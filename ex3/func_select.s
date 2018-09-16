
  # Or Paz - 311250708
  
.section .rodata
inputInt:   .string "%d"
inputChar:  .string "%c"
inputString:    .string "%s"

stringCase50:   .string "first pstring length: %d, second pstring length: %d\n"
stringCase51:   .string "old char: %c, new char: %c, first string: %s, second string: %s\n"
stringCase52_3: .string "length: %d, string: %s\n"
printDefaultCase:   .string "invalid option!\n"
    
    
.align 8
.cases:
 .quad .case_50
 .quad .case_51
 .quad .case_52
 .quad .case_53 
 .quad .case_default
    
.data
.globl run_func
.type   run_func, @function

.text

run_func:
    #jump table-switch case 
    leaq    -50(%rdi), %rdi               # Compute xi = x-50
    cmpq    $3, %rdi                      # Compare xi:3
    ja      .case_default                 # if > 3, goto default-case
    jmp     *.cases(,%rdi,8)              #goto to the right case by jumping 8*(the case) 
    
.case_50:
    pushq        %r14
    pushq        %r15
    
    movq         %rsi, %rdi                   # get the first pstring (rsi) to rdi - first argument
    xorq          %rax, %rax
    call         pstrlen
    movq         %rax, %r15                   # move the return value into temporary 
    
    movq        %rdx, %rdi                    #get the second pstring to rdi - first argument
    xor         %rax, %rax
    call        pstrlen
    movq        %rax, %r14                    # move the return value into temporary
    
    movq        $stringCase50, %rdi           #move the format strint to rdi
    movq        %r15, %rsi                    # first string into rsi
    movq        %r14, %rdx                    # second string into rdx
    xorq         %rax, %rax                    # Resets
    call        printf                        # print the lengths of the pstrings
    popq        %r15
    popq        %r14
    ret

.case_51:
    pushq       %r14                           # calle save register
    pushq       %r15
    
    movq        %rsi, %r14                     # put first string in temporary register - calle save register               
    movq        %rdx, %r15                     # put second string in temporary register - calle save register
    
    
    decq        %rsp 	                      # allocate memory for "\0" 
    movq        %rsp, %rsi 
    movq        $inputChar, %rdi 	              # rdi get %c
    movq        $0,%rax 		
    call        scanf 			
    
    # get old char
    movq        %rsp, %rsi 		    # get the number into the stack
    movq        $inputChar,%rdi	            # rdi get %c
    movq        $0,%rax 		
    call        scanf 
    
    
    decq        %rsp 		            # allocate memory for "\0" 
    movq        %rsp, %rsi 
    movq        $inputChar, %rdi 	            # rdi get %c
    xorq         %rax, %rax                    # Resets
    call        scanf
    
    # get new char
    movq        %rsp, %rsi 		   # get the number into the stack
    movq        $inputChar,%rdi		
    movq        $0,%rax 		
    call        scanf 
    
    
    movq        %r14,%rdi 		  # move first string to rdi
    movzbq      (%rsp),%rdx		  # new char in rdx 
    movzbq      1(%rsp),%rsi		  # old char in rsi
    call        replaceChar
    movq        %rax,%r14                   # save the new sting in r14
    
    movq        %r15,%rdi		  # rdi has pointer to second string
    movzbq      (%rsp),%rdx		  # new char in rdx
    movzbq      1(%rsp),%rsi	          # old char in rsi
    call        replaceChar
    movq        %rax,%r15                  # save the new sting in r15
    
    # print
    movq        $stringCase51,%rdi 	 # put the format string in rdi
    movzbq      (%rsp),%rdx		 # new char in rdx - third arg    
    incq        %rsp 		         
    movzbq      (%rsp),%rsi                # old char in rsi -second arg
    movq        %r14,%rcx		 # move first string to rcx - four argument
    incq        %rcx			 # send the string without his legth    
    movq        %r15,%r8		         # move the second string to r8 - fifth argument
    incq        %r8 			# send the string without his legth
    xorq         %rax, %rax                # Resets
    call        printf
    
    
    leaq 	1(%rsp),%rsp	        # update %rsp to return value
    
    	
    popq        %r15
    popq        %r14
    ret

.case_52:
    pushq       %rbx                        
    pushq       %r12                     # calle save register                    
    pushq       %r13                    
    pushq       %r14                    
                   
    
    movq        %rsi, %rbx               # save the first pstring - dst
    movq        %rdx, %r12               # save the second pstring - src
    subq        $4, %rsp                 # allocate place for the int
    movq        %rsp, %rsi               #rsi will get the address of rsp
    movq        $inputInt, %rdi          #get the format into rdi
    xorq         %rax, %rax               # Resets
    call        scanf 
    movzbq      (%rsp), %r13             # save the first byte that return on r13
    
    # for "\n"
    decq        %rsp 		       # allocate memory to new char 
    movq        %rsp, %rsi 	       # rsi point on rsp
    movq        $inputChar, %rdi        
    movq        $0,%rax 
    call        scanf 
    
    subq        $3, %rsp                # get place for the int (override '\n')
    movq        %rsp, %rsi              # rsi will get the address of rsp
    movq        $inputInt, %rdi         # get the format into rdi
    xorq         %rax, %rax
    call         scanf 
    movzbq      (%rsp), %r14             # save the first byte that return on r14
    
    movq        %rbx, %rdi               # restore the backup -dst
    movq        %r12, %rsi               # restore the backup -src
    
    movb        %r13b, %dl
    movb        %r14b, %cl
    
    addq        $8, %rsp                # return rsp to the his first place before subq
    xorq         %rax, %rax              # put 0 on rax
    call        pstrijcpy
    
    
    
    movq        $stringCase52_3, %rdi   #format string  into rdi
    movzbq      (%rbx), %rsi            # move the length into rsi
    addq        $1, %rbx                # took only the string 
    movq        %rbx, %rdx              #get the string into args for printf
    xor         %rax, %rax
    call        printf
    
    movq        $stringCase52_3, %rdi   #format into rdi
    movzbq      (%r12), %rsi            #the length into rsi
    addq        $1, %r12                # took only the string
    movq        %r12, %rdx              # get the string into args for printf
    xorq         %rax, %rax
    call        printf 
    
    popq        %r14                   # pop from stack.
    popq        %r13
    popq        %r12
    popq        %rbx
    ret


.case_53:
    pushq       %r12                    # calle save register
    pushq       %r13
    movq        %rsi,%rdi               # rdi get first pstring
    call        swapCase
    movq        %rax, %r12              # pointer to new first string in r12
    
    movq        %rdx,%rdi               # rdi get second pstring
    call        swapCase
    movq        %rax, %r13              #  pointer to new first string in r13
    
    movq        $stringCase52_3, %rdi
    movzbq      (%r12),%rsi              # length of string in rsi. r12 point to start of dst
    incq        %r12
    movq        %r12,%rdx                # save in rdx
    movq        $0,%rax
    call        printf
    
    movq        $stringCase52_3, %rdi
    movzbq      (%r13),%rsi             # length of string in rsi. r13 point to start of dst
    incq        %r13
    movq        %r13,%rdx               # save in rdx
    xorq         %rax, %rax              # Resets
    call        printf
    popq        %r13
    popq        %r12
    ret
    
    
.case_default:  
    movq    $printDefaultCase, %rdi
    call    printf
    ret


