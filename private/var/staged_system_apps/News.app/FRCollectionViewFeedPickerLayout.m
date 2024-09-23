@implementation FRCollectionViewFeedPickerLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class(FRCollectionViewFeedPickerLayoutAttributes, a2);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  BOOL result;
  objc_super v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[FRCollectionViewFlowLayout oldWidth](self, "oldWidth");
  v9 = v8;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v10 = vabdd_f64(v9, CGRectGetWidth(v13));
  v12.receiver = self;
  v12.super_class = (Class)FRCollectionViewFeedPickerLayout;
  result = -[FRCollectionViewFeedPickerLayout shouldInvalidateLayoutForBoundsChange:](&v12, "shouldInvalidateLayoutForBoundsChange:", x, y, width, height);
  if (v10 >= 0.00999999978)
    return 1;
  return result;
}

- (void)invalidateLayout
{
  UIFont *placeholderTopicFont;
  NSDictionary *placeholderTopicAttributes;
  UIFont *placeholderChannelFont;
  NSDictionary *placeholderChannelAttributes;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FRCollectionViewFeedPickerLayout;
  -[FRCollectionViewFeedPickerLayout invalidateLayout](&v7, "invalidateLayout");
  placeholderTopicFont = self->_placeholderTopicFont;
  self->_placeholderTopicFont = 0;

  placeholderTopicAttributes = self->_placeholderTopicAttributes;
  self->_placeholderTopicAttributes = 0;

  placeholderChannelFont = self->_placeholderChannelFont;
  self->_placeholderChannelFont = 0;

  placeholderChannelAttributes = self->_placeholderChannelAttributes;
  self->_placeholderChannelAttributes = 0;

  -[FRCollectionViewFlowLayout setOldWidth:](self, "setOldWidth:", 0.0);
}

- (void)prepareLayout
{
  double v3;
  double v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIFont *v10;
  UIFont *placeholderTopicFont;
  void *v12;
  NSDictionary *v13;
  NSDictionary *placeholderTopicAttributes;
  void *v15;
  UIFont *v16;
  UIFont *placeholderChannelFont;
  void *v18;
  NSDictionary *v19;
  NSDictionary *placeholderChannelAttributes;
  void *v21;
  UIImage *v22;
  UIImage *placeholderTopicImage;
  void *v24;
  UIImage *v25;
  UIImage *placeholderChannelImage;
  objc_super v27;
  CGRect v28;

  v27.receiver = self;
  v27.super_class = (Class)FRCollectionViewFeedPickerLayout;
  -[FRCollectionViewFeedPickerLayout prepareLayout](&v27, "prepareLayout");
  -[FRCollectionViewFeedPickerLayout transitioningToSize](self, "transitioningToSize");
  if (CGSizeZero.width == v4 && CGSizeZero.height == v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayout collectionView](self, "collectionView"));
    objc_msgSend(v6, "bounds");
    -[FRCollectionViewFlowLayout setOldWidth:](self, "setOldWidth:", CGRectGetWidth(v28));

  }
  else
  {
    -[FRCollectionViewFeedPickerLayout transitioningToSize](self, "transitioningToSize");
    -[FRCollectionViewFlowLayout setOldWidth:](self, "setOldWidth:");
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayout collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));

  if (v8)
  {
    if ((objc_opt_respondsToSelector(v8, "collectionView:placeholderTopicFontForLayout:") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayout collectionView](self, "collectionView"));
      v10 = (UIFont *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionView:placeholderTopicFontForLayout:", v9, self));
      placeholderTopicFont = self->_placeholderTopicFont;
      self->_placeholderTopicFont = v10;

    }
    if ((objc_opt_respondsToSelector(v8, "collectionView:placeholderTopicStringAttributesForLayout:") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayout collectionView](self, "collectionView"));
      v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionView:placeholderTopicStringAttributesForLayout:", v12, self));
      placeholderTopicAttributes = self->_placeholderTopicAttributes;
      self->_placeholderTopicAttributes = v13;

    }
    if ((objc_opt_respondsToSelector(v8, "collectionView:placeholderChannelFontForLayout:") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayout collectionView](self, "collectionView"));
      v16 = (UIFont *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionView:placeholderChannelFontForLayout:", v15, self));
      placeholderChannelFont = self->_placeholderChannelFont;
      self->_placeholderChannelFont = v16;

    }
    if ((objc_opt_respondsToSelector(v8, "collectionView:placeholderChannelStringAttributesForLayout:") & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayout collectionView](self, "collectionView"));
      v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionView:placeholderChannelStringAttributesForLayout:", v18, self));
      placeholderChannelAttributes = self->_placeholderChannelAttributes;
      self->_placeholderChannelAttributes = v19;

    }
    if ((objc_opt_respondsToSelector(v8, "collectionView:placeholderTopicImageForLayout:") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayout collectionView](self, "collectionView"));
      v22 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionView:placeholderTopicImageForLayout:", v21, self));
      placeholderTopicImage = self->_placeholderTopicImage;
      self->_placeholderTopicImage = v22;

    }
    if ((objc_opt_respondsToSelector(v8, "collectionView:placeholderChannelImageForLayout:") & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayout collectionView](self, "collectionView"));
      v25 = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionView:placeholderChannelImageForLayout:", v24, self));
      placeholderChannelImage = self->_placeholderChannelImage;
      self->_placeholderChannelImage = v25;

    }
  }

}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FRCollectionViewFeedPickerLayout;
  v4 = -[FRCollectionViewFeedPickerLayout layoutAttributesForItemAtIndexPath:](&v7, "layoutAttributesForItemAtIndexPath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[FRCollectionViewFeedPickerLayout _populateAttributes:](self, "_populateAttributes:", v5);
  return v5;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];

  v15.receiver = self;
  v15.super_class = (Class)FRCollectionViewFeedPickerLayout;
  v4 = -[FRCollectionViewFeedPickerLayout layoutAttributesForElementsInRect:](&v15, "layoutAttributesForElementsInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[FRCollectionViewFeedPickerLayout _populateAttributes:](self, "_populateAttributes:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }
  return v5;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FRCollectionViewFeedPickerLayout;
  v5 = -[FRCollectionViewFeedPickerLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](&v8, "layoutAttributesForSupplementaryViewOfKind:atIndexPath:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  -[FRCollectionViewFeedPickerLayout _populateAttributes:](self, "_populateAttributes:", v6);
  return v6;
}

