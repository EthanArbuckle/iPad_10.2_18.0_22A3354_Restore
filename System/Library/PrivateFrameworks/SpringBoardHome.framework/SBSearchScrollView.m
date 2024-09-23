@implementation SBSearchScrollView

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v7;
  id v8;
  BOOL v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  if (+[SBIconView isIconTapGestureRecognizer:](SBIconView, "isIconTapGestureRecognizer:", v8))
  {
    v9 = 1;
  }
  else if (objc_msgSend((id)+[SBSearchScrollView superclass](SBSearchScrollView, "superclass"), "instancesRespondToSelector:", a2))
  {
    v11.receiver = self;
    v11.super_class = (Class)SBSearchScrollView;
    v9 = -[SBSearchScrollView gestureRecognizer:shouldRequireFailureOfGestureRecognizer:](&v11, sel_gestureRecognizer_shouldRequireFailureOfGestureRecognizer_, v7, v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  void *v4;
  char isKindOfClass;

  objc_msgSend(a4, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("NCNotificationListView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  double v7;
  id WeakRetained;
  int v9;
  objc_super v11;

  v4 = a3;
  -[SBSearchScrollView panGestureRecognizer](self, "panGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4
    || (objc_msgSend(v4, "translationInView:", self), v7 >= 0.0)
    && (WeakRetained = objc_loadWeakRetained((id *)&self->_searchDelegate),
        v9 = objc_msgSend(WeakRetained, "searchScrollViewShouldRecognize:", self),
        WeakRetained,
        v9))
  {
    v11.receiver = self;
    v11.super_class = (Class)SBSearchScrollView;
    v6 = -[SBSearchScrollView gestureRecognizerShouldBegin:](&v11, sel_gestureRecognizerShouldBegin_, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SBSearchScrollViewDelegate)searchDelegate
{
  return (SBSearchScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_searchDelegate);
}

- (void)setSearchDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_searchDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_searchDelegate);
}

@end
