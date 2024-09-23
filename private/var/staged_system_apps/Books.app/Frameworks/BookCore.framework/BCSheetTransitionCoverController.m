@implementation BCSheetTransitionCoverController

- (void)setupWithArtworkSource:(id)a3 cardArtworkSource:(id)a4 isDismiss:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  BCCardStackTransitionCoverView *v13;
  BCCardStackTransitionCoverView *v14;
  BCCardStackTransitionCoverView *coverView;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v5 = a5;
  v20 = a3;
  v8 = a4;
  if (v5)
    v9 = v8;
  else
    v9 = v20;
  if (v5)
    v10 = v20;
  else
    v10 = v8;
  v11 = v9;
  v12 = v10;
  v13 = [BCCardStackTransitionCoverView alloc];
  objc_msgSend(v11, "frame");
  v14 = -[BCCardStackTransitionCoverView initWithFrame:](v13, "initWithFrame:");
  coverView = self->_coverView;
  self->_coverView = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "image"));
  v17 = v16;
  if (v16)
    v18 = v16;
  else
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "image"));
  v19 = v18;

  -[BCCardStackTransitionCoverView setImage:](self->_coverView, "setImage:", v19);
  -[BCSheetTransitionCoverController _observeImageChangeForArtworkSource:](self, "_observeImageChangeForArtworkSource:", v12);

}

- (void)setupWithArtworkSource:(id)a3
{
  BCCardStackTransitionCoverView *v4;
  BCCardStackTransitionCoverView *v5;
  BCCardStackTransitionCoverView *coverView;
  void *v7;
  id v8;

  v8 = a3;
  v4 = [BCCardStackTransitionCoverView alloc];
  objc_msgSend(v8, "frame");
  v5 = -[BCCardStackTransitionCoverView initWithFrame:](v4, "initWithFrame:");
  coverView = self->_coverView;
  self->_coverView = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "image"));
  -[BCCardStackTransitionCoverView setImage:](self->_coverView, "setImage:", v7);

  -[BCSheetTransitionCoverController _observeImageChangeForArtworkSource:](self, "_observeImageChangeForArtworkSource:", v8);
}

- (UIView)coverView
{
  return (UIView *)self->_coverView;
}

- (void)configureCoverViewWithFrame:(CGRect)a3
{
  -[BCCardStackTransitionCoverView setFrame:](self->_coverView, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[BCCardStackTransitionCoverView updateContentFrame](self->_coverView, "updateContentFrame");
}

- (void)dealloc
{
  objc_super v3;

  -[BCSheetTransitioningArtworkSource setImageChangeObserverBlock:](self->_observedArtworkSource, "setImageChangeObserverBlock:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BCSheetTransitionCoverController;
  -[BCSheetTransitionCoverController dealloc](&v3, "dealloc");
}

- (void)_observeImageChangeForArtworkSource:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  if ((objc_opt_respondsToSelector(v4, "setImageChangeObserverBlock:") & 1) != 0)
  {
    -[BCSheetTransitionCoverController setObservedArtworkSource:](self, "setObservedArtworkSource:", v4);
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_5BCB4;
    v5[3] = &unk_28DD08;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "setImageChangeObserverBlock:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

- (BCSheetTransitioningArtworkSource)observedArtworkSource
{
  return self->_observedArtworkSource;
}

- (void)setObservedArtworkSource:(id)a3
{
  objc_storeStrong((id *)&self->_observedArtworkSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedArtworkSource, 0);
  objc_storeStrong((id *)&self->_coverView, 0);
}

@end
