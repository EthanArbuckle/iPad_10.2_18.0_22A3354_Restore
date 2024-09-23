@implementation SAAppSize

- (SAAppSize)init
{
  SAAppSize *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SAAppSize;
  result = -[SAAppSize init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_purgeableSize = 0u;
    *(_OWORD *)&result->_fixedSize = 0u;
    *(_OWORD *)&result->_physicalSize = 0u;
    *(_OWORD *)&result->_appCacheSize = 0u;
  }
  return result;
}

- (SAAppSize)initWithFixedSize:(unint64_t)a3 dataSize:(unint64_t)a4 cloneSize:(unint64_t)a5 purgeableSize:(unint64_t)a6 FSPurgeableSize:(unint64_t)a7 physicalSize:(unint64_t)a8 appCacheSize:(unint64_t)a9 CDPluginSize:(unint64_t)a10
{
  SAAppSize *result;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SAAppSize;
  result = -[SAAppSize init](&v17, sel_init);
  if (result)
  {
    result->_fixedSize = a3;
    result->_dataSize = a4;
    result->_purgeableSize = a6;
    result->_cloneSize = a5;
    result->_physicalSize = a8;
    result->_FSPurgeableSize = a7;
    result->_appCacheSize = a9;
    result->_cacheDeletePluginSize = a10;
  }
  return result;
}

+ (id)newWithFixedSize:(unint64_t)a3 andDataSize:(unint64_t)a4
{
  return -[SAAppSize initWithFixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:]([SAAppSize alloc], "initWithFixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:", a3, a4, 0, 0, 0, 0, 0, 0);
}

+ (id)newWithFixedSize:(unint64_t)a3 dataSize:(unint64_t)a4 cloneSize:(unint64_t)a5 purgeableSize:(unint64_t)a6 FSPurgeableSize:(unint64_t)a7 physicalSize:(unint64_t)a8 appCacheSize:(unint64_t)a9 CDPluginSize:(unint64_t)a10
{
  return -[SAAppSize initWithFixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:]([SAAppSize alloc], "initWithFixedSize:dataSize:cloneSize:purgeableSize:FSPurgeableSize:physicalSize:appCacheSize:CDPluginSize:", a3, a4, a5, a6, a7, a8);
}

- (id)copy
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setFixedSize:", self->_fixedSize);
  objc_msgSend(v3, "setDataSize:", self->_dataSize);
  objc_msgSend(v3, "setCloneSize:", self->_cloneSize);
  objc_msgSend(v3, "setPurgeableSize:", self->_purgeableSize);
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t fixedSize;
  id v5;

  fixedSize = self->_fixedSize;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", fixedSize, CFSTR("fixedSize"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_dataSize, CFSTR("dataSize"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_purgeableSize, CFSTR("purgeableSize"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_cloneSize, CFSTR("cloneSize"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_physicalSize, CFSTR("physicalSize"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_FSPurgeableSize, CFSTR("FSPurgeableSize"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_cacheDeletePluginSize, CFSTR("CDPluginSize"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_appCacheSize, CFSTR("appCacheSizeSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vendorName, CFSTR("vendorName"));

}

- (SAAppSize)initWithCoder:(id)a3
{
  id v4;
  SAAppSize *v5;
  uint64_t v6;
  NSString *vendorName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SAAppSize;
  v5 = -[SAAppSize init](&v9, sel_init);
  if (v5)
  {
    v5->_fixedSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("fixedSize"));
    v5->_dataSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("dataSize"));
    v5->_purgeableSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("purgeableSize"));
    v5->_cloneSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("cloneSize"));
    v5->_physicalSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("physicalSize"));
    v5->_FSPurgeableSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("FSPurgeableSize"));
    v5->_cacheDeletePluginSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("CDPluginSize"));
    v5->_appCacheSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("appCacheSizeSize"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("vendorName"));
    v6 = objc_claimAutoreleasedReturnValue();
    vendorName = v5->_vendorName;
    v5->_vendorName = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ fixedSize = %llu, dataSize = %llu, cloneSize = %llu, purgeableSize = %llu>"), objc_opt_class(), -[SAAppSize fixedSize](self, "fixedSize"), -[SAAppSize dataSize](self, "dataSize"), -[SAAppSize cloneSize](self, "cloneSize"), -[SAAppSize purgeableSize](self, "purgeableSize"));
}

- (unint64_t)fixedSize
{
  return self->_fixedSize;
}

- (void)setFixedSize:(unint64_t)a3
{
  self->_fixedSize = a3;
}

- (unint64_t)dataSize
{
  return self->_dataSize;
}

- (void)setDataSize:(unint64_t)a3
{
  self->_dataSize = a3;
}

- (unint64_t)purgeableSize
{
  return self->_purgeableSize;
}

- (void)setPurgeableSize:(unint64_t)a3
{
  self->_purgeableSize = a3;
}

- (unint64_t)cloneSize
{
  return self->_cloneSize;
}

- (void)setCloneSize:(unint64_t)a3
{
  self->_cloneSize = a3;
}

- (NSString)vendorName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVendorName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unint64_t)physicalSize
{
  return self->_physicalSize;
}

- (void)setPhysicalSize:(unint64_t)a3
{
  self->_physicalSize = a3;
}

- (unint64_t)FSPurgeableSize
{
  return self->_FSPurgeableSize;
}

- (void)setFSPurgeableSize:(unint64_t)a3
{
  self->_FSPurgeableSize = a3;
}

- (unint64_t)appCacheSize
{
  return self->_appCacheSize;
}

- (void)setAppCacheSize:(unint64_t)a3
{
  self->_appCacheSize = a3;
}

- (unint64_t)cacheDeletePluginSize
{
  return self->_cacheDeletePluginSize;
}

- (void)setCacheDeletePluginSize:(unint64_t)a3
{
  self->_cacheDeletePluginSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorName, 0);
}

@end
