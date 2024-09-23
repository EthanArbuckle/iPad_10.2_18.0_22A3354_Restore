@implementation TRIPBFileDescriptor

- (unsigned)syntax
{
  return self->syntax_;
}

- (TRIPBFileDescriptor)initWithPackage:(id)a3 syntax:(unsigned __int8)a4
{
  TRIPBFileDescriptor *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TRIPBFileDescriptor;
  v6 = -[TRIPBFileDescriptor init](&v8, sel_init);
  if (v6)
  {
    v6->package_ = (NSString *)objc_msgSend(a3, "copy");
    v6->syntax_ = a4;
  }
  return v6;
}

- (TRIPBFileDescriptor)initWithPackage:(id)a3 objcPrefix:(id)a4 syntax:(unsigned __int8)a5
{
  TRIPBFileDescriptor *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TRIPBFileDescriptor;
  v8 = -[TRIPBFileDescriptor init](&v10, sel_init);
  if (v8)
  {
    v8->package_ = (NSString *)objc_msgSend(a3, "copy");
    v8->objcPrefix_ = (NSString *)objc_msgSend(a4, "copy");
    v8->syntax_ = a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRIPBFileDescriptor;
  -[TRIPBFileDescriptor dealloc](&v3, sel_dealloc);
}

- (NSString)package
{
  return self->package_;
}

- (NSString)objcPrefix
{
  return self->objcPrefix_;
}

@end
