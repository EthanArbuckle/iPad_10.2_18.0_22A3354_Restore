@implementation SPRInstallData

- (SPRInstallData)initWithKernelsInstalled:(id)a3 countryCode:(id)a4
{
  NSArray *v6;
  NSString *v7;
  NSArray *kernelsInstalled;
  NSArray *v9;
  NSString *countryCode;

  v6 = (NSArray *)a3;
  v7 = (NSString *)a4;
  kernelsInstalled = self->_kernelsInstalled;
  self->_kernelsInstalled = v6;
  v9 = v6;

  countryCode = self->_countryCode;
  self->_countryCode = v7;

  return self;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("{kernelsInstalled=%@, countryCode=%@}"), v2, v3, v4, self->_kernelsInstalled, self->_countryCode);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPRInstallData)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  NSArray *kernelsInstalled;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *v15;
  NSString *countryCode;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("kernelsInstalled"), v7, v8);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  kernelsInstalled = self->_kernelsInstalled;
  self->_kernelsInstalled = v9;

  v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("countryCode"), v13, v14);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();

  countryCode = self->_countryCode;
  self->_countryCode = v15;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *kernelsInstalled;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  kernelsInstalled = self->_kernelsInstalled;
  v11 = a3;
  objc_msgSend_encodeObject_forKey_(v11, v5, (uint64_t)kernelsInstalled, (uint64_t)CFSTR("kernelsInstalled"), v6, v7);
  objc_msgSend_encodeObject_forKey_(v11, v8, (uint64_t)self->_countryCode, (uint64_t)CFSTR("countryCode"), v9, v10);

}

- (SPRInstallData)initWithKernelsInstalled:(id)a3
{
  objc_storeStrong((id *)&self->_kernelsInstalled, a3);
  return self;
}

- (NSArray)kernelsInstalled
{
  return self->_kernelsInstalled;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_kernelsInstalled, 0);
}

@end
