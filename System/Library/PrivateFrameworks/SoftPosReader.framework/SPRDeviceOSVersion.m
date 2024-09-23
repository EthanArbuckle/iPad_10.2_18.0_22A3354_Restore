@implementation SPRDeviceOSVersion

- (SPRDeviceOSVersion)initWithDERRepresentation:(id)a3
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
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  NSString *v18;
  NSString *buildNumber;
  id v20;
  const char *v21;
  uint64_t v22;
  NSString *v23;
  SPRDeviceOSVersion *v24;
  SPRDeviceOSVersion *v25;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _QWORD v31[2];
  unint64_t v32[2];
  uint64_t v33;
  _QWORD v34[2];

  v4 = objc_retainAutorelease(a3);
  v34[0] = objc_msgSend_bytes(v4, v5, v6, v7, v8, v9);
  v34[1] = objc_msgSend_length(v4, v10, v11, v12, v13, v14);
  v32[1] = 0;
  v33 = 0;
  v32[0] = 0;
  if (!sub_215984CCC((uint64_t)v34, &v33, v32) && v33 == 0x2000000000000010)
  {
    v30 = 0;
    v31[0] = 0;
    v31[1] = 0;
    while (!sub_215984D84(v32, &v30))
    {
      if (v30 == 0xA00000000000057BLL)
      {
        v27 = 0;
        v28 = 0;
        v29 = 0;
        if (sub_21598492C((uint64_t)v31, &v27) || v27 != 4)
          continue;
        v20 = objc_alloc(MEMORY[0x24BDD17C8]);
        v23 = (NSString *)objc_msgSend_initWithBytes_length_encoding_(v20, v21, v28, v29, 4, v22);
        buildNumber = self->_buildNumber;
        self->_buildNumber = v23;
      }
      else
      {
        if (v30 != 0xA000000000000578)
          continue;
        v27 = 0;
        v28 = 0;
        v29 = 0;
        if (sub_21598492C((uint64_t)v31, &v27) || v27 != 4)
          continue;
        v15 = objc_alloc(MEMORY[0x24BDD17C8]);
        v18 = (NSString *)objc_msgSend_initWithBytes_length_encoding_(v15, v16, v28, v29, 4, v17);
        buildNumber = self->_productVersion;
        self->_productVersion = v18;
      }

    }
  }
  if (self->_productVersion)
    v24 = self;
  else
    v24 = 0;
  v25 = v24;

  return v25;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSString *productVersion;
  NSString *buildNumber;

  productVersion = self->_productVersion;
  buildNumber = self->_buildNumber;
  if (buildNumber)
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("SPRDeviceOSVersion(productVersion:%@, buildNumber:%@)"), v2, v3, v4, productVersion, buildNumber);
  else
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("SPRDeviceOSVersion(productVersion:%@)"), v2, v3, v4, productVersion);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)shortVersion
{
  return self->_productVersion;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (NSString)buildNumber
{
  return self->_buildNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildNumber, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
}

@end
