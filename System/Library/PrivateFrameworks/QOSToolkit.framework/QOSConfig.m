@implementation QOSConfig

- (QOSConfig)initWithAppTarget:(int64_t)a3 locale:(id)a4
{
  id v5;
  QOSConfig *v6;
  QOSConfigInternal *v7;
  uint64_t v8;
  QOSConfigInternal *underlyingObject;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)QOSConfig;
  v5 = a4;
  v6 = -[QOSConfig init](&v11, sel_init);
  v7 = [QOSConfigInternal alloc];
  v8 = -[QOSConfigInternal initWithAppTarget:locale:](v7, "initWithAppTarget:locale:", a3, v5, v11.receiver, v11.super_class);

  underlyingObject = v6->_underlyingObject;
  v6->_underlyingObject = (QOSConfigInternal *)v8;

  return v6;
}

- (id)locale
{
  void *v2;
  void *v3;

  -[QOSConfig underlyingObject](self, "underlyingObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)appTarget
{
  void *v2;
  int64_t v3;

  -[QOSConfig underlyingObject](self, "underlyingObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "appTarget");

  return v3;
}

- (QOSConfigInternal)underlyingObject
{
  return (QOSConfigInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
