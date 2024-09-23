@implementation TSDCachedGestureTargetHolder

- (TSDCachedGestureTargetHolder)initWithTarget:(id)a3
{
  id v4;
  TSDCachedGestureTargetHolder *v5;
  TSDCachedGestureTargetHolder *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TSDCachedGestureTargetHolder;
  v5 = -[TSDCachedGestureTargetHolder init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->mWeakCachedGestureTarget, v4);

  return v6;
}

- (CRLGestureTarget)weakCachedGestureTarget
{
  return (CRLGestureTarget *)objc_loadWeakRetained((id *)&self->mWeakCachedGestureTarget);
}

- (void)setWeakCachedGestureTarget:(id)a3
{
  objc_storeWeak((id *)&self->mWeakCachedGestureTarget, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mWeakCachedGestureTarget);
}

@end
