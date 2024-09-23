@implementation asn1OSToken

- (id)_initWithID:(unint64_t)a3 class:(unsigned __int8)a4 length:(unint64_t)a5 content:(const char *)a6 opaque:(BOOL)a7
{
  _BOOL4 v7;
  int v10;
  asn1OSToken *v12;
  asn1OSToken *v13;
  asn1OSToken *v14;
  objc_super v16;

  v7 = a7;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)asn1OSToken;
  v12 = -[asn1OSToken init](&v16, sel_init);
  v13 = v12;
  if (a3 != 4 || v10)
  {
    v14 = v12;
    return 0;
  }
  else if (v12)
  {
    v12->super.mClass = 0;
    v12->super.mIdentifier = 4;
    v12->super.mLength = a5;
    v12->super.mContent = a6;
    if (v7)
      v12->mValue = 0;
    else
      v12->mValue = (asn1Token *)+[asn1Token readTokenFromBuffer:](asn1Token, "readTokenFromBuffer:", a6);
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)asn1OSToken;
  -[asn1OSToken dealloc](&v3, sel_dealloc);
}

- (id)stringValue
{
  uint64_t v3;

  v3 = 4 * (-[asn1Token identifier](self->mValue, "identifier") == 12);
  if (-[asn1Token identifier](self->mValue, "identifier") == 22)
    v3 = 1;
  if (v3)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", -[asn1Token content](self->mValue, "content"), -[asn1Token length](self->mValue, "length"), v3);
  else
    return 0;
}

- (asn1Token)value
{
  return self->mValue;
}

@end
