@implementation asn1ReceiptToken

- (id)_initWithType:(unint64_t)a3 typeVersion:(unint64_t)a4 contentToken:(id)a5
{
  asn1ReceiptToken *v8;
  asn1ReceiptToken *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)asn1ReceiptToken;
  v8 = -[asn1ReceiptToken init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->mType = a3;
    v8->mTypeVersion = a4;
    v8->mContentToken = (asn1Token *)a5;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)asn1ReceiptToken;
  -[asn1ReceiptToken dealloc](&v3, sel_dealloc);
}

+ (id)readFromBuffer:(const char *)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;

  v3 = +[asn1Token readTokenFromBuffer:](asn1Token, "readTokenFromBuffer:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v4 = +[asn1Token readTokenFromBuffer:](asn1Token, "readTokenFromBuffer:", objc_msgSend(v3, "content") + objc_msgSend(v3, "length"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = objc_msgSend(v4, "content");
  v6 = objc_msgSend(v4, "length");
  v7 = objc_msgSend(v3, "value");
  if (v7 > 0x18)
    return 0;
  v8 = v5 + v6;
  if (((1 << v7) & 0x1E1FF1F) == 0)
  {
    if (((1 << v7) & 0xE0) == 0)
      return 0;
    v9 = +[asn1Token readOpaqueTokenFromBuffer:](asn1Token, "readOpaqueTokenFromBuffer:", v8);
    if (!v9)
      return 0;
    return -[asn1ReceiptToken _initWithType:typeVersion:contentToken:]([asn1ReceiptToken alloc], "_initWithType:typeVersion:contentToken:", objc_msgSend(v3, "value"), objc_msgSend(v4, "value"), v9);
  }
  v9 = +[asn1Token readTokenFromBuffer:](asn1Token, "readTokenFromBuffer:", v8);
  if (objc_msgSend(v9, "identifier") == 4 && !objc_msgSend(v9, "tokenClass") && v9)
    return -[asn1ReceiptToken _initWithType:typeVersion:contentToken:]([asn1ReceiptToken alloc], "_initWithType:typeVersion:contentToken:", objc_msgSend(v3, "value"), objc_msgSend(v4, "value"), v9);
  return 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Type:%ld Version:%ld Data:%@"), self->mType, self->mTypeVersion, objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", -[asn1Token content](self->mContentToken, "content"), -[asn1Token length](self->mContentToken, "length"), 0));
}

- (NSString)stringValue
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)-[asn1Token stringValue](self->mContentToken, "stringValue");
  else
    return 0;
}

- (unint64_t)integerValue
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v3 = (void *)-[asn1Token value](self->mContentToken, "value"), !objc_msgSend(v3, "tokenClass"))
    && objc_msgSend(v3, "identifier") == 2)
  {
    return objc_msgSend(v3, "value");
  }
  else
  {
    return 0xFFFFLL;
  }
}

- (unint64_t)type
{
  return self->mType;
}

- (unint64_t)typeVersion
{
  return self->mTypeVersion;
}

- (asn1Token)contentToken
{
  return self->mContentToken;
}

@end
