[ENABLE]
//code from here to '[DISABLE]' will be used to enable the cheat
alloc(newmem,4096)
alloc(f_constants, 8)
registersymbol(f_constants)

label(returnhere)
label(originalcode)
label(exit)
label(label_1)
label(label_2)


newmem:
  cmp dword ptr [f_constants],0
  jne constants_set
  mov dword ptr [f_constants],(float)1.0
  mov dword ptr [f_constants+4],(float)0
  mov dword ptr [f_constants+8],(float)0
  constants_set:

  PUSH EBP
  MOV EBP,ESP
  SUB ESP,0000009C
  LEA EAX,[EBP-0000009C]
  PUSH EBX
  PUSH ESI
  PUSH EDI
  PUSH 00000090
  PUSH 00
  PUSH EAX
  CALL GameAssembly.dll+1D6C20
  ADD ESP,0C
  JMP label_1
label_1:
  MOV EAX,[GameAssembly.dll+1B5B9E8]
  PUSH 00
  MOV EAX,[EAX+5C]
  movq xmm0,[EAX+24]
  MOV ESI,[EAX+2C]
  movq [EBP-0C],xmm0
  CALL UnityEngine.Time.get_fixedDeltaTime
  movss xmm3,[EBP+10]
  ADD ESP,04
  movss xmm2,[EBP+14]
  movss xmm1,[EBP+18]
  fstp dword ptr [EBP-04]
  movss xmm0,[EBP-04]
  mulss xmm3,xmm0
  mulss xmm2,xmm0
  mulss xmm1,xmm0
  movss [EBP+10],xmm3
  movss [EBP+14],xmm2
  movss [EBP+18],xmm1
  MOV EDX,[EBP+0C]
  TEST EDX,EDX
  JE label_2
  movq xmm0,[EBP+10]
  LEA EAX,[EBP-0000009C]
  PUSH 00
  PUSH EAX
  MOV EAX,[EBP+18]
  SUB ESP,0C
  MOV ECX,ESP
  SUB ESP,0C
  movq [ECX],xmm0
  movq xmm0,[EBP-0C]
  MOV [ECX+08],EAX
  MOV EAX,ESP
  PUSH ECX
  movq [EAX],xmm0
  movss xmm0,[EBP+1C]
  addss xmm0,[GameAssembly.dll+1659800]
  sub esp, 4
  movss [esp], xmm0
  fld dword ptr [esp]
  fadd dword ptr [f_constants]
  fstp dword ptr [esp]
  movss xmm0, [esp]
  add esp, 4
  MOV [EAX+08],ESI
  movss [ESP],xmm0
  PUSH EDX
  CALL MvCharacterController.TestWithOutSliding
  ADD ESP,28
  mov ecx, [f_constants+8]
  mov edx, [f_constants+4]
  mov [EBP-9C+18], ecx
  mov [EBP-9C+1C], edx
  mov [EBP-9C+20], ecx
  LEA ESI,[EBP-0000009C]
  MOV BL,AL
  MOV ECX,00000024
  MOV [EBP+1C],BL
  PUSH 00
  SUB ESP,00000090
  MOV EDI,ESP
  repe movsd
  PUSH [EBP+1C]
  PUSH [EBP+0C]
  PUSH [EBP+08]
  CALL MVGroundState.UpdateGroundStateWithHit
  ADD ESP,000000A0
  MOV AL,BL
  POP EDI
  POP ESI
  POP EBX
  MOV ESP,EBP
  POP EBP
  RET
label_2:
  RET

originalcode:
push ebp
mov ebp,esp
sub esp,0000009C

exit:
jmp returnhere

MVGroundState.Update:
jmp newmem
nop 4
returnhere:

[DISABLE]
//code from here till the end of the code will be used to disable the cheat
dealloc(newmem)
unregistersymbol(f_constants)
dealloc(f_constants)
MVGroundState.Update:
db 55 8B EC 81 EC 9C 00 00 00
