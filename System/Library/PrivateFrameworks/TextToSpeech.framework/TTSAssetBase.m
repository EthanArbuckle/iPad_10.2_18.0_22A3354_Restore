@implementation TTSAssetBase

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleIdentifier;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;

  bundleIdentifier = self->_bundleIdentifier;
  v13 = a3;
  objc_msgSend_encodeObject_forKey_(v13, v5, (uint64_t)bundleIdentifier, (uint64_t)CFSTR("_bundleIdentifier"), v6);
  objc_msgSend_encodeObject_forKey_(v13, v7, (uint64_t)self->_compatibilityVersion, (uint64_t)CFSTR("_compatibilityVersion"), v8);
  objc_msgSend_encodeObject_forKey_(v13, v9, (uint64_t)self->_contentVersion, (uint64_t)CFSTR("_contentVersion"), v10);
  objc_msgSend_encodeObject_forKey_(v13, v11, (uint64_t)self->_masteredVersion, (uint64_t)CFSTR("_masteredVersion"), v12);

}

- (TTSAssetBase)initWithCoder:(id)a3
{
  id v4;
  TTSAssetBase *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *bundleIdentifier;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSNumber *compatibilityVersion;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSNumber *contentVersion;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSString *masteredVersion;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TTSAssetBase;
  v5 = -[TTSAssetBase init](&v27, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("_bundleIdentifier"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("_compatibilityVersion"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    compatibilityVersion = v5->_compatibilityVersion;
    v5->_compatibilityVersion = (NSNumber *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("_contentVersion"), v18);
    v19 = objc_claimAutoreleasedReturnValue();
    contentVersion = v5->_contentVersion;
    v5->_contentVersion = (NSNumber *)v19;

    v21 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, (uint64_t)CFSTR("_masteredVersion"), v23);
    v24 = objc_claimAutoreleasedReturnValue();
    masteredVersion = v5->_masteredVersion;
    v5->_masteredVersion = (NSString *)v24;

  }
  return v5;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)setCompatibilityVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)contentVersion
{
  return self->_contentVersion;
}

- (void)setContentVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)masteredVersion
{
  return self->_masteredVersion;
}

- (void)setMasteredVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masteredVersion, 0);
  objc_storeStrong((id *)&self->_contentVersion, 0);
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
