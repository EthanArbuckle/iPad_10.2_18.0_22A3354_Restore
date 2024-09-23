@implementation MTEpisodeStateView

+ (id)explicitIcon
{
  return objc_msgSend(a1, "imageForIconKey:theme:", &off_1004D5D70, 0);
}

+ (id)videoIcon
{
  return objc_msgSend(a1, "imageForIconKey:theme:", &off_1004D5D88, 0);
}

+ (id)orderedIconKeys
{
  if (qword_100567460 != -1)
    dispatch_once(&qword_100567460, &stru_1004A9E08);
  return (id)qword_100567458;
}

+ (id)imageForIconKey:(id)a3 theme:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (qword_100567470 != -1)
    dispatch_once(&qword_100567470, &stru_1004A9E28);
  v7 = objc_msgSend(v5, "unsignedIntegerValue");
  if (v7 == (id)2048)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[UIImage backCatalogPartiallyPlayedIconForTheme:](UIImage, "backCatalogPartiallyPlayedIconForTheme:", v6));
  }
  else if (v7 == (id)1024)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[UIImage backCatalogIconForTheme:](UIImage, "backCatalogIconForTheme:", v6));
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100567468, "objectForKeyedSubscript:", v5));
  }
  v9 = (void *)v8;

  return v9;
}

+ (double)imagePadding
{
  return 8.0;
}

- (MTEpisodeStateView)init
{
  MTEpisodeStateView *v2;
  uint64_t v3;
  NSArray *imageViews;
  uint64_t v5;
  NSMutableDictionary *imageViewCache;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTEpisodeStateView;
  v2 = -[MTEpisodeStateView init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    imageViews = v2->_imageViews;
    v2->_imageViews = (NSArray *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    imageViewCache = v2->_imageViewCache;
    v2->_imageViewCache = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)updateSizeIfNeeded
{
  if (self->_needsSizeUpdate)
    -[MTEpisodeStateView sizeToFit](self, "sizeToFit");
}

- (BOOL)isNotEmpty
{
  return self->_icons != 0;
}

- (void)setVerticalLayout:(BOOL)a3
{
  if (self->_verticalLayout != a3)
  {
    self->_verticalLayout = a3;
    -[MTEpisodeStateView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCenteredLayout:(BOOL)a3
{
  if (self->_centeredLayout != a3)
  {
    self->_centeredLayout = a3;
    -[MTEpisodeStateView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setAssetStatus:(unint64_t)a3
{
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  BOOL v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;

  v4 = (a3 & 0x1F) == 1;
  v5 = (a3 & 0x1F) == 3;
  v6 = (a3 & 0x1F) == 4;
  v7 = a3 > 4;
  v8 = a3 <= 4 && (a3 & 0x1F) == 2;
  v9 = !v7 && v4;
  v10 = !v7 && v5;
  v11 = !v7 && v6;
  -[MTEpisodeStateView _setStreaming:](self, "_setStreaming:", v8);
  -[MTEpisodeStateView _setDocument:](self, "_setDocument:", v9);
  -[MTEpisodeStateView _setError:](self, "_setError:", v10);
  -[MTEpisodeStateView _setAirplaneMode:](self, "_setAirplaneMode:", v11);
}

- (void)setPlayStatus:(unint64_t)a3
{
  unint64_t v3;

  v3 = self->_icons & 0xFFFFFFFFFFFFE07FLL;
  self->_icons = v3;
  if (a3 <= 5)
    self->_icons = v3 | qword_1003C81D8[a3];
  -[MTEpisodeStateView _setNeedsIconUpdate](self, "_setNeedsIconUpdate");
}

- (BOOL)isExplicit
{
  return (LOBYTE(self->_icons) >> 1) & 1;
}

- (BOOL)isVideo
{
  return self->_icons & 1;
}

- (void)setExplicit:(BOOL)a3
{
  -[MTEpisodeStateView _setEnabled:forFlag:](self, "_setEnabled:forFlag:", a3, 2);
}

- (void)setVideo:(BOOL)a3
{
  -[MTEpisodeStateView _setEnabled:forFlag:](self, "_setEnabled:forFlag:", a3, 1);
}

- (id)imagesForCurrentIconsExcludingPlayState
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  unint64_t icons;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = objc_opt_new(NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeStateView orderedIconKeys](MTEpisodeStateView, "orderedIconKeys", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if ((unint64_t)objc_msgSend(v9, "unsignedIntegerValue") <= 0x7F)
        {
          icons = self->_icons;
          if (((unint64_t)objc_msgSend(v9, "unsignedIntegerValue") & icons) != 0)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeStateView _imageViewForKey:](self, "_imageViewForKey:", v9));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "image"));

            if (v12)
              -[NSMutableArray addObject:](v3, "addObject:", v12);

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v13 = -[NSMutableArray copy](v3, "copy");
  return v13;
}

- (void)_setStreaming:(BOOL)a3
{
  -[MTEpisodeStateView _setEnabled:forFlag:](self, "_setEnabled:forFlag:", a3, 8);
}

- (void)_setDocument:(BOOL)a3
{
  -[MTEpisodeStateView _setEnabled:forFlag:](self, "_setEnabled:forFlag:", a3, 16);
}

- (void)_setError:(BOOL)a3
{
  -[MTEpisodeStateView _setEnabled:forFlag:](self, "_setEnabled:forFlag:", a3, 32);
}

- (void)_setAirplaneMode:(BOOL)a3
{
  -[MTEpisodeStateView _setEnabled:forFlag:](self, "_setEnabled:forFlag:", a3, 64);
}

- (BOOL)_streaming
{
  return (LOBYTE(self->_icons) >> 3) & 1;
}

- (BOOL)_document
{
  return (LOBYTE(self->_icons) >> 4) & 1;
}

- (BOOL)_error
{
  return (LOBYTE(self->_icons) >> 5) & 1;
}

- (BOOL)_airplaneMode
{
  return (LOBYTE(self->_icons) >> 6) & 1;
}

- (void)_setEnabled:(BOOL)a3 forFlag:(unint64_t)a4
{
  unint64_t icons;
  unint64_t v5;
  unint64_t v6;

  icons = self->_icons;
  if (((((icons & a4) == 0) ^ a3) & 1) == 0)
  {
    v5 = icons & ~a4;
    v6 = icons | a4;
    if (!a3)
      v6 = v5;
    self->_icons = v6;
    -[MTEpisodeStateView _setNeedsIconUpdate](self, "_setNeedsIconUpdate");
  }
}

- (void)_setNeedsIconUpdate
{
  self->_needsIconUpdate = 1;
  self->_needsSizeUpdate = 1;
}

- (void)_updateIconsIfNeeded
{
  if (self->_needsIconUpdate)
    -[MTEpisodeStateView _updateImageViews](self, "_updateImageViews");
}

- (void)_updateImageViews
{
  NSArray *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSArray *imageViews;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v3 = (NSArray *)objc_claimAutoreleasedReturnValue(-[MTEpisodeStateView _imageViews](self, "_imageViews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", self->_imageViews));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v4));
  objc_msgSend(v6, "minusSet:", v5);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v11), "removeFromSuperview");
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v9);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v5));
  objc_msgSend(v12, "minusSet:", v4);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        -[MTEpisodeStateView addSubview:](self, "addSubview:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v17), (_QWORD)v19);
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v15);
  }

  imageViews = self->_imageViews;
  self->_imageViews = v3;

}

