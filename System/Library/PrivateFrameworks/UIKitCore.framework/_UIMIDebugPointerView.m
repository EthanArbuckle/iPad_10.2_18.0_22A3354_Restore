@implementation _UIMIDebugPointerView

- (_UIMIDebugPointerView)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _UIMIDebugPointerView *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  UIView *v13;
  uint64_t v14;
  UIView *actualPointer;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  objc_super v22;
  CGRect v23;
  CGRect v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)_UIMIDebugPointerView;
  v7 = -[UIView initWithFrame:](&v22, sel_initWithFrame_);
  if (v7)
  {
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    -[UIView _setCornerRadius:](v7, "_setCornerRadius:", CGRectGetHeight(v23) * 0.5);
    -[UIView layer](v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsEdgeAntialiasing:", 1);

    -[UIView layer](v7, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBorderWidth:", 1.0);

    +[UIColor redColor](UIColor, "redColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v10, "CGColor");
    -[UIView layer](v7, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBorderColor:", v11);

    -[UIView setClipsToBounds:](v7, "setClipsToBounds:", 0);
    v13 = [UIView alloc];
    -[UIView bounds](v7, "bounds");
    v14 = -[UIView initWithFrame:](v13, "initWithFrame:");
    actualPointer = v7->_actualPointer;
    v7->_actualPointer = (UIView *)v14;

    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    -[UIView _setCornerRadius:](v7->_actualPointer, "_setCornerRadius:", CGRectGetHeight(v24) * 0.5);
    -[UIView layer](v7->_actualPointer, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAllowsEdgeAntialiasing:", 1);

    +[UIColor systemBlueColor](UIColor, "systemBlueColor");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend(v17, "CGColor");
    -[UIView layer](v7->_actualPointer, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBorderColor:", v18);

    -[UIView layer](v7->_actualPointer, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setBorderWidth:", 1.0);

    -[UIView addSubview:](v7, "addSubview:", v7->_actualPointer);
  }
  return v7;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double v6;
  UIView *actualPointer;
  double v8;
  uint64_t *v10;
  uint64_t v11;
  id v12;

  height = a3.size.height;
  width = a3.size.width;
  -[UIView setFrame:](self->_actualPointer, "setFrame:", a3.origin.x, a3.origin.y);
  -[UIView bounds](self, "bounds");
  actualPointer = self->_actualPointer;
  if (width == v8 && height == v6)
    v10 = (uint64_t *)MEMORY[0x1E0CD2A60];
  else
    v10 = (uint64_t *)MEMORY[0x1E0CD2A68];
  v11 = *v10;
  -[UIView layer](actualPointer, "layer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerCurve:", v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualPointer, 0);
}

@end
