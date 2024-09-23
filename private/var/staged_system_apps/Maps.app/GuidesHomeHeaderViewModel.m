@implementation GuidesHomeHeaderViewModel

- (GuidesHomeHeaderViewModel)initWithGuideLocation:(id)a3 featuredGuide:(id)a4 sectionTitle:(id)a5
{
  id v9;
  id v10;
  id v11;
  GuidesHomeHeaderViewModel *v12;
  GuidesHomeHeaderViewModel *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSAttributedString *v19;
  NSAttributedString *sectionTitle;
  id v21;
  void *v22;
  MKPlaceCollectionViewModel *v23;
  MKPlaceCollectionViewModel *viewModel;
  objc_super v26;
  _QWORD v27[2];
  _QWORD v28[2];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)GuidesHomeHeaderViewModel;
  v12 = -[GuidesHomeHeaderViewModel init](&v26, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_featuredGuide, a4);
    objc_storeStrong((id *)&v13->_guideLocation, a3);
    v14 = objc_alloc((Class)NSAttributedString);
    v27[0] = NSFontAttributeName;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 11.0));
    v28[0] = v15;
    v27[1] = NSForegroundColorAttributeName;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "colorWithAlphaComponent:", 0.6));
    v28[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));
    v19 = (NSAttributedString *)objc_msgSend(v14, "initWithString:attributes:", v11, v18);
    sectionTitle = v13->_sectionTitle;
    v13->_sectionTitle = v19;

    v21 = objc_alloc((Class)MKPlaceCollectionViewModel);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system28Bold](UIFont, "system28Bold"));
    v23 = (MKPlaceCollectionViewModel *)objc_msgSend(v21, "initWithGEOPlaceCollection:usingSyncCoordinator:inContext:usingTitleFont:", v10, 0, 9, v22);
    viewModel = v13->_viewModel;
    v13->_viewModel = v23;

  }
  return v13;
}

- (UIColor)backgroundColor
{
  UIColor *backgroundColor;
  void *v4;
  UIColor *v5;
  UIColor *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  UIColor *v10;
  void *v11;
  void *v12;
  UIColor *v13;
  UIColor *v14;

  backgroundColor = self->_backgroundColor;
  if (!backgroundColor)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeHeaderViewModel viewModel](self, "viewModel"));
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundColor"));
    v6 = self->_backgroundColor;
    self->_backgroundColor = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKPlaceCollectionImageProvider sharedInstance](MKPlaceCollectionImageProvider, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeHeaderViewModel featuredGuide](self, "featuredGuide"));
    v9 = objc_msgSend(v7, "isJoeColorManuallyCuratedForCuratedCollection:", v8);

    if ((v9 & 1) == 0)
    {
      v10 = self->_backgroundColor;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "colorWithAlphaComponent:", 0.3));
      v13 = (UIColor *)objc_claimAutoreleasedReturnValue(-[UIColor _colorBlendedWithColor:compositingFilter:](v10, "_colorBlendedWithColor:compositingFilter:", v12, kCAFilterDarkenBlendMode));
      v14 = self->_backgroundColor;
      self->_backgroundColor = v13;

    }
    backgroundColor = self->_backgroundColor;
  }
  return backgroundColor;
}

- (NSAttributedString)collectionTitle
{
  NSAttributedString *collectionTitle;
  void *v4;
  NSAttributedString *v5;
  NSAttributedString *v6;

  collectionTitle = self->_collectionTitle;
  if (!collectionTitle)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeHeaderViewModel viewModel](self, "viewModel"));
    v5 = (NSAttributedString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionTitle"));
    v6 = self->_collectionTitle;
    self->_collectionTitle = v5;

    collectionTitle = self->_collectionTitle;
  }
  return collectionTitle;
}

- (NSAttributedString)collectionLongTitle
{
  NSAttributedString *collectionLongTitle;
  void *v4;
  NSAttributedString *v5;
  NSAttributedString *v6;

  collectionLongTitle = self->_collectionLongTitle;
  if (!collectionLongTitle)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeHeaderViewModel viewModel](self, "viewModel"));
    v5 = (NSAttributedString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionLongTitle"));
    v6 = self->_collectionLongTitle;
    self->_collectionLongTitle = v5;

    collectionLongTitle = self->_collectionLongTitle;
  }
  return collectionLongTitle;
}

- (NSString)guideLocationTitle
{
  NSString *guideLocationTitle;
  void *v4;
  NSString *v5;
  NSString *v6;

  guideLocationTitle = self->_guideLocationTitle;
  if (!guideLocationTitle)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeHeaderViewModel guideLocation](self, "guideLocation"));
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
    v6 = self->_guideLocationTitle;
    self->_guideLocationTitle = v5;

    guideLocationTitle = self->_guideLocationTitle;
  }
  return guideLocationTitle;
}

- (void)publisherLogoImageWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GuidesHomeHeaderViewModel viewModel](self, "viewModel"));
  objc_msgSend(v5, "publisherLogoImageWithCompletion:", v4);

}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void)setCollectionTitle:(id)a3
{
  objc_storeStrong((id *)&self->_collectionTitle, a3);
}

- (void)setCollectionLongTitle:(id)a3
{
  objc_storeStrong((id *)&self->_collectionLongTitle, a3);
}

- (void)setGuideLocationTitle:(id)a3
{
  objc_storeStrong((id *)&self->_guideLocationTitle, a3);
}

- (GEOGuideLocation)guideLocation
{
  return self->_guideLocation;
}

- (GEOPlaceCollection)featuredGuide
{
  return self->_featuredGuide;
}

- (NSAttributedString)sectionTitle
{
  return self->_sectionTitle;
}

- (void)setSectionTitle:(id)a3
{
  objc_storeStrong((id *)&self->_sectionTitle, a3);
}

- (MKPlaceCollectionViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (CGSize)photoSize
{
  double width;
  double height;
  CGSize result;

  width = self->_photoSize.width;
  height = self->_photoSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPhotoSize:(CGSize)a3
{
  self->_photoSize = a3;
}

- (UIImage)publisherLogoImage
{
  return (UIImage *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPublisherLogoImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (UIImage)collectionImage
{
  return self->_collectionImage;
}

- (void)setCollectionImage:(id)a3
{
  objc_storeStrong((id *)&self->_collectionImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionImage, 0);
  objc_storeStrong((id *)&self->_publisherLogoImage, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
  objc_storeStrong((id *)&self->_featuredGuide, 0);
  objc_storeStrong((id *)&self->_guideLocation, 0);
  objc_storeStrong((id *)&self->_guideLocationTitle, 0);
  objc_storeStrong((id *)&self->_collectionLongTitle, 0);
  objc_storeStrong((id *)&self->_collectionTitle, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)collectionImageForSize:(CGSize)a3 onCompletion:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[GuidesHomeHeaderViewModel viewModel](self, "viewModel"));
  objc_msgSend(v8, "collectionImageForSize:onCompletion:", v7, width, height);

}

@end
