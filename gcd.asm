movi 18 r9

LOOP:
	movi 180 r8// make r8 180
	push r8 //parameter r8
	push r9 // parameter b, starts at 18
	movi GCD r4 //calls function
  	jal  r4 //jumps to function
	pop r10
	pop r11
	out r1//return

	movi 1 r6//sets r6 to 1
	add r6 r9 //adds one to r9

	mov r9 r5 //sets r5 to r9(increments r9 above)
	movi 25 r6 // sets r6 to 25
	sub r6 r5 //subtracts r5 and r6
	movi LOOP r7//call the loop
	jnz r5 r7 // if r5 is not 0, then run LOOP again
	halt // end program

GCD: 
	push rp      // save RP
 	push fp      // save old FP
  	mov  sp fp   // puts the fp at the point of the sp
	
	ldlo -3 r10 //b
	ldlo -4 r11 //a

	
	movi else r12// sets else to r12
	jnz r10 r12 // calls else if r10 is not 0

	mov r11 r1 // set r1 to r11

	pop fp 
	pop rp

	ret 
else:
	
	mov r11 r1

	// MOD: return a - ((a / b) * b)
	idiv r10 r11  // b /= a
	mul r10 r11   // b *= a
	sub r11 r1 //b -= a
 	stlo -3 r1 //b
	stlo -4 r10 //a
	pop r25 //stack needs to have 2 things to run GCD
	pop r26 // pop these two

	movi GCD r4 //calls function
  	jmp  r4 //jumps to function

	ret// idk
