@implementation SidecarService_Scanner

+ (id)name
{
  __CFString *v2;

  v2 = CFSTR("SidecarServiceNameScanDocument");
  return CFSTR("SidecarServiceNameScanDocument");
}

+ (id)returnTypes
{
  if (returnTypes_once != -1)
    dispatch_once(&returnTypes_once, &__block_literal_global);
  return (id)returnTypes_types;
}

+ (int64_t)minimumRapportVersion
{
  return 1600000;
}

- (id)serviceIdentifier
{
  return CFSTR("com.apple.sidecar.camera");
}

- (id)serviceExtension
{
  return CFSTR("com.apple.sidecar.extension.camera");
}

- (id)localizedDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return SidecarLocalizedString(CFSTR("Scan Documents"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)localizedItemName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  return SidecarLocalizedString(CFSTR("Scanned Document"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)makeRequest
{
  void *v3;
  void *v4;
  SidecarRequest_ScanDocument *v5;

  -[SidecarService devices](self, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = -[SidecarRequest initWithService:device:]([SidecarRequest_ScanDocument alloc], "initWithService:device:", self, v4);
  else
    v5 = 0;

  return v5;
}

@end
