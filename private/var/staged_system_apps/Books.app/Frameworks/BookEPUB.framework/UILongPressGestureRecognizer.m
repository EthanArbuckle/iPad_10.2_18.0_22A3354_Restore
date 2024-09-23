@implementation UILongPressGestureRecognizer

+ (void)be_enableUIVariableDelayLoupeGestureOverrides
{
  if (qword_3C1AF0 != -1)
    dispatch_once(&qword_3C1AF0, &stru_378338);
}

- (double)be_gestureDelay
{
  id AssociatedObject;
  void *v3;
  double v4;
  double v5;

  AssociatedObject = objc_getAssociatedObject(self, "be_gestureDelay");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)setBe_gestureDelay:(double)a3
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_setAssociatedObject(self, "be_gestureDelay", v5, (char *)&dword_0 + 1);

  -[UILongPressGestureRecognizer setDelay:](self, "setDelay:", a3);
}

- (void)be_setDelay:(double)a3
{
  id AssociatedObject;
  double v6;
  id v7;

  AssociatedObject = objc_getAssociatedObject(self, "be_gestureDelay");
  v7 = (id)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (v7)
  {
    objc_msgSend(v7, "doubleValue");
    a3 = v6;
  }
  -[UILongPressGestureRecognizer be_setDelay:](self, "be_setDelay:", a3);

}

@end
