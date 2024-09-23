@implementation UIKBRTTouchDrifting

void __28___UIKBRTTouchDrifting_init__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "leftDriftLockTouchIDs");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

void __28___UIKBRTTouchDrifting_init__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "rightDriftLockTouchIDs");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

uint64_t __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_2;
  v4[3] = &unk_1E16D8180;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a3, "enumerateObjectsUsingBlock:", v4);
}

uint64_t __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  uint64_t result;
  double v5;

  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a2, "touchTime");
  if (v3 >= v5)
    v5 = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

uint64_t __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_4;
  v4[3] = &unk_1E16D8180;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a3, "enumerateObjectsUsingBlock:", v4);
}

uint64_t __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_4(uint64_t a1, void *a2)
{
  double v3;
  uint64_t result;
  double v5;

  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a2, "touchTime");
  if (v3 >= v5)
    v5 = v3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

BOOL __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "indexOfObjectPassingTest:", &__block_literal_global_34_2) != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isActive") && (objc_msgSend(v2, "ignoreForDrift") & 1) == 0)
    v3 = objc_msgSend(v2, "ignoreTouch") ^ 1;
  else
    v3 = 0;

  return v3;
}

BOOL __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "indexOfObjectPassingTest:", &__block_literal_global_36_3) != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isActive") && (objc_msgSend(v2, "ignoreForDrift") & 1) == 0)
    v3 = objc_msgSend(v2, "ignoreTouch") ^ 1;
  else
    v3 = 0;

  return v3;
}

void __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_37(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_2_38;
  v9[3] = &unk_1E16D8210;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10 = v7;
  v11 = v8;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v9);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;

}

void __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_2_38(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  id v8;

  v7 = a2;
  if (*(id *)(a1 + 32) == v7)
  {
    v8 = v7;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v7 = v8;
    *a4 = 1;
  }

}

void __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_3_39(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_4_40;
  v9[3] = &unk_1E16D8210;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10 = v7;
  v11 = v8;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v9);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;

}

void __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_4_40(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  id v8;

  v7 = a2;
  if (*(id *)(a1 + 32) == v7)
  {
    v8 = v7;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v7 = v8;
    *a4 = 1;
  }

}

uint64_t __68___UIKBRTTouchDrifting__updateDriftForFingers_leftHand_newestTouch___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[4];
  __int128 v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68___UIKBRTTouchDrifting__updateDriftForFingers_leftHand_newestTouch___block_invoke_2;
  v4[3] = &unk_1E16D8260;
  v5 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a3, "enumerateObjectsUsingBlock:", v4);
}

void __68___UIKBRTTouchDrifting__updateDriftForFingers_leftHand_newestTouch___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isActive")
    && (objc_msgSend(v3, "ignoreForDrift") & 1) == 0
    && (objc_msgSend(v3, "ignoreTouch") & 1) == 0)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

void __68___UIKBRTTouchDrifting__updateDriftForFingers_leftHand_newestTouch___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];

  v5 = a3;
  v11 = v5;
  if (!*(_BYTE *)(a1 + 56))
  {
    v6 = objc_msgSend(a2, "intValue");
    v5 = v11;
    if (*(_QWORD *)(a1 + 48) != v6)
    {
      v7 = objc_msgSend(v11, "count");
      v5 = v11;
      if (v7)
      {
        v8 = *(void **)(a1 + 32);
        objc_msgSend(v11, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "touchIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v10);

        v5 = v11;
      }
    }
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68___UIKBRTTouchDrifting__updateDriftForFingers_leftHand_newestTouch___block_invoke_4;
  v13[3] = &unk_1E16D8180;
  v13[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v13, v11);

}

uint64_t __68___UIKBRTTouchDrifting__updateDriftForFingers_leftHand_newestTouch___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "setIgnoreTouch:", 0);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __40___UIKBRTTouchDrifting__updateDriftView__block_invoke()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceIdiom") != 1
    || ((objc_msgSend(v0, "bounds"), v2 = v1, objc_msgSend(v0, "bounds"), v2 >= v3) ? (v4 = v2) : (v4 = v3), v4 <= 1024.0))
  {
    qword_1ECD75D00 = 0x400000005;
    dword_1ECD75D08 = 4;
    _MergedGlobals_11 = 0x4014000000000000;
  }

}

void __40___UIKBRTTouchDrifting__updateDriftView__block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  uint64_t v10;
  id v11;
  _UIKBRTTouchDrifingFingerCircleView *v12;
  _UIKBRTTouchDrifingFingerCircleView *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;

  v26 = a2;
  v3 = objc_msgSend(v26, "isLeftHand");
  v4 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v4, "fCenter");
  else
    objc_msgSend(v4, "jCenter");
  v7 = v5;
  v8 = v6;
  v9 = objc_msgSend(v26, "isLeftHand");
  v10 = 9;
  if (v9)
    v10 = 6;
  v11 = *(id *)(*(_QWORD *)(a1 + 32) + OBJC_IVAR____UIKBRTTouchDrifting__touches[v10]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "objectForKey:", v26);
  v12 = (_UIKBRTTouchDrifingFingerCircleView *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v13 = [_UIKBRTTouchDrifingFingerCircleView alloc];
    v12 = -[_UIKBRTTouchDrifingFingerCircleView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    +[UIColor orangeColor](UIColor, "orangeColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v14);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "setObject:forKey:", v12, v26);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "addSubview:", v12);
  }
  v15 = *(void **)(a1 + 32);
  objc_msgSend(v26, "historyOffset");
  objc_msgSend(v15, "_pointFromPoint:plusOffset:", v7, v8, v16, v17);
  v19 = v18;
  v21 = v20;
  objc_msgSend(v11, "offset");
  objc_msgSend(v15, "_pointFromPoint:plusOffset:", v19, v21, v22, v23);
  -[_UIKBRTTouchDrifingFingerCircleView setFrame:](v12, "setFrame:", v24 + -5.0, v25 + -5.0, 11.0, 11.0);

}

@end
