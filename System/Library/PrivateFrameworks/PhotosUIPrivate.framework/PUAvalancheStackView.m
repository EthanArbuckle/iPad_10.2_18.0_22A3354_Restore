@implementation PUAvalancheStackView

- (PUAvalancheStackView)init
{
  PUAvalancheStackView *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CALayer *v10;
  CALayer *imageLayer;
  CALayer *v12;
  CALayer *stackLayer0;
  CALayer *v14;
  CALayer *stackLayer1;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;
  _QWORD v25[6];
  _QWORD v26[7];

  v26[6] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)PUAvalancheStackView;
  v2 = -[PUAvalancheStackView init](&v24, sel_init);
  if (v2)
  {
    v25[0] = CFSTR("bounds");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v3;
    v25[1] = CFSTR("contents");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v4;
    v25[2] = CFSTR("contentsScale");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v5;
    v25[3] = CFSTR("onOrderIn");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v6;
    v25[4] = CFSTR("onOrderOut");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26[4] = v7;
    v25[5] = CFSTR("sublayers");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26[5] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    imageLayer = v2->_imageLayer;
    v2->_imageLayer = v10;

    v12 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    stackLayer0 = v2->_stackLayer0;
    v2->_stackLayer0 = v12;

    v14 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    stackLayer1 = v2->_stackLayer1;
    v2->_stackLayer1 = v14;

    -[CALayer setOpaque:](v2->_imageLayer, "setOpaque:", 1);
    LODWORD(v16) = 1058642330;
    -[CALayer setOpacity:](v2->_stackLayer0, "setOpacity:", v16);
    LODWORD(v17) = 1058642330;
    -[CALayer setOpacity:](v2->_stackLayer1, "setOpacity:", v17);
    -[CALayer setMasksToBounds:](v2->_imageLayer, "setMasksToBounds:", 1);
    -[CALayer setMasksToBounds:](v2->_stackLayer0, "setMasksToBounds:", 1);
    -[CALayer setMasksToBounds:](v2->_stackLayer1, "setMasksToBounds:", 1);
    -[CALayer setContentsGravity:](v2->_imageLayer, "setContentsGravity:", *MEMORY[0x1E0CD2F98]);
    v18 = *MEMORY[0x1E0CD2F60];
    -[CALayer setContentsGravity:](v2->_stackLayer0, "setContentsGravity:", *MEMORY[0x1E0CD2F60]);
    -[CALayer setContentsGravity:](v2->_stackLayer1, "setContentsGravity:", v18);
    -[CALayer setActions:](v2->_imageLayer, "setActions:", v9);
    -[CALayer setActions:](v2->_stackLayer0, "setActions:", v9);
    -[CALayer setActions:](v2->_stackLayer1, "setActions:", v9);
    -[PUAvalancheStackView layer](v2, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSublayer:", v2->_imageLayer);

    -[PUAvalancheStackView layer](v2, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSublayer:", v2->_stackLayer0);

    -[PUAvalancheStackView layer](v2, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addSublayer:", v2->_stackLayer1);

    -[PUAvalancheStackView layer](v2, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAllowsGroupOpacity:", 0);

  }
  return v2;
}

- (void)setImage:(id)a3
{
  id v4;
  CGImage *v5;
  CGImage *v6;
  size_t Width;
  size_t Height;
  CALayer *imageLayer;
  id v10;
  CALayer *stackLayer0;
  id v12;
  CALayer *stackLayer1;
  id v14;
  id v15;

  v4 = a3;
  -[CALayer contents](self->_imageLayer, "contents");
  v5 = (CGImage *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    Width = CGImageGetWidth(v5);
    Height = CGImageGetHeight(v6);
  }
  else
  {
    Height = 0;
    Width = 0;
  }
  imageLayer = self->_imageLayer;
  v10 = objc_retainAutorelease(v4);
  -[CALayer setContents:](imageLayer, "setContents:", objc_msgSend(v10, "CGImage"));
  stackLayer0 = self->_stackLayer0;
  v12 = objc_retainAutorelease(v10);
  -[CALayer setContents:](stackLayer0, "setContents:", objc_msgSend(v12, "CGImage"));
  stackLayer1 = self->_stackLayer1;
  v14 = objc_retainAutorelease(v12);
  -[CALayer setContents:](stackLayer1, "setContents:", objc_msgSend(v14, "CGImage"));
  v15 = objc_retainAutorelease(v14);
  if (Width != CGImageGetWidth((CGImageRef)objc_msgSend(v15, "CGImage"))
    || Height != CGImageGetHeight((CGImageRef)objc_msgSend(objc_retainAutorelease(v15), "CGImage")))
  {
    -[PUAvalancheStackView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGImage *v16;
  double Width;
  CALayer *stackLayer1;
  double v19;
  CGImage *v20;

  -[PUAvalancheStackView contentScaleFactor](self, "contentScaleFactor");
  v4 = v3 * 2.5;
  v5 = v3 * -0.5;
  -[PUAvalancheStackView _imageContentFrame](self, "_imageContentFrame");
  v7 = v4 + v6;
  v9 = v8 - v4;
  v11 = v10 + v4 * -2.0;
  v12 = v4 + v5;
  v13 = v6 + v4 * 2.0;
  v14 = v8 + v4 * -2.0;
  v15 = v10 + v4 * -4.0;
  -[CALayer setFrame:](self->_imageLayer, "setFrame:");
  -[CALayer setFrame:](self->_stackLayer0, "setFrame:", v7, v9, v11, v12);
  -[CALayer setFrame:](self->_stackLayer1, "setFrame:", v13, v14, v15, v12);
  -[CALayer contents](self->_imageLayer, "contents");
  v16 = (CGImage *)objc_claimAutoreleasedReturnValue();
  v20 = v16;
  if (v16)
  {
    Width = (double)CGImageGetWidth(v16);
    -[CALayer setContentsScale:](self->_stackLayer0, "setContentsScale:", Width / v11);
    stackLayer1 = self->_stackLayer1;
    v19 = Width / v15;
  }
  else
  {
    -[CALayer setContentsScale:](self->_stackLayer0, "setContentsScale:", 1.0);
    stackLayer1 = self->_stackLayer1;
    v19 = 1.0;
  }
  -[CALayer setContentsScale:](stackLayer1, "setContentsScale:", v19);

}

- (CGRect)_imageContentFrame
{
  double v3;
  double v4;
  CGImage *v5;
  CGImage *v6;
  double v8;
  double v9;
  double Width;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect result;

  -[PUAvalancheStackView contentScaleFactor](self, "contentScaleFactor");
  v4 = v3 * 2.5;
  -[CALayer contents](self->_imageLayer, "contents");
  v5 = (CGImage *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_contentMode != 2 || v5 == 0)
  {
    v20 = v4 + v4;
    -[PUAvalancheStackView frame](self, "frame");
    v18 = v8;
    -[PUAvalancheStackView frame](self, "frame");
    v22 = v9 + v4 * -2.0;
    v16 = 0.0;
  }
  else
  {
    Width = (double)CGImageGetWidth(v5);
    v11 = (double)CGImageGetHeight(v6) + v4 * 2.0;
    -[PUAvalancheStackView bounds](self, "bounds");
    v16 = PURectWithSizeThatFitsInRect(Width, v11, v12, v13, v14, v15);
    v18 = v17;
    v20 = v19 + v4 * 2.0;
    v22 = v21 + v4 * -2.0;
  }
  v23 = PURoundRectToPixel(v16, v20, v18, v22);
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v30 = v23;
  v31 = v25;
  v32 = v27;
  v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (void)setImageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_imageLayer, a3);
}

- (CALayer)stackLayer0
{
  return self->_stackLayer0;
}

- (void)setStackLayer0:(id)a3
{
  objc_storeStrong((id *)&self->_stackLayer0, a3);
}

- (CALayer)stackLayer1
{
  return self->_stackLayer1;
}

- (void)setStackLayer1:(id)a3
{
  objc_storeStrong((id *)&self->_stackLayer1, a3);
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackLayer1, 0);
  objc_storeStrong((id *)&self->_stackLayer0, 0);
  objc_storeStrong((id *)&self->_imageLayer, 0);
}

@end