- (void)_populateAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v6 = objc_opt_class(FRCollectionViewFeedPickerLayoutAttributes, v5);
  v7 = FCDynamicCast(v6, v4);
  v14 = (id)objc_claimAutoreleasedReturnValue(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayout placeholderTopicFont](self, "placeholderTopicFont"));
  objc_msgSend(v14, "setPlaceholderTopicFont:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayout placeholderChannelFont](self, "placeholderChannelFont"));
  objc_msgSend(v14, "setPlaceholderChannelFont:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayout placeholderTopicAttributes](self, "placeholderTopicAttributes"));
  objc_msgSend(v14, "setPlaceholderTopicAttributes:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayout placeholderChannelAttributes](self, "placeholderChannelAttributes"));
  objc_msgSend(v14, "setPlaceholderChannelAttributes:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayout placeholderChannelImage](self, "placeholderChannelImage"));
  objc_msgSend(v14, "setPlaceholderChannelImage:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayout placeholderTopicImage](self, "placeholderTopicImage"));
  objc_msgSend(v14, "setPlaceholderTopicImage:", v13);

}

- (void)finalizeCollectionViewUpdates
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  unsigned int v15;
  double v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];

  v23.receiver = self;
  v23.super_class = (Class)FRCollectionViewFeedPickerLayout;
  -[FRCollectionViewFeedPickerLayout finalizeCollectionViewUpdates](&v23, "finalizeCollectionViewUpdates");
  v3 = FRZoomAnimationTimingFunction();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRCollectionViewFeedPickerLayout collectionView](self, "collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleCells"));

  v6 = v5;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "animationForKey:", CFSTR("position")));
        v14 = objc_msgSend(v13, "copy");

        if (v14)
        {
          objc_msgSend(v14, "setTimingFunction:", v18);
          v15 = +[FRAnimationHelpers overrideDurationEnabled](FRAnimationHelpers, "overrideDurationEnabled");
          v16 = 0.35;
          if (v15)
            +[FRAnimationHelpers animationDuration](FRAnimationHelpers, "animationDuration", 0.35);
          objc_msgSend(v14, "setDuration:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));
          objc_msgSend(v17, "addAnimation:forKey:", v14, CFSTR("position"));

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v8);
  }

}

- (CGSize)transitioningToSize
{
  double width;
  double height;
  CGSize result;

  width = self->_transitioningToSize.width;
  height = self->_transitioningToSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTransitioningToSize:(CGSize)a3
{
  self->_transitioningToSize = a3;
}

- (UIFont)placeholderTopicFont
{
  return self->_placeholderTopicFont;
}

- (void)setPlaceholderTopicFont:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderTopicFont, a3);
}

- (UIFont)placeholderChannelFont
{
  return self->_placeholderChannelFont;
}

- (void)setPlaceholderChannelFont:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderChannelFont, a3);
}

- (NSDictionary)placeholderTopicAttributes
{
  return self->_placeholderTopicAttributes;
}

- (void)setPlaceholderTopicAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderTopicAttributes, a3);
}

- (NSDictionary)placeholderChannelAttributes
{
  return self->_placeholderChannelAttributes;
}

- (void)setPlaceholderChannelAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderChannelAttributes, a3);
}

- (UIImage)placeholderTopicImage
{
  return self->_placeholderTopicImage;
}

- (void)setPlaceholderTopicImage:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderTopicImage, a3);
}

- (UIImage)placeholderChannelImage
{
  return self->_placeholderChannelImage;
}

- (void)setPlaceholderChannelImage:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderChannelImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderChannelImage, 0);
  objc_storeStrong((id *)&self->_placeholderTopicImage, 0);
  objc_storeStrong((id *)&self->_placeholderChannelAttributes, 0);
  objc_storeStrong((id *)&self->_placeholderTopicAttributes, 0);
  objc_storeStrong((id *)&self->_placeholderChannelFont, 0);
  objc_storeStrong((id *)&self->_placeholderTopicFont, 0);
}

@end
