@implementation CKKSBaseAESSIVKey

- (CKKSBaseAESSIVKey)init
{
  CKKSBaseAESSIVKey *v2;
  CKKSBaseAESSIVKey *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKKSBaseAESSIVKey;
  v2 = -[CKKSBaseAESSIVKey init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    v2->size = 80;
    -[CKKSBaseAESSIVKey zeroKey](v2, "zeroKey");
  }
  return v3;
}

- (CKKSBaseAESSIVKey)initWithBytes:(char *)a3 len:(unint64_t)a4
{
  CKKSBaseAESSIVKey *v6;
  CKKSBaseAESSIVKey *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKKSBaseAESSIVKey;
  v6 = -[CKKSBaseAESSIVKey init](&v9, "init");
  v7 = v6;
  if (a4 <= 0x50 && v6)
  {
    v6->size = a4;
    memcpy(v6->key, a3, a4);
  }
  return v7;
}

- (CKKSBaseAESSIVKey)initWithBase64:(id)a3
{
  id v4;
  CKKSBaseAESSIVKey *v5;
  CKKSBaseAESSIVKey *v6;
  CKKSBaseAESSIVKey *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKKSBaseAESSIVKey;
  v5 = -[CKKSBaseAESSIVKey init](&v9, "init");
  if (!v5)
  {
LABEL_6:
    v7 = v5;
    goto LABEL_7;
  }
  v6 = (CKKSBaseAESSIVKey *)objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v4, 0);
  v7 = v6;
  if (v6)
  {
    if ((unint64_t)-[CKKSBaseAESSIVKey length](v6, "length") <= 0x50)
    {
      v5->size = (unint64_t)-[CKKSBaseAESSIVKey length](v7, "length");
      memcpy(v5->key, -[CKKSBaseAESSIVKey bytes](objc_retainAutorelease(v7), "bytes"), v5->size);
    }

    goto LABEL_6;
  }
LABEL_7:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  size_t size;
  BOOL v7;

  v4 = a3;
  v5 = objc_opt_class(CKKSBaseAESSIVKey);
  v7 = 0;
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    size = self->size;
    if (size == v4[11] && !memcmp(self->key, v4 + 1, size))
      v7 = 1;
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CKKSBaseAESSIVKey zeroKey](self, "zeroKey");
  v3.receiver = self;
  v3.super_class = (Class)CKKSBaseAESSIVKey;
  -[CKKSBaseAESSIVKey dealloc](&v3, "dealloc");
}

- (void)zeroKey
{
  memset_s(self->key, self->size, 0, 0x50uLL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "initWithBytes:len:", self->key, self->size);
}

@end
