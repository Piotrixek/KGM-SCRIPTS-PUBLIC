/*
MADE BY VENI
*/

[ENABLE]
alloc(newmem,2048)
alloc(rotation_angle, 4)
alloc(f_constants, 8)
registersymbol(rotation_angle)
registersymbol(f_constants)

label(returnhere)
label(originalcode)
label(exit)
label(label_1)
label(label_10)
label(label_11)
label(label_12)
label(label_13)
label(label_14)
label(label_15)
label(label_16)
label(label_17)
label(label_2)
label(label_3)
label(label_4)
label(label_5)
label(label_6)
label(label_7)
label(label_8)
label(label_9)


newmem:
  cmp dword ptr [f_constants],0
  jne constants_set
  mov dword ptr [f_constants],(float)0.5
  mov dword ptr [f_constants+4],(float)0.20  // Rotation speed
  constants_set:
  PUSH EBP
  MOV EBP,ESP
  SUB ESP,50
  PUSH EBX
  PUSH ESI
  PUSH EDI
  JMP label_1
label_1:
  MOV ESI,[EBP+08]
  xorps xmm0,xmm0
  movq [EBP-40],xmm0
  MOV [EBP-38],00000000
  MOV EAX,[ESI]
  PUSH [EAX+000000FC]
  MOV ECX,[EAX+000000F8]
  PUSH ESI
  CALL ECX
  ADD ESP,08
  TEST AL,AL
  JNE label_2
  MOV EAX,[ESI+54]
  TEST EAX,EAX
  JE label_3
  MOV EAX,[EAX+10]
  TEST EAX,EAX
  JE label_3
  PUSH 00
  PUSH EAX
  CALL UnityEngine.Component.get_transform
  MOV EBX,[EBP+0C]
  ADD ESP,08
  MOV [EBP-10],EAX
  TEST EBX,EBX
  JE label_3
  MOV EAX,[EBX]
  XOR ECX,ECX
  MOV EDI,[GameAssembly.dll+1B63BF8]
  MOV [EBP-0C],EAX
  MOV [EBP-08],ECX
  MOVZX EDX,word ptr [EAX+000000B6]
  CMP CX,DX
  JAE label_4
  NOP
label_5:
  MOV EBX,[EBP-0C]
  MOVZX EAX,CX
  MOV ESI,[EBX+58]
  MOV EBX,[EBP+0C]
  CMP [ESI+EAX*8],EDI
  MOV ESI,[EBP+08]
  JE label_6
  INC ECX
  CMP CX,DX
  JB label_5
label_4:
  PUSH 02
  PUSH EDI
  PUSH EBX
  CALL GameAssembly.dll+15DDE0
  ADD ESP,0C
label_7:
  PUSH [EAX+04]
  MOV ECX,[EAX]
  LEA EAX,[EBP-50]
  PUSH EBX
  PUSH EAX
  CALL ECX
  MOV EDX,EAX
  ADD ESP,0C
  push edx
  push eax
  fld dword ptr [rotation_angle]
  fadd dword ptr [f_constants+4]
  fstp dword ptr [rotation_angle]
  fld dword ptr [rotation_angle]
  fmul dword ptr [f_constants]
  fsincos
  mov dword ptr [edx],0
  mov dword ptr [edx+8],0
  fstp dword ptr [edx+0C]
  fstp dword ptr [edx+4]
  pop eax
  pop edx
  MOV EAX,[EBP-10]
  TEST EAX,EAX
  JE label_3
  movups xmm0,[EDX]
  PUSH 00
  SUB ESP,10
  MOV ECX,ESP
  PUSH EAX
  movups [ECX],xmm0
  CALL UnityEngine.Transform.set_rotation
  movq xmm0,[ESI+3C]
  ADD ESP,18
  MOV EAX,[ESI+44]
  MOV EDI,[ESI+5C]
  movq [EBP-34],xmm0
  movq xmm0,xmm0
  MOV [EBP-18],EAX
  movq [EBP-28],xmm0
  movq xmm0,[ESI+3C]
  MOV [EBP-14],EAX
  MOV [EBP-08],EAX
  MOV EAX,[ESI+54]
  movq [EBP-20],xmm0
  TEST EAX,EAX
  JE label_3
  MOV EAX,[EAX+10]
  MOV [EBP-0C],EAX
  MOV EAX,[ESI+54]
  MOV EAX,[EAX+10]
  TEST EAX,EAX
  JE label_3
  PUSH 00
  PUSH EAX
  CALL TierUnlockedPopupContentBase.get_DisplayTime
  ADD ESP,08
  fstp dword ptr [EBP-10]
  TEST EDI,EDI
  JE label_3
  movss xmm0,[EBP-10]
  LEA EAX,[EBP-40]
  PUSH 00
  PUSH EAX
  PUSH [ESI+18]
  PUSH ECX
  MOV ECX,[EBP-08]
  movss [ESP],xmm0
  PUSH [EBP-0C]
  movq xmm0,[EBP-20]
  SUB ESP,0C
  MOV EAX,ESP
  PUSH EDI
  movq [EAX],xmm0
  MOV [EAX+08],ECX
  CALL MVMovableMotorState.Move
  movq xmm0,[EBP-40]
  PUSH EBX
  PUSH [GameAssembly.dll+1B63BF8]
  MOV [EBP-01],AL
  MOV EAX,[EBP-38]
  PUSH 04
  movq [EBP-20],xmm0
  MOV [EBP-08],EAX
  CALL GameAssembly.mono_arch_setup_resume_sighandler_ctx+5C80
  MOV EDI,[EBX]
  XOR ECX,ECX
  MOV EDX,[GameAssembly.dll+1B63BF8]
  ADD ESP,30
  MOV [EBP-0C],AL
  MOV [EBP-10],ECX
  MOVZX EAX,word ptr [EDI+000000B6]
  CMP CX,AX
  JAE label_8
  MOV EDI,[EDI+58]
