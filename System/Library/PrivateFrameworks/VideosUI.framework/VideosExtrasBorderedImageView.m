@implementation VideosExtrasBorderedImageView

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  __int128 v6;
  objc_super v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  if (-[VideosExtrasBorderedImageView shouldDeferSettingTransform](self, "shouldDeferSettingTransform"))
  {
    v5 = *(_OWORD *)&a3->c;
    v8 = *(_OWORD *)&a3->a;
    v9 = v5;
    v10 = *(_OWORD *)&a3->tx;
    -[VideosExtrasBorderedImageView setDeferredTransform:](self, "setDeferredTransform:", &v8);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VideosExtrasBorderedImageView;
    v6 = *(_OWORD *)&a3->c;
    v8 = *(_OWORD *)&a3->a;
    v9 = v6;
    v10 = *(_OWORD *)&a3->tx;
    -[VideosExtrasBorderedImageView setTransform:](&v7, sel_setTransform_, &v8);
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VideosExtrasBorderedImageView;
  if (-[VideosExtrasBorderedImageView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4)
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("borderColor")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("borderWidth"));
  }

  return v5;
}

- (UIColor)borderColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3658];
  -[VideosExtrasBorderedImageView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "borderColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (void)setBorderColor:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[VideosExtrasBorderedImageView layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGColor");

  objc_msgSend(v7, "setBorderColor:", v6);
}

- (double)borderWidth
{
  void *v2;
  double v3;
  double v4;

  -[VideosExtrasBorderedImageView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "borderWidth");
  v4 = v3;

  return v4;
}

- (void)setBorderWidth:(double)a3
{
  id v4;

  -[VideosExtrasBorderedImageView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderWidth:", a3);

}

- (void)replicateStateFromImageView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
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
  CGAffineTransform v33;
  CGAffineTransform t1;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;

  v4 = a3;
  -[VideosExtrasBorderedImageView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[VideosExtrasBorderedImageView shouldSkipImageWhenReplicatingState](self, "shouldSkipImageWhenReplicatingState"))
  {
    objc_msgSend(v4, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VideosExtrasBorderedImageView setImage:](self, "setImage:", v7);

  }
  objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "borderColor"));
  objc_msgSend(v6, "borderWidth");
  objc_msgSend(v5, "setBorderWidth:");
  objc_msgSend(v4, "bounds");
  -[VideosExtrasBorderedImageView convertRect:fromView:](self, "convertRect:fromView:", v4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[VideosExtrasBorderedImageView superview](self, "superview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v4, "superview");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "convertPoint:fromView:", v21, v18, v20);
  v23 = v22;
  v25 = v24;

  if (-[VideosExtrasBorderedImageView shouldUseTransformWhenReplicatingState](self, "shouldUseTransformWhenReplicatingState"))
  {
    -[VideosExtrasBorderedImageView bounds](self, "bounds");
    v27 = v26;
    v29 = v28;
    if (MPUFloatLessThanOrEqualToFloat())
      v27 = 1.0;
    if (MPUFloatLessThanOrEqualToFloat())
      v30 = 1.0;
    else
      v30 = v29;
    memset(&v37, 0, sizeof(v37));
    CGAffineTransformMakeScale(&v37, v13 / v27, v15 / v30);
    -[VideosExtrasBorderedImageView center](self, "center");
    memset(&v36, 0, sizeof(v36));
    CGAffineTransformMakeTranslation(&v36, v23 - v31, v25 - v32);
    t1 = v37;
    memset(&v35, 0, sizeof(v35));
    v33 = v36;
    CGAffineTransformConcat(&v35, &t1, &v33);
    t1 = v35;
    -[VideosExtrasBorderedImageView setTransform:](self, "setTransform:", &t1);
  }
  else
  {
    -[VideosExtrasBorderedImageView setBounds:](self, "setBounds:", v9, v11, v13, v15);
    -[VideosExtrasBorderedImageView setCenter:](self, "setCenter:", v23, v25);
  }

}

- (CGAffineTransform)deferredTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[11].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[10].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[11].d;
  return self;
}

- (void)setDeferredTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_deferredTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_deferredTransform.c = v4;
  *(_OWORD *)&self->_deferredTransform.tx = v3;
}

- (BOOL)shouldDeferSettingTransform
{
  return self->_shouldDeferSettingTransform;
}

- (void)setShouldDeferSettingTransform:(BOOL)a3
{
  self->_shouldDeferSettingTransform = a3;
}

- (BOOL)shouldUseTransformWhenReplicatingState
{
  return self->_shouldUseTransformWhenReplicatingState;
}

- (void)setShouldUseTransformWhenReplicatingState:(BOOL)a3
{
  self->_shouldUseTransformWhenReplicatingState = a3;
}

- (BOOL)shouldSkipImageWhenReplicatingState
{
  return self->_shouldSkipImageWhenReplicatingState;
}

- (void)setShouldSkipImageWhenReplicatingState:(BOOL)a3
{
  self->_shouldSkipImageWhenReplicatingState = a3;
}

@end
