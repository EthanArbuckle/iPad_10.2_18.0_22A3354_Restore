@implementation KCSharingLocalFingerprint

- (KCSharingLocalFingerprint)initWithDatabaseItem:(SecDbItem *)a3 error:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFDictionary *Mutable;
  SecDbClass *var1;
  SecDbAttr *v12;
  SecDbAttr **v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFData *v18;
  SecDbAttr *v19;
  __CFData *v20;
  __CFData *v21;
  uint64_t v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __CFString *v29;
  KCSharingLocalFingerprint *v30;
  __CFString *v31;
  uint64_t v33;
  __CFString *v34;

  v34 = 0;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  var1 = a3->var1;
  v12 = var1->var2[0];
  if (v12)
  {
    v13 = &var1->var2[1];
    do
    {
      if ((~LODWORD(v12->var2) & 3) == 0)
      {
        v18 = sub_100010724((CFMutableDictionaryRef *)a3, v12, &v34);
        if (!v18)
          goto LABEL_19;
        CFDictionarySetValue(Mutable, v12->var0, v18);
        CFRelease(v18);
      }
      v19 = *v13++;
      v12 = v19;
    }
    while (v19);
  }
  v20 = sub_10001A474((const __CFString *)Mutable, (CFTypeRef *)&v34, v7, v8, v9);
  v18 = v20;
  if (v20)
  {
    v21 = sub_100032878(v20);
    if (!Mutable)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_19:
  v21 = 0;
  if (Mutable)
LABEL_9:
    CFRelease(Mutable);
LABEL_10:
  if (v18)
    CFRelease(v18);
  if (!v21)
  {
    v29 = v34;
    sub_10004D598(a4, 23, v34, CFSTR("Copying keyprint"), v14, v15, v16, v17, v33);
LABEL_17:
    v30 = 0;
    goto LABEL_18;
  }
  v22 = sub_10001E6A8(&a3->var1->var0, 7, &v34);
  v23 = sub_100019204(a3, v22, &v34);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (!v24)
  {
    v31 = v34;
    sub_10004D598(a4, 24, v34, CFSTR("Copying valueprint"), v25, v26, v27, v28, v33);

    v29 = 0;
    goto LABEL_17;
  }
  v29 = (__CFString *)v24;
  self = -[KCSharingLocalFingerprint initWithKeyprint:valueprint:](self, "initWithKeyprint:valueprint:", v21, v24);
  v30 = self;
LABEL_18:

  return v30;
}

- (KCSharingLocalFingerprint)initWithKeyprint:(id)a3 valueprint:(id)a4
{
  id v7;
  id v8;
  KCSharingLocalFingerprint *v9;
  KCSharingLocalFingerprint *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KCSharingLocalFingerprint;
  v9 = -[KCSharingLocalFingerprint init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyprint, a3);
    objc_storeStrong((id *)&v10->_valueprint, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  id v3;

  v3 = -[NSData hash](self->_keyprint, "hash");
  return (_BYTE *)-[NSData hash](self->_valueprint, "hash") - (_BYTE *)v3 + 32 * (_QWORD)v3;
}

- (BOOL)isEqual:(id)a3
{
  KCSharingLocalFingerprint *v4;
  KCSharingLocalFingerprint *v5;
  NSData *keyprint;
  void *v7;
  NSData *valueprint;
  void *v9;
  unsigned __int8 v10;

  v4 = (KCSharingLocalFingerprint *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if (-[KCSharingLocalFingerprint isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class(self)))
  {
    v5 = v4;
    keyprint = self->_keyprint;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingLocalFingerprint keyprint](v5, "keyprint"));
    if (-[NSData isEqualToData:](keyprint, "isEqualToData:", v7))
    {
      valueprint = self->_valueprint;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingLocalFingerprint valueprint](v5, "valueprint"));
      v10 = -[NSData isEqualToData:](valueprint, "isEqualToData:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingLocalFingerprint keyprint](self, "keyprint"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "base64EncodedDataWithOptions:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingLocalFingerprint valueprint](self, "valueprint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "base64EncodedDataWithOptions:", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("KCSharingLocalFingerprint(keyprint:%@ valueprint:%@)"), v4, v6));

  return v7;
}

- (NSData)keyprint
{
  return self->_keyprint;
}

- (NSData)valueprint
{
  return self->_valueprint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueprint, 0);
  objc_storeStrong((id *)&self->_keyprint, 0);
}

@end
