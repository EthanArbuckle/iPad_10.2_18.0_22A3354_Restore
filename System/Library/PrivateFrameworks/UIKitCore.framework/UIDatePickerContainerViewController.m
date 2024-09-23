@implementation UIDatePickerContainerViewController

void __64___UIDatePickerContainerViewController_keyboardFrameWillChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  double v19;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  objc_msgSend(*(id *)(a1 + 32), "presentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && objc_msgSend(v3, "isUserInteractionEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "keyboardAdjustmentOffset");
    v5 = v4;
    objc_msgSend(v3, "frame");
    v22 = CGRectOffset(v21, 0.0, -v5);
    x = v22.origin.x;
    y = v22.origin.y;
    width = v22.size.width;
    height = v22.size.height;
    objc_msgSend(*(id *)(a1 + 32), "presentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeDatePicker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_style");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    if (CGRectIntersectsRect(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), v24))
    {
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      v23 = CGRectIntersection(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), v25);
      CGRectGetHeight(v23);
      objc_msgSend(v12, "overlayPlatterDefaultMargin");
    }
    UIRoundToViewScale(v3);
    v14 = v13;
    objc_msgSend(*(id *)(a1 + 32), "setKeyboardAdjustmentOffset:");
    if (v14 != v5)
    {
      v15 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __64___UIDatePickerContainerViewController_keyboardFrameWillChange___block_invoke_2;
      v17[3] = &unk_1E16B4E70;
      v18 = v3;
      v19 = v5;
      v20 = v14;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v16, v17, 0, v15, 0.0);

    }
  }

}

uint64_t __64___UIDatePickerContainerViewController_keyboardFrameWillChange___block_invoke_2(uint64_t a1)
{
  void *v2;
  CGFloat v3;
  double v4;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  memset(&v9, 0, sizeof(v9));
  v2 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v2, "transform");
  v3 = -*(double *)(a1 + 40);
  v7 = v9;
  CGAffineTransformTranslate(&v8, &v7, 0.0, v3);
  v9 = v8;
  v4 = *(double *)(a1 + 48);
  if (v4 != 0.0)
  {
    v7 = v9;
    CGAffineTransformTranslate(&v8, &v7, 0.0, v4);
    v9 = v8;
  }
  v6 = v9;
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", &v6);
}

@end
