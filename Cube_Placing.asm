/*
MADE BY VENI
*/

[ENABLE]

alloc(newmem,2048)
label(returnhere)
label(originalcode)
label(exit)

label(label_1)
label(label_2)
label(label_3)
label(label_4)
label(label_5)



newmem:
  PUSH EBP
  MOV EBP,ESP
  PUSH EBX
  PUSH ESI
  MOV ESI,[EBP+14]
  PUSH EDI
  JMP label_1
label_1:
  MOV EDI,[EBP+08]
  PUSH 00
  PUSH EDI
  CALL MVCubeModelBase.MakeUnique
  MOV EBX,[EDI+000000D8]
  ADD ESP,08
  TEST EBX,EBX
  JE label_2
  MOV EDX,[GameAssembly.dll+1B546E0]
  TEST ESI,ESI
  JE label_3
  MOV EAX,[ESI]
  MOV AL,[EAX+000000B8]
  CMP AL,[EDX+000000B8]
  JB label_4
  MOV EAX,[ESI]
  MOVZX ECX,byte ptr [EDX+000000B8]
  MOV EAX,[EAX+64]
  CMP [EAX+ECX*4-04],EDX
  JNE label_4
label_3:
  MOV ECX,[EBP+0C]
  PUSH 00
  PUSH ESI
  SUB ESP,08
  MOV EAX,ESP
  PUSH EBX
  MOV [EAX],ECX
  MOV CX,[EBP+10]
  MOV [EAX+04],CX
  CALL RuntimePrototypeCubeModel.AddCube
  pushad
  mov ecx, [ebp+0C]
  inc ecx
  push 00
  push esi
  sub esp,08
  mov eax,esp
  push ebx
  mov [eax],ecx
  mov cx,[ebp+10]    
  mov [eax+04],cx
  call RuntimePrototypeCubeModel.AddCube
  add esp,14
  mov ecx,[ebp+0C]   
  push 00
  push esi            
  sub esp,08
  mov eax,esp
  push ebx            
  mov [eax],ecx
  mov cx,[ebp+10]    
  inc cx              
  mov [eax+04],cx
  call RuntimePrototypeCubeModel.AddCube
  add esp,14
  mov ecx,[ebp+0C]   
  inc ecx             
  push 00
  push esi
  sub esp,08
  mov eax,esp
  push ebx            
  mov [eax],ecx
  mov cx, [ebp+10]    
  inc cx              
  mov [eax+04], cx
  call RuntimePrototypeCubeModel.AddCube
  add esp, 14
  popad
  ADD ESP,14
  TEST AL,AL
  JE label_5
  PUSH [GameAssembly.dll+1B547E0]
  MOV ESI,[EDI+000000E8]
  CALL GameAssembly.il2cpp_property_get_flags+60
  ADD ESP,04
  MOV EBX,EAX
  MOV EAX,[EBP+0C]
  PUSH 00
  PUSH EDI
  SUB ESP,08
  MOV ECX,ESP
  PUSH 02
  MOV [ECX],EAX
  MOV AX,[EBP+10]
  PUSH EBX
  MOV [ECX+04],AX
  CALL CubeModelChangedEventArgs..ctor
  ADD ESP,18
  TEST ESI,ESI
  JE label_2
  PUSH [GameAssembly.dll+1B3CD3C]
  PUSH EBX
  PUSH ESI
  CALL GameAssembly.dll+AFCEB0
  ADD ESP,0C
label_5:
  POP EDI
  POP ESI
  POP EBX
  POP EBP
  RET
label_2:
  CALL GameAssembly.il2cpp_property_get_flags+B0
label_4:
  PUSH EDX
  PUSH ESI
  CALL GameAssembly.il2cpp_value_box+80
  INT 3

originalcode:
push ebp
mov ebp,esp
mov eax,[ebp+08]

exit:
jmp returnhere

MVCubeModelBase.AddCube:
jmp newmem
nop
returnhere:


[DISABLE]

dealloc(newmem)
MVCubeModelBase.AddCube:
db 55 8B EC 83 3D 9E F2 BD 01 00


