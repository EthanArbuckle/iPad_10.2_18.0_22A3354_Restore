@implementation _UIBackdropEffectView

- (void)setContentScaleFactor:(double)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIBackdropEffectView;
  -[UIView setContentScaleFactor:](&v5, sel_setContentScaleFactor_, a3);
  -[UIView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRasterizationScale:", 1.0);

}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("filters.gaussianBlur.inputRadius")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("filters.gaussianBlur.inputQuality")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("filters.colorSaturate.inputAmount")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("filters.colorMatrix.inputColorMatrix")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("enabled")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("meshTransform")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIBackdropEffectView;
    v5 = -[UIView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (void)setZoom:(double)a3
{
  void *v5;
  void *v6;

  if (self->_zoom != a3)
  {
    MeshTransformForZoom(a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBackdropEffectView backdropLayer](self, "backdropLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMeshTransform:", v5);

    self->_zoom = a3;
  }
}

- (_UIBackdropEffectView)init
{
  _UIBackdropEffectView *v2;
  _UIBackdropEffectView *v3;
  void *v4;
  _UIBackdropEffectView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIBackdropEffectView;
  v2 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v3 = v2;
  if (v2)
  {
    -[UIView setAutoresizingMask:](v2, "setAutoresizingMask:", 18);
    -[UIView setOpaque:](v3, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[_UIBackdropEffectView backdropLayer](v3, "backdropLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", 1);

    v5 = v3;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropLayer, 0);
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  __CFString *v5;
  uint64_t v6;
  objc_super v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;

  v4 = a3;
  NSLog(CFSTR("*** warning calling -[_UIBackdropEffectView: valueForUndefinedKey:] for key: %@"), v4);
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("filters.gaussianBlur.inputRadius")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("filters.gaussianBlur.inputQuality")) & 1) != 0)
    {
      v5 = CFSTR("default");
      goto LABEL_12;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("filters.colorSaturate.inputAmount")) & 1) == 0)
    {
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("filters.colorMatrix.inputColorMatrix")))
      {
        v9 = 1065353216;
        v11 = 0;
        v10 = 0;
        v12 = 0x3F80000000000000;
        v14 = 0;
        v13 = 0;
        v15 = 0x3F80000000000000;
        v17 = 0;
        v16 = 0;
        v18 = 0;
        v19 = 1065353216;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", &v9);
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v5 = (__CFString *)v6;
        goto LABEL_12;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("enabled")) & 1) == 0)
      {
        v8.receiver = self;
        v8.super_class = (Class)_UIBackdropEffectView;
        -[_UIBackdropEffectView valueForUndefinedKey:](&v8, sel_valueForUndefinedKey_, v4);
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
    v5 = (__CFString *)&unk_1E1A966C0;
    goto LABEL_12;
  }
  v5 = (__CFString *)&unk_1E1A966A8;
LABEL_12:

  return v5;
}

- (void)setBackdropLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backdropLayer, a3);
}

- (double)zoom
{
  return self->_zoom;
}

@end
