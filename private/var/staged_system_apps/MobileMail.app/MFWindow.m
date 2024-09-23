@implementation MFWindow

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (void)becomeKeyWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFWindow;
  -[MFWindow becomeKeyWindow](&v4, "becomeKeyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_compositionStateChanged:", MFMailComposeViewDidShow, 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_compositionStateChanged:", MFMailComposeViewDidDismiss, 0);

}

- (void)sendEvent:(id)a3
{
  id v4;
  void (**touchEventListener)(id, void *);
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFWindow;
  -[MFWindow sendEvent:](&v7, "sendEvent:", v4);
  touchEventListener = (void (**)(id, void *))self->_touchEventListener;
  if (touchEventListener)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allTouches"));
    touchEventListener[2](touchEventListener, v6);

  }
}

- (id)undoManager
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFWindow delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "undoManagerForWindow:", self));
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MFWindow;
    v7 = -[MFWindow undoManager](&v10, "undoManager");
    v6 = (id)objc_claimAutoreleasedReturnValue(v7);
  }
  v8 = v6;

  return v8;
}

- (void)resignKeyWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFWindow;
  -[MFWindow resignKeyWindow](&v4, "resignKeyWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, MFMailComposeViewDidShow, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, MFMailComposeViewDidDismiss, 0);

}

- (void)_compositionStateChanged:(id)a3
{
  void *v4;
  MFWindow *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v5 = (MFWindow *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", MFMailComposeViewWindowKey));

  if (v5 == self)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    self->_composeActive = objc_msgSend(v6, "isEqualToString:", MFMailComposeViewDidShow);

  }
}

- (id)touchEventListener
{
  return self->_touchEventListener;
}

- (void)setTouchEventListener:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MFWindowDelegate)delegate
{
  return (MFWindowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_touchEventListener, 0);
}

@end
