@implementation NCNotificationHighlightsSectionList

- (id)materialGroupNameBase
{
  void *v3;
  void *v4;

  -[NCNotificationStructuredSectionList delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundGroupNameBaseForNotificationListBaseComponent:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)insertNotificationRequest:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NCNotificationHighlightsSectionList;
  -[NCNotificationStructuredSectionList insertNotificationRequest:](&v3, sel_insertNotificationRequest_, a3);
}

- (void)removeNotificationRequest:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationHighlightsSectionList;
  -[NCNotificationStructuredSectionList removeNotificationRequest:](&v5, sel_removeNotificationRequest_, a3);
  if (!-[NCNotificationStructuredSectionList notificationCount](self, "notificationCount"))
  {
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recycleVisibleViews");

  }
}

- (id)backgroundViewForNotificationList:(id)a3
{
  PLPlatterView *v4;

  v4 = -[NCNotificationStructuredSectionList notificationCount](self, "notificationCount", a3);
  if (v4)
  {
    -[NCNotificationHighlightsSectionList _configureBackgroundPlatterViewIfNecessary](self, "_configureBackgroundPlatterViewIfNecessary");
    v4 = self->_backgroundPlatterView;
  }
  return v4;
}

- (void)_configureBackgroundPlatterViewIfNecessary
{
  PLPlatterView *v3;
  PLPlatterView *backgroundPlatterView;
  PLPlatterView *v5;
  void *v6;
  id v7;

  if (!self->_backgroundPlatterView)
  {
    v3 = (PLPlatterView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7D3F0]), "initWithRecipe:", 51);
    backgroundPlatterView = self->_backgroundPlatterView;
    self->_backgroundPlatterView = v3;

    -[PLPlatterView _setContinuousCornerRadius:](self->_backgroundPlatterView, "_setContinuousCornerRadius:", 28.0);
    v5 = self->_backgroundPlatterView;
    -[NCNotificationStructuredSectionList delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundGroupNameBaseForNotificationListBaseComponent:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPlatterView setMaterialGroupNameBase:](v5, "setMaterialGroupNameBase:", v6);

  }
}

- (id)_newGroupListForNotificationRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NCNotificationHighlightsSectionList;
  return -[NCNotificationStructuredSectionList _newGroupListForNotificationRequest:](&v4, sel__newGroupListForNotificationRequest_, a3);
}

- (id)_newSectionHeaderView
{
  id v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NCNotificationHighlightsSectionList;
  v2 = -[NCNotificationStructuredSectionList _newSectionHeaderView](&v5, sel__newSectionHeaderView);
  objc_msgSend(v2, "clearButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  return v2;
}

- (void)setNotificationListViewRevealed:(BOOL)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NCNotificationHighlightsSectionList;
  -[NCNotificationStructuredSectionList setNotificationListViewRevealed:](&v6, sel_setNotificationListViewRevealed_);
  if (!a3)
  {
    -[NCNotificationStructuredSectionList listView](self, "listView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recycleVisibleViews");

  }
}

- (PLPlatterView)backgroundPlatterView
{
  return self->_backgroundPlatterView;
}

- (void)setBackgroundPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundPlatterView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundPlatterView, 0);
}

@end
