@implementation PXGFocusEffectViewConfiguration

- (PXGFocusEffectViewConfiguration)initWithConfiguration:(id)a3
{
  id v4;
  PXGFocusEffectViewConfiguration *v5;
  PXGFocusEffectViewConfiguration *v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PXGFocusEffectViewConfiguration;
  v5 = -[PXGFocusableViewConfiguration initWithConfiguration:](&v21, sel_initWithConfiguration_, v4);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "cornerRadius");
      v6->_cornerRadius = v7;
      objc_msgSend(v4, "contentMotionRotation");
      v6->_contentMotionRotation.x = v8;
      v6->_contentMotionRotation.y = v9;
      objc_msgSend(v4, "contentMotionTranslation");
      v6->_contentMotionTranslation.x = v10;
      v6->_contentMotionTranslation.y = v11;
      objc_msgSend(v4, "focusedSizeIncrease");
      v6->_focusedSizeIncrease = v12;
      objc_msgSend(v4, "shadowVerticalOffset");
      v6->_shadowVerticalOffset = v13;
      objc_msgSend(v4, "shadowOpacity");
    }
    else
    {
      v5->_cornerRadius = 5.0;
      v5->_contentMotionRotation = (CGPoint)vdupq_n_s64(0x3FA47AE147AE147BuLL);
      __asm { FMOV            V0.2D, #4.0 }
      v5->_contentMotionTranslation = _Q0;
      v5->_focusedSizeIncrease = 30.0;
      v5->_shadowVerticalOffset = 25.0;
      v14 = 0.5;
    }
    v6->_shadowOpacity = v14;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  int8x16_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXGFocusEffectViewConfiguration;
  v3 = -[PXGFocusableViewConfiguration hash](&v6, sel_hash);
  v4 = veorq_s8((int8x16_t)vshlq_u64(vcvtq_u64_f64((float64x2_t)self->_contentMotionRotation), (uint64x2_t)xmmword_1A7BCC520), (int8x16_t)vshlq_u64(vcvtq_u64_f64((float64x2_t)self->_contentMotionTranslation), (uint64x2_t)xmmword_1A7BCC530));
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL)) ^ (2
                                                                                                * (unint64_t)self->_cornerRadius) ^ ((unint64_t)self->_focusedSizeIncrease << 6) ^ ((unint64_t)self->_shadowVerticalOffset << 7) ^ v3 ^ ((unint64_t)self->_shadowOpacity << 8);
}

- (BOOL)isEqual:(id)a3
{
  PXGFocusEffectViewConfiguration *v4;
  PXGFocusEffectViewConfiguration *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
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
  double v30;
  objc_super v32;

  v4 = (PXGFocusEffectViewConfiguration *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v32.receiver = self;
      v32.super_class = (Class)PXGFocusEffectViewConfiguration;
      if (!-[PXGFocusableViewConfiguration isEqual:](&v32, sel_isEqual_, v5))
        goto LABEL_14;
      -[PXGFocusEffectViewConfiguration cornerRadius](self, "cornerRadius");
      v7 = v6;
      -[PXGFocusEffectViewConfiguration cornerRadius](v5, "cornerRadius");
      if (v7 != v8)
        goto LABEL_14;
      -[PXGFocusEffectViewConfiguration contentMotionRotation](self, "contentMotionRotation");
      v10 = v9;
      v12 = v11;
      -[PXGFocusEffectViewConfiguration contentMotionRotation](v5, "contentMotionRotation");
      v14 = 0;
      if (v10 != v15)
        goto LABEL_15;
      if (v12 != v13)
        goto LABEL_15;
      -[PXGFocusEffectViewConfiguration contentMotionTranslation](self, "contentMotionTranslation");
      v17 = v16;
      v19 = v18;
      -[PXGFocusEffectViewConfiguration contentMotionTranslation](v5, "contentMotionTranslation");
      v14 = 0;
      if (v17 != v21 || v19 != v20)
        goto LABEL_15;
      -[PXGFocusEffectViewConfiguration focusedSizeIncrease](self, "focusedSizeIncrease");
      v23 = v22;
      -[PXGFocusEffectViewConfiguration focusedSizeIncrease](v5, "focusedSizeIncrease");
      if (v23 == v24
        && (-[PXGFocusEffectViewConfiguration shadowVerticalOffset](self, "shadowVerticalOffset"),
            v26 = v25,
            -[PXGFocusEffectViewConfiguration shadowVerticalOffset](v5, "shadowVerticalOffset"),
            v26 == v27))
      {
        -[PXGFocusEffectViewConfiguration shadowOpacity](self, "shadowOpacity");
        v29 = v28;
        -[PXGFocusEffectViewConfiguration shadowOpacity](v5, "shadowOpacity");
        v14 = v29 == v30;
      }
      else
      {
LABEL_14:
        v14 = 0;
      }
LABEL_15:

      goto LABEL_16;
    }
    v14 = 0;
  }
LABEL_16:

  return v14;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (CGPoint)contentMotionRotation
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentMotionRotation.x;
  y = self->_contentMotionRotation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setContentMotionRotation:(CGPoint)a3
{
  self->_contentMotionRotation = a3;
}

- (CGPoint)contentMotionTranslation
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentMotionTranslation.x;
  y = self->_contentMotionTranslation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setContentMotionTranslation:(CGPoint)a3
{
  self->_contentMotionTranslation = a3;
}

- (double)focusedSizeIncrease
{
  return self->_focusedSizeIncrease;
}

- (void)setFocusedSizeIncrease:(double)a3
{
  self->_focusedSizeIncrease = a3;
}

- (double)shadowVerticalOffset
{
  return self->_shadowVerticalOffset;
}

- (void)setShadowVerticalOffset:(double)a3
{
  self->_shadowVerticalOffset = a3;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (void)setShadowOpacity:(double)a3
{
  self->_shadowOpacity = a3;
}

@end
