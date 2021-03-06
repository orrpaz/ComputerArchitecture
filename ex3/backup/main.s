
      # Or Paz - 311250708
.data
inputOfInt: .string "%d"
inputOfString: .string "%s"

.text
.global main
.type   main, @function
main:
    pushq       %rbp
    movq        %rsp, %rbp
    pushq       %r13
    pushq       %rbx
    
    pushq       %r15
    pushq       %r14
    
    
    
    # get first number.
    subq        $4, %rsp	                 # allocate place for int
    movq        $inputOfInt, %rdi   	# rdi is the first argumrnt
    movq        %rsp, %rsi        	# scan the input into the stack - copy adress of rsp to rsi
    xor         %rax, %rax
    call        scanf
    movzbq      (%rsp), %rdi         	# move the number(the first byte) to rdi(LSB)
    movq         %rdi,%r15                # save the length in temp register 
     

    
    # get first string
    subq       %r15, %rsp	        # place for string
    subq       $2, %rsp                  # place for length and '/0'
    movq       %rsp, %rsi                # parameter before function
    xor        %rax, %rax
    call       getString		
    movq       %rax, %rbx       	       # move the addres of first string to rbx
       
 
    
    # get second number
    subq        $4, %rsp	                # allocate place for int
    movq        %rsp, %rsi      	        # rsi will get the address of rsp
    movq        $inputOfInt, %rdi   	# rdi is the first argument
    xor         %rax, %rax
    call        scanf  
    movzbq      (%rsp), %rdi    	        # move the number in rdi
    movq        %rdi, %r14               # save the length in temp register 
         
    
    # get second string 
    subq        %r14, %rsp	        # place for string
    subq        $2, %rsp	                # allocate place for length and '/0'
    movq        %rsp, %rsi		
    xor         %rax, %rax
    call        getString		
    movq        %rax, %r13               # move the addres of first string to r13
    
    
    # get the number case from user
    subq        $4, %rsp                 # allocate place for int
    movq        %rsp, %rsi      	        # rsi will get the address of rsp
    movq        $inputOfInt, %rdi        # rdi is the first argument
    xor         %rax, %rax
    call        scanf    
    movzbq      (%rsp), %rdi             # took the first byte that rsp point him and put in rdi.
    addq        $4, %rsp                 # return rsp to the previous place
    
    movq        %rbx, %rsi               # save the information in argument before sending
    movq        %r13, %rdx
    xor         %rax, %rax
    call        run_func
    
            
   
    
    
    addq        %r15, %rsp               # return rsp to return adress
    addq        %r14, %rsp
    addq        $12, %rsp
    
              
                                        # pop calle save register
    popq        %r14
    popq        %r15
    popq        %rbx
    popq        %r13
    movq        %rbp, %rsp
    
    popq        %rbp 
    ret



getString:
    pushq       %r12		         # calle-saved resgister - backup
    movb        %dil, (%rsi)              # rsp get the length to first place from rdi
    movq        %rsi, %r12                # r12 save the start of the pstring 
    addq        $1, %rsi                  # after the length we now point to the place for the string
    movq        $inputOfString, %rdi      # put the format in rdi
    xor         %rax, %rax
    call        scanf               
    movq        %r12, %rax                # rax is return value - put the adress of pstring on rax
    popq        %r12		         # restore r12
    ret







