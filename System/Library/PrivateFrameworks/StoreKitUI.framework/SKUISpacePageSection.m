@implementation SKUISpacePageSection

- (SKUISpacePageSection)initWithPageComponent:(id)a3
{
  id v4;
  SKUISpacePageSection *v5;
  objc_super v7;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUISpacePageSection initWithPageComponent:].cold.1();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUISpacePageSection;
  v5 = -[SKUIStorePageSection initWithPageComponent:](&v7, sel_initWithPageComponent_, v4);

  return v5;
}

- (void)willAppearInContext:(id)a3
{
  id v3;

  objc_msgSend(a3, "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("SKUISpacePageSectionReuseIdentifier"));

}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SKUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("SKUISpacePageSectionReuseIdentifier"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[SKUIStorePageSection context](self, "context", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  -[SKUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "height");
  v10 = v9;

  v11 = v7;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (int64_t)numberOfCells
{
  return 1;
}

- (void)initWithPageComponent:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUISpacePageSection initWithPageComponent:]";
}

@end
