@implementation BAManifestDownload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BAManifestDownload)init
{

  return 0;
}

- (BAManifestDownload)initWithCoder:(id)a3
{
  id v4;
  BAManifestDownload *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BAManifestDownload;
  v5 = -[BAURLDownload initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5)
    v5->_applicationEvent = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("applicationEvent"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t applicationEvent;
  id v5;
  objc_super v6;

  if (self)
    applicationEvent = self->_applicationEvent;
  else
    applicationEvent = 0;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", applicationEvent, CFSTR("applicationEvent"));
  v6.receiver = self;
  v6.super_class = (Class)BAManifestDownload;
  -[BAURLDownload encodeWithCoder:](&v6, "encodeWithCoder:", v5);

}

- (id)debugDescription
{
  id v2;
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BAManifestDownload;
  v2 = -[BAURLDownload debugDescription](&v6, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "mutableCopy");

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  int64_t applicationEvent;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BAManifestDownload;
  result = -[BAURLDownload copyWithZone:](&v6, "copyWithZone:", a3);
  if (self)
    applicationEvent = self->_applicationEvent;
  else
    applicationEvent = 0;
  *((_QWORD *)result + 24) = applicationEvent;
  return result;
}

@end
