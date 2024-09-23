@implementation CRLAnimatedGIFLayer

- (void)dealloc
{
  id WeakRetained;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->mController);

  if (WeakRetained)
  {
    v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124FEA8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1DC3C(v4, v5);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124FEC8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAnimatedGIFLayer dealloc]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLAnimatedGIFLayer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 23, 0, "expected nil value for '%{public}s'", "mController");

  }
  v9.receiver = self;
  v9.super_class = (Class)CRLAnimatedGIFLayer;
  -[CRLAnimatedGIFLayer dealloc](&v9, "dealloc");
}

- (void)setController:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mController);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->mController);
    objc_msgSend(v5, "removeLayer:", self);

    v6 = objc_storeWeak((id *)&self->mController, obj);
    objc_msgSend(obj, "addLayer:", self);

    -[CRLAnimatedGIFLayer setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)teardown
{
  -[CRLAnimatedGIFLayer setController:](self, "setController:", 0);
}

- (CRLAnimatedGIFController)controller
{
  return (CRLAnimatedGIFController *)objc_loadWeakRetained((id *)&self->mController);
}

- (void)display
{
  CRLAnimatedGIFController **p_mController;
  id WeakRetained;
  id v5;

  p_mController = &self->mController;
  WeakRetained = objc_loadWeakRetained((id *)&self->mController);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_mController);
    -[CRLAnimatedGIFLayer setContents:](self, "setContents:", objc_msgSend(v5, "imageForCurrentTime"));
  }
  else
  {
    -[CRLAnimatedGIFLayer setContents:](self, "setContents:", 0);
    v5 = (id)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor"));
    -[CRLAnimatedGIFLayer setBackgroundColor:](self, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));
  }

}

+ (id)defaultActionForKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("contents")))
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___CRLAnimatedGIFLayer;
    v6 = objc_msgSendSuper2(&v9, "defaultActionForKey:", v4);
    v5 = objc_claimAutoreleasedReturnValue(v6);
  }
  v7 = (void *)v5;

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mController);
}

@end
