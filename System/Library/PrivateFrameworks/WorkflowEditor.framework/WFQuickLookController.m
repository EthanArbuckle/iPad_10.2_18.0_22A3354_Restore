@implementation WFQuickLookController

- (WFQuickLookController)initWithNibName:(id)a3 bundle:(id)a4
{
  WFQuickLookController *v4;
  uint64_t v5;
  NSMutableIndexSet *indexesPendingRefresh;
  WFQuickLookController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFQuickLookController;
  v4 = -[QLPreviewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_opt_new();
    indexesPendingRefresh = v4->_indexesPendingRefresh;
    v4->_indexesPendingRefresh = (NSMutableIndexSet *)v5;

    v7 = v4;
  }

  return v4;
}

- (void)_updateAppearance:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!-[WFQuickLookController isEmbedded](self, "isEmbedded"))
  {
    v5.receiver = self;
    v5.super_class = (Class)WFQuickLookController;
    -[QLPreviewController _updateAppearance:](&v5, sel__updateAppearance_, v3);
  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)WFQuickLookController;
  -[WFQuickLookController viewWillLayoutSubviews](&v19, sel_viewWillLayoutSubviews);
  if (-[WFQuickLookController modalPresentationStyle](self, "modalPresentationStyle") == 2)
  {
    -[WFQuickLookController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFQuickLookController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "center");
    v8 = v7;
    v10 = v9;
    -[WFQuickLookController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "convertPoint:fromView:", v13, v8, v10);
    v15 = v14;
    v17 = v16;
    -[WFQuickLookController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setCenter:", v15, v17);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFQuickLookController;
  -[QLPreviewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_updateCurrentIndex, 0, 1, 0.100000001);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFQuickLookController setIndexTimer:](self, "setIndexTimer:", v4);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFQuickLookController;
  -[QLPreviewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[WFQuickLookController indexTimer](self, "indexTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (void)updateCurrentIndex
{
  int64_t v3;
  void *v4;

  v3 = -[QLPreviewController currentPreviewItemIndex](self, "currentPreviewItemIndex");
  if (self->_lastIndex != v3)
  {
    -[WFQuickLookController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentPreviewItemIndex"));
    -[WFQuickLookController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentPreviewItemIndex"));
    -[WFQuickLookController indexesPendingRefresh](self, "indexesPendingRefresh");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "containsIndex:", v3))
    {
      objc_msgSend(v4, "removeAllIndexes");
      -[QLPreviewController refreshCurrentPreviewItem](self, "refreshCurrentPreviewItem");
    }

  }
  self->_lastIndex = v3;
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  v10.receiver = self;
  v10.super_class = (Class)WFQuickLookController;
  -[WFQuickLookController preferredContentSize](&v10, sel_preferredContentSize);
  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (v2 != *MEMORY[0x24BDBF148] || v3 != v5)
  {
    v7 = fmax(400.0 / v2, 300.0 / v3);
    v4 = v2;
    v5 = v3;
    if (v7 > 1.0)
    {
      v4 = v2 * v7;
      v5 = v3 * v7;
    }
  }
  v8 = v4;
  v9 = v5;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)wf_refreshPreviewItemAtIndex:(int64_t)a3
{
  id v5;

  if (-[QLPreviewController currentPreviewItemIndex](self, "currentPreviewItemIndex") == a3)
  {
    -[QLPreviewController refreshCurrentPreviewItem](self, "refreshCurrentPreviewItem");
  }
  else
  {
    -[WFQuickLookController indexesPendingRefresh](self, "indexesPendingRefresh");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addIndex:", a3);

  }
}

- (id)activityItemForDocumentInteractionController:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  if (objc_msgSend((id)-[WFQuickLookController superclass](self, "superclass"), "instancesRespondToSelector:", sel_activityItemForDocumentInteractionController_))
  {
    v15.receiver = self;
    v15.super_class = (Class)WFQuickLookController;
    -[QLPreviewController activityItemForDocumentInteractionController:](&v15, sel_activityItemForDocumentInteractionController_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    NSClassFromString(CFSTR("QLActivityItemProvider"));
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v5;
    if ((isKindOfClass & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[QLPreviewController currentPreviewItem](self, "currentPreviewItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v8;
        objc_msgSend(v9, "originalItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = (void *)objc_opt_new();
          objc_msgSend(v9, "originalItem");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setItem:", v12);

          objc_msgSend(MEMORY[0x24BDE5EB8], "itemWithPreviewItem:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setActivityPreviewItem:", v13);

        }
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEmbedded
{
  return self->_embedded;
}

- (void)setEmbedded:(BOOL)a3
{
  self->_embedded = a3;
}

- (NSMutableIndexSet)indexesPendingRefresh
{
  return self->_indexesPendingRefresh;
}

- (void)setIndexesPendingRefresh:(id)a3
{
  objc_storeStrong((id *)&self->_indexesPendingRefresh, a3);
}

- (NSTimer)indexTimer
{
  return self->_indexTimer;
}

- (void)setIndexTimer:(id)a3
{
  objc_storeStrong((id *)&self->_indexTimer, a3);
}

- (int64_t)lastIndex
{
  return self->_lastIndex;
}

- (void)setLastIndex:(int64_t)a3
{
  self->_lastIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexTimer, 0);
  objc_storeStrong((id *)&self->_indexesPendingRefresh, 0);
}

@end
