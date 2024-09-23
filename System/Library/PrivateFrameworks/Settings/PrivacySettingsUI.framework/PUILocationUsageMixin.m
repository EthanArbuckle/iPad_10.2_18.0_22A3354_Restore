@implementation PUILocationUsageMixin

- (PUILocationUsageMixin)init
{
  PUILocationUsageMixin *v3;
  PUILocationUsageMixin *v4;
  double v5;
  double v6;
  uint64_t v7;
  UIImageView *usageIndicator;
  objc_super v10;

  if (loadLocationFillSystemImage_onceToken != -1)
    dispatch_once(&loadLocationFillSystemImage_onceToken, &__block_literal_global_680);
  v10.receiver = self;
  v10.super_class = (Class)PUILocationUsageMixin;
  v3 = -[PUILocationUsageMixin init](&v10, sel_init);
  v4 = v3;
  if (v3)
  {
    v3->_usage = -1;
    -[PUILocationUsageMixin usageIndicatorSize](v3, "usageIndicatorSize");
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", 0.0, 0.0, v5, v6);
    usageIndicator = v4->_usageIndicator;
    v4->_usageIndicator = (UIImageView *)v7;

    -[UIImageView setHidden:](v4->_usageIndicator, "setHidden:", 1);
    -[UIImageView setContentMode:](v4->_usageIndicator, "setContentMode:", 1);
  }
  return v4;
}

- (id)iconForUsage:(int)a3
{
  if ((a3 - 2) > 2)
    return 0;
  else
    return (id)*off_1EA26C9B8[a3 - 2];
}

- (void)setUsage:(int)a3
{
  uint64_t v5;
  id v6;

  if (self->_usage != a3)
  {
    -[PUILocationUsageMixin iconForUsage:](self, "iconForUsage:");
    v5 = objc_claimAutoreleasedReturnValue();
    self->_usage = a3;
    v6 = (id)v5;
    if (v5)
    {
      -[UIImageView setImage:](self->_usageIndicator, "setImage:", v5);
      v5 = (uint64_t)v6;
    }
    -[UIImageView setHidden:](self->_usageIndicator, "setHidden:", v5 == 0);

  }
}

- (void)setAuthLevel:(unint64_t)a3
{
  NSString *v4;
  NSString *authLevelString;

  self->_authLevel = a3;
  -[PUILocationUsageMixin _authLevelForMask:](self, "_authLevelForMask:");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  authLevelString = self->_authLevelString;
  self->_authLevelString = v4;

}

- (CGSize)usageIndicatorSize
{
  double v2;
  double v3;
  CGSize result;

  if (usageIndicatorSize_onceToken != -1)
    dispatch_once(&usageIndicatorSize_onceToken, &__block_literal_global_15);
  v2 = *(double *)&usageIndicatorSize_size_0;
  v3 = *(double *)&usageIndicatorSize_size_1;
  result.height = v3;
  result.width = v2;
  return result;
}

uint64_t __43__PUILocationUsageMixin_usageIndicatorSize__block_invoke()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = objc_msgSend((id)locationFillSystemImage, "size");
  usageIndicatorSize_size_0 = v1;
  usageIndicatorSize_size_1 = v2;
  return result;
}

- (CGSize)_authLevelLabelSize:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  _QWORD v14[2];
  CGSize result;

  v14[1] = *MEMORY[0x1E0C80C00];
  -[PUILocationUsageMixin _authLevelForMask:](self, "_authLevelForMask:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0DC1138];
  v4 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1350], "labelFontSize");
  objc_msgSend(v4, "systemFontOfSize:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeWithAttributes:", v6);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)_authLevelForMask:(unint64_t)a3
{
  void *v3;
  __CFString *v4;

  if (!a3)
  {
    v4 = CFSTR("NOT_DETERMINED_AUTHORIZATION_SHORT");
LABEL_11:
    PUI_LocalizedStringForLocationServicesPrivacy(v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if ((a3 & 1) != 0)
  {
    v4 = CFSTR("NEVER_AUTHORIZATION");
    goto LABEL_11;
  }
  if ((a3 & 4) != 0)
  {
    v4 = CFSTR("ALWAYS_AUTHORIZATION");
    goto LABEL_11;
  }
  if ((a3 & 2) != 0)
  {
    v4 = CFSTR("WHEN_IN_USE_AUTHORIZATION_SHORT");
    goto LABEL_11;
  }
  v3 = 0;
  return v3;
}

- (int)usage
{
  return self->_usage;
}

- (unint64_t)authLevel
{
  return self->_authLevel;
}

- (UIImageView)usageIndicator
{
  return self->_usageIndicator;
}

- (NSString)authLevelString
{
  return self->_authLevelString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authLevelString, 0);
  objc_storeStrong((id *)&self->_usageIndicator, 0);
}

@end
