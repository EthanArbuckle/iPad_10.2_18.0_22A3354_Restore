@implementation PXOverlayBadgeUIViewTile

- (PXOverlayBadgeUIViewTile)initWithFrame:(CGRect)a3
{
  PXOverlayBadgeUIViewTile *v3;
  PXOverlayBadgeUIViewTile *v4;
  void *v5;
  PXUIAssetBadgeView *v6;
  uint64_t v7;
  PXUIAssetBadgeView *badgeView;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXOverlayBadgeUIViewTile;
  v3 = -[PXOverlayBadgeUIViewTile initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXOverlayBadgeUIViewTile setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXOverlayBadgeUIViewTile setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = [PXUIAssetBadgeView alloc];
    -[PXOverlayBadgeUIViewTile bounds](v4, "bounds");
    v7 = -[PXUIAssetBadgeView initWithFrame:](v6, "initWithFrame:");
    badgeView = v4->__badgeView;
    v4->__badgeView = (PXUIAssetBadgeView *)v7;

    -[PXUIAssetBadgeView setStyle:](v4->__badgeView, "setStyle:", 1);
    -[PXUIAssetBadgeView setHidden:](v4->__badgeView, "setHidden:", 1);
    -[PXOverlayBadgeUIViewTile addSubview:](v4, "addSubview:", v4->__badgeView);
    -[PXOverlayBadgeUIViewTile layer](v4, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupOpacity:", 0);

  }
  return v4;
}

- (void)becomeReusable
{
  void *v3;

  -[PXOverlayBadgeUIViewTile view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[PXOverlayBadgeUIViewTile setImageRequester:](self, "setImageRequester:", 0);
}

- (void)prepareForReuse
{
  id v2;

  -[PXOverlayBadgeUIViewTile view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  uint64_t v5;

  if (a4)
    v5 = objc_msgSend(a4, "badgeOptions", a3);
  else
    v5 = 0;
  -[PXOverlayBadgeUIViewTile _setBadgeOptions:](self, "_setBadgeOptions:", v5);
  -[PXOverlayBadgeUIViewTile layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)setImageRequester:(id)a3
{
  PXImageRequester *v5;
  PXImageRequester *imageRequester;
  PXImageRequester *v7;

  v5 = (PXImageRequester *)a3;
  imageRequester = self->_imageRequester;
  v7 = v5;
  if (imageRequester != v5)
  {
    -[PXImageRequester unregisterChangeObserver:context:](imageRequester, "unregisterChangeObserver:context:", self, PXImageRequesterObserverContext_182527);
    objc_storeStrong((id *)&self->_imageRequester, a3);
    -[PXImageRequester registerChangeObserver:context:](v7, "registerChangeObserver:context:", self, PXImageRequesterObserverContext_182527);
    -[PXOverlayBadgeUIViewTile _invalidateBadgeView](self, "_invalidateBadgeView");
  }

}

- (void)setBadgeManager:(id)a3
{
  PXAssetBadgeManager *v5;
  PXAssetBadgeManager *v6;

  v5 = (PXAssetBadgeManager *)a3;
  if (self->_badgeManager != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_badgeManager, a3);
    -[PXOverlayBadgeUIViewTile _invalidateBadgeView](self, "_invalidateBadgeView");
    v5 = v6;
  }

}

- (void)_setBadgeOptions:(unint64_t)a3
{
  if (self->__badgeOptions != a3)
  {
    self->__badgeOptions = a3;
    -[PXOverlayBadgeUIViewTile _invalidateBadgeView](self, "_invalidateBadgeView");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
  void *v14;
  objc_super v15;
  CGRect v16;

  v15.receiver = self;
  v15.super_class = (Class)PXOverlayBadgeUIViewTile;
  -[PXOverlayBadgeUIViewTile layoutSubviews](&v15, sel_layoutSubviews);
  -[PXOverlayBadgeUIViewTile _updateBadgeViewIfNeeded](self, "_updateBadgeViewIfNeeded");
  -[PXOverlayBadgeUIViewTile bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  +[PXUIAssetBadgeView preferredHeightForStyle:](PXUIAssetBadgeView, "preferredHeightForStyle:", 1);
  v12 = v11;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  v13 = CGRectGetMaxY(v16) - v12;
  -[PXOverlayBadgeUIViewTile _badgeView](self, "_badgeView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v4, v13, v8, v12);

}

- (void)_invalidateBadgeView
{
  self->_needsUpdateFlags.badgeView = 1;
  -[PXOverlayBadgeUIViewTile setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateBadgeViewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t IsNull;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  if (self->_needsUpdateFlags.badgeView)
  {
    -[PXOverlayBadgeUIViewTile _badgeView](self, "_badgeView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXOverlayBadgeUIViewTile imageRequester](self, "imageRequester");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "image");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v7 = 0;
      else
        v7 = objc_msgSend(v5, "isInCloud");

      objc_msgSend(v5, "asset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0u;
      v15 = 0u;
      -[PXOverlayBadgeUIViewTile badgeManager](self, "badgeManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "badgeInfoForAsset:inCollection:options:", v9, 0, 0);
      }
      else
      {
        v14 = 0u;
        v15 = 0u;
      }

      if ((-[PXOverlayBadgeUIViewTile _badgeOptions](self, "_badgeOptions") & 2) == 0)
        *(_QWORD *)&v14 = 0;
      if (v7)
        *(_QWORD *)&v14 = v14 | 0x20;
      v12 = v14;
      v13 = v15;
      objc_msgSend(v3, "setBadgeInfo:", &v12);
      v12 = v14;
      v13 = v15;
      IsNull = PXAssetBadgeInfoIsNull();

    }
    else
    {
      IsNull = 1;
    }
    objc_msgSend(v3, "setHidden:", IsNull);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v8;
  id v9;
  id v10;

  v6 = a4;
  v8 = a3;
  if ((void *)PXImageRequesterObserverContext_182527 == a5)
  {
    v10 = v8;
    -[PXOverlayBadgeUIViewTile imageRequester](self, "imageRequester");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 != v10)
    {

LABEL_6:
      v8 = v10;
      goto LABEL_7;
    }

    v8 = v10;
    if ((v6 & 0x15) != 0)
    {
      -[PXOverlayBadgeUIViewTile _invalidateBadgeView](self, "_invalidateBadgeView");
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (PXAssetBadgeManager)badgeManager
{
  return self->_badgeManager;
}

- (PXImageRequester)imageRequester
{
  return self->_imageRequester;
}

- (unint64_t)_badgeOptions
{
  return self->__badgeOptions;
}

- (PXUIAssetBadgeView)_badgeView
{
  return self->__badgeView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__badgeView, 0);
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_badgeManager, 0);
}

+ (void)preloadResources
{
  +[PXUIAssetBadgeView preloadResourcesForStyle:](PXUIAssetBadgeView, "preloadResourcesForStyle:", 1);
}

@end