- (id)_imageViews
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  unint64_t icons;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeStateView orderedIconKeys](MTEpisodeStateView, "orderedIconKeys", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        icons = self->_icons;
        if (((unint64_t)objc_msgSend(v9, "unsignedIntegerValue") & icons) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeStateView _imageViewForKey:](self, "_imageViewForKey:", v9));
          if (v11)
            objc_msgSend(v3, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v3));
  return v12;
}

- (id)_imageViewForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_imageViewCache, "objectForKeyedSubscript:", v4));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeStateView colorTheme](self, "colorTheme"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeStateView imageForIconKey:theme:](MTEpisodeStateView, "imageForIconKey:theme:", v4, v6));

    if (v7)
    {
      v5 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v7);
      objc_msgSend(v5, "sizeToFit");
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_imageViewCache, "setObject:forKeyedSubscript:", v5, v4);
    }
    else
    {
      v5 = 0;
    }

  }
  -[MTEpisodeStateView applyThemeToImageViewWithKey:](self, "applyThemeToImageViewWithKey:", v4);

  return v5;
}

- (BOOL)_isRTL
{
  return (id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[MTEpisodeStateView semanticContentAttribute](self, "semanticContentAttribute")) == (id)1;
}

- (void)applyThemeToImageViewWithKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_imageViewCache, "objectForKeyedSubscript:"));
  if (v4 && objc_msgSend(v7, "unsignedIntegerValue") == (id)4096)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeStateView colorTheme](self, "colorTheme"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tintColorForTheme:](UIColor, "tintColorForTheme:", v5));
    objc_msgSend(v4, "setTintColor:", v6);

  }
}

