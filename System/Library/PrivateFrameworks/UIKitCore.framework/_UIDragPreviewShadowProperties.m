@implementation _UIDragPreviewShadowProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIDragPreviewShadowProperties)init
{
  _UIDragPreviewShadowProperties *result;
  uint64_t v3;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDragPreviewShadowProperties;
  result = -[_UIDragPreviewShadowProperties init](&v5, sel_init);
  if (result)
  {
    result->_shadowType = 0;
    v3 = MEMORY[0x1E0C9BAA8];
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&result->_liftedTransform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&result->_liftedTransform.c = v4;
    *(_OWORD *)&result->_liftedTransform.tx = *(_OWORD *)(v3 + 32);
    *(_OWORD *)&result->_liftedAlpha = xmmword_186684270;
  }
  return result;
}

- (_UIDragPreviewShadowProperties)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIDragPreviewShadowProperties;
  v5 = -[_UIDragPreviewShadowProperties init](&v12, sel_init);
  if (v5)
  {
    *((_QWORD *)v5 + 1) = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("shadowType"));
    if (v4)
    {
      objc_msgSend(v4, "decodeCGAffineTransformForKey:", CFSTR("liftedTransform"));
    }
    else
    {
      v10 = 0u;
      v11 = 0u;
      v9 = 0u;
    }
    *(_OWORD *)(v5 + 40) = v9;
    *(_OWORD *)(v5 + 56) = v10;
    *(_OWORD *)(v5 + 72) = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("liftedAlpha"), v9, v10, v11);
    *((_QWORD *)v5 + 2) = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("radiosityBlurRadius"));
    *((_QWORD *)v5 + 3) = v7;
  }

  return (_UIDragPreviewShadowProperties *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t shadowType;
  id v5;
  __int128 v6;
  _OWORD v7[3];

  shadowType = self->_shadowType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", shadowType, CFSTR("shadowType"));
  v6 = *(_OWORD *)&self->_liftedTransform.c;
  v7[0] = *(_OWORD *)&self->_liftedTransform.a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&self->_liftedTransform.tx;
  objc_msgSend(v5, "encodeCGAffineTransform:forKey:", v7, CFSTR("liftedTransform"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("liftedAlpha"), self->_liftedAlpha);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("radiosityBlurRadius"), self->_radiosityBlurRadius);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _UIDragPreviewShadowProperties *v4;
  void *v5;
  _OWORD v7[6];

  v4 = objc_alloc_init(_UIDragPreviewShadowProperties);
  -[_UIDragPreviewShadowProperties setShadowType:](v4, "setShadowType:", -[_UIDragPreviewShadowProperties shadowType](self, "shadowType"));
  -[_UIDragPreviewShadowProperties liftedTransform](self, "liftedTransform");
  v7[0] = v7[3];
  v7[1] = v7[4];
  v7[2] = v7[5];
  -[_UIDragPreviewShadowProperties setLiftedTransform:](v4, "setLiftedTransform:", v7);
  -[_UIDragPreviewShadowProperties liftedAlpha](self, "liftedAlpha");
  -[_UIDragPreviewShadowProperties setLiftedAlpha:](v4, "setLiftedAlpha:");
  -[_UIDragPreviewShadowProperties radiosityBlurRadius](self, "radiosityBlurRadius");
  -[_UIDragPreviewShadowProperties setRadiosityBlurRadius:](v4, "setRadiosityBlurRadius:");
  -[_UIDragPreviewShadowProperties _localShadowView](self, "_localShadowView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDragPreviewShadowProperties set_localShadowView:](v4, "set_localShadowView:", v5);

  return v4;
}

- (int64_t)shadowType
{
  return self->_shadowType;
}

- (void)setShadowType:(int64_t)a3
{
  self->_shadowType = a3;
}

- (CGAffineTransform)liftedTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].d;
  return self;
}

- (void)setLiftedTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_liftedTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_liftedTransform.c = v4;
  *(_OWORD *)&self->_liftedTransform.a = v3;
}

- (double)liftedAlpha
{
  return self->_liftedAlpha;
}

- (void)setLiftedAlpha:(double)a3
{
  self->_liftedAlpha = a3;
}

- (double)radiosityBlurRadius
{
  return self->_radiosityBlurRadius;
}

- (void)setRadiosityBlurRadius:(double)a3
{
  self->_radiosityBlurRadius = a3;
}

- (UIView)_localShadowView
{
  return self->__localShadowView;
}

- (void)set_localShadowView:(id)a3
{
  objc_storeStrong((id *)&self->__localShadowView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__localShadowView, 0);
}

@end
