@implementation UGCAddPhotosCell

- (UGCAddPhotosCell)initWithDelegate:(id)a3
{
  id v4;
  UGCAddPhotosCell *v5;
  UGCAddPhotosCell *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UGCAddPhotosCell;
  v5 = -[UGCPOIEnrichmentEditorCell initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    -[UGCAddPhotosCell setupSubviews](v6, "setupSubviews");
  }

  return v6;
}

- (void)setupSubviews
{
  MUPlatterView *v3;
  MUPlatterView *platterView;
  _UGCAddPhotoViewModel *v5;
  void *v6;
  MUButtonCellRowView *v7;
  MUButtonCellRowView *buttonView;
  id v9;
  id v10;
  MUPlatterView *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;
  _QWORD v22[2];

  v3 = (MUPlatterView *)objc_msgSend(objc_alloc((Class)MUPlatterView), "initWithContentView:", 0);
  platterView = self->_platterView;
  self->_platterView = v3;

  -[MUPlatterView setClipsToBounds:](self->_platterView, "setClipsToBounds:", 1);
  -[UGCAddPhotosCell addSubview:](self, "addSubview:", self->_platterView);
  v5 = objc_alloc_init(_UGCAddPhotoViewModel);
  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10096BBA0;
  v19[3] = &unk_1011AD260;
  objc_copyWeak(&v20, &location);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10096BBD4;
  v17[3] = &unk_1011AD260;
  objc_copyWeak(&v18, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MUPhotoOptionsMenuButton menuForPhotoOptionsMenuButtonWithCameraCompletion:libraryCompletion:](MUPhotoOptionsMenuButton, "menuForPhotoOptionsMenuButtonWithCameraCompletion:libraryCompletion:", v19, v17));
  -[_UGCAddPhotoViewModel setMenu:](v5, "setMenu:", v6);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10096BC08;
  v15[3] = &unk_1011BAB10;
  objc_copyWeak(&v16, &location);
  -[_UGCAddPhotoViewModel setActionBlock:](v5, "setActionBlock:", v15);
  v7 = (MUButtonCellRowView *)objc_msgSend(objc_alloc((Class)MUButtonCellRowView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  buttonView = self->_buttonView;
  self->_buttonView = v7;

  -[MUButtonCellRowView setBottomHairlineHidden:](self->_buttonView, "setBottomHairlineHidden:", 1);
  -[MUButtonCellRowView setViewModel:](self->_buttonView, "setViewModel:", v5);
  -[MUPlatterView addSubview:](self->_platterView, "addSubview:", self->_buttonView);
  v9 = objc_msgSend(objc_alloc((Class)MUEdgeLayout), "initWithItem:container:", self->_buttonView, self->_platterView);
  v10 = objc_alloc((Class)MUEdgeLayout);
  v11 = self->_platterView;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UGCAddPhotosCell layoutMarginsGuide](self, "layoutMarginsGuide"));
  v13 = objc_msgSend(v10, "initWithItem:container:", v11, v12);

  v22[0] = v9;
  v22[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
  +[NSLayoutConstraint _mapsui_activateLayouts:](NSLayoutConstraint, "_mapsui_activateLayouts:", v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)_addPhotosUsingSourceType:(int64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "addPhotosCellRequestsAddingNewPhoto:usingSourceType:", self, a3);

}

- (UGCARPAddPhotosCellRequestDelegate)delegate
{
  return (UGCARPAddPhotosCellRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_buttonView, 0);
}

@end
