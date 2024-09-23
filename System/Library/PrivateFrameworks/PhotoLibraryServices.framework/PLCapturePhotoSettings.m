@implementation PLCapturePhotoSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoSettings, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *uuid;
  id v5;

  uuid = self->_uuid;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uuid, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoSettings, CFSTR("photoSettings"));

}

- (AVCaptureDeferredPhotoSettings)photoSettings
{
  return (AVCaptureDeferredPhotoSettings *)objc_getProperty(self, a2, 16, 1);
}

+ (id)photoSettingsWithPhotoSettings:(id)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPhotoSettings:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (PLCapturePhotoSettings)initWithPhotoSettings:(id)a3
{
  id v5;
  PLCapturePhotoSettings *v6;
  void *v7;
  uint64_t v8;
  NSString *uuid;
  PLCapturePhotoSettings *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLCapturePhotoSettings;
  v6 = -[PLCapturePhotoSettings init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = objc_claimAutoreleasedReturnValue();
    uuid = v6->_uuid;
    v6->_uuid = (NSString *)v8;

    objc_storeStrong((id *)&v6->_photoSettings, a3);
    v10 = v6;
  }

  return v6;
}

- (PLCapturePhotoSettings)initWithCoder:(id)a3
{
  id v4;
  PLCapturePhotoSettings *v5;
  uint64_t v6;
  NSString *uuid;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  AVCaptureDeferredPhotoSettings *photoSettings;
  PLCapturePhotoSettings *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLCapturePhotoSettings;
  v5 = -[PLCapturePhotoSettings init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("photoSettings"));
    v11 = objc_claimAutoreleasedReturnValue();
    photoSettings = v5->_photoSettings;
    v5->_photoSettings = (AVCaptureDeferredPhotoSettings *)v11;

    v13 = v5;
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PLCapturePhotoSettings;
  -[PLCapturePhotoSettings description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ uuid: %@, photoSettings: %@"), v4, self->_uuid, self->_photoSettings);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setPhotoSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

@end
