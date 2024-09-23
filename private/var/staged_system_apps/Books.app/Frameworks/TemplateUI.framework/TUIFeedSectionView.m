@implementation TUIFeedSectionView

- (TUIHoverController)hoverController
{
  TUIHoverController *hoverController;
  TUIHoverController *v4;
  TUIHoverController *v5;

  hoverController = self->_hoverController;
  if (!hoverController)
  {
    v4 = objc_alloc_init(TUIHoverController);
    v5 = self->_hoverController;
    self->_hoverController = v4;

    -[TUIHoverController updateHoverInteractionWithView:](self->_hoverController, "updateHoverInteractionWithView:", self);
    hoverController = self->_hoverController;
  }
  return hoverController;
}

- (void)setRenderModel:(id)a3
{
  TUIRenderModelSection *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  TUIHoverController *hoverController;
  TUIHoverController *v11;
  _QWORD v12[5];
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v5 = (TUIRenderModelSection *)a3;
  if (self->_renderModel != v5)
  {
    objc_storeStrong((id *)&self->_renderModel, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelSection hoverRegions](self->_renderModel, "hoverRegions"));
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      v15 = 0uLL;
      v16 = 0;
      if (v5)
        -[TUIRenderModelSection config](v5, "config");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedSectionView hoverController](self, "hoverController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hoverInteraction"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_37E20;
      v12[3] = &unk_23E7B0;
      v12[4] = self;
      v13 = v15;
      v14 = v16;
      objc_msgSend(v9, "rebuildAllRegionsWithBlock:", v12);

    }
    else
    {
      hoverController = self->_hoverController;
      if (hoverController)
      {
        -[TUIHoverController reset](hoverController, "reset");
        v11 = self->_hoverController;
        self->_hoverController = 0;

      }
    }
  }

}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIFeedSectionView;
  -[TUIFeedSectionView setFrame:](&v4, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[TUIFeedSectionView _updateClippingState](self, "_updateClippingState");
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUIFeedSectionView;
  -[TUIFeedSectionView setBounds:](&v4, "setBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[TUIFeedSectionView _updateClippingState](self, "_updateClippingState");
}

- (void)_updateClippingState
{
  CGRect v3;

  -[TUIFeedSectionView bounds](self, "bounds");
  -[TUIFeedSectionView setClipsToBounds:](self, "setClipsToBounds:", CGRectIsEmpty(v3));
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  char v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  double v14;
  double v15;
  objc_super v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  unsigned __int8 v20;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v16.receiver = self;
  v16.super_class = (Class)TUIFeedSectionView;
  v20 = -[TUIFeedSectionView pointInside:withEvent:](&v16, "pointInside:withEvent:", v7, x, y);
  if (*((_BYTE *)v18 + 24))
  {
    v8 = 1;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedSectionView subviews](self, "subviews"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_3816C;
    v11[3] = &unk_23E7D8;
    v11[4] = self;
    v14 = x;
    v15 = y;
    v12 = v7;
    v13 = &v17;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

    v8 = *((_BYTE *)v18 + 24) != 0;
  }
  _Block_object_dispose(&v17, 8);

  return v8;
}

- (NSDictionary)tui_hostedSubviewsMap
{
  return self->_hostedSubviewsMap;
}

- (void)setTui_hostedSubviewsMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)tui_querySectionUUID
{
  return self->_tui_querySectionUUID;
}

- (void)setTui_querySectionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_tui_querySectionUUID, a3);
}

- (NSString)tui_querySectionUID
{
  return self->_tui_querySectionUID;
}

- (void)setTui_querySectionUID:(id)a3
{
  objc_storeStrong((id *)&self->_tui_querySectionUID, a3);
}

- (TUIRenderModelSection)renderModel
{
  return self->_renderModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderModel, 0);
  objc_storeStrong((id *)&self->_tui_querySectionUID, 0);
  objc_storeStrong((id *)&self->_tui_querySectionUUID, 0);
  objc_storeStrong((id *)&self->_hostedSubviewsMap, 0);
  objc_storeStrong((id *)&self->_hoverController, 0);
}

@end
