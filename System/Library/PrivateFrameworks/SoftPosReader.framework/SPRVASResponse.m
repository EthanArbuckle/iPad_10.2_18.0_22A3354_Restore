@implementation SPRVASResponse

- (SPRVASResponse)initWithStatus:(unsigned __int16)a3 vasData:(id)a4 mobileToken:(id)a5
{
  NSData *v8;
  NSData *v9;
  NSData *vasData;
  NSData *v11;
  NSData *mobileToken;

  v8 = (NSData *)a4;
  v9 = (NSData *)a5;
  self->_status = a3;
  vasData = self->_vasData;
  self->_vasData = v8;
  v11 = v8;

  mobileToken = self->_mobileToken;
  self->_mobileToken = v9;

  return self;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t status;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  status = self->_status;
  if ((_DWORD)status == 36864)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_asHexString(self->_vasData, a2, v2, v3, v4, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v8, v10, (uint64_t)CFSTR("{vasData=%@, mobileToken=%@}"), v11, v12, v13, v9, self->_mobileToken);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("{status=%04X}"), v3, v4, v5, status);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPRVASResponse)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSData *v13;
  NSData *vasData;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSData *v19;
  NSData *mobileToken;

  v4 = a3;
  self->_status = objc_msgSend_decodeIntForKey_(v4, v5, (uint64_t)CFSTR("status"), v6, v7, v8);
  v9 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, (uint64_t)CFSTR("vasData"), v11, v12);
  v13 = (NSData *)objc_claimAutoreleasedReturnValue();
  vasData = self->_vasData;
  self->_vasData = v13;

  v15 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, (uint64_t)CFSTR("mobileToken"), v17, v18);
  v19 = (NSData *)objc_claimAutoreleasedReturnValue();

  mobileToken = self->_mobileToken;
  self->_mobileToken = v19;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t status;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  status = self->_status;
  v14 = a3;
  objc_msgSend_encodeInt_forKey_(v14, v5, status, (uint64_t)CFSTR("status"), v6, v7);
  objc_msgSend_encodeObject_forKey_(v14, v8, (uint64_t)self->_vasData, (uint64_t)CFSTR("vasData"), v9, v10);
  objc_msgSend_encodeObject_forKey_(v14, v11, (uint64_t)self->_mobileToken, (uint64_t)CFSTR("mobileToken"), v12, v13);

}

- (unsigned)status
{
  return self->_status;
}

- (NSData)vasData
{
  return self->_vasData;
}

- (NSData)mobileToken
{
  return self->_mobileToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileToken, 0);
  objc_storeStrong((id *)&self->_vasData, 0);
}

@end
