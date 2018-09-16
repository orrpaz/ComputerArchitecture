	.file	"main-test.c"
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%s"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$288, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movb	$101, -282(%rbp)
	movb	$102, -281(%rbp)
	leaq	-280(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	leaq	-272(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	-280(%rbp), %eax
	movb	%al, -272(%rbp)
	leaq	-272(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$0, -276(%rbp)
	jmp	.L2
.L4:
	movl	-276(%rbp), %eax
	cltq
	movzbl	-271(%rbp,%rax), %eax
	cmpb	-282(%rbp), %al
	jne	.L3
	movl	-276(%rbp), %eax
	cltq
	movzbl	-281(%rbp), %edx
	movb	%dl, -271(%rbp,%rax)
.L3:
	addl	$1, -276(%rbp)
.L2:
	movzbl	-272(%rbp), %eax
	movsbl	%al, %eax
	cmpl	-276(%rbp), %eax
	jge	.L4
	leaq	-272(%rbp), %rax
	addq	$1, %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L6
	call	__stack_chk_fail
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.5) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
