@implementation TSKHideOnTouchOutsideViewGestureRecognizerTarget

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  const char *v9;

  objc_opt_class();
  v5 = TSUDynamicCast();
  if (!a3)
    return 0;
  v6 = (void *)v5;
  v7 = -[TSKHideOnTouchOutsideViewGestureRecognizerTarget target](self, "target");
  if (v7 != (id)objc_msgSend(v6, "target"))
    return 0;
  v9 = -[TSKHideOnTouchOutsideViewGestureRecognizerTarget action](self, "action");
  return v9 == (const char *)objc_msgSend(v6, "action");
}

- (unint64_t)hash
{
  return objc_msgSend(-[TSKHideOnTouchOutsideViewGestureRecognizerTarget target](self, "target"), "hash");
}

- (id)target
{
  return self->mTarget;
}

- (void)setTarget:(id)a3
{
  self->mTarget = a3;
}

- (SEL)action
{
  return self->mAction;
}

- (void)setAction:(SEL)a3
{
  self->mAction = a3;
}

@end
