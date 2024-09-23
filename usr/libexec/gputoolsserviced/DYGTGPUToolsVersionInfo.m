@implementation DYGTGPUToolsVersionInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSDictionary copyWithZone:](self->_infoPlist, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSDictionary copyWithZone:](self->_versionPlist, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  *((_DWORD *)v5 + 2) = self->_interposeVersionGL;
  *((_DWORD *)v5 + 3) = self->_interposeVersionMetal;
  return v5;
}

- (DYGTGPUToolsVersionInfo)initWithCoder:(id)a3
{
  id v4;
  DYGTGPUToolsVersionInfo *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDictionary *infoPlist;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSDictionary *versionPlist;
  objc_super v15;
  _QWORD v16[3];

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DYGTGPUToolsVersionInfo;
  v5 = -[DYGTGPUToolsVersionInfo init](&v15, "init");
  if (v5)
  {
    v16[0] = objc_opt_class(NSString);
    v16[1] = objc_opt_class(NSDictionary);
    v16[2] = objc_opt_class(NSMutableArray);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 3));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("infoPlist")));
    infoPlist = v5->_infoPlist;
    v5->_infoPlist = (NSDictionary *)v8;

    v10 = objc_opt_class(NSString);
    v11 = objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v10, objc_opt_class(NSString), CFSTR("versionPlist"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    versionPlist = v5->_versionPlist;
    v5->_versionPlist = (NSDictionary *)v12;

    v5->_interposeVersionGL = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("interposeVersion"));
    v5->_interposeVersionMetal = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("interposeVersionMetal"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *infoPlist;
  id v5;

  infoPlist = self->_infoPlist;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", infoPlist, CFSTR("infoPlist"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_versionPlist, CFSTR("versionPlist"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_interposeVersionGL, CFSTR("interposeVersion"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_interposeVersionMetal, CFSTR("interposeVersionMetal"));

}

- (NSDictionary)infoPlist
{
  return self->_infoPlist;
}

- (void)setInfoPlist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)versionPlist
{
  return self->_versionPlist;
}

- (void)setVersionPlist:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)interposeVersionGL
{
  return self->_interposeVersionGL;
}

- (void)setInterposeVersionGL:(unsigned int)a3
{
  self->_interposeVersionGL = a3;
}

- (unsigned)interposeVersionMetal
{
  return self->_interposeVersionMetal;
}

- (void)setInterposeVersionMetal:(unsigned int)a3
{
  self->_interposeVersionMetal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionPlist, 0);
  objc_storeStrong((id *)&self->_infoPlist, 0);
}

@end
