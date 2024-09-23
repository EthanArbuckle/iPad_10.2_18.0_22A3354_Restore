@implementation MailStatusProgressBarView

- (void)removeFromSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MailStatusProgressBarView;
  -[MailStatusProgressBarView removeFromSuperview](&v4, "removeFromSuperview");
  self->_filler = 0.0;
  self->_countUsedUp = 0;
  self->_lastUsedTotal = 0;
  self->_lastUsedCount = 0;
  self->_lastProgress = 0.0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusProgressBarView progressObserverCancelable](self, "progressObserverCancelable"));
  objc_msgSend(v3, "cancel");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusProgressBarView progressObserverCancelable](self, "progressObserverCancelable"));
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)MailStatusProgressBarView;
  -[MailStatusProgressBarView dealloc](&v4, "dealloc");
}

- (void)updateWithStatusInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  MailStatusProgressBarView *v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailStatusProgressBarView progressObserverCancelable](self, "progressObserverCancelable"));
  objc_msgSend(v5, "cancel");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "progress"));
  if (v6)
  {
    v7 = NSStringFromSelector("fractionCompleted");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_1000FB170;
    v15 = &unk_10051D8D0;
    v16 = self;
    v17 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ef_observeKeyPath:options:usingBlock:", v8, 5, &v12));
    -[MailStatusProgressBarView setProgressObserverCancelable:](self, "setProgressObserverCancelable:", v9, v12, v13, v14, v15, v16);

  }
  else
  {
    -[MailStatusProgressBarView setProgressObserverCancelable:](self, "setProgressObserverCancelable:", 0);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "status"));
  if (v10)
    v11 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v10);
  else
    v11 = 0;
  -[MailStatusLabelView setPrimaryLabelText:](self, "setPrimaryLabelText:", v11);
  -[MailStatusLabelView setSecondaryLabelText:](self, "setSecondaryLabelText:", 0);

}

- (MFProgressToolbar)toolbarView
{
  return self->_toolbarView;
}

- (void)setToolbarView:(id)a3
{
  objc_storeStrong((id *)&self->_toolbarView, a3);
}

- (EFCancelable)progressObserverCancelable
{
  return self->_progressObserverCancelable;
}

- (void)setProgressObserverCancelable:(id)a3
{
  objc_storeStrong((id *)&self->_progressObserverCancelable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressObserverCancelable, 0);
  objc_storeStrong((id *)&self->_toolbarView, 0);
}

@end
