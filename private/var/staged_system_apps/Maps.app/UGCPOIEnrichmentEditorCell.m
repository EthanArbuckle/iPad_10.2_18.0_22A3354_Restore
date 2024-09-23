@implementation UGCPOIEnrichmentEditorCell

- (UGCPOIEnrichmentEditorCell)initWithFrame:(CGRect)a3
{
  UGCPOIEnrichmentEditorCell *v3;
  UGCPOIEnrichmentEditorCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UGCPOIEnrichmentEditorCell;
  v3 = -[UGCPOIEnrichmentEditorCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[UGCPOIEnrichmentEditorCell _mapsui_resetLayoutMargins](v3, "_mapsui_resetLayoutMargins");
  return v4;
}

- (void)setShowTopHairline:(BOOL)a3
{
  _BOOL4 v3;
  UGCHairlineView *v5;
  UGCHairlineView *topHairlineView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[3];

  v3 = a3;
  if (-[UGCPOIEnrichmentEditorCell showTopHairline](self, "showTopHairline") != a3)
  {
    if (v3)
    {
      v5 = -[UGCHairlineView initWithFrame:]([UGCHairlineView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      topHairlineView = self->_topHairlineView;
      self->_topHairlineView = v5;

      -[UGCHairlineView setTranslatesAutoresizingMaskIntoConstraints:](self->_topHairlineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UGCPOIEnrichmentEditorCell addSubview:](self, "addSubview:", self->_topHairlineView);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UGCHairlineView topAnchor](self->_topHairlineView, "topAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentEditorCell topAnchor](self, "topAnchor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v7));
      v18[0] = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCHairlineView leadingAnchor](self->_topHairlineView, "leadingAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentEditorCell layoutMarginsGuide](self, "layoutMarginsGuide"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
      v18[1] = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UGCHairlineView trailingAnchor](self->_topHairlineView, "trailingAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentEditorCell trailingAnchor](self, "trailingAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
      v18[2] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 3));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

    }
    else
    {
      -[UGCHairlineView removeFromSuperview](self->_topHairlineView, "removeFromSuperview");
    }
  }
}

- (BOOL)showTopHairline
{
  return self->_topHairlineView != 0;
}

- (void)setShowBottomHairline:(BOOL)a3
{
  _BOOL4 v3;
  UGCHairlineView *v5;
  UGCHairlineView *bottomHairlineView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[3];

  v3 = a3;
  if (-[UGCPOIEnrichmentEditorCell showBottomHairline](self, "showBottomHairline") != a3)
  {
    if (v3)
    {
      v5 = -[UGCHairlineView initWithFrame:]([UGCHairlineView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      bottomHairlineView = self->_bottomHairlineView;
      self->_bottomHairlineView = v5;

      -[UGCHairlineView setTranslatesAutoresizingMaskIntoConstraints:](self->_bottomHairlineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UGCPOIEnrichmentEditorCell addSubview:](self, "addSubview:", self->_bottomHairlineView);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UGCHairlineView bottomAnchor](self->_bottomHairlineView, "bottomAnchor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentEditorCell bottomAnchor](self, "bottomAnchor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v7));
      v18[0] = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UGCHairlineView leadingAnchor](self->_bottomHairlineView, "leadingAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentEditorCell layoutMarginsGuide](self, "layoutMarginsGuide"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
      v18[1] = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UGCHairlineView trailingAnchor](self->_bottomHairlineView, "trailingAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPOIEnrichmentEditorCell trailingAnchor](self, "trailingAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
      v18[2] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 3));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

    }
    else
    {
      -[UGCHairlineView removeFromSuperview](self->_bottomHairlineView, "removeFromSuperview");
    }
  }
}

- (BOOL)showBottomHairline
{
  return self->_bottomHairlineView != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomHairlineView, 0);
  objc_storeStrong((id *)&self->_topHairlineView, 0);
}

@end
