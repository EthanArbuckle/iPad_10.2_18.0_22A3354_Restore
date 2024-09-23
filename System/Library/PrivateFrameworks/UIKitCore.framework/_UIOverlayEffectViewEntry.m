@implementation _UIOverlayEffectViewEntry

- (void)applyRequestedEffectToView:(id)a3
{
  objc_msgSend(a3, "setAlpha:", self->_alpha);
}

- (void)removeEffectFromView:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompositingFilter:", 0);

  objc_msgSend(v7, "setAlpha:", 1.0);
  objc_msgSend(v7, "_nilBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v4);

  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) == 0;
  v6 = v7;
  if (v5)
    v6 = 0;
  objc_msgSend(v6, "setImage:", 0);

}

- (void)applyIdentityEffectToView:(id)a3
{
  objc_msgSend(a3, "setAlpha:", 0.0);
}

+ (id)newEntryWithFilterType:(id)a3 color:(id)a4 alpha:(double)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v7 = a4;
  v8 = a3;
  v9 = objc_opt_new();
  objc_msgSend((id)v9, "setRequirements:", 0);
  v10 = objc_msgSend(v8, "copy");

  v11 = *(void **)(v9 + 16);
  *(_QWORD *)(v9 + 16) = v10;

  v12 = objc_msgSend(v7, "copy");
  v13 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = v12;

  v14 = *(void **)(v9 + 32);
  *(_QWORD *)(v9 + 32) = 0;

  *(double *)(v9 + 40) = a5;
  return (id)v9;
}

- (void)addEffectToView:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  UIImage *image;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0CD2780];
  v5 = a3;
  v9 = (id)objc_msgSend([v4 alloc], "initWithType:", self->_filterType);
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompositingFilter:", v9);

  objc_msgSend(v5, "setBackgroundColor:", self->_color);
  image = self->_image;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v5;
  else
    v8 = 0;
  objc_msgSend(v8, "setImage:", image);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_filterType, 0);
}

+ (id)newEntryWithFilterType:(id)a3 image:(id)a4 alpha:(double)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a4;
  v8 = a3;
  v9 = objc_opt_new();
  objc_msgSend((id)v9, "setRequirements:", v7 != 0);
  v10 = objc_msgSend(v8, "copy");

  v11 = *(void **)(v9 + 16);
  *(_QWORD *)(v9 + 16) = v10;

  v12 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = 0;

  v13 = *(void **)(v9 + 32);
  *(_QWORD *)(v9 + 32) = v7;

  *(double *)(v9 + 40) = a5;
  return (id)v9;
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[_UIVisualEffectViewEntry setRequirements:](self, "setRequirements:", self->_image != 0);
    v5 = v6;
  }

}

- (BOOL)canTransitionToEffect:(id)a3
{
  NSString *filterType;
  void *v4;

  filterType = self->_filterType;
  objc_msgSend(a3, "filterType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(filterType) = -[NSString isEqualToString:](filterType, "isEqualToString:", v4);

  return (char)filterType;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIOverlayEffectViewEntry;
  -[_UIVisualEffectViewEntry description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" compositingMode=%@ color=%@ image=%@ alpha=%f"), self->_filterType, self->_color, self->_image, *(_QWORD *)&self->_alpha);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)filterType
{
  return self->_filterType;
}

- (void)setFilterType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIImage)image
{
  return self->_image;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

@end
