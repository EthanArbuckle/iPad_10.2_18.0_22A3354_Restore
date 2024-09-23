@implementation DYGTDeviceInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYGTDeviceInfo)initWithCoder:(id)a3
{
  id v4;
  DYGTDeviceInfo *v5;
  id v6;
  uint64_t v7;
  NSString *permanentIdentifier;
  id v9;
  uint64_t v10;
  NSString *name;
  id v12;
  uint64_t v13;
  NSString *productType;
  id v15;
  uint64_t v16;
  NSString *version;
  id v18;
  uint64_t v19;
  NSString *build;
  id v21;
  uint64_t v22;
  NSString *metalVersion;
  id v24;
  uint64_t v25;
  DYGTGPUToolsVersionInfo *gputoolsVersionInfo;
  double v27;
  id v28;
  uint64_t v29;
  NSArray *profiles;
  int platform;
  int v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)DYGTDeviceInfo;
  v5 = -[DYGTDeviceInfo init](&v34, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("permanentIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    permanentIdentifier = v5->_permanentIdentifier;
    v5->_permanentIdentifier = (NSString *)v7;

    v5->_runtimeIdentifier = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("runtimeIdentifier"));
    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("name"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    name = v5->_name;
    v5->_name = (NSString *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("productType"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    productType = v5->_productType;
    v5->_productType = (NSString *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("version"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    version = v5->_version;
    v5->_version = (NSString *)v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("build"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    build = v5->_build;
    v5->_build = (NSString *)v19;

    v5->_platform = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("platform"));
    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("metalVersion"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    metalVersion = v5->_metalVersion;
    v5->_metalVersion = (NSString *)v22;

    v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(DYGTGPUToolsVersionInfo), CFSTR("gputoolsVersionInfo"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    gputoolsVersionInfo = v5->_gputoolsVersionInfo;
    v5->_gputoolsVersionInfo = (DYGTGPUToolsVersionInfo *)v25;

    v5->_mainScreenDescriptor.width = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("mainScreenResolution.width"));
    v5->_mainScreenDescriptor.height = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("mainScreenResolution.height"));
    v5->_mainScreenDescriptor.scale = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("mainScreenResolution.scale"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("mainScreenDescriptor.orientation"));
    v5->_mainScreenDescriptor.orientation = v27;
    v5->_mainScreenDescriptor.type = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("mainScreenDescriptor.type"));
    v28 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(DYGTMTLDeviceProfile), CFSTR("supportedGLProfileContextsInfo"));
    v29 = objc_claimAutoreleasedReturnValue(v28);
    profiles = v5->_profiles;
    v5->_profiles = (NSArray *)v29;

    v5->_nativePointerSize = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("nativePointerSize"));
    platform = v5->_platform;
    if (platform == 7)
    {
      v32 = 9;
      goto LABEL_6;
    }
    if (platform == 8)
    {
      v32 = 10;
LABEL_6:
      v5->_platform = v32;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *permanentIdentifier;
  id v5;

  permanentIdentifier = self->_permanentIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", permanentIdentifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_runtimeIdentifier, CFSTR("runtimeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productType, CFSTR("productType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_build, CFSTR("build"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_platform, CFSTR("platform"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metalVersion, CFSTR("metalVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_gputoolsVersionInfo, CFSTR("gputoolsVersionInfo"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_mainScreenDescriptor.width, CFSTR("mainScreenResolution.width"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_mainScreenDescriptor.height, CFSTR("mainScreenResolution.height"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_mainScreenDescriptor.scale, CFSTR("mainScreenResolution.scale"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("mainScreenDescriptor.orientation"), self->_mainScreenDescriptor.orientation);
  objc_msgSend(v5, "encodeInt32:forKey:", self->_mainScreenDescriptor.type, CFSTR("mainScreenDescriptor.type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_profiles, CFSTR("supportedGLProfileContextsInfo"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_nativePointerSize, CFSTR("nativePointerSize"));

}

- (int)platform
{
  return self->_platform;
}

- (void)setPlatform:(int)a3
{
  self->_platform = a3;
}

- (unint64_t)runtimeIdentifier
{
  return self->_runtimeIdentifier;
}

- (void)setRuntimeIdentifier:(unint64_t)a3
{
  self->_runtimeIdentifier = a3;
}

- (NSString)permanentIdentifier
{
  return self->_permanentIdentifier;
}

- (void)setPermanentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)metalVersion
{
  return self->_metalVersion;
}

- (void)setMetalVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unsigned)nativePointerSize
{
  return self->_nativePointerSize;
}

- (void)setNativePointerSize:(unsigned int)a3
{
  self->_nativePointerSize = a3;
}

- (DYGTGPUToolsVersionInfo)gputoolsVersionInfo
{
  return self->_gputoolsVersionInfo;
}

- (void)setGputoolsVersionInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- ($16123236EB3C150F368AB57B9BCDCA0E)mainScreenDescriptor
{
  *($F47FE06625FC0D634ED89CCC9D0BEEDA *)retstr = *($F47FE06625FC0D634ED89CCC9D0BEEDA *)((char *)self + 88);
  return self;
}

- (void)setMainScreenDescriptor:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_mainScreenDescriptor.scale = *(_QWORD *)&a3->var3;
  *(_OWORD *)&self->_mainScreenDescriptor.orientation = v3;
}

- (NSArray)profiles
{
  return self->_profiles;
}

- (void)setProfiles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profiles, 0);
  objc_storeStrong((id *)&self->_gputoolsVersionInfo, 0);
  objc_storeStrong((id *)&self->_metalVersion, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_permanentIdentifier, 0);
}

@end