- (void)setColorTheme:(id)a3
{
  id v5;
  void *v6;
  NSMutableDictionary *imageViewCache;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  objc_storeStrong((id *)&self->_colorTheme, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryTextColorForTheme:](UIColor, "secondaryTextColorForTheme:", v5));
  -[MTEpisodeStateView setTintColor:](self, "setTintColor:", v6);

  imageViewCache = self->_imageViewCache;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000C757C;
  v9[3] = &unk_1004A9E50;
  v10 = v5;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](imageViewCache, "enumerateKeysAndObjectsUsingBlock:", v9);
  -[MTEpisodeStateView setNeedsLayout](self, "setNeedsLayout");

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  double y;
  double x;
  uint64_t v13;
  void *i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  -[MTEpisodeStateView bounds](self, "bounds");
  v4 = v3;
  -[MTEpisodeStateView bounds](self, "bounds");
  v6 = v5;
  -[MTEpisodeStateView _updateIconsIfNeeded](self, "_updateIconsIfNeeded");
  if (-[MTEpisodeStateView _isRTL](self, "_isRTL") && !-[MTEpisodeStateView isVerticalLayout](self, "isVerticalLayout"))
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray reverseObjectEnumerator](self->_imageViews, "reverseObjectEnumerator"));
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectEnumerator](self->_imageViews, "objectEnumerator"));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v15, "frame", (_QWORD)v26);
        v17 = v16;
        v19 = v18;
        v20 = -[MTEpisodeStateView isVerticalLayout](self, "isVerticalLayout");
        v21 = -[MTEpisodeStateView isCenteredLayout](self, "isCenteredLayout");
        if (v20)
        {
          if (v21)
          {
            x = IMRoundToPixel((v6 - v17) * 0.5);
          }
          else if (-[MTEpisodeStateView _isRTL](self, "_isRTL"))
          {
            x = v6 - v17;
          }
          else
          {
            x = 0.0;
          }
        }
        else
        {
          y = v4 - v19;
          if (v21)
            y = IMRoundToPixel(y * 0.5);
        }
        objc_msgSend(v15, "setFrame:", x, y, v17, v19);
        v22 = -[MTEpisodeStateView isVerticalLayout](self, "isVerticalLayout");
        +[MTEpisodeStateView imagePadding](MTEpisodeStateView, "imagePadding");
        v24 = v19 + v23;
        v25 = v17 + v23;
        if (!v22)
          v24 = -0.0;
        y = y + v24;
        if (v22)
          v25 = -0.0;
        x = x + v25;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  void *i;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unsigned int v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  CGSize result;

  -[MTEpisodeStateView _updateIconsIfNeeded](self, "_updateIconsIfNeeded", a3.width, a3.height);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = self->_imageViews;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    v8 = 0.0;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "frame", (_QWORD)v22);
        v13 = v12;
        v15 = v14;
        v16 = -[MTEpisodeStateView isVerticalLayout](self, "isVerticalLayout");
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_imageViews, "lastObject"));

        if (v16)
        {
          if (v9 < v13)
            v9 = v13;
          v8 = v8 + v15;
          if (v11 != v17)
          {
            +[MTEpisodeStateView imagePadding](MTEpisodeStateView, "imagePadding");
            v8 = v8 + v18;
          }
        }
        else
        {
          if (v8 < v15)
            v8 = v15;
          v9 = v9 + v13;
          if (v11 != v17)
          {
            +[MTEpisodeStateView imagePadding](MTEpisodeStateView, "imagePadding");
            v9 = v9 + v19;
          }
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
    v9 = 0.0;
  }

  v20 = v9;
  v21 = v8;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)sizeToFit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTEpisodeStateView;
  -[MTEpisodeStateView sizeToFit](&v3, "sizeToFit");
  self->_needsSizeUpdate = 0;
}

- (MTColorTheme)colorTheme
{
  return self->_colorTheme;
}

- (unint64_t)playStatus
{
  return self->_playStatus;
}

- (unint64_t)assetStatus
{
  return self->_assetStatus;
}

- (BOOL)isVerticalLayout
{
  return self->_verticalLayout;
}

- (BOOL)isCenteredLayout
{
  return self->_centeredLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorTheme, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_imageViewCache, 0);
}

@end
