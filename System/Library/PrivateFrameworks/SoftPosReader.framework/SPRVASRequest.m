@implementation SPRVASRequest

- (SPRVASRequest)init
{
  return (SPRVASRequest *)MEMORY[0x24BEDD108](self, sel_initWithVasTerminalProtocol_merchantId_vasUrl_vasFilter_, 0x24D3D49A0, &stru_24D3CDE20, 0, 0);
}

- (SPRVASRequest)initWithVasTerminalProtocol:(id)a3 merchantId:(id)a4 vasUrl:(id)a5 vasFilter:(id)a6
{
  NSNumber *v10;
  NSString *v11;
  NSURL *v12;
  NSData *v13;
  NSNumber *vasTerminalProtocol;
  NSNumber *v15;
  NSString *merchantId;
  NSString *v17;
  NSURL *vasUrl;
  NSURL *v19;
  NSData *vasFilter;

  v10 = (NSNumber *)a3;
  v11 = (NSString *)a4;
  v12 = (NSURL *)a5;
  v13 = (NSData *)a6;
  vasTerminalProtocol = self->_vasTerminalProtocol;
  self->_vasTerminalProtocol = v10;
  v15 = v10;

  merchantId = self->_merchantId;
  self->_merchantId = v11;
  v17 = v11;

  vasUrl = self->_vasUrl;
  self->_vasUrl = v12;
  v19 = v12;

  vasFilter = self->_vasFilter;
  self->_vasFilter = v13;

  return self;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSURL *vasUrl;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v15 = *(_OWORD *)&self->_vasTerminalProtocol;
  vasUrl = self->_vasUrl;
  objc_msgSend_asHexString(self->_vasFilter, a2, v2, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v9, (uint64_t)CFSTR("{vasTerminalProtocol=%@, merchantId=%@, vasUrl=%@, vasFilter=%@}"), v10, v11, v12, v15, vasUrl, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPRVASRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSNumber *v9;
  NSNumber *vasTerminalProtocol;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  NSString *merchantId;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSURL *v21;
  NSURL *vasUrl;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSData *v27;
  NSData *vasFilter;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("vasTerminalProtocol"), v7, v8);
  v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  vasTerminalProtocol = self->_vasTerminalProtocol;
  self->_vasTerminalProtocol = v9;

  v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("merchantId"), v13, v14);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  merchantId = self->_merchantId;
  self->_merchantId = v15;

  v17 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("vasUrl"), v19, v20);
  v21 = (NSURL *)objc_claimAutoreleasedReturnValue();
  vasUrl = self->_vasUrl;
  self->_vasUrl = v21;

  v23 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, (uint64_t)CFSTR("vasFilter"), v25, v26);
  v27 = (NSData *)objc_claimAutoreleasedReturnValue();

  vasFilter = self->_vasFilter;
  self->_vasFilter = v27;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *vasTerminalProtocol;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  vasTerminalProtocol = self->_vasTerminalProtocol;
  v17 = a3;
  objc_msgSend_encodeObject_forKey_(v17, v5, (uint64_t)vasTerminalProtocol, (uint64_t)CFSTR("vasTerminalProtocol"), v6, v7);
  objc_msgSend_encodeObject_forKey_(v17, v8, (uint64_t)self->_merchantId, (uint64_t)CFSTR("merchantId"), v9, v10);
  objc_msgSend_encodeObject_forKey_(v17, v11, (uint64_t)self->_vasUrl, (uint64_t)CFSTR("vasUrl"), v12, v13);
  objc_msgSend_encodeObject_forKey_(v17, v14, (uint64_t)self->_vasFilter, (uint64_t)CFSTR("vasFilter"), v15, v16);

}

- (NSNumber)vasTerminalProtocol
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setVasTerminalProtocol:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)merchantId
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMerchantId:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSURL)vasUrl
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVasUrl:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSData)vasFilter
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVasFilter:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vasFilter, 0);
  objc_storeStrong((id *)&self->_vasUrl, 0);
  objc_storeStrong((id *)&self->_merchantId, 0);
  objc_storeStrong((id *)&self->_vasTerminalProtocol, 0);
}

@end
