@implementation PFCameraClientMetadata

- (PFCameraClientMetadata)initWithPrivateClientMetadata:(id)a3 contactIDsInProximity:(id)a4 sharedLibraryMode:(int64_t)a5
{
  id v9;
  id v10;
  PFCameraClientMetadata *v11;
  PFCameraClientMetadata *v12;
  uint64_t v13;
  NSArray *contactIDsInProximity;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PFCameraClientMetadata;
  v11 = -[PFCameraClientMetadata init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_privateClientMetadata, a3);
    v13 = objc_msgSend(v10, "copy");
    contactIDsInProximity = v12->_contactIDsInProximity;
    v12->_contactIDsInProximity = (NSArray *)v13;

    v12->_sharedLibraryMode = a5;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  AVCapturePhotoPrivateClientMetadata *privateClientMetadata;
  id v5;

  privateClientMetadata = self->_privateClientMetadata;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", privateClientMetadata, CFSTR("privateClientMetadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactIDsInProximity, CFSTR("contactIDsInProximity"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sharedLibraryMode, CFSTR("sharedLibraryMode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedLibraryDiagnostics, CFSTR("sharedLibraryDiagnostics"));

}

- (PFCameraClientMetadata)initWithCoder:(id)a3
{
  id v4;
  PFCameraClientMetadata *v5;
  void *v6;
  uint64_t v7;
  AVCapturePhotoPrivateClientMetadata *privateClientMetadata;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *contactIDsInProximity;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSDictionary *sharedLibraryDiagnostics;

  v4 = a3;
  v5 = -[PFCameraClientMetadata init](self, "init");
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("privateClientMetadata"));
    v7 = objc_claimAutoreleasedReturnValue();
    privateClientMetadata = v5->_privateClientMetadata;
    v5->_privateClientMetadata = (AVCapturePhotoPrivateClientMetadata *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("contactIDsInProximity"));
    v12 = objc_claimAutoreleasedReturnValue();
    contactIDsInProximity = v5->_contactIDsInProximity;
    v5->_contactIDsInProximity = (NSArray *)v12;

    v5->_sharedLibraryMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sharedLibraryMode"));
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("sharedLibraryDiagnostics"));
    v19 = objc_claimAutoreleasedReturnValue();
    sharedLibraryDiagnostics = v5->_sharedLibraryDiagnostics;
    v5->_sharedLibraryDiagnostics = (NSDictionary *)v19;

  }
  return v5;
}

- (AVCapturePhotoPrivateClientMetadata)privateClientMetadata
{
  return self->_privateClientMetadata;
}

- (void)setPrivateClientMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_privateClientMetadata, a3);
}

- (NSArray)contactIDsInProximity
{
  return self->_contactIDsInProximity;
}

- (void)setContactIDsInProximity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)sharedLibraryMode
{
  return self->_sharedLibraryMode;
}

- (void)setSharedLibraryMode:(int64_t)a3
{
  self->_sharedLibraryMode = a3;
}

- (NSDictionary)sharedLibraryDiagnostics
{
  return self->_sharedLibraryDiagnostics;
}

- (void)setSharedLibraryDiagnostics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedLibraryDiagnostics, 0);
  objc_storeStrong((id *)&self->_contactIDsInProximity, 0);
  objc_storeStrong((id *)&self->_privateClientMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
