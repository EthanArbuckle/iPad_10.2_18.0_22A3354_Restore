@implementation STUAskAlertModel

- (STUAskAlertModel)initWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  STUAskAlertModel *v8;
  NSString *v9;
  NSString *title;
  NSString *v11;
  NSString *message;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STUAskAlertModel;
  v8 = -[STUAskAlertModel init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = v9;

    v11 = (NSString *)objc_msgSend(v7, "copy");
    message = v8->_message;
    v8->_message = v11;

  }
  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
