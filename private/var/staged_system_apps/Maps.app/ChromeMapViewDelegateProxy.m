@implementation ChromeMapViewDelegateProxy

+ (id)protocols
{
  if (qword_1014D3B78 != -1)
    dispatch_once(&qword_1014D3B78, &stru_1011DD668);
  return (id)qword_1014D3B70;
}

- (id)delegatesForSelector:(SEL)a3 protocol:(id)a4
{
  id v6;
  ChromeViewController **p_chromeViewController;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  p_chromeViewController = &self->super._chromeViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->super._chromeViewController);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "navigationDisplay"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapViewDelegate"));

  if (v10)
    objc_msgSend(v6, "addObject:", v10);
  v11 = objc_loadWeakRetained((id *)p_chromeViewController);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapViewDelegateForSelector:", a3));

  if (v12)
    objc_msgSend(v6, "addObject:", v12);
  v13 = objc_msgSend(v6, "copy");

  return v13;
}

- (BOOL)preferChromeForSelector:(SEL)a3 protocol:(id)a4
{
  return "mapView:viewForAnnotation:" == a3 || "mapViewDidStartUserInteraction:" == a3;
}

@end
