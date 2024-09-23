@implementation PXPhotosDetailsHeaderPreviewTile

- (void)_setContentView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->__contentView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__contentView, a3);
    -[PXPhotosDetailsHeaderPreviewTile _updateContentViewFrame](self, "_updateContentViewFrame");
    v5 = v6;
  }

}

- (void)_updateContentViewFrame
{
  id v3;

  -[PXPhotosDetailsHeaderPreviewTile _contentView](self, "_contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self->_containerView, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGSize size;
  CGSize v10;
  _OWORD v11[12];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXPhotosDetailsHeaderPreviewTile;
  v5 = *(_OWORD *)&a3->contentSize.height;
  v11[8] = *(_OWORD *)&a3->hidden;
  v11[9] = v5;
  v6 = *(_OWORD *)&a3->contentsRect.size.height;
  v11[10] = *(_OWORD *)&a3->contentsRect.origin.y;
  v11[11] = v6;
  v7 = *(_OWORD *)&a3->transform.c;
  v11[4] = *(_OWORD *)&a3->transform.a;
  v11[5] = v7;
  v8 = *(_OWORD *)&a3->alpha;
  v11[6] = *(_OWORD *)&a3->transform.tx;
  v11[7] = v8;
  size = a3->frame.size;
  v11[0] = a3->frame.origin;
  v11[1] = size;
  v10 = a3->size;
  v11[2] = a3->center;
  v11[3] = v10;
  -[PXUIImageTile didApplyGeometry:withUserData:](&v12, sel_didApplyGeometry_withUserData_, v11, a4);
  -[PXPhotosDetailsHeaderPreviewTile _updateContentViewFrame](self, "_updateContentViewFrame");
}

- (void)becomeReusable
{
  id v2;

  -[PXUIImageTile view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

}

- (void)prepareForReuse
{
  id v2;

  -[PXUIImageTile view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

}

- (UIView)_contentView
{
  return self->__contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__contentView, 0);
  objc_storeStrong((id *)&self->_floatingView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end
