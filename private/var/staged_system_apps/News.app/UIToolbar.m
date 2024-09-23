@implementation UIToolbar

- (id)barButtonViews
{
  NSMutableArray *v3;
  void *v4;
  NSMutableArray *v5;
  _QWORD v7[4];
  NSMutableArray *v8;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIToolbar items](self, "items"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005B938;
  v7[3] = &unk_1000DD4C8;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

@end
