@implementation PXSharedLibraryLegacyDevice

- (PXSharedLibraryLegacyDevice)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryLegacyDevice.m"), 29, CFSTR("%s is not available as initializer"), "-[PXSharedLibraryLegacyDevice init]");

  abort();
}

- (PXSharedLibraryLegacyDevice)initWithName:(id)a3 iconData:(id)a4 operatingSystem:(int64_t)a5 upgradeable:(BOOL)a6
{
  id v11;
  id v12;
  PXSharedLibraryLegacyDevice *v13;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSData *iconData;
  void *v19;
  void *v20;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  if (v11)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryLegacyDevice.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (a5)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryLegacyDevice.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("operatingSystem != PXSharedLibraryLegacyDeviceOperatingSystemUnknown"));

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)PXSharedLibraryLegacyDevice;
  v13 = -[PXSharedLibraryLegacyDevice init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v11, "copy");
    name = v13->_name;
    v13->_name = (NSString *)v14;

    v16 = objc_msgSend(v12, "copy");
    iconData = v13->_iconData;
    v13->_iconData = (NSData *)v16;

    v13->_operatingSystem = a5;
    v13->_upgradeable = a6;
  }

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *name;
  NSUInteger v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  name = self->_name;
  v6 = -[NSData length](self->_iconData, "length");
  PXSharedLibraryLegacyDeviceOperatingSystemDescription(self->_operatingSystem);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, name:\"%@\", data:%lu, os:\"%@\", upgradeable:%d>"), v4, self, name, v6, v7, self->_upgradeable);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)instructions
{
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v8;

  switch(self->_operatingSystem)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryLegacyDevice.m"), 56, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      if (self->_upgradeable)
        v3 = CFSTR("PXSharedLibraryAssistant_LegacyDevices_Instructions_iOS");
      else
        v3 = CFSTR("PXSharedLibraryAssistant_LegacyDevices_Warning_iOS");
      v4 = v3;
      break;
    case 2:
      v4 = CFSTR("PXSharedLibraryAssistant_LegacyDevices_Instructions_iPadOS");
      break;
    case 3:
      v4 = CFSTR("PXSharedLibraryAssistant_LegacyDevices_Instructions_macOS");
      break;
    case 4:
      v4 = CFSTR("PXSharedLibraryAssistant_LegacyDevices_Instructions_tvOS");
      break;
    default:
      v4 = 0;
      break;
  }
  PXLocalizedSharedLibraryString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (int64_t)operatingSystem
{
  return self->_operatingSystem;
}

- (BOOL)upgradeable
{
  return self->_upgradeable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
