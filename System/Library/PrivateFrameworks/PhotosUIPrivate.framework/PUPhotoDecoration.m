@implementation PUPhotoDecoration

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PUPhotoDecoration borderWidth](self, "borderWidth");
    v7 = v6;
    objc_msgSend(v5, "borderWidth");
    if (v7 == v8
      && (-[PUPhotoDecoration borderColor](self, "borderColor"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "borderColor"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v9, "isEqual:", v10),
          v10,
          v9,
          v11))
    {
      -[PUPhotoDecoration foregroundColor](self, "foregroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "foregroundColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  unint64_t v10;
  unint64_t v11;

  v3 = (void *)MEMORY[0x1E0DC3658];
  -[PUPhotoDecoration borderColor](self, "borderColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "colorWithCGColor:", objc_msgSend(v4, "CGColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3658];
  -[PUPhotoDecoration foregroundColor](self, "foregroundColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "colorWithCGColor:", objc_msgSend(v7, "CGColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotoDecoration borderWidth](self, "borderWidth");
  v10 = 1319 * ((1319 * (unint64_t)(v9 * 1319.0)) ^ objc_msgSend(v5, "hash"));
  v11 = v10 ^ objc_msgSend(v8, "hash");

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[PUPhotoDecoration borderColor](self, "borderColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderColor:", v5);

  -[PUPhotoDecoration borderWidth](self, "borderWidth");
  objc_msgSend(v4, "setBorderWidth:");
  -[PUPhotoDecoration foregroundColor](self, "foregroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForegroundColor:", v6);

  return v4;
}

- (id)photoDecorationVariantsWithIncreasingAlpha:(int64_t)a3
{
  int64_t v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if (a3 < 1)
  {
    v5 = 0;
  }
  else
  {
    v3 = a3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    do
    {
      v7 = (void *)-[PUPhotoDecoration copy](self, "copy");
      if (v6)
      {
        objc_msgSend(v6, "pu_colorWithIncreasedAlpha");
        v8 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v8;
      }
      else
      {
        -[PUPhotoDecoration foregroundColor](self, "foregroundColor");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "setForegroundColor:", v6);
      objc_msgSend(v5, "addObject:", v7);

      --v3;
    }
    while (v3);

  }
  return v5;
}

- (id)photoDecorationVariantsWithIncreasingBorderBrightness:(int64_t)a3
{
  int64_t v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if (a3 < 1)
  {
    v5 = 0;
  }
  else
  {
    v3 = a3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    do
    {
      v7 = (void *)-[PUPhotoDecoration copy](self, "copy");
      if (v6)
      {
        objc_msgSend(v6, "pu_colorWithIncreasedBrightness");
        v8 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v8;
      }
      else
      {
        -[PUPhotoDecoration borderColor](self, "borderColor");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v7, "setBorderColor:", v6);
      objc_msgSend(v5, "addObject:", v7);

      --v3;
    }
    while (v3);

  }
  return v5;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
}

+ (id)defaultDecoration
{
  PUPhotoDecoration *v2;
  void *v3;
  double v4;
  void *v5;

  v2 = objc_alloc_init(PUPhotoDecoration);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoDecoration setBorderColor:](v2, "setBorderColor:", v3);

  PLPhysicalScreenScale();
  -[PUPhotoDecoration setBorderWidth:](v2, "setBorderWidth:", 1.0 / v4);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoDecoration setForegroundColor:](v2, "setForegroundColor:", v5);

  return v2;
}

@end
