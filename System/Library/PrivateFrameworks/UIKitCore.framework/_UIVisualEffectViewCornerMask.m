@implementation _UIVisualEffectViewCornerMask

+ (void)_applyZeroMaskToLayer:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setCornerRadius:", 0.0);
  objc_msgSend(v3, "setCornerCurve:", *MEMORY[0x1E0CD2A60]);
  objc_msgSend(v3, "setCornerContentsMasksEdges:", 0);
  objc_msgSend(v3, "setMaskedCorners:", 15);
  objc_msgSend(v3, "setCornerContents:", 0);
  objc_msgSend(v3, "setCornerContentsCenter:", 0.5, 0.5, 0.0, 0.0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

+ (id)cornerMaskWithRadius:(double)a3 continuous:(BOOL)a4 cornerMask:(unint64_t)a5
{
  char v5;
  double *v8;

  if (a3 <= 0.0)
    return 0;
  v5 = a5;
  v8 = (double *)objc_alloc_init((Class)a1);
  v8[8] = a3;
  *((_BYTE *)v8 + 56) = a4;
  *((_QWORD *)v8 + 6) = v5 & 0xF;
  return v8;
}

+ (id)cornerMaskWithRadius:(double)a3
{
  return (id)objc_msgSend(a1, "cornerMaskWithRadius:continuous:cornerMask:", 0, 15, a3);
}

- (_UIVisualEffectViewCornerMask)init
{
  _UIVisualEffectViewCornerMask *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIVisualEffectViewCornerMask;
  result = -[_UIVisualEffectViewCornerMask init](&v8, sel_init);
  if (result)
  {
    result->_imageCenter.size.height = 0.0;
    result->_appliedCorners = 15;
    __asm { FMOV            V0.2D, #0.5 }
    result->_imageCenter.origin = _Q0;
    result->_imageCenter.size.width = 0.0;
  }
  return result;
}

- (BOOL)_isCornerWithRadius:(double)a3 continuous:(BOOL)a4 mask:(unint64_t)a5
{
  return self->_continuous == a4 && self->_appliedCorners == a5 && !self->_image && self->_radius == a3;
}

- (id)cornerMaskAppliedToCorners:(unint64_t)a3
{
  unint64_t v3;
  _UIVisualEffectViewCornerMask *v4;

  v3 = a3 & 0xF;
  if (v3 == self->_appliedCorners)
  {
    v4 = self;
  }
  else
  {
    -[_UIVisualEffectViewCornerMask _clone](self, "_clone");
    v4 = (_UIVisualEffectViewCornerMask *)objc_claimAutoreleasedReturnValue();
    v4->_appliedCorners = v3;
  }
  return v4;
}

- (void)_applyToLayer:(id)a3
{
  double radius;
  _QWORD *v5;
  id v6;

  radius = self->_radius;
  v6 = a3;
  objc_msgSend(v6, "setCornerRadius:", radius);
  v5 = (_QWORD *)MEMORY[0x1E0CD2A68];
  if (!self->_continuous)
    v5 = (_QWORD *)MEMORY[0x1E0CD2A60];
  objc_msgSend(v6, "setCornerCurve:", *v5);
  objc_msgSend(v6, "setCornerContentsMasksEdges:", self->_effectsEdges);
  objc_msgSend(v6, "setMaskedCorners:", self->_appliedCorners);
  objc_msgSend(v6, "setCornerContents:", -[UIImage CGImage](self->_image, "CGImage"));
  objc_msgSend(v6, "setCornerContentsCenter:", self->_imageCenter.origin.x, self->_imageCenter.origin.y, self->_imageCenter.size.width, self->_imageCenter.size.height);

}

+ (id)continuousCornerMaskWithRadius:(double)a3
{
  return (id)objc_msgSend(a1, "cornerMaskWithRadius:continuous:cornerMask:", 1, 15, a3);
}

- (BOOL)isEqual:(id)a3
{
  _UIVisualEffectViewCornerMask *v4;
  _UIVisualEffectViewCornerMask *v5;
  _UIVisualEffectViewCornerMask *v6;
  UIImage *image;
  UIImage *v8;
  BOOL v9;

  v4 = (_UIVisualEffectViewCornerMask *)a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (self == v4)
      {
        v9 = 1;
        goto LABEL_16;
      }
      v5 = v4;
      v6 = v5;
      if (self->_radius != v5->_radius
        || self->_continuous != v5->_continuous
        || self->_appliedCorners != v5->_appliedCorners
        || self->_effectsEdges != v5->_effectsEdges)
      {
        goto LABEL_13;
      }
      image = self->_image;
      v8 = v6->_image;
      v9 = ((unint64_t)image | (unint64_t)v8) == 0;
      if (!image || !v8)
        goto LABEL_14;
      if (-[UIImage isEqual:](image, "isEqual:"))
        v9 = CGRectEqualToRect(self->_imageCenter, v6->_imageCenter);
      else
LABEL_13:
        v9 = 0;
LABEL_14:

      goto LABEL_16;
    }
  }
  v9 = 0;
LABEL_16:

  return v9;
}

- (id)_clone
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  CGSize size;

  v3 = objc_alloc_init((Class)objc_opt_class());
  v3[8] = *(_QWORD *)&self->_radius;
  v4 = -[UIImage copy](self->_image, "copy");
  v5 = (void *)v3[1];
  v3[1] = v4;

  size = self->_imageCenter.size;
  *((_OWORD *)v3 + 1) = self->_imageCenter.origin;
  *((CGSize *)v3 + 2) = size;
  v3[6] = self->_appliedCorners;
  return v3;
}

+ (id)imageCornerMaskWithImage:(id)a3 radius:(double)a4
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v22;
  void *v23;

  v7 = a3;
  v8 = v7;
  if (a4 <= 0.0)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v7, "images");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIVisualEffectView.m"), 128, CFSTR("Cannot use an animated image"));

    }
    objc_msgSend(v8, "size");
    v12 = v11;
    v13 = v10;
    if (v11 <= 0.0 || v10 <= 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIVisualEffectView.m"), 130, CFSTR("Can't mask with an empty image"));

    }
    v14 = (double *)objc_alloc_init((Class)a1);
    v14[8] = a4;
    *((_BYTE *)v14 + 56) = 0;
    v15 = objc_msgSend(v8, "copy");
    v16 = (void *)*((_QWORD *)v14 + 1);
    *((_QWORD *)v14 + 1) = v15;

    if (objc_msgSend(v8, "_isResizable"))
    {
      objc_msgSend(v8, "capInsets");
      v14[2] = v17 / v12;
      v14[3] = v18 / v13;
      v14[4] = 1.0 - (v17 + v19) / v12;
      v14[5] = 1.0 - (v18 + v20) / v13;
    }
  }

  return v14;
}

- (BOOL)cornersAreContinuous
{
  return self->_continuous;
}

- (unint64_t)appliedCorners
{
  return self->_appliedCorners;
}

- (id)cornerMaskEffectingEdges:(BOOL)a3
{
  _UIVisualEffectViewCornerMask *v3;

  if (self->_effectsEdges == a3)
  {
    v3 = self;
  }
  else
  {
    -[_UIVisualEffectViewCornerMask _clone](self, "_clone");
    v3 = (_UIVisualEffectViewCornerMask *)objc_claimAutoreleasedReturnValue();
    v3->_effectsEdges = a3;
  }
  return v3;
}

- (double)radius
{
  return self->_radius;
}

@end
