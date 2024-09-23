@implementation TSKWarning

+ (id)warningWithMessage:(id)a3 severity:(int)a4
{
  return (id)objc_msgSend(a1, "warningWithMessage:kind:severity:infos:", a3, 0, *(_QWORD *)&a4, 0);
}

+ (id)warningWithMessage:(id)a3
{
  return (id)objc_msgSend(a1, "warningWithMessage:kind:infos:", a3, 0, 0);
}

+ (id)warningWithMessage:(id)a3 kind:(unsigned int)a4 infos:(id)a5
{
  return (id)objc_msgSend(a1, "warningWithMessage:kind:severity:infos:", a3, *(_QWORD *)&a4, 0, a5);
}

+ (id)warningWithMessage:(id)a3 kind:(unsigned int)a4 severity:(int)a5 infos:(id)a6
{
  return -[TSKWarning initWithMessage:kind:severity:infos:]([TSKWarning alloc], "initWithMessage:kind:severity:infos:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

- (TSKWarning)initWithMessage:(id)a3 kind:(unsigned int)a4 severity:(int)a5 infos:(id)a6
{
  TSKWarning *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSKWarning;
  v10 = -[TSKWarning init](&v12, sel_init);
  if (v10)
  {
    v10->mMessage = (NSString *)objc_msgSend(a3, "copy");
    v10->mInfos = (NSArray *)objc_msgSend(a6, "copy");
    v10->mKind = a4;
    v10->mSeverity = a5;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKWarning;
  -[TSKWarning dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return -[NSString hash](self->mMessage, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v4;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (v4)
    LOBYTE(v4) = -[NSString isEqualToString:](self->mMessage, "isEqualToString:", objc_msgSend(v4, "message"));
  return (char)v4;
}

- (NSString)message
{
  return self->mMessage;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)infos
{
  return self->mInfos;
}

- (void)setInfos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)kind
{
  return self->mKind;
}

- (int)severity
{
  return self->mSeverity;
}

@end
