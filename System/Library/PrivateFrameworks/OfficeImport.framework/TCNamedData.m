@implementation TCNamedData

+ (id)namedDataWithData:(id)a3 named:(id)a4
{
  id v5;
  id v6;
  TCNamedData *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[TCNamedData initWithData:named:]([TCNamedData alloc], "initWithData:named:", v5, v6);

  return v7;
}

- (TCNamedData)initWithData:(id)a3 named:(id)a4
{
  id v7;
  id v8;
  TCNamedData *v9;
  TCNamedData *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TCNamedData;
  v9 = -[TCNamedData init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mData, a3);
    objc_storeStrong((id *)&v10->mName, a4);
  }

  return v10;
}

- (NSData)data
{
  return self->mData;
}

- (NSString)name
{
  return self->mName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
  objc_storeStrong((id *)&self->mData, 0);
}

@end