label_9:
  MOVZX EAX,CX
  CMP [EDI+EAX*8],EDX
  JE label_10
  MOV ESI,[EBX]
  INC ECX
  MOVZX EAX,word ptr [ESI+000000B6]
  MOV ESI,[EBP+08]
  CMP CX,AX
  JB label_9
label_8:
  PUSH 00
  PUSH EDX
  PUSH EBX
  CALL GameAssembly.dll+15DDE0
  ADD ESP,0C
label_11:
  PUSH [EAX+04]
  MOV ECX,[EAX]
  LEA EAX,[EBP-4C]
  PUSH EBX
  PUSH EAX
  CALL ECX
  ADD ESP,0C
  movq xmm0,[EAX]
  MOV EAX,[EAX+08]
  PUSH 00
  SUB ESP,0C
  MOV ECX,ESP
  PUSH [EBP-0C]
  movq [ECX],xmm0
  movq xmm0,[EBP-20]
  SUB ESP,0C
  MOV [ECX+08],EAX
  MOV EAX,ESP
  MOV ECX,[EBP-08]
  SUB ESP,0C
  movq [EAX],xmm0
  movq xmm0,[EBP-28]
  MOV [EAX+08],ECX
  MOV EAX,ESP
  MOV ECX,[EBP-14]
  PUSH ESI
  movq [EAX],xmm0
  MOV [EAX+08],ECX
  LEA EAX,[EBP-4C]
  PUSH EAX
  CALL AvatarMotor.GetVelocity
  ADD ESP,34
  MOV EDX,EAX
  CMP byte ptr [EBP-01],00
  JNE label_12
  movq xmm0,[EBP-40]
  MOV EAX,[EBP-38]
  PUSH 00
  SUB ESP,0C
  MOV ECX,ESP
  SUB ESP,0C
  movq [ECX],xmm0
  movq xmm0,[EDX]
  MOV [ECX+08],EAX
  MOV ECX,ESP
  MOV EAX,[EDX+08]
  PUSH ESI
  movq [ECX],xmm0
  MOV [ECX+08],EAX
  CALL AvatarMotor.Move
  MOV byte ptr [EBP-01],00
  JMP label_13
label_6:
  MOV EDX,[EBX]
  MOVZX ECX,CX
  MOV EAX,[EDX+58]
  MOV EAX,[EAX+ECX*8+04]
  ADD EAX,1A
  LEA EAX,[EDX+EAX*8]
  JMP label_7
label_10:
  MOV EDX,[EBX]
  MOVZX ECX,CX
  MOV EAX,[EDX+58]
  MOV EAX,[EAX+ECX*8+04]
  ADD EAX,18
  LEA EAX,[EDX+EAX*8]
  JMP label_11
label_12:

label_14:
  MOV EAX,[GameAssembly.dll+1B5B9E8]
  PUSH 00
  SUB ESP,0C
  MOV ECX,ESP
  SUB ESP,0C
  MOV EAX,[EAX+5C]
  movq xmm0,[EAX]
  MOV EAX,[EAX+08]
  movq [ECX],xmm0
  movq xmm0,[EBP-28]
  MOV [ECX+08],EAX
  MOV EAX,ESP
  PUSH ESI
  movq [EAX],xmm0
  MOV [EAX+08],EDI
  CALL AvatarMotor.Move
