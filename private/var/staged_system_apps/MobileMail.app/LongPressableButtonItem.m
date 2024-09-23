@implementation LongPressableButtonItem

- (void)setLongPressTarget:(id)a3 action:(SEL)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  objc_storeWeak(&self->_longPressTarget, a3);
  self->_longPressAction = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LongPressableButtonItem longPressGestureRecognizer](self, "longPressGestureRecognizer"));

  if (!v6)
  {
    v10 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "longPressGestureRecognized:");
    objc_msgSend(v10, "setEnabled:", -[LongPressableButtonItem isLongPressEnabled](self, "isLongPressEnabled"));
    -[LongPressableButtonItem setLongPressGestureRecognizer:](self, "setLongPressGestureRecognizer:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LongPressableButtonItem _gestureRecognizers](self, "_gestureRecognizers"));
    v8 = objc_msgSend(v7, "mutableCopy");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LongPressableButtonItem longPressGestureRecognizer](self, "longPressGestureRecognizer"));
    objc_msgSend(v8, "addObject:", v9);

    -[LongPressableButtonItem _setGestureRecognizers:](self, "_setGestureRecognizers:", v8);
  }
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (BOOL)isLongPressEnabled
{
  return self->_longPressEnabled;
}

- (LongPressableButtonItem)init
{
  LongPressableButtonItem *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LongPressableButtonItem;
  result = -[LongPressableButtonItem init](&v3, "init");
  if (result)
    result->_longPressEnabled = 1;
  return result;
}

- (LongPressableButtonItem)initWithCoder:(id)a3
{
  LongPressableButtonItem *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LongPressableButtonItem;
  result = -[LongPressableButtonItem initWithCoder:](&v4, "initWithCoder:", a3);
  if (result)
    result->_longPressEnabled = 1;
  return result;
}

- (void)longPressGestureRecognized:(id)a3
{
  void *v4;
  SEL longPressAction;
  id WeakRetained;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "state") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    longPressAction = self->_longPressAction;
    WeakRetained = objc_loadWeakRetained(&self->_longPressTarget);
    objc_msgSend(v4, "sendAction:to:from:forEvent:", longPressAction, WeakRetained, self, 0);

  }
}

- (void)setLongPressEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_longPressEnabled = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[LongPressableButtonItem longPressGestureRecognizer](self, "longPressGestureRecognizer"));
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_destroyWeak(&self->_longPressTarget);
}

@end
