@implementation ErrorActionOption

- (ErrorActionOption)initWithTitle:(id)a3 cancels:(BOOL)a4 handler:(id)a5
{
  id v8;
  id v9;
  ErrorActionOption *v10;
  NSString *v11;
  NSString *title;
  id v13;
  id handler;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ErrorActionOption;
  v10 = -[ErrorActionOption init](&v16, "init");
  if (v10)
  {
    v11 = (NSString *)objc_msgSend(v8, "copy");
    title = v10->_title;
    v10->_title = v11;

    v10->_cancels = a4;
    v13 = objc_msgSend(v9, "copy");
    handler = v10->_handler;
    v10->_handler = v13;

  }
  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)cancels
{
  return self->_cancels;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
