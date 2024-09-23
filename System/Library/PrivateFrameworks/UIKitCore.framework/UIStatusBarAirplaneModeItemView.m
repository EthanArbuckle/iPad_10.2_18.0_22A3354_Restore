@implementation UIStatusBarAirplaneModeItemView

- (void)setVisible:(BOOL)a3 frame:(CGRect)a4 duration:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v10;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  uint64_t v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  double v28;
  CGFloat rect;
  objc_super v30;
  _QWORD v31[9];
  _QWORD v32[9];
  _QWORD v33[9];
  CGRect v34;
  CGRect v35;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  if (a5 > 0.0
    && +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
  {
    v12 = *((_DWORD *)&self->super.super.super._viewFlags + 4);
    -[UIView frame](self, "frame");
    v14 = v13;
    rect = v15;
    v17 = v16;
    v19 = v18;
    v20 = _UIDeviceNativeUserInterfaceIdiom();
    if (v10)
    {
      if (v20 == 1)
      {
        if ((v12 & 0x80000) != 0)
          v21 = 70.0;
        else
          v21 = -70.0;
        v24 = v14 + v21;
      }
      else if ((v12 & 0x80000) != 0)
      {
        v34.origin.x = v14;
        v34.origin.y = rect;
        v34.size.width = v17;
        v34.size.height = v19;
        v24 = v17 + CGRectGetMaxX(v34);
      }
      else
      {
        v24 = -v17;
      }
      v25 = MEMORY[0x1E0C809B0];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __61__UIStatusBarAirplaneModeItemView_setVisible_frame_duration___block_invoke;
      v33[3] = &unk_1E16B20D8;
      v33[4] = self;
      *(double *)&v33[5] = v24;
      *(CGFloat *)&v33[6] = rect;
      *(double *)&v33[7] = v17;
      *(CGFloat *)&v33[8] = v19;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v33, *(_QWORD *)&rect);
      v32[0] = v25;
      v32[1] = 3221225472;
      v32[2] = __61__UIStatusBarAirplaneModeItemView_setVisible_frame_duration___block_invoke_2;
      v32[3] = &unk_1E16B20D8;
      v32[4] = self;
      *(double *)&v32[5] = x;
      *(double *)&v32[6] = y;
      v26 = 131136;
      *(double *)&v32[7] = width;
      *(double *)&v32[8] = height;
      v27 = v32;
      v28 = a5;
    }
    else
    {
      if (v20 == 1)
      {
        v22 = dbl_186682EA0[(*(_QWORD *)&v12 & 0x80000) == 0] + v14;
        v23 = rect;
      }
      else
      {
        v23 = rect;
        if ((v12 & 0x80000) != 0)
        {
          v35.origin.x = v14;
          v35.origin.y = rect;
          v35.size.width = v17;
          v35.size.height = v19;
          v22 = CGRectGetMaxX(v35) + -70.0;
        }
        else
        {
          v22 = 70.0;
        }
      }
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __61__UIStatusBarAirplaneModeItemView_setVisible_frame_duration___block_invoke_3;
      v31[3] = &unk_1E16B20D8;
      v31[4] = self;
      *(double *)&v31[5] = v22;
      *(CGFloat *)&v31[6] = v23;
      *(double *)&v31[7] = v17;
      *(CGFloat *)&v31[8] = v19;
      v27 = v31;
      v28 = a5;
      v26 = 65600;
    }
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v26, v27, 0, v28, 0.0, *(_QWORD *)&rect);
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)UIStatusBarAirplaneModeItemView;
    -[UIStatusBarItemView setVisible:frame:duration:](&v30, sel_setVisible_frame_duration_, v10, x, y, width, height, a5);
  }
}

uint64_t __61__UIStatusBarAirplaneModeItemView_setVisible_frame_duration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setVisible:", 1);
}

uint64_t __61__UIStatusBarAirplaneModeItemView_setVisible_frame_duration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __61__UIStatusBarAirplaneModeItemView_setVisible_frame_duration___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setVisible:", 0);
}

- (id)contentsImage
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIStatusBarAirplaneModeItemView;
  -[UIStatusBarIndicatorItemView contentsImage](&v6, sel_contentsImage);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UIStatusBarItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    objc_msgSend(v3, "imageSetWithOrientation:", 4);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

@end
