@implementation UITextContainerView

void __76___UITextContainerView__setFrameOrBounds_oldRect_isFrameRect_settingAction___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  CGFloat v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  int v8;
  double v9;
  id v11;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(a1 + 48) == v2[64])
  {
    v3 = *(double *)(a1 + 56);
    v4 = *(double *)(a1 + 64);
    v5 = *(double *)(a1 + 72);
    v6 = *(double *)(a1 + 80);
    if (*(_BYTE *)(a1 + 120))
    {
      if (objc_msgSend(v2, "isHorizontallyResizable"))
      {
        objc_msgSend(*(id *)(a1 + 32), "bounds");
        v6 = v7;
      }
      v8 = objc_msgSend(*(id *)(a1 + 32), "isVerticallyResizable");
      v2 = *(_QWORD **)(a1 + 32);
      if (v8)
      {
        objc_msgSend(v2, "bounds");
        v5 = v9;
        v2 = *(_QWORD **)(a1 + 32);
      }
    }
    _UITextContainerViewResyncNSTextContainer(v2, v3, v4, v5, v6);
    if (*(double *)(a1 + 104) != v5 || *(double *)(a1 + 112) != v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "invalidateTextContainerOrigin");
      objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:", CFSTR("_UITextContainerViewSizeDidChange"), *(_QWORD *)(a1 + 32));

    }
  }
}

_QWORD *__76___UITextContainerView__setFrameOrBounds_oldRect_isFrameRect_settingAction___block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = *(_QWORD **)(a1 + 32);
  v3 = result[65];
  if (v3)
  {
    if (*(_QWORD *)(a1 + 40) == result[64])
    {
      result = (_QWORD *)objc_msgSend(result, "setClipsToBounds:", v3 == 1);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520) = 0;
    }
  }
  return result;
}

id __33___UITextContainerView_setFrame___block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)_UITextContainerView;
  return objc_msgSendSuper2(&v2, sel_setFrame_, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __76___UITextContainerView__setFrameOrBounds_oldRect_isFrameRect_settingAction___block_invoke_3(uint64_t a1)
{
  uint64_t v1;

  v1 = 32;
  if (!*(_BYTE *)(a1 + 48))
    v1 = 40;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + v1) + 16))();
}

id __34___UITextContainerView_setBounds___block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)_UITextContainerView;
  return objc_msgSendSuper2(&v2, sel_setBounds_, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

@end
