@implementation STUFBSActivityContinuation

- (STUFBSActivityContinuation)initWithType:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  STUFBSActivityContinuation *v8;
  NSString *v9;
  NSString *type;
  NSData *v11;
  NSData *data;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STUFBSActivityContinuation;
  v8 = -[STUFBSActivityContinuation init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    type = v8->_type;
    v8->_type = v9;

    v11 = (NSData *)objc_msgSend(v7, "copy");
    data = v8->_data;
    v8->_data = v11;

  }
  return v8;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
