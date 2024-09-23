@implementation CHAchievementCollectionViewCell

- (CHAchievementCollectionViewCell)initWithFrame:(CGRect)a3
{
  CHAchievementCollectionViewCell *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHAchievementCollectionViewCell;
  v3 = -[CHAchievementCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CHAchievementCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[CHAchievementCollectionViewCell _createAndAddSubviews](v3, "_createAndAddSubviews");
    -[CHAchievementCollectionViewCell setIsAccessibilityElement:](v3, "setIsAccessibilityElement:", 1);
  }
  return v3;
}

- (void)setImageHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_imageHidden = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CHAchievementCollectionViewCell imageView](self, "imageView"));
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)_createAndAddSubviews
{
  UIImageView *v3;
  UIImageView *imageView;
  id v5;

  v3 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  imageView = self->_imageView;
  self->_imageView = v3;

  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 4);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CHAchievementCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v5, "addSubview:", self->_imageView);

}

- (void)setAchievement:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  dispatch_queue_global_t global_queue;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v5 = a3;
  objc_storeStrong((id *)&self->_achievement, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementCollectionViewCell locProvider](self, "locProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "titleForAchievement:", v5));
  -[CHAchievementCollectionViewCell setAccessibilityLabel:](self, "setAccessibilityLabel:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ACHIEVEMENT_TITLE_ACCESSIBILITY_HINT"), &stru_1007AE1D0, CFSTR("Localizable")));
  -[CHAchievementCollectionViewCell setAccessibilityHint:](self, "setAccessibilityHint:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "template"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueName"));
  -[CHAchievementCollectionViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v11);

  global_queue = dispatch_get_global_queue(25, 0);
  v13 = objc_claimAutoreleasedReturnValue(global_queue);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000ABF40;
  v15[3] = &unk_100777EE0;
  v15[4] = self;
  v16 = v5;
  v14 = v5;
  dispatch_async(v13, v15);

}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHAchievementCollectionViewCell;
  -[CHAchievementCollectionViewCell setHighlighted:](&v3, "setHighlighted:", a3);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CHAchievementCollectionViewCell;
  -[CHAchievementCollectionViewCell layoutSubviews](&v12, "layoutSubviews");
  -[CHAchievementCollectionViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementCollectionViewCell imageView](self, "imageView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHAchievementCollectionViewCell;
  -[CHAchievementCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementCollectionViewCell imageView](self, "imageView"));
  objc_msgSend(v3, "setImage:", 0);

}

- (CGRect)badgeFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementCollectionViewCell imageView](self, "imageView"));
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (ACHAchievement)achievement
{
  return self->_achievement;
}

- (BOOL)imageHidden
{
  return self->_imageHidden;
}

- (ACHAchievementLocalizationProvider)locProvider
{
  return self->_locProvider;
}

- (void)setLocProvider:(id)a3
{
  objc_storeStrong((id *)&self->_locProvider, a3);
}

- (AAUIBadgeImageFactory)imageFactory
{
  return self->_imageFactory;
}

- (void)setImageFactory:(id)a3
{
  objc_storeStrong((id *)&self->_imageFactory, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (double)imageDimension
{
  return self->_imageDimension;
}

- (void)setImageDimension:(double)a3
{
  self->_imageDimension = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_imageFactory, 0);
  objc_storeStrong((id *)&self->_locProvider, 0);
  objc_storeStrong((id *)&self->_achievement, 0);
}

@end
