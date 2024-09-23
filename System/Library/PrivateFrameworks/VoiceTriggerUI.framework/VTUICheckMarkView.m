@implementation VTUICheckMarkView

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[VTUICheckMarkView checkMaskLayer](self, "checkMaskLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)animateForSuccess:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  VTUICheckMarkView *v34;
  id v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;

  v6 = a4;
  if (a3)
    -[VTUICheckMarkView checkMaskLayer](self, "checkMaskLayer");
  else
    -[VTUICheckMarkView xMaskLayer](self, "xMaskLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTUICheckMarkView bounds](self, "bounds");
  v9 = v8;
  objc_msgSend(v7, "bounds");
  v11 = v9 / v10;
  -[VTUICheckMarkView bounds](self, "bounds");
  v13 = v12;
  objc_msgSend(v7, "bounds");
  CGAffineTransformMakeScale(&v39, v11, v13 / v14);
  v38 = v39;
  objc_msgSend(v7, "setAffineTransform:", &v38);
  -[VTUICheckMarkView bounds](self, "bounds");
  v16 = v15;
  -[VTUICheckMarkView colorLayer](self, "colorLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v16 / v18;
  -[VTUICheckMarkView bounds](self, "bounds");
  v21 = v20;
  -[VTUICheckMarkView colorLayer](self, "colorLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  CGAffineTransformMakeScale(&v37, v19, v21 / v23);
  -[VTUICheckMarkView colorLayer](self, "colorLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v37;
  objc_msgSend(v24, "setAffineTransform:", &v36);

  -[VTUICheckMarkView layer](self, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setMask:", v7);

  -[VTUICheckMarkView setAlpha:](self, "setAlpha:", 1.0);
  -[VTUICheckMarkView setHidden:](self, "setHidden:", 0);
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", 0.666666687);
  objc_msgSend(MEMORY[0x24BDE57D8], "disableActions");
  v30 = MEMORY[0x24BDAC760];
  v31 = 3221225472;
  v32 = __50__VTUICheckMarkView_animateForSuccess_completion___block_invoke;
  v33 = &unk_24F33D9D8;
  v34 = self;
  v35 = v6;
  v26 = (void *)MEMORY[0x24BDE57D8];
  v27 = v6;
  objc_msgSend(v26, "setCompletionBlock:", &v30);
  -[VTUICheckMarkView colorLayer](self, "colorLayer", v30, v31, v32, v33, v34);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = 1.0;
  objc_msgSend(v28, "setPhase:", v29);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

void __50__VTUICheckMarkView_animateForSuccess_completion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[5];
  id v4;
  _QWORD v5[4];
  uint64_t v6;

  v1 = (void *)MEMORY[0x24BEBDB00];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__VTUICheckMarkView_animateForSuccess_completion___block_invoke_2;
  v5[3] = &unk_24F33DA28;
  v2 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__VTUICheckMarkView_animateForSuccess_completion___block_invoke_3;
  v3[3] = &unk_24F33DE48;
  v3[4] = v6;
  v4 = v2;
  objc_msgSend(v1, "animateWithDuration:animations:completion:", v5, v3, 0.333333343);

}

uint64_t __50__VTUICheckMarkView_animateForSuccess_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __50__VTUICheckMarkView_animateForSuccess_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "colorLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = 0;
  objc_msgSend(v4, "setPhase:", v3);

}

- (VTUIColorLayer)colorLayer
{
  VTUIColorLayer *colorLayer;
  VTUIColorLayer *v4;
  VTUIColorLayer *v5;
  void *v6;
  double MidX;
  void *v8;
  double MidY;
  void *v10;
  CGRect v12;
  CGRect v13;

  colorLayer = self->_colorLayer;
  if (!colorLayer)
  {
    +[VTUIColorLayer layer](VTUIColorLayer, "layer");
    v4 = (VTUIColorLayer *)objc_claimAutoreleasedReturnValue();
    v5 = self->_colorLayer;
    self->_colorLayer = v4;

    -[VTUIColorLayer setBounds:](self->_colorLayer, "setBounds:", 0.0, 0.0, 400.0, 400.0);
    -[VTUICheckMarkView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    MidX = CGRectGetMidX(v12);
    -[VTUICheckMarkView layer](self, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    MidY = CGRectGetMidY(v13);

    -[VTUIColorLayer setPosition:](self->_colorLayer, "setPosition:", MidX, MidY);
    -[VTUICheckMarkView layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSublayer:", self->_colorLayer);

    colorLayer = self->_colorLayer;
  }
  return colorLayer;
}

- (CALayer)checkMaskLayer
{
  CALayer *checkMaskLayer;
  CALayer *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double MidX;
  double MidY;
  id v14;
  CALayer *v15;
  CGRect v17;
  CGRect v18;

  checkMaskLayer = self->_checkMaskLayer;
  if (!checkMaskLayer)
  {
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v4 = (CALayer *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:", 7, 62.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("checkmark"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithConfiguration:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "size");
    v9 = v8;
    v11 = v10;
    v17.origin.x = 0.0;
    v17.origin.y = 0.0;
    v17.size.width = v9;
    v17.size.height = v11;
    MidX = CGRectGetMidX(v17);
    v18.origin.x = 0.0;
    v18.origin.y = 0.0;
    v18.size.width = v9;
    v18.size.height = v11;
    MidY = CGRectGetMidY(v18);
    v14 = objc_retainAutorelease(v7);
    -[CALayer setContents:](v4, "setContents:", objc_msgSend(v14, "CGImage"));
    -[CALayer setBounds:](v4, "setBounds:", 0.0, 0.0, v9, v11);
    -[CALayer setPosition:](v4, "setPosition:", MidX, MidY);
    v15 = self->_checkMaskLayer;
    self->_checkMaskLayer = v4;

    checkMaskLayer = self->_checkMaskLayer;
  }
  return checkMaskLayer;
}

- (CALayer)xMaskLayer
{
  CALayer *xMaskLayer;
  CALayer *v4;
  CGPath *Mutable;
  CALayer *v6;

  xMaskLayer = self->_xMaskLayer;
  if (!xMaskLayer)
  {
    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v4 = (CALayer *)objc_claimAutoreleasedReturnValue();
    -[CALayer setBounds:](v4, "setBounds:", 0.0, 0.0, 400.0, 400.0);
    -[CALayer setAnchorPoint:](v4, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, 80.0, 80.0);
    CGPathAddLineToPoint(Mutable, 0, 320.0, 320.0);
    CGPathMoveToPoint(Mutable, 0, 80.0, 320.0);
    CGPathAddLineToPoint(Mutable, 0, 320.0, 80.0);
    -[CALayer setPath:](v4, "setPath:", Mutable);
    CGPathRelease(Mutable);
    -[CALayer setFillColor:](v4, "setFillColor:", 0);
    -[CALayer setStrokeColor:](v4, "setStrokeColor:", CGColorGetConstantColor((CFStringRef)*MEMORY[0x24BDBF200]));
    -[CALayer setLineWidth:](v4, "setLineWidth:", 36.0);
    v6 = self->_xMaskLayer;
    self->_xMaskLayer = v4;

    xMaskLayer = self->_xMaskLayer;
  }
  return xMaskLayer;
}

- (void)setCheckMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_checkMaskLayer, a3);
}

- (void)setXMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_xMaskLayer, a3);
}

- (void)setColorLayer:(id)a3
{
  objc_storeStrong((id *)&self->_colorLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorLayer, 0);
  objc_storeStrong((id *)&self->_xMaskLayer, 0);
  objc_storeStrong((id *)&self->_checkMaskLayer, 0);
  objc_storeStrong((id *)&self->_redView, 0);
  objc_storeStrong((id *)&self->_greenView, 0);
  objc_storeStrong((id *)&self->_blueView, 0);
  objc_storeStrong((id *)&self->_redColor, 0);
  objc_storeStrong((id *)&self->_blueColor, 0);
}

@end
