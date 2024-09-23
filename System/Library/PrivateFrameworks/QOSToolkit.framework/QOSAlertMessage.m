@implementation QOSAlertMessage

- (QOSAlertMessage)initWithTitle:(id)a3 body:(id)a4
{
  id v5;
  id v6;
  QOSAlertMessage *v7;
  QOSAlertMessageInternal *v8;
  uint64_t v9;
  QOSAlertMessageInternal *underlyingObject;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)QOSAlertMessage;
  v5 = a4;
  v6 = a3;
  v7 = -[QOSAlertMessage init](&v12, sel_init);
  v8 = [QOSAlertMessageInternal alloc];
  v9 = -[QOSAlertMessageInternal initWithTitle:body:](v8, "initWithTitle:body:", v6, v5, v12.receiver, v12.super_class);

  underlyingObject = v7->_underlyingObject;
  v7->_underlyingObject = (QOSAlertMessageInternal *)v9;

  return v7;
}

- (id)title
{
  void *v2;
  void *v3;

  -[QOSAlertMessage underlyingObject](self, "underlyingObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)body
{
  void *v2;
  void *v3;

  -[QOSAlertMessage underlyingObject](self, "underlyingObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "body");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (QOSAlertMessageInternal)underlyingObject
{
  return (QOSAlertMessageInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
