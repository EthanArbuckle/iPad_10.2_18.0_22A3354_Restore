@implementation TransparencyGPBFileDescriptor

- (TransparencyGPBFileDescriptor)initWithPackage:(id)a3 objcPrefix:(id)a4 syntax:(unsigned __int8)a5
{
  TransparencyGPBFileDescriptor *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TransparencyGPBFileDescriptor;
  v8 = -[TransparencyGPBFileDescriptor init](&v10, "init");
  if (v8)
  {
    v8->package_ = (NSString *)objc_msgSend(a3, "copy");
    v8->objcPrefix_ = (NSString *)objc_msgSend(a4, "copy");
    v8->syntax_ = a5;
  }
  return v8;
}

- (TransparencyGPBFileDescriptor)initWithPackage:(id)a3 syntax:(unsigned __int8)a4
{
  TransparencyGPBFileDescriptor *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TransparencyGPBFileDescriptor;
  v6 = -[TransparencyGPBFileDescriptor init](&v8, "init");
  if (v6)
  {
    v6->package_ = (NSString *)objc_msgSend(a3, "copy");
    v6->syntax_ = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBFileDescriptor;
  -[TransparencyGPBFileDescriptor dealloc](&v3, "dealloc");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  unsigned int v6;
  NSString *objcPrefix;
  NSString *v8;

  if (a3 == self)
    goto LABEL_9;
  v5 = objc_opt_class(TransparencyGPBFileDescriptor, a2);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) == 0 || self->syntax_ != *((unsigned __int8 *)a3 + 24))
    goto LABEL_8;
  v6 = -[NSString isEqual:](self->package_, "isEqual:", *((_QWORD *)a3 + 1));
  if (v6)
  {
    objcPrefix = self->objcPrefix_;
    v8 = (NSString *)*((_QWORD *)a3 + 2);
    if (objcPrefix != v8)
    {
      if (v8)
      {
        LOBYTE(v6) = -[NSString isEqual:](objcPrefix, "isEqual:");
        return v6;
      }
LABEL_8:
      LOBYTE(v6) = 0;
      return v6;
    }
LABEL_9:
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->package_, "hash");
}

- (NSString)package
{
  return self->package_;
}

- (NSString)objcPrefix
{
  return self->objcPrefix_;
}

- (unsigned)syntax
{
  return self->syntax_;
}

@end
