@implementation _SFCertificate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFCertificate)initWithSecCertificate:(__SecCertificate *)a3
{
  _SFCertificate *v4;
  SFCertificate_Ivars *v5;
  id certificateInternal;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_SFCertificate;
  v4 = -[_SFCertificate init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(SFCertificate_Ivars);
    certificateInternal = v4->_certificateInternal;
    v4->_certificateInternal = v5;

    *((_QWORD *)v4->_certificateInternal + 5) = a3;
    CFRetain(*((CFTypeRef *)v4->_certificateInternal + 5));
  }
  return v4;
}

- (int64_t)certificateType
{
  return *((_QWORD *)self->_certificateInternal + 1);
}

- (NSString)subject
{
  return (NSString *)(id)objc_msgSend(*((id *)self->_certificateInternal + 2), "copy");
}

- (NSString)issuerName
{
  return (NSString *)(id)objc_msgSend(*((id *)self->_certificateInternal + 3), "copy");
}

- (NSData)serialNumber
{
  return (NSData *)*((id *)self->_certificateInternal + 4);
}

- (__SecCertificate)secCertificate
{
  return (__SecCertificate *)*((_QWORD *)self->_certificateInternal + 5);
}

- (void)dealloc
{
  const void *v3;
  objc_super v4;

  v3 = (const void *)*((_QWORD *)self->_certificateInternal + 5);
  if (v3)
  {
    CFRelease(v3);
    *((_QWORD *)self->_certificateInternal + 5) = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_SFCertificate;
  -[_SFCertificate dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_certificateInternal, 0);
}

@end
