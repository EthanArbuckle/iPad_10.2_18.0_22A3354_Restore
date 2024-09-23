@implementation JSAScreen

- (BOOL)supportsWideGamut
{
  id v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = sub_A640(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollection"));
  v5 = objc_msgSend(v4, "displayGamut") == (char *)&dword_0 + 1;

  return v5;
}

- (NSNumber)scale
{
  id v2;
  void *v3;
  void *v4;

  v2 = sub_A640(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v3, "scale");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

  return (NSNumber *)v4;
}

- (NSDictionary)size
{
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];

  v2 = sub_A640(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v12[0] = CFSTR("width");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v5));
  v12[1] = CFSTR("height");
  v13[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7));
  v13[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));

  return (NSDictionary *)v10;
}

- (JSAWindow)keyWindow
{
  _JSAWindowManagerKeyWindowHosting *v2;
  JSAWindow *v3;

  v2 = objc_alloc_init(_JSAWindowManagerKeyWindowHosting);
  v3 = -[JSAWindow initWithHosting:]([JSAWindow alloc], "initWithHosting:", v2);

  return v3;
}

@end
