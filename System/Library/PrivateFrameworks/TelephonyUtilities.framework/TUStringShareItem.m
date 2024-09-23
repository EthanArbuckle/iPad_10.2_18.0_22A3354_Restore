@implementation TUStringShareItem

- (TUStringShareItem)initWithMessage:(id)a3
{
  id v4;
  TUStringShareItem *v5;
  TUStringShareItem *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUStringShareItem;
  v5 = -[TUStringShareItem init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[TUStringShareItem setMessage:](v5, "setMessage:", v4);

  return v6;
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
