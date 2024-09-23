@implementation CKKSWrappedAESSIVKey

- (CKKSWrappedAESSIVKey)init
{
  CKKSWrappedAESSIVKey *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKKSWrappedAESSIVKey;
  result = -[CKKSBaseAESSIVKey init](&v3, "init");
  if (result)
    result->super.size = 80;
  return result;
}

- (CKKSWrappedAESSIVKey)initWithBytes:(char *)a3 len:(unint64_t)a4
{
  void *v5;
  id v6;
  objc_super v7;

  if (a4 != 80)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("length (%lu) was not %d"), a4, 80));
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongKeySizeException"), v5, 0));

    objc_exception_throw(v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)CKKSWrappedAESSIVKey;
  return -[CKKSBaseAESSIVKey initWithBytes:len:](&v7, "initWithBytes:len:", a3);
}

- (CKKSWrappedAESSIVKey)initWithBase64:(id)a3
{
  id v4;
  CKKSWrappedAESSIVKey *v5;
  CKKSWrappedAESSIVKey *v6;
  void *v8;
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKKSWrappedAESSIVKey;
  v5 = -[CKKSBaseAESSIVKey initWithBase64:](&v10, "initWithBase64:", v4);
  v6 = v5;
  if (v5 && v5->super.size != 80)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("length (%lu) was not %d"), v5->super.size, 80));
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongKeySizeException"), v8, 0));

    objc_exception_throw(v9);
  }

  return v6;
}

- (CKKSWrappedAESSIVKey)initWithData:(id)a3
{
  id v4;
  id v5;
  CKKSWrappedAESSIVKey *v6;
  void *v8;
  id v9;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "length") != (id)80)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("length (%lu) was not %d"), objc_msgSend(v4, "length"), 80));
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("WrongKeySizeException"), v8, 0));

    objc_exception_throw(v9);
  }
  v5 = objc_retainAutorelease(v4);
  v10.receiver = self;
  v10.super_class = (Class)CKKSWrappedAESSIVKey;
  v6 = -[CKKSBaseAESSIVKey initWithBytes:len:](&v10, "initWithBytes:len:", objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));

  return v6;
}

- (id)wrappedData
{
  return objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", self->super.key, self->super.size);
}

- (id)base64WrappedKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSWrappedAESSIVKey wrappedData](self, "wrappedData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "base64EncodedStringWithOptions:", 0));

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBytes:length:forKey:", self->super.key, self->super.size, CFSTR("wrappedkey"));
}

- (CKKSWrappedAESSIVKey)initWithCoder:(id)a3
{
  id v4;
  CKKSWrappedAESSIVKey *v5;
  id v6;
  size_t v7;
  unint64_t v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKKSWrappedAESSIVKey;
  v5 = -[CKKSBaseAESSIVKey init](&v10, "init");
  if (v5)
  {
    v9 = 0;
    v6 = objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("wrappedkey"), &v9);
    if (v6)
    {
      if (v9 >= 0x50)
        v7 = 80;
      else
        v7 = v9;
      memcpy(v5->super.key, v6, v7);
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)zeroedKey
{
  void *v2;
  CKKSWrappedAESSIVKey *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 80));
  v3 = -[CKKSWrappedAESSIVKey initWithData:]([CKKSWrappedAESSIVKey alloc], "initWithData:", v2);

  return v3;
}

@end
