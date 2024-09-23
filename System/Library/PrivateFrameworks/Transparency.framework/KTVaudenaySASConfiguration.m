@implementation KTVaudenaySASConfiguration

- (KTVaudenaySASConfiguration)initWithName:(id)a3 digestPrefix:(id)a4 shortCodeLength:(int)a5 digest:(const ccdigest_info *)a6
{
  uint64_t v7;
  id v10;
  id v11;
  KTVaudenaySASConfiguration *v12;
  KTVaudenaySASConfiguration *v13;
  objc_super v15;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  if ((v7 & 0x80000000) != 0
    || (v15.receiver = self,
        v15.super_class = (Class)KTVaudenaySASConfiguration,
        v12 = -[KTVaudenaySASConfiguration init](&v15, sel_init),
        (self = v12) == 0))
  {
    v13 = 0;
  }
  else
  {
    -[KTVaudenaySASConfiguration setName:](v12, "setName:", v10);
    -[KTVaudenaySASConfiguration setDi:](self, "setDi:", a6);
    -[KTVaudenaySASConfiguration setDigestPrefix:](self, "setDigestPrefix:", v11);
    -[KTVaudenaySASConfiguration setShortCodeLength:](self, "setShortCodeLength:", v7);
    -[KTVaudenaySASConfiguration setShortCodeMod10:](self, "setShortCodeMod10:", 1);
    for (; (_DWORD)v7; LODWORD(v7) = v7 - 1)
      -[KTVaudenaySASConfiguration setShortCodeMod10:](self, "setShortCodeMod10:", 10 * -[KTVaudenaySASConfiguration shortCodeMod10](self, "shortCodeMod10"));
    self = self;
    v13 = self;
  }

  return v13;
}

+ (id)sha256Transparency
{
  void *v2;
  KTVaudenaySASConfiguration *v3;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", "sha256Transparency", 18);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[KTVaudenaySASConfiguration initWithName:digestPrefix:shortCodeLength:digest:]([KTVaudenaySASConfiguration alloc], "initWithName:digestPrefix:shortCodeLength:digest:", CFSTR("sha256Transparency"), v2, 8, ccsha256_di());
  else
    v3 = 0;

  return v3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (const)di
{
  return self->_di;
}

- (void)setDi:(const ccdigest_info *)a3
{
  self->_di = a3;
}

- (NSData)digestPrefix
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDigestPrefix:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int)shortCodeLength
{
  return self->_shortCodeLength;
}

- (void)setShortCodeLength:(int)a3
{
  self->_shortCodeLength = a3;
}

- (unint64_t)shortCodeMod10
{
  return self->_shortCodeMod10;
}

- (void)setShortCodeMod10:(unint64_t)a3
{
  self->_shortCodeMod10 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestPrefix, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
