@implementation TPSPageControl

- (TPSPageControl)init
{
  TPSPageControl *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSPageControl;
  v2 = -[TPSPageControl init](&v5, "init");
  if (v2
    && +[TPSDefaultsManager showPagingLabelOnLongPress](TPSDefaultsManager, "showPagingLabelOnLongPress"))
  {
    v3 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", v2, "handleLongPressForAccessibilityHUDView:");
    objc_msgSend(v3, "setDelegate:", v2);
    -[TPSPageControl addGestureRecognizer:](v2, "addGestureRecognizer:", v3);

  }
  return v2;
}

- (void)handleLongPressForAccessibilityHUDView:(id)a3
{
  char *v4;
  char *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (char *)objc_msgSend(a3, "state");
  if ((unint64_t)(v4 - 3) < 2)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[TPSPageControl hudDelegate](self, "hudDelegate"));
    objc_msgSend(v10, "pageControlCancelLongPressedForHUD:", self);
LABEL_10:

    return;
  }
  if (v4 == (char *)1)
  {
    if (-[TPSPageControl currentPage](self, "currentPage") == (id)0x7FFFFFFFFFFFFFFFLL
      || (uint64_t)-[TPSPageControl numberOfPages](self, "numberOfPages") < 1)
    {
      v6 = 0;
      v5 = 0;
    }
    else
    {
      v5 = (char *)-[TPSPageControl currentPage](self, "currentPage") + 1;
      v6 = -[TPSPageControl numberOfPages](self, "numberOfPages");
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TIP_NUMBER_X_OF_Y"), &stru_1000A5680, 0));
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v5, v6));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSPageControl hudDelegate](self, "hudDelegate"));
    objc_msgSend(v9, "pageControlLongPressedForHUD:withText:", self, v10);

    goto LABEL_10;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (TPSPageControlHudDelegate)hudDelegate
{
  return (TPSPageControlHudDelegate *)objc_loadWeakRetained((id *)&self->_hudDelegate);
}

- (void)setHudDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_hudDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hudDelegate);
}

@end
