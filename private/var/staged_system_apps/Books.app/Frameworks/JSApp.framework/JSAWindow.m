@implementation JSAWindow

- (JSAWindow)initWithHosting:(id)a3
{
  id v5;
  JSAWindow *v6;
  JSAWindow *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)JSAWindow;
  v6 = -[JSAWindow init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_hosting, a3);

  return v7;
}

- (NSDictionary)size
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[JSAWindow hosting](self, "hosting"));
  objc_msgSend(v2, "windowHostingWindowSize");
  v4 = v3;
  v6 = v5;

  v11[0] = CFSTR("width");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v4));
  v11[1] = CFSTR("height");
  v12[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6));
  v12[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));

  return (NSDictionary *)v9;
}

- (_JSAWindowHosting)hosting
{
  return self->_hosting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hosting, 0);
}

@end
