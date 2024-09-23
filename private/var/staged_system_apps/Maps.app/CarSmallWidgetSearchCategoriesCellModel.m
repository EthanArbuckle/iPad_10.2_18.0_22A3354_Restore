@implementation CarSmallWidgetSearchCategoriesCellModel

- (CarSmallWidgetSearchCategoriesCellModel)initWithBrowseCategory:(id)a3
{
  id v5;
  CarSmallWidgetSearchCategoriesCellModel *v6;
  CarSmallWidgetSearchCategoriesCellModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarSmallWidgetSearchCategoriesCellModel;
  v6 = -[CarSmallWidgetSearchCategoriesCellModel init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_category, a3);

  return v7;
}

- (id)_maps_diffableDataSourceIdentifier
{
  return -[BrowseCategory name](self->_category, "name");
}

- (id)title
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseCategory alternativeName](self->_category, "alternativeName"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BrowseCategory name](self->_category, "name"));
  v6 = v5;

  return v6;
}

- (id)subtitle
{
  return 0;
}

- (id)image
{
  UIImage *image;
  void *v4;
  UIImage *v5;
  UIImage *v6;

  image = self->_image;
  if (!image)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BrowseManager sharedManager](BrowseManager, "sharedManager"));
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "synchronousImageForCategory:scale:isCarplay:", self->_category, 1, 0.0));
    v6 = self->_image;
    self->_image = v5;

    -[UIImage setAccessibilityIdentifier:](self->_image, "setAccessibilityIdentifier:", CFSTR("CarSmallWidgetSearchCategoryImage"));
    image = self->_image;
  }
  return image;
}

- (BOOL)vibrantBackground
{
  return 0;
}

- (BrowseCategory)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
