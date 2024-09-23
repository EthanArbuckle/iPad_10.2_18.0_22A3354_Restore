@implementation UIKBRTTouchHistory

uint64_t __31___UIKBRTTouchHistory_lastTime__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "ignoreForDrift") & 1) != 0)
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "ignoreTouch") ^ 1;

  return v3;
}

void __43___UIKBRTTouchHistory_adjustHistoryOffset___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "ignoreForDrift") & 1) == 0
    && (objc_msgSend(v5, "ignoreTouch") & 1) == 0
    && (objc_msgSend(v5, "isActive") & 1) == 0)
  {
    objc_msgSend(v5, "errorVector");
    objc_msgSend(v5, "setErrorVector:", v3 - *(double *)(a1 + 32), v4 - *(double *)(a1 + 40));
  }

}

uint64_t __35___UIKBRTTouchHistory_clearHistory__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isActive") ^ 1;
}

uint64_t __35___UIKBRTTouchHistory__sortHistory__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isActive") & 1) != 0)
  {
    v3 = 0;
  }
  else if ((objc_msgSend(v2, "ignoreForDrift") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "ignoreTouch");
  }

  return v3;
}

uint64_t __35___UIKBRTTouchHistory__sortHistory__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v4, "isActive") && !objc_msgSend(v5, "isActive"))
    goto LABEL_12;
  if ((objc_msgSend(v4, "isActive") & 1) == 0 && (objc_msgSend(v5, "isActive") & 1) != 0)
  {
    v6 = -1;
    goto LABEL_21;
  }
  if (!objc_msgSend(v4, "isActive"))
    goto LABEL_18;
  if ((objc_msgSend(v4, "ignoreTouch") & 1) != 0)
  {
    if ((objc_msgSend(v5, "ignoreTouch") & 1) == 0)
    {
      v7 = 0;
      goto LABEL_14;
    }
LABEL_18:
    objc_msgSend(v4, "touchTime");
    v11 = v10;
    objc_msgSend(v5, "touchTime");
    v13 = v11 - v12;
    if (v13 < 0.0)
      v6 = -1;
    else
      v6 = v13 > 0.0;
    goto LABEL_21;
  }
  v8 = objc_msgSend(v4, "ignoreForDrift");
  if ((objc_msgSend(v5, "ignoreTouch") & 1) != 0)
  {
    if ((v8 & 1) != 0)
      goto LABEL_18;
LABEL_12:
    v6 = 1;
    goto LABEL_21;
  }
  v7 = v8 ^ 1;
LABEL_14:
  v9 = objc_msgSend(v5, "ignoreForDrift");
  if (v7 | v9)
    v6 = 1;
  else
    v6 = -1;
  if (v7 != v9)
    goto LABEL_18;
LABEL_21:

  return v6;
}

uint64_t __43___UIKBRTTouchHistory__decayHistoryToSize___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a2;
  if ((objc_msgSend(v6, "isActive") & 1) != 0
    || (v7 = *(double *)(a1 + 40), objc_msgSend(v6, "touchTime"), v7 - v8 < *(double *)(a1 + 48)))
  {
    v9 = 0;
  }
  else
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(_QWORD *)(v10 + 24) - 1;
    *(_QWORD *)(v10 + 24) = v11;
    *a4 = v11 == 0;
    v9 = 1;
  }

  return v9;
}

BOOL __43___UIKBRTTouchHistory__decayHistoryToSize___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  _BOOL8 v6;

  v3 = a2;
  v6 = 0;
  if ((objc_msgSend(v3, "isActive") & 1) == 0)
  {
    v4 = *(double *)(a1 + 32);
    objc_msgSend(v3, "touchTime");
    if (v4 - v5 >= *(double *)(a1 + 40))
      v6 = 1;
  }

  return v6;
}

double __36___UIKBRTTouchHistory__updateOffset__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  double result;

  v3 = a2;
  objc_msgSend(v3, "errorVector");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = v4
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 32);
  objc_msgSend(v3, "errorVector");
  v6 = v5;

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v6 + *(double *)(v7 + 40);
  *(double *)(v7 + 40) = result;
  return result;
}

void __36___UIKBRTTouchHistory__updateOffset__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6;
  int v7;
  id v8;

  v8 = a2;
  if ((objc_msgSend(v8, "ignoreForDrift") & 1) == 0 && (objc_msgSend(v8, "ignoreTouch") & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(_DWORD *)(v6 + 24);
    *(_DWORD *)(v6 + 24) = v7 + 1;
    *a4 = v7 > 8;
  }

}

@end
