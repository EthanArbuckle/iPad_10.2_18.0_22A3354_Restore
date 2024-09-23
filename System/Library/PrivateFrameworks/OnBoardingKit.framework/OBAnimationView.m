@implementation OBAnimationView

- (OBAnimationView)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  OBAnimationView *result;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)OBAnimationView;
  result = -[OBAnimationView initWithFrame:](&v8, sel_initWithFrame_);
  if (result)
  {
    result->_preferredFrame.origin.x = x;
    result->_preferredFrame.origin.y = y;
    result->_preferredFrame.size.width = width;
    result->_preferredFrame.size.height = height;
  }
  return result;
}

- (double)defaultScale
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[OBAnimationView preferredFrame](self, "preferredFrame");
  v4 = v3;
  -[OBAnimationView package](self, "package");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "size");
  v8 = v4 / v7;

  return v8;
}

- (void)setPackage:(id)a3 sizingTransformScale:(double)a4
{
  CAPackage *v7;

  v7 = (CAPackage *)a3;
  -[OBAnimationView setScale:](self, "setScale:", a4);
  if (self->_package != v7)
  {
    objc_storeStrong((id *)&self->_package, a3);
    -[OBAnimationView _setPackage:](self, "_setPackage:", v7);
  }

}

- (void)_setPackage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[OBAnimationView packageLayer](self, "packageLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperlayer");

  objc_msgSend(v4, "rootLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBAnimationView setPackageLayer:](self, "setPackageLayer:", v6);

  v7 = objc_msgSend(v4, "isGeometryFlipped");
  -[OBAnimationView packageLayer](self, "packageLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGeometryFlipped:", v7);

  v9 = *MEMORY[0x1E0CD2F90];
  -[OBAnimationView packageLayer](self, "packageLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentsGravity:", v9);

  -[OBAnimationView packageLayer](self, "packageLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMasksToBounds:", 0);

  v12 = *MEMORY[0x1E0CD2B50];
  -[OBAnimationView packageLayer](self, "packageLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFillMode:", v12);

  -[OBAnimationView layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShouldRasterize:", 0);

  -[OBAnimationView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBAnimationView packageLayer](self, "packageLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSublayer:", v16);

  -[OBAnimationView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[OBAnimationView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  -[OBAnimationView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMasksToBounds:", 0);

  -[OBAnimationView packageLayer](self, "packageLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBAnimationView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "center");
  objc_msgSend(v4, "setPosition:");

  -[OBAnimationView scale](self, "scale");
  v7 = v6;
  -[OBAnimationView scale](self, "scale");
  if (v8 == 0.0)
  {
    -[OBAnimationView bounds](self, "bounds");
    v10 = v9;
    -[OBAnimationView packageLayer](self, "packageLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v7 = v10 / v12;

  }
  -[OBAnimationView packageLayer](self, "packageLayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBAnimationView packageLayer](self, "packageLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "contentsTransform");
  else
    memset(&v16, 0, sizeof(v16));
  CGAffineTransformScale(&v17, &v16, v7, v7);
  objc_msgSend(v13, "setAffineTransform:", &v17);

}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGSize result;

  -[OBAnimationView packageLayer](self, "packageLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[OBAnimationView scale](self, "scale");
  if (v8 == 0.0)
  {
    -[OBAnimationView preferredFrame](self, "preferredFrame");
    v10 = v9;
    -[OBAnimationView packageLayer](self, "packageLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v10 / v12;

  }
  else
  {
    v13 = v8;
  }
  -[OBAnimationView packageLayer](self, "packageLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "contentsTransform");
  else
    memset(&v20, 0, sizeof(v20));
  CGAffineTransformScale(&v21, &v20, v13, v13);
  v16 = v7 * v21.c + v21.a * v5;

  -[OBAnimationView preferredFrame](self, "preferredFrame");
  v18 = v17;
  v19 = v16;
  result.height = v18;
  result.width = v19;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!v9
    || (v4 = objc_msgSend(v9, "userInterfaceStyle"),
        -[OBAnimationView traitCollection](self, "traitCollection"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "userInterfaceStyle"),
        v5,
        v7 = v9,
        v4 != v6))
  {
    -[OBAnimationView appearanceChangeDelegate](self, "appearanceChangeDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateAnimationForAppearanceChange");

    v7 = v9;
  }

}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (OBAnimationAppearanceChangeDelegate)appearanceChangeDelegate
{
  return (OBAnimationAppearanceChangeDelegate *)objc_loadWeakRetained((id *)&self->_appearanceChangeDelegate);
}

- (void)setAppearanceChangeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_appearanceChangeDelegate, a3);
}

- (BOOL)flipForRTL
{
  return self->_flipForRTL;
}

- (void)setFlipForRTL:(BOOL)a3
{
  self->_flipForRTL = a3;
}

- (CALayer)packageLayer
{
  return self->_packageLayer;
}

- (void)setPackageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_packageLayer, a3);
}

- (CAPackage)package
{
  return self->_package;
}

- (void)setPackage:(id)a3
{
  objc_storeStrong((id *)&self->_package, a3);
}

- (CGRect)preferredFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_preferredFrame.origin.x;
  y = self->_preferredFrame.origin.y;
  width = self->_preferredFrame.size.width;
  height = self->_preferredFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreferredFrame:(CGRect)a3
{
  self->_preferredFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_packageLayer, 0);
  objc_destroyWeak((id *)&self->_appearanceChangeDelegate);
}

@end
