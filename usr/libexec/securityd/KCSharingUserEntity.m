@implementation KCSharingUserEntity

- (KCSharingUserEntity)initWithCBORData:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  KCSharingUserEntity *v11;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CBOR decodeFromData:](CBOR, "decodeFromData:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBOR cborWithUTF8String:](CBOR, "cborWithUTF8String:", CFSTR("id")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));

  if (v10)
  {
    self = -[KCSharingUserEntity initWithUserHandle:](self, "initWithUserHandle:", v10);
    v11 = self;
  }
  else
  {
    sub_10004D4E8(a4, 19, 0);
    v11 = 0;
  }

  return v11;
}

- (KCSharingUserEntity)initWithUserHandle:(id)a3
{
  id v4;
  KCSharingUserEntity *v5;
  NSData *v6;
  NSData *userHandle;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingUserEntity;
  v5 = -[KCSharingUserEntity init](&v9, "init");
  if (v5)
  {
    v6 = (NSData *)objc_msgSend(v4, "copy");
    userHandle = v5->_userHandle;
    v5->_userHandle = v6;

  }
  return v5;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingUserEntity userHandle](self, "userHandle"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  KCSharingUserEntity *v4;
  KCSharingUserEntity *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = (KCSharingUserEntity *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (-[KCSharingUserEntity isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class(self)))
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingUserEntity userHandle](self, "userHandle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingUserEntity userHandle](v5, "userHandle"));

    v8 = objc_msgSend(v6, "isEqualToData:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSData)CBORData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CBOR cborWithUTF8String:](CBOR, "cborWithUTF8String:", CFSTR("id")));
  v10 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingUserEntity userHandle](self, "userHandle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CBOR cborWithData:](CBOR, "cborWithData:", v4));
  v11 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CBOR cborWithDictionary:](CBOR, "cborWithDictionary:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithCBOR:](NSData, "dataWithCBOR:", v7));
  return (NSData *)v8;
}

- (NSData)userHandle
{
  return self->_userHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userHandle, 0);
}

@end
