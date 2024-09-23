@implementation XBLaunchCaptureInformation

- (XBLaunchCaptureInformation)init
{
  XBLaunchCaptureInformation *v2;
  XBLaunchCaptureInformation *v3;
  NSString *caarFilePath;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)XBLaunchCaptureInformation;
  v2 = -[XBLaunchCaptureInformation init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    caarFilePath = v2->_caarFilePath;
    v2->_estimatedMemoryImpact = -1;
    v2->_caarFilePath = 0;

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t estimatedMemoryImpact;
  id v5;

  estimatedMemoryImpact = self->_estimatedMemoryImpact;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", estimatedMemoryImpact, CFSTR("XBLaunchCaptureInformationEstimatedSize"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_caarFilePath, CFSTR("XBLaunchCaptureInformationCaarPath"));

}

- (XBLaunchCaptureInformation)initWithCoder:(id)a3
{
  id v4;
  XBLaunchCaptureInformation *v5;
  uint64_t v6;
  NSString *caarFilePath;

  v4 = a3;
  v5 = -[XBLaunchCaptureInformation init](self, "init");
  if (v5)
  {
    v5->_estimatedMemoryImpact = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("XBLaunchCaptureInformationEstimatedSize"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("XBLaunchCaptureInformationCaarPath"));
    v6 = objc_claimAutoreleasedReturnValue();
    caarFilePath = v5->_caarFilePath;
    v5->_caarFilePath = (NSString *)v6;

  }
  return v5;
}

- (unint64_t)estimatedMemoryImpact
{
  return self->_estimatedMemoryImpact;
}

- (void)setEstimatedMemoryImpact:(unint64_t)a3
{
  self->_estimatedMemoryImpact = a3;
}

- (NSString)caarFilePath
{
  return self->_caarFilePath;
}

- (void)setCaarFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caarFilePath, 0);
}

@end
