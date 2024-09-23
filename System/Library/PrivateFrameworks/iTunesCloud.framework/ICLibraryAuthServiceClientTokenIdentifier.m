@implementation ICLibraryAuthServiceClientTokenIdentifier

- (ICLibraryAuthServiceClientTokenIdentifier)initWithResponseDictionary:(id)a3
{
  id v4;
  ICLibraryAuthServiceClientTokenIdentifier *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[ICLibraryAuthServiceClientTokenIdentifier init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("dsid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSNumber())
      objc_storeStrong((id *)&v5->_DSID, v6);
    objc_msgSend(v4, "objectForKey:", CFSTR("deviceGUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (_NSIsNSString())
      objc_storeStrong((id *)&v5->_deviceGUID, v7);

  }
  return v5;
}

- (ICLibraryAuthServiceClientTokenIdentifier)initWithCoder:(id)a3
{
  id v4;
  ICLibraryAuthServiceClientTokenIdentifier *v5;
  uint64_t v6;
  NSNumber *DSID;
  uint64_t v8;
  NSString *deviceGUID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICLibraryAuthServiceClientTokenIdentifier;
  v5 = -[ICLibraryAuthServiceClientTokenIdentifier init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dsid"));
    v6 = objc_claimAutoreleasedReturnValue();
    DSID = v5->_DSID;
    v5->_DSID = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceGUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    deviceGUID = v5->_deviceGUID;
    v5->_deviceGUID = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *DSID;
  id v5;

  DSID = self->_DSID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", DSID, CFSTR("dsid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceGUID, CFSTR("deviceGUID"));

}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (NSString)deviceGUID
{
  return self->_deviceGUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceGUID, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
