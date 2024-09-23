@implementation ChromeNavigationDisplayDelegateProxy

+ (id)protocols
{
  if (qword_1014D24E8 != -1)
    dispatch_once(&qword_1014D24E8, &stru_1011B5AA0);
  return (id)qword_1014D24E0;
}

- (id)delegatesForSelector:(SEL)a3 protocol:(id)a4
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._chromeViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "topContext"));

  if ((objc_opt_respondsToSelector(v6, a3) & 1) != 0)
  {
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
