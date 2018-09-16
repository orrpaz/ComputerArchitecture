
      # Or Paz - 311250708
      
    .section .rodata
    printError: 		.string "invalid input!\n"
    
    
    .text
    
    
    # case_50
    
    .global pstrlen
    .type  pstrlen, @function 
    pstrlen:
        movzbq	 (%rdi),%rax 		  # return the length of the string - copy the first byte to rax (put 0 in the rest)
        ret
        
    # case 51    
    
    .global replaceChar
    .type  replaceChar, @function
    # pointer to string in %rdi, old char in %rsi, new char in %rdx, i in %rcx
    replaceChar:
        xorq 	%rcx,%rcx 		# Resets loop variable
        movq 	%rdi,%rcx 		# rdi contain the string therefore rcx point to start of the string
        
        .Loop:
        incq	%rcx 			# increase counter
        cmpb 	(%rcx),%sil 		# if the chars is equals -sil is the first byte of rsi
        jne  	.checkingEnd
        movb 	%dl, (%rcx) 		# change the old char in new char - dl is the first byte of rdx
        .checkingEnd:
        cmpb 	$0,(%rcx) 		# check if we arrive to end of string
        jne 	.Loop
        
        movq 	%rdi,%rax		# put pointer to string as return value in %rax
        ret
         
        
   # case 52  
     
     .global pstrijcpy
    .type  pstrijcpy, @function
    pstrijcpy:
    
    # pointer to dst string in %rdi,
    # pointer to src string in %rsi,
    # i in %rdx, j in %rcx

    pushq       %r12
    pushq       %r15
    pushq       %rbx
    
    movq        %rdi, %r12                    # dst string
    movq        %rsi, %r15                    # src string
    
    cmpb 	(%r12),%cl 		# check j is valid in dst (part of rcx ,cl, contain j)
    ja      	.PrintError
    
    cmpb 	(%r15),%cl 		# check j is valid in src 
    ja 	        .PrintError
    
    cmpb 	(%r12),%dl 		# check i is valid in dst (part of rdx ,dl, contain i)
    ja 	        .PrintError
    
    cmpb 	(%r15),%dl 		# check i is valid in src 
    ja 	        .PrintError
    
    incq 	%rdi
    incq 	%rsi
    
    
    movb 	%dl,%r8b 		# counter=i
    addb 	%r8b,%sil 		# rsi begin from the index i in the string
    addb 	%r8b,%dil		# start the letter in place 'i'
    decb 	%r8b			# decreament our conter. the first letter need ad index 0
    
    .replaceIntervalLoop:
    movzbq 	(%rsi),%rbx 		# keep first byte of %rsi (char to replace) in %rbx
    movb 	%bl,(%rdi) 		# now put it in dst string in same index of char
    incb 	%r8b 			# counter ++
    incq 	%rsi 			#iterate over the relvant chars in the string
    incq 	%rdi 			# go on in chars in the dst stinrg
    cmpb 	%r8b,%cl 		# check if counter>j -> end the loop
    ja 	.replaceIntervalLoop
    popq        %rbx
    popq        %r15
    popq        %r12
    ret
    
    
    
   .PrintError:
    #print "invalid input"
    movq 	$printError,%rdi 	#format to print
    movq 	$0,%rax
    call 	printf 
    popq         %rbx
    popq         %r15
    popq         %r12
    ret   
        
        
        
  # case 53
        
    .global swapCase
    .type  swapCase, @function
    swapCase:
    # pointer to string in %rdi
    xorq         %r10,%r10              # Resets loop variable
    movq         %rdi,%rax              # svae the pstring on rax
    
    .LoopSwapCase:
    incq         %rdi                   # skip on the lengh parameter
    incq         %r10
    
    cmpb        $65, (%rdi)
    jl          .LoopSwapCase
    cmpb        $122, (%rdi)
    jg          .LoopSwapCase
    
    cmpb 	$97,(%rdi)		# if the char between 96-90 is not letter
    jge     	.SwapToBig 
    
    cmpb 	$90,(%rdi)		# if the char between 96-90 is not letter
    jle     	.SwapToLittle
    
    
    .ReturnFromSwap:
    cmpb 	(%rax),%r10b 		# check if we read all string
    je 	        .End
    jmp     	.LoopSwapCase	
    	
    .End:				# end the function
    ret	
    
    
    .SwapToBig:
    subb 	$32,(%rdi)		# swap the letter to big. sub the ascii value in 32 
    jmp 	       .ReturnFromSwap
    
    .SwapToLittle:   
    addb 	$32,(%rdi)		# swap the letter to little. add the ascii value in 32
    jmp     	.ReturnFromSwap
        
    
        
        