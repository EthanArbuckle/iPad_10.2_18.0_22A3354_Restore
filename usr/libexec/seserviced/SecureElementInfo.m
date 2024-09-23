@implementation SecureElementInfo

+ (id)withSEID:(id)a3 casdCertificate:(id)a4 casdCertificateRSA:(id)a5 isProd:(BOOL)a6 isSkyOrLater:(BOOL)a7 secureElementType:(unint64_t)a8 csn:(unint64_t)a9 chipID:(unint64_t)a10
{
  NSData *v15;
  NSData *v16;
  NSData *v17;
  SecureElementInfo *v18;
  NSData *seid;
  NSData *v20;
  NSData *casdCertificate;
  NSData *v22;
  NSData *casdCertificateRSA;

  v15 = (NSData *)a3;
  v16 = (NSData *)a4;
  v17 = (NSData *)a5;
  v18 = objc_opt_new(SecureElementInfo);
  seid = v18->_seid;
  v18->_seid = v15;
  v20 = v15;

  casdCertificate = v18->_casdCertificate;
  v18->_casdCertificate = v16;
  v22 = v16;

  casdCertificateRSA = v18->_casdCertificateRSA;
  v18->_casdCertificateRSA = v17;

  v18->_isProd = a6;
  v18->_isSkyOrLater = a7;
  v18->_type = a8;
  v18->_csn = a9;
  v18->_chipId = a10;
  return v18;
}

- (NSData)seid
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)casdCertificate
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)casdCertificateRSA
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isProd
{
  return self->_isProd;
}

- (BOOL)isSkyOrLater
{
  return self->_isSkyOrLater;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)csn
{
  return self->_csn;
}

- (unint64_t)chipId
{
  return self->_chipId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_casdCertificateRSA, 0);
  objc_storeStrong((id *)&self->_casdCertificate, 0);
  objc_storeStrong((id *)&self->_seid, 0);
}

@end
