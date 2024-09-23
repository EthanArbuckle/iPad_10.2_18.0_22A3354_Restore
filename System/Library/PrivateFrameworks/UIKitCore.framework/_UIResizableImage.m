@implementation _UIResizableImage

- (BOOL)_suppressesAccessibilityHairlineThickening
{
  return 1;
}

- (BOOL)_isTiledWhenStretchedToSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;

  if ((*(_BYTE *)&self->_rImageFlags & 1) != 0)
    return 0;
  height = a3.height;
  width = a3.width;
  -[UIImage size](self, "size");
  if (v6 - self->_capInsets.left - self->_capInsets.right > 1.0 && width != v6)
    return 1;
  if (height == v7)
    return 0;
  return v7 - self->_capInsets.top - self->_capInsets.bottom > 1.0;
}

- (BOOL)_isSubimage
{
  return (*(_BYTE *)&self->_rImageFlags >> 1) & 1;
}

- (CGRect)_contentStretchInPixels
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[5];
  CGRect result;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44___UIResizableImage__contentStretchInPixels__block_invoke;
  v6[3] = &unk_1E16CAF00;
  v6[4] = self;
  -[_UIResizableImage _contentRectInPixelsApplyingInsets:emptySizeFallback:](self, "_contentRectInPixelsApplyingInsets:emptySizeFallback:", v6, self->_capInsets.top, self->_capInsets.left, self->_capInsets.bottom, self->_capInsets.right);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)_contentRectInPixelsApplyingInsets:(UIEdgeInsets)a3 emptySizeFallback:(id)a4
{
  double right;
  double bottom;
  double left;
  double top;
  double (**v9)(_QWORD);
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
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
  CGRect result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v9 = (double (**)(_QWORD))a4;
  -[UIImage content](self, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sizeInPixels");
  v13 = v12;
  v14 = v11;
  if (v12 <= 0.0 || v11 <= 0.0)
  {
    if (v9)
    {
      v21 = v9[2](v9);
      v22 = v23;
      v13 = v24;
      v14 = v25;
    }
    else
    {
      v21 = *MEMORY[0x1E0C9D538];
      v22 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    }
  }
  else
  {
    objc_msgSend(v10, "scale");
    v16 = top * v15;
    v17 = bottom * v15;
    v18 = *MEMORY[0x1E0C9D538] + left * v15;
    v19 = top * v15 + *(double *)(MEMORY[0x1E0C9D538] + 8);
    v20 = v13 - (left * v15 + right * v15);
    v21 = fmax(v18, 0.0);
    v22 = fmax(v19, 0.0);
    v13 = fmax(v20, 0.0);
    v14 = fmax(v14 - (v16 + v17), 0.0);
  }

  v26 = v21;
  v27 = v22;
  v28 = v13;
  v29 = v14;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (id)_resizableImageWithCapMask:(int)a3
{
  char v3;
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
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  CGFloat v29;
  double v30;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  _UIResizableImage *v35;
  CGImage *v36;
  CGImage *v37;
  UIImage *v38;
  void *v39;
  BOOL v40;
  uint64_t v43;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGAffineTransform v52;
  __int128 v53;
  __int128 v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v3 = a3;
  -[_UIResizableImage capInsets](self, "capInsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIImage alignmentRectInsets](self, "alignmentRectInsets");
  v53 = 0u;
  v54 = 0u;
  v17 = 0.0;
  if ((v3 & 1) == 0)
  {
    v14 = 0.0;
    v51 = 0.0;
    if ((v3 & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v50 = 0.0;
    if ((v3 & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  *((double *)&v53 + 1) = v14;
  v51 = v8;
  v8 = 0.0;
  if ((v3 & 2) == 0)
    goto LABEL_6;
LABEL_3:
  *(double *)&v53 = v13;
  v17 = v13;
  v50 = v6;
  v6 = 0.0;
  if ((v3 & 4) != 0)
  {
LABEL_4:
    *((double *)&v54 + 1) = v16;
    v18 = v12;
    v12 = 0.0;
    goto LABEL_8;
  }
LABEL_7:
  v16 = 0.0;
  v18 = 0.0;
LABEL_8:
  v48 = v16;
  v49 = v14;
  v47 = v17;
  if ((v3 & 8) != 0)
  {
    *(_QWORD *)&v54 = v15;
    v45 = v15;
    v19 = v10;
    v10 = 0.0;
  }
  else
  {
    v45 = 0;
    v19 = 0.0;
  }
  v20 = *MEMORY[0x1E0C9D538];
  v21 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[UIImage size](self, "size", v45);
  v22 = v8 + v20;
  v23 = v6 + v21;
  v25 = v24 - (v8 + v12);
  v27 = v26 - (v6 + v10);
  v55.origin.x = v22;
  v55.origin.y = v23;
  v55.size.width = v25;
  v55.size.height = v27;
  if (CGRectIsEmpty(v55))
  {
    v28 = 0;
  }
  else
  {
    -[UIImage scale](self, "scale");
    v30 = v29;
    CGAffineTransformMakeScale(&v52, v29, v29);
    v56.origin.x = v22;
    v56.origin.y = v23;
    v56.size.width = v25;
    v56.size.height = v27;
    v57 = CGRectApplyAffineTransform(v56, &v52);
    x = v57.origin.x;
    y = v57.origin.y;
    width = v57.size.width;
    height = v57.size.height;
    v35 = objc_retainAutorelease(self);
    v36 = -[UIImage CGImage](v35, "CGImage");
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = width;
    v58.size.height = height;
    v37 = CGImageCreateWithImageInRect(v36, v58);
    v38 = -[UIImage initWithCGImage:scale:orientation:]([UIImage alloc], "initWithCGImage:scale:orientation:", v37, -[UIImage imageOrientation](v35, "imageOrientation"), v30);
    CGImageRelease(v37);
    -[UIImage resizableImageWithCapInsets:](v38, "resizableImageWithCapInsets:", v50, v51, v19, v18);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v39;
    if ((_QWORD)v53)
      v40 = 0;
    else
      v40 = *((_QWORD *)&v53 + 1) == 0;
    if (v40 && (_QWORD)v54 == 0 && *((_QWORD *)&v54 + 1) == 0)
    {
      objc_msgSend(v39, "imageWithAlignmentRectInsets:", v47, v49, v46, v48);
      v43 = objc_claimAutoreleasedReturnValue();

      v28 = (void *)v43;
    }
    if ((*(_BYTE *)&v35->_rImageFlags & 1) != 0)
      objc_msgSend(v28, "_setAlwaysStretches:", 1);

  }
  return v28;
}

- (void)_configureImage:(id)a3 assumePreconfigured:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  __int128 v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIResizableImage;
  -[UIImage _configureImage:assumePreconfigured:](&v8, sel__configureImage_assumePreconfigured_, v6, v4);
  if (objc_msgSend(v6, "_isResizable"))
  {
    -[_UIResizableImage capInsets](self, "capInsets");
    objc_msgSend(v6, "_setCapInsets:");
    *((_BYTE *)v6 + 208) = *((_BYTE *)v6 + 208) & 0xFD | *(_BYTE *)&self->_rImageFlags & 2;
    v7 = *(_OWORD *)&self->_subimageInsets.bottom;
    *((_OWORD *)v6 + 11) = *(_OWORD *)&self->_subimageInsets.top;
    *((_OWORD *)v6 + 12) = v7;
    objc_msgSend(v6, "_setAlwaysStretches:", *(_BYTE *)&self->_rImageFlags & 1);
  }

}

- (BOOL)_isResizable
{
  return 1;
}

- (UIEdgeInsets)capInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_capInsets.top;
  left = self->_capInsets.left;
  bottom = self->_capInsets.bottom;
  right = self->_capInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_setAlwaysStretches:(BOOL)a3
{
  *(_BYTE *)&self->_rImageFlags = *(_BYTE *)&self->_rImageFlags & 0xFE | a3;
}

- (void)_setCapInsets:(UIEdgeInsets)a3
{
  self->_capInsets = a3;
}

- (_UIResizableImage)initWithImage:(id)a3 capInsets:(UIEdgeInsets)a4
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  _UIResizableImage *result;
  objc_super v9;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v9.receiver = self;
  v9.super_class = (Class)_UIResizableImage;
  result = -[UIImage _initWithOtherImage:](&v9, sel__initWithOtherImage_, a3);
  if (result)
  {
    result->_capInsets.top = top;
    result->_capInsets.left = left;
    result->_capInsets.bottom = bottom;
    result->_capInsets.right = right;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
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
  double v16;
  BOOL v17;
  double v18;
  int64_t v19;
  objc_super v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v21.receiver = self;
    v21.super_class = (Class)_UIResizableImage;
    if (-[UIImage isEqual:](&v21, sel_isEqual_, v5))
    {
      -[_UIResizableImage capInsets](self, "capInsets");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      objc_msgSend(v5, "capInsets");
      v17 = 0;
      if (v9 == v18 && v7 == v14 && v13 == v16 && v11 == v15)
      {
        v19 = -[_UIResizableImage resizingMode](self, "resizingMode");
        v17 = v19 == objc_msgSend(v5, "resizingMode");
      }
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (int64_t)resizingMode
{
  return *(_BYTE *)&self->_rImageFlags & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIResizableImage)initWithCoder:(id)a3
{
  id v4;
  _UIResizableImage *v5;
  _UIResizableImage *v6;
  double *p_top;
  uint64_t v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIResizableImage;
  v5 = -[UIImage initWithCoder:](&v15, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    p_top = &v5->_capInsets.top;
    objc_msgSend(v4, "decodeUIEdgeInsetsForKey:", CFSTR("UICapInsets"));
    *(_QWORD *)p_top = v8;
    v6->_capInsets.left = v9;
    v6->_capInsets.bottom = v10;
    v6->_capInsets.right = v11;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UILeftCapWidth")))
    {
      v6->_capInsets.left = (double)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UILeftCapWidth"));
      *p_top = (double)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("UITopCapHeight"));
      -[UIImage size](v6, "size");
      v6->_capInsets.right = v12 - v6->_capInsets.left + -1.0;
      -[UIImage size](v6, "size");
      v6->_capInsets.bottom = v13 - *p_top + -1.0;
    }
    *(_BYTE *)&v6->_rImageFlags = *(_BYTE *)&v6->_rImageFlags & 0xFE | (objc_msgSend(v4, "decodeIntForKey:", CFSTR("UIResizingMode")) != 0);
    *(_OWORD *)&v6->_subimageInsets.top = 0u;
    *(_OWORD *)&v6->_subimageInsets.bottom = 0u;
    *(_BYTE *)&v6->_rImageFlags &= ~2u;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIResizableImage;
  v4 = a3;
  -[UIImage encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", CFSTR("UICapInsets"), self->_capInsets.top, self->_capInsets.left, self->_capInsets.bottom, self->_capInsets.right, v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt:forKey:", *(_BYTE *)&self->_rImageFlags & 1, CFSTR("UIResizingMode"));

}

- (void)_setSubimageInsets:(UIEdgeInsets)a3
{
  char v6;

  if (a3.top == 0.0 && a3.left == 0.0 && a3.right == 0.0 && a3.bottom == 0.0)
    v6 = 0;
  else
    v6 = 2;
  *(_BYTE *)&self->_rImageFlags = *(_BYTE *)&self->_rImageFlags & 0xFD | v6;
  self->_subimageInsets = a3;
}

- (UIEdgeInsets)_subimageInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_subimageInsets.top;
  left = self->_subimageInsets.left;
  bottom = self->_subimageInsets.bottom;
  right = self->_subimageInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGRect)_contentRectInPixels
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[5];
  CGRect result;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41___UIResizableImage__contentRectInPixels__block_invoke;
  v6[3] = &unk_1E16CAF00;
  v6[4] = self;
  -[_UIResizableImage _contentRectInPixelsApplyingInsets:emptySizeFallback:](self, "_contentRectInPixelsApplyingInsets:emptySizeFallback:", v6, self->_subimageInsets.top, self->_subimageInsets.left, self->_subimageInsets.bottom, self->_subimageInsets.right);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

@end
