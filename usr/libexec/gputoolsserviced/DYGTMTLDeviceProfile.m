@implementation DYGTMTLDeviceProfile

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYGTMTLDeviceProfile)initWithCoder:(id)a3
{
  id v4;
  DYGTMTLDeviceProfile *v5;
  id v6;
  uint64_t v7;
  NSString *name;
  id v9;
  uint64_t v10;
  NSArray *supportedFeatureSets;
  id v12;
  uint64_t v13;
  NSArray *supportedGPUFamilies;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSSet *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *defaultSamplePositions;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DYGTMTLDeviceProfile;
  v5 = -[DYGTMTLDeviceProfile init](&v23, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("name"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    name = v5->_name;
    v5->_name = (NSString *)v7;

    v5->_streamRef = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("streamRef"));
    v9 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("supportedFeatureSets"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    supportedFeatureSets = v5->_supportedFeatureSets;
    v5->_supportedFeatureSets = (NSArray *)v10;

    v12 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("supportedGPUFamilies"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    supportedGPUFamilies = v5->_supportedGPUFamilies;
    v5->_supportedGPUFamilies = (NSArray *)v13;

    v15 = objc_opt_class(NSDictionary);
    v16 = objc_opt_class(NSArray);
    v17 = objc_opt_class(NSNumber);
    v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, v16, v17, objc_opt_class(NSValue), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("defaultSamplePositions")));
    defaultSamplePositions = v5->_defaultSamplePositions;
    v5->_defaultSamplePositions = (NSDictionary *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_streamRef, CFSTR("streamRef"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedFeatureSets, CFSTR("supportedFeatureSets"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedGPUFamilies, CFSTR("supportedGPUFamilies"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_defaultSamplePositions, CFSTR("defaultSamplePositions"));

}

- (NSArray)supportedFeatureSets
{
  return self->_supportedFeatureSets;
}

- (void)setSupportedFeatureSets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)supportedGPUFamilies
{
  return self->_supportedGPUFamilies;
}

- (void)setSupportedGPUFamilies:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)defaultSamplePositions
{
  return self->_defaultSamplePositions;
}

- (void)setDefaultSamplePositions:(id)a3
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

- (MTLDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  self->_device = (MTLDevice *)a3;
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_defaultSamplePositions, 0);
  objc_storeStrong((id *)&self->_supportedGPUFamilies, 0);
  objc_storeStrong((id *)&self->_supportedFeatureSets, 0);
}

@end
