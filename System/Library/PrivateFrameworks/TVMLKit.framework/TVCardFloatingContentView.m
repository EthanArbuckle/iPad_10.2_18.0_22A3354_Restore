@implementation TVCardFloatingContentView

uint64_t __76___TVCardFloatingContentView_setSelected_animated_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  _QWORD v8[5];
  char v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(double *)(v2 + 856) != 1.0)
  {
    objc_msgSend(MEMORY[0x24BDF6F90], "inheritedAnimationDuration");
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __76___TVCardFloatingContentView_setSelected_animated_withAnimationCoordinator___block_invoke_2;
    v8[3] = &unk_24EB852F8;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = *(_BYTE *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 32, v8, 0, v3 * 0.3, 0.0);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v4 = 0.0;
  v5 = 0.0;
  if (*(_BYTE *)(a1 + 40))
    v5 = *(double *)(v2 + 880);
  objc_msgSend(*(id *)(v2 + 848), "setAlpha:", v5);
  v6 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(a1 + 40))
    v4 = *(double *)(v6 + 872);
  return objc_msgSend(*(id *)(v6 + 840), "setAlpha:", v4);
}

uint64_t __76___TVCardFloatingContentView_setSelected_animated_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  double *v2;
  double v3;

  v2 = *(double **)(a1 + 32);
  v3 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v3 = v2[107];
  return objc_msgSend(v2, "setAlpha:", v3);
}

uint64_t __76___TVCardFloatingContentView_setSelected_animated_withAnimationCoordinator___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76___TVCardFloatingContentView_setSelected_animated_withAnimationCoordinator___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelected:animated:withAnimationCoordinator:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41), *(_QWORD *)(a1 + 32));
}

@end