label_13:
  ADD ESP,20
  MOV EAX,[ESI+54]
  TEST EAX,EAX
  JE label_3
  MOV EAX,[EAX+10]
  TEST EAX,EAX
  JE label_3
  movq xmm0,[EAX+54]
  MOV EAX,[EAX+5C]
  PUSH 00
  movq [EBP-2C],xmm0
  MOV [EBP-24],EAX
  CALL UnityEngine.Time.get_fixedDeltaTime
  movss xmm2,[EBP-24]
  ADD ESP,04
  fstp dword ptr [EBP+08]
  movss xmm0,[EBP+08]
  divss xmm2,xmm0
  movss xmm1,[EBP-2C]
  movss xmm3,[EBP-28]
  divss xmm1,xmm0
  divss xmm3,xmm0
  movss [EBP-24],xmm2
  CMP byte ptr [EBP-01],00
  movaps xmm0,xmm1
  MOV EAX,[EBP-24]
  unpcklps xmm0,xmm3
  movq [ESI+3C],xmm0
  MOV [ESI+44],EAX
  JNE label_15
  subss xmm2,[EBP-38]
  subss xmm1,[EBP-40]
  subss xmm3,[EBP-3C]
  movss [EBP-24],xmm2
  MOV EAX,[EBP-24]
  unpcklps xmm1,xmm3
  movq [ESI+3C],xmm1
  MOV [ESI+44],EAX
label_15:
  MOV ECX,[ESI+58]
  movq xmm0,[ESI+3C]
  MOV EDX,[ESI+44]
  TEST ECX,ECX
  JE label_3
  movq xmm1,[EBP-34]
  MOV EDI,[EBP-18]
  PUSH 00
  PUSH [ESI+60]
  SUB ESP,0C
  MOV EAX,ESP
  SUB ESP,0C
  movq [EAX],xmm1
  MOV [EAX+08],EDI
  MOV EAX,ESP
  PUSH ECX
  movq [EAX],xmm0
  MOV [EAX+08],EDX
  CALL ImpactState.UpdateImpactState
  fstp dword ptr [EBP+08]
  movss xmm0,[EBP+08]
  ADD ESP,24
  ucomiss xmm0,[GameAssembly.dll+1659580]
  lahf
  TEST ah,44
  jnp label_16
  MOV ECX,[ESI+60]
  TEST ECX,ECX
  JE label_3
  MOV EAX,[ECX]
  PUSH [EAX+000000EC]
  MOV EAX,[EAX+000000E8]
  PUSH 05
  PUSH 00
  PUSH ECX
  movss [ESP],xmm0
  PUSH ECX
  CALL EAX
  ADD ESP,14
label_16:
  PUSH EBX
  PUSH [GameAssembly.dll+1B63BF8]
  PUSH 04
  CALL GameAssembly.mono_arch_setup_resume_sighandler_ctx+5C80
  MOV ECX,[ESI+4C]
  ADD ESP,0C
  TEST ECX,ECX
  JE label_3
  TEST [ECX+18],AL
  JE label_17
  CMP dword ptr [ESI+7C],00
  JE label_17
  MOV EAX,[ESI+7C]
  PUSH [EAX+14]
  PUSH [EAX+20]
  MOV EAX,[EAX+0C]
  CALL EAX
  ADD ESP,08
label_17:
  MOV EAX,[ESI+74]
  TEST EAX,EAX
  JE label_3
  PUSH 00
  PUSH EAX
  CALL SizeState.UpdateScale
  MOV EAX,[ESI+54]
  ADD ESP,08
  MOV EDI,[ESI+50]
  TEST EAX,EAX
  JE label_3
  MOV EAX,[EAX+10]
  TEST EAX,EAX
  JE label_3
  PUSH 00
  PUSH EAX
  CALL UnityEngine.Component.get_transform
  ADD ESP,08
  TEST EAX,EAX
  JE label_3
  PUSH 00
  PUSH EAX
  LEA EAX,[EBP-4C]
  PUSH EAX
  CALL UnityEngine.Transform.get_position
  ADD ESP,0C
  TEST EDI,EDI
  JE label_3
  movq xmm0,[EAX]
  MOV EAX,[EAX+08]
  PUSH 00
  PUSH [ESI+60]
  SUB ESP,0C
  MOV ECX,ESP
  PUSH EDI
  movq [ECX],xmm0
  MOV [ECX+08],EAX
  CALL WaterState.Update
  ADD ESP,18
label_2:
  POP EDI
  POP ESI
  POP EBX
  MOV ESP,EBP
  POP EBP
  RET
label_3:
ret

originalcode:
push ebp
mov ebp,esp
sub esp,50

exit:
jmp returnhere

AvatarMotor.FixedUpdateFunction:
jmp newmem
nop
returnhere:


[DISABLE]
dealloc(newmem)
unregisterSymbol(rotation_angle)
unregisterSymbol(f_constants)
dealloc(rotation_angle)
dealloc(f_constants)
AvatarMotor.FixedUpdateFunction:
db 55 8B EC 83 EC 50
//push ebp
//mov ebp,esp
//sub esp,50
