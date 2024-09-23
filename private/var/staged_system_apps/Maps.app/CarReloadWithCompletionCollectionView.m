@implementation CarReloadWithCompletionCollectionView

- (void)reloadDataWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = sub_10043379C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CarReloadWithCompletionCollectionView reloadDataWithCompletion", v7, 2u);
  }

  -[CarReloadWithCompletionCollectionView setReloadDataCompletion:](self, "setReloadDataCompletion:", v4);
  -[CarReloadWithCompletionCollectionView reloadData](self, "reloadData");
}

- (void)layoutSubviews
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  void (**v7)(void);
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CarReloadWithCompletionCollectionView;
  -[CarReloadWithCompletionCollectionView layoutSubviews](&v9, "layoutSubviews");
  v3 = sub_10043379C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CarReloadWithCompletionCollectionView layoutSubviews", v8, 2u);
  }

  if (-[CarReloadWithCompletionCollectionView _shouldRunCompletion](self, "_shouldRunCompletion"))
  {
    v5 = sub_10043379C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CarReloadWithCompletionCollectionView layoutSubviews reloadDataCompletionBlock", v8, 2u);
    }

    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[CarReloadWithCompletionCollectionView reloadDataCompletion](self, "reloadDataCompletion"));
    v7[2]();

    -[CarReloadWithCompletionCollectionView setReloadDataCompletion:](self, "setReloadDataCompletion:", 0);
  }
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CarReloadWithCompletionCollectionView;
  -[CarReloadWithCompletionCollectionView didMoveToWindow](&v3, "didMoveToWindow");
  if (-[CarReloadWithCompletionCollectionView _shouldRunCompletion](self, "_shouldRunCompletion"))
  {
    -[CarReloadWithCompletionCollectionView setNeedsLayout](self, "setNeedsLayout");
    -[CarReloadWithCompletionCollectionView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (BOOL)_shouldRunCompletion
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarReloadWithCompletionCollectionView window](self, "window"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarReloadWithCompletionCollectionView reloadDataCompletion](self, "reloadDataCompletion"));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)reloadDataCompletion
{
  return self->_reloadDataCompletion;
}

- (void)setReloadDataCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reloadDataCompletion, 0);
}

@end
