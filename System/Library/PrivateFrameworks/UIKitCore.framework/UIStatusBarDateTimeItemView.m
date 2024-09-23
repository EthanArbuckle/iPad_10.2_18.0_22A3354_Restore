@implementation UIStatusBarDateTimeItemView

+ (const)_cStringFromData:(id *)a3
{
  return 0;
}

- (BOOL)shouldTintContentImage
{
  return 1;
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v5;
  void *v6;
  NSString **p_dateTimeString;
  char v8;

  v5 = objc_msgSend(a3, "rawData");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", objc_msgSend((id)objc_opt_class(), "_cStringFromData:", v5), 4);
  p_dateTimeString = &self->_dateTimeString;
  v8 = objc_msgSend(v6, "isEqualToString:", *p_dateTimeString);
  if ((v8 & 1) == 0)
    objc_storeStrong((id *)p_dateTimeString, v6);

  return v8 ^ 1;
}

- (id)contentsImage
{
  return -[UIStatusBarItemView imageWithText:shouldCache:](self, "imageWithText:shouldCache:", self->_dateTimeString, 0);
}

- (int64_t)textStyle
{
  return 3;
}

- (void)setVisible:(BOOL)a3 frame:(CGRect)a4 duration:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v10;
  _BOOL4 v12;
  double v13;
  objc_super v14;
  _QWORD v15[6];
  BOOL v16;
  _QWORD v17[5];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  if (self->_useCustomFadeAnimation)
  {
    if (-[UIStatusBarItemView isVisible](self, "isVisible") != a3)
    {
      -[UIStatusBarItemView setVisible:settingAlpha:](self, "setVisible:settingAlpha:", v10, 0);
      if (a5 <= 0.0)
      {
        v12 = -[UIStatusBarItemView isVisible](self, "isVisible");
        v13 = 0.0;
        if (v12)
          v13 = 1.0;
        -[UIView setAlpha:](self, "setAlpha:", v13);
      }
      else
      {
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __57__UIStatusBarDateTimeItemView_setVisible_frame_duration___block_invoke;
        v17[3] = &unk_1E16B1B28;
        v17[4] = self;
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __57__UIStatusBarDateTimeItemView_setVisible_frame_duration___block_invoke_2;
        v15[3] = &unk_1E16D9340;
        v16 = v10;
        *(double *)&v15[5] = a5;
        v15[4] = self;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 32, v17, v15, a5 * 0.2, 0.0);
      }
    }
    -[UIStatusBarDateTimeItemView setFrame:](self, "setFrame:", x, y, width, height);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)UIStatusBarDateTimeItemView;
    -[UIStatusBarItemView setVisible:frame:duration:](&v14, sel_setVisible_frame_duration_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5);
  }
}

uint64_t __57__UIStatusBarDateTimeItemView_setVisible_frame_duration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __57__UIStatusBarDateTimeItemView_setVisible_frame_duration___block_invoke_2(uint64_t result)
{
  double v1;
  _QWORD v2[5];

  if (*(_BYTE *)(result + 48))
  {
    v1 = *(double *)(result + 40) * 0.5;
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __57__UIStatusBarDateTimeItemView_setVisible_frame_duration___block_invoke_3;
    v2[3] = &unk_1E16B1B28;
    v2[4] = *(_QWORD *)(result + 32);
    return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 32, v2, 0, v1, 0.0);
  }
  return result;
}

uint64_t __57__UIStatusBarDateTimeItemView_setVisible_frame_duration___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v19.receiver = self;
  v19.super_class = (Class)UIStatusBarDateTimeItemView;
  -[UIView setFrame:](&v19, sel_setFrame_, x, y, width, height);
  -[UIView frame](self, "frame");
  v21.origin.x = v9;
  v21.origin.y = v11;
  v21.size.width = v13;
  v21.size.height = v15;
  if (!CGRectEqualToRect(v20, v21))
  {
    -[UIView _screen](self, "_screen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 == v17)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "postNotificationName:object:", CFSTR("UIStatusBarTimeItemViewDidMoveNotification"), 0);

    }
  }
}

- (double)extraRightPadding
{
  uint64_t v3;
  double result;
  objc_super v5;

  v3 = _UIDeviceNativeUserInterfaceIdiom();
  result = 4.0;
  if (v3 != 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIStatusBarDateTimeItemView;
    -[UIStatusBarItemView extraRightPadding](&v5, sel_extraRightPadding, 4.0);
  }
  return result;
}

- (id)accessibilityHUDRepresentation
{
  return -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", self->_dateTimeString, 0, 0.0, 0.0, 0.0, 0.0);
}

- (BOOL)useCustomFadeAnimation
{
  return self->_useCustomFadeAnimation;
}

- (void)setUseCustomFadeAnimation:(BOOL)a3
{
  self->_useCustomFadeAnimation = a3;
}

- (NSString)dateTimeString
{
  return self->_dateTimeString;
}

- (void)setDateTimeString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateTimeString, 0);
}

@end
