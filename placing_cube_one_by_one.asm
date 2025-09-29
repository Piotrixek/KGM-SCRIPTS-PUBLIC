/*
MADE BY VENI
*/

[enable]

alloc(newmem,4096)
alloc(build_step,4)
alloc(last_place_time,4)
alloc(build_delay,4)
alloc(start_x,4)
alloc(start_y,2)
alloc(material_ptr,4)
alloc(model_ptr,4)

label(returnhere)
label(exit_and_cleanup)
label(continue_build)
label(build_the_second_cube)
label(build_the_third_cube)
label(build_the_fourth_cube)

build_step:
  dd 0
last_place_time:
  dd (float)0.0
build_delay:
  dd (float)2.0
start_x:
  dd 0
start_y:
  dw 0
material_ptr:
  dd 0
model_ptr:
  dd 0

newmem:
  
  push ebp
  mov ebp,esp
  pushad 

  
  cmp dword ptr [build_step],0
  je start_new_build 

continue_build:
  
  push 00
  call unityengine.time.get_time
  fstp dword ptr [esp]
  movss xmm0,[esp]
  add esp,4

  subss xmm0,[last_place_time] 
  comiss xmm0,[build_delay]
  jb exit_and_cleanup 

  
  push 00
  call unityengine.time.get_time
  fstp dword ptr [last_place_time]
  add esp, 4

  
  mov ecx,[build_step]
  cmp ecx,1
  je build_the_second_cube
  cmp ecx,2
  je build_the_third_cube
  cmp ecx,3
  je build_the_fourth_cube
  jmp exit_and_cleanup 

start_new_build:
  
  mov dword ptr [build_step],1 
  push 00
  call unityengine.time.get_time
  fstp dword ptr [last_place_time]
  add esp,4

  
  mov edi,[ebp+08]
  mov esi,[ebp+14]
  mov ecx,[ebp+0c]
  mov ebx,[edi+000000d8]
  mov [start_x],ecx
  mov cx,[ebp+10]
  mov [start_y],cx
  mov [material_ptr],esi
  mov [model_ptr],ebx

  
  push 00
  push esi
  sub esp,08
  mov eax,esp
  push ebx
  mov ecx,[start_x]
  mov [eax],ecx
  mov cx,[start_y]
  mov [eax+04],cx
  call runtimeprototypecubemodel.addcube
  add esp, 14
  jmp exit_and_cleanup

build_the_second_cube:
  mov dword ptr [build_step],2
  mov esi,[material_ptr]
  mov ebx,[model_ptr]
  mov ecx,[start_x]
  inc ecx 
  push 00
  push esi
  sub esp,08
  mov eax,esp
  push ebx
  mov [eax],ecx
  mov cx,[start_y]
  mov [eax+04],cx
  call runtimeprototypecubemodel.addcube
  add esp,14
  jmp exit_and_cleanup

build_the_third_cube:
  mov dword ptr [build_step],3
  mov esi,[material_ptr]
  mov ebx,[model_ptr]
  mov ecx,[start_x]
  push 00
  push esi
  sub esp,08
  mov eax, esp
  push ebx
  mov [eax],ecx
  mov cx,[start_y]
  inc cx 
  mov [eax+04],cx
  call runtimeprototypecubemodel.addcube
  add esp,14
  jmp exit_and_cleanup

build_the_fourth_cube:
  mov dword ptr [build_step],0 
  mov esi, [material_ptr]
  mov ebx, [model_ptr]
  mov ecx, [start_x]
  inc ecx 
  push 00
  push esi
  sub esp,08
  mov eax,esp
  push ebx
  mov [eax],ecx
  mov cx, [start_y]
  inc cx 
  mov [eax+04],cx
  call runtimeprototypecubemodel.addcube
  add esp,14
  jmp exit_and_cleanup

exit_and_cleanup:
  
  popad
  mov esp,ebp
  pop ebp
  ret

mvcubemodelbase.addcube:
  jmp newmem
  nop
  nop
  nop
  nop
returnhere:


[disable]

dealloc(newmem)
dealloc(build_step)
dealloc(last_place_time)
dealloc(build_delay)
dealloc(start_x)
dealloc(start_y)
dealloc(material_ptr)
dealloc(model_ptr)

mvcubemodelbase.addcube:
db 55 8b ec 83 3d 9e f2 bd 01 00


