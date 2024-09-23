@implementation SSReduceTransparencyFlashView

- (SSReduceTransparencyFlashView)initWithFrame:(CGRect)a3
{
  SSReduceTransparencyFlashView *v3;
  UIView *v4;
  UIView *colorView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSReduceTransparencyFlashView;
  v3 = -[SSFlashView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
  colorView = v3->_colorView;
  v3->_colorView = v4;

  -[SSReduceTransparencyFlashView addSubview:](v3, "addSubview:", v3->_colorView);
  return v3;
}

- (void)layoutSubviews
{
  UIView *colorView;
  id v4;

  colorView = self->_colorView;
  -[SSReduceTransparencyFlashView bounds](self, "bounds");
  -[UIView setFrame:](colorView, "setFrame:");
  if (-[SSFlashView style](self, "style"))
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_colorView, "setBackgroundColor:", v4);

}

+ (double)expectedAnimationDurationForStyle:(unint64_t)a3
{
  return 1.0;
}

- (void)flashWithCompletion:(id)a3
{
  id v4;
  void (**oldCompletionBlock)(void);
  id v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];

  v4 = a3;
  oldCompletionBlock = (void (**)(void))self->_oldCompletionBlock;
  if (oldCompletionBlock)
  {
    oldCompletionBlock[2]();
    v6 = self->_oldCompletionBlock;
    self->_oldCompletionBlock = 0;

  }
  -[UIView setAlpha:](self->_colorView, "setAlpha:", 1.0);
  v7 = (void *)MEMORY[0x24BDF6F90];
  objc_msgSend((id)objc_opt_class(), "expectedAnimationDurationForStyle:", -[SSFlashView style](self, "style"));
  v9 = v8;
  v12 = v4;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__SSReduceTransparencyFlashView_flashWithCompletion___block_invoke;
  v13[3] = &unk_24D06BE08;
  v13[4] = self;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__SSReduceTransparencyFlashView_flashWithCompletion___block_invoke_2;
  v11[3] = &unk_24D06BF48;
  v10 = v4;
  objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 6, v13, v11, v9, 0.0);

}

uint64_t __53__SSReduceTransparencyFlashView_flashWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setAlpha:", 0.0);
}

uint64_t __53__SSReduceTransparencyFlashView_flashWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_storeStrong(&self->_oldCompletionBlock, 0);
}

@end
