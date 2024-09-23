@implementation TUIStringTextFragment

- (TUIStringTextFragment)initWithString:(id)a3
{
  id v4;
  TUIStringTextFragment *v5;
  NSString *v6;
  NSString *string;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIStringTextFragment;
  v5 = -[TUIStringTextFragment init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    string = v5->_string;
    v5->_string = v6;

  }
  return v5;
}

- (void)appendToBuilder:(id)a3 context:(id)a4
{
  objc_msgSend(a3, "appendString:", self->_string, a4);
}

- (NSString)string
{
  return self->_string;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
