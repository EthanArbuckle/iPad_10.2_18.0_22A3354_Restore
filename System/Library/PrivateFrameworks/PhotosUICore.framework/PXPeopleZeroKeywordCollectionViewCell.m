@implementation PXPeopleZeroKeywordCollectionViewCell

- (void)setPeople:(id)a3 withThumbnailSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  double v9;
  void *v10;
  id v11;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[PXPeopleZeroKeywordCollectionViewCell traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  +[PXPeopleSocialGroupViewGenerator generateViewForSocialGroup:withSize:displayScale:](PXPeopleSocialGroupViewGenerator, "generateViewForSocialGroup:withSize:displayScale:", v7, width, height, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPeopleZeroKeywordCollectionViewCell setPeopleContentView:](self, "setPeopleContentView:", v11);
  -[PXSearchZeroKeywordCollectionViewCell imageView](self, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);

}

- (void)setThumbnailSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[PXPeopleZeroKeywordCollectionViewCell peopleContentView](self, "peopleContentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PXPeopleSocialGroupViewGenerator resizeThumbnailSizeForSocialGroupView:withSize:](PXPeopleSocialGroupViewGenerator, "resizeThumbnailSizeForSocialGroupView:withSize:", v5, width, height);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXPeopleZeroKeywordCollectionViewCell;
  -[PXPeopleZeroKeywordCollectionViewCell layoutSubviews](&v10, sel_layoutSubviews);
  -[PXPeopleZeroKeywordCollectionViewCell frame](self, "frame");
  v4 = v3;
  -[PXPeopleZeroKeywordCollectionViewCell peopleContentView](self, "peopleContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;

  if (v4 != v7)
  {
    -[PXPeopleZeroKeywordCollectionViewCell frame](self, "frame");
    -[PXPeopleZeroKeywordCollectionViewCell setThumbnailSize:](self, "setThumbnailSize:", v8, v9);
  }
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleZeroKeywordCollectionViewCell;
  -[PXSearchZeroKeywordCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[PXPeopleZeroKeywordCollectionViewCell peopleContentView](self, "peopleContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[PXPeopleZeroKeywordCollectionViewCell setPeopleContentView:](self, "setPeopleContentView:", 0);
}

- (UIView)peopleContentView
{
  return self->_peopleContentView;
}

- (void)setPeopleContentView:(id)a3
{
  objc_storeStrong((id *)&self->_peopleContentView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleContentView, 0);
}

+ (id)reuseIdentifier
{
  return CFSTR("PXPeopleZeroKeywordCollectionViewCell");
}

@end
