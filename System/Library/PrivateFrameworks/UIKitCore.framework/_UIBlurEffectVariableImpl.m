@implementation _UIBlurEffectVariableImpl

- (void)_updateEffectDescriptor:(id)a3 forEnvironment:(id)a4 usage:(int64_t)a5
{
  id v7;
  double blurRadius;
  UIImage *imageMask;
  double blurScale;
  id v11;
  id v12;
  UIImage *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  UIImage *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  UIImage *v21;
  uint64_t v22;
  _UIVisualEffectFilterEntry *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _UIVisualEffectFilterEntry *v29;
  double v30;
  uint64_t i;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  __int128 v41;
  _QWORD v42[4];

  v42[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v36 = a3;
  if (objc_msgSend(v7, "reducedTransperancy"))
  {
    _UIBlurEffectAddAverageColorFilterEntry(v36, v7, fmax(self->_blurScale, 0.25));
  }
  else
  {
    blurRadius = self->_blurRadius;
    imageMask = self->_imageMask;
    blurScale = self->_blurScale;
    v11 = v36;
    v12 = v7;
    v13 = imageMask;
    if (objc_msgSend(v12, "allowsBlurring"))
    {
      v42[0] = (id)*MEMORY[0x1E0CD2D70];
      v42[1] = (id)*MEMORY[0x1E0CD2D28];
      v41 = xmmword_1E16B4F58;
      v14 = (void *)MEMORY[0x1E0C99D80];
      if (objc_msgSend(v12, "allowsDithering"))
        v15 = 2;
      else
        v15 = 1;
      objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", &v41, v42, v15);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "traitCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v13;
      -[UIImage _primitiveImageAsset](v17, "_primitiveImageAsset");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, "imageWithTraitCollection:", v16);
        v20 = objc_claimAutoreleasedReturnValue();

        v17 = (UIImage *)v20;
      }
      v21 = objc_retainAutorelease(v17);
      v22 = -[UIImage CGImage](v21, "CGImage");
      if (!v22)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGImageRef _imageRefFromUIImage(UIImage *__strong, UITraitCollection *__strong)");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("UIBlurEffect.m"), 981, CFSTR("UIImage (%@) returned NULL from -CGImage."), v21);

      }
      v23 = [_UIVisualEffectFilterEntry alloc];
      v24 = *MEMORY[0x1E0CD2F00];
      v39[0] = *MEMORY[0x1E0CD2D90];
      v25 = v39[0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", blurRadius);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v39[1] = CFSTR("inputMaskImage");
      v40[0] = v26;
      v40[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v25;
      v37[1] = CFSTR("inputMaskImage");
      v38[0] = &unk_1E1A955B0;
      v38[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[_UIVisualEffectFilterEntry initWithFilterType:configurationValues:requestedValues:identityValues:](v23, "initWithFilterType:configurationValues:requestedValues:identityValues:", v24, v35, v27, v28);

      -[_UIVisualEffectFilterEntry setIdentityScaleHint:](v29, "setIdentityScaleHint:", 1.0);
      -[_UIVisualEffectFilterEntry setUseRelaxedDiffingRule:](v29, "setUseRelaxedDiffingRule:", 1);
      v30 = 0.5;
      if (blurScale > 0.0)
        v30 = blurScale;
      -[_UIVisualEffectFilterEntry setRequestedScaleHint:](v29, "setRequestedScaleHint:", v30);
      objc_msgSend(v11, "addFilterEntry:", v29);

      for (i = 1; i != -1; --i)
      for (j = 1; j != -1; --j)

    }
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  UIImage *v8;
  UIImage *v9;
  UIImage *v10;
  BOOL v11;
  char v12;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = v5;
    if (*((double *)v5 + 1) == self->_blurRadius && *((double *)v5 + 2) == self->_blurScale)
    {
      v7 = (void *)*((_QWORD *)v5 + 3);
      v8 = self->_imageMask;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {
        v12 = 1;
      }
      else
      {
        if (v8)
          v11 = v9 == 0;
        else
          v11 = 1;
        if (v11)
          v12 = 0;
        else
          v12 = -[UIImage isEqual:](v8, "isEqual:", v9);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (_UIBlurEffectVariableImpl)initWithBaseRadius:(double)a3 imageMask:(id)a4 scale:(double)a5
{
  id v9;
  _UIBlurEffectVariableImpl *v10;
  _UIBlurEffectVariableImpl *v11;
  double v12;
  objc_super v14;

  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIBlurEffectVariableImpl;
  v10 = -[_UIBlurEffectVariableImpl init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    if (a3 >= 0.0)
      v12 = a3;
    else
      v12 = 0.0;
    v10->_blurRadius = v12;
    v10->_blurScale = fmax(fmin(a5, 1.0), 0.0);
    objc_storeStrong((id *)&v10->_imageMask, a4);
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_blurRadius > 0.0)
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("UIBlurEffectRadius"));
  if (self->_blurScale > 0.0)
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("UIBlurEffectScale"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageMask, CFSTR("UIBlurEffectImageMask"));

}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = vcvtmd_u64_f64(self->_blurRadius);
  return -[UIImage hash](self->_imageMask, "hash") * v2;
}

- (void)appendDescriptionTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "appendFormat:", CFSTR(" blurRadius=%f"), *(_QWORD *)&self->_blurRadius);
  if (self->_blurScale > 0.0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" blurScale=%f"), *(_QWORD *)&self->_blurScale);
  objc_msgSend(v4, "appendFormat:", CFSTR(" imageMask=%@"), self->_imageMask);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageMask, 0);
}

@end
