@implementation NCImageBrandingBadge

- (NCImageBrandingBadge)initWithFrame:(CGRect)a3
{
  NCImageBrandingBadge *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCImageBrandingBadge;
  result = -[NCImageBrandingBadge initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_badgeLocation = 12;
  return result;
}

- (NCImageBrandingBadge)initWithImage:(id)a3
{
  id v4;
  NCImageBrandingBadge *v5;
  NCImageBrandingBadge *v6;

  v4 = a3;
  v5 = -[NCImageBrandingBadge initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  v6 = v5;
  if (v5)
    -[NCImageBrandingBadge setImage:](v5, "setImage:", v4);

  return v6;
}

- (int64_t)badgeType
{
  return 1;
}

- (void)setBadgeLocation:(unint64_t)a3
{
  id WeakRetained;

  if (self->_badgeLocation != a3)
  {
    self->_badgeLocation = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_badgedIconView);
    objc_msgSend(WeakRetained, "setNeedsLayout");

  }
}

- (BOOL)isEqual:(id)a3
{
  NCImageBrandingBadge *v4;
  char isKindOfClass;
  char v6;
  NCImageBrandingBadge *v7;
  void *v8;
  void *v9;

  v4 = (NCImageBrandingBadge *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v6 = 0;
    if (v4 && (isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[NCImageBrandingBadge image](self, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NCImageBrandingBadge image](v7, "image");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = BSEqualObjects();
    }
  }

  return v6;
}

- (unint64_t)badgeLocation
{
  return self->_badgeLocation;
}

- (NCBadgedIconView)badgedIconView
{
  return (NCBadgedIconView *)objc_loadWeakRetained((id *)&self->_badgedIconView);
}

- (void)setBadgedIconView:(id)a3
{
  objc_storeWeak((id *)&self->_badgedIconView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_badgedIconView);
}

@end
