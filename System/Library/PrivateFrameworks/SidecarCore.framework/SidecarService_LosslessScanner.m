@implementation SidecarService_LosslessScanner

+ (id)name
{
  __CFString *v2;

  v2 = CFSTR("SidecarServiceNameScanLosslessDocument");
  return CFSTR("SidecarServiceNameScanLosslessDocument");
}

+ (id)returnTypes
{
  if (returnTypes_once_294 != -1)
    dispatch_once(&returnTypes_once_294, &__block_literal_global_295);
  return (id)returnTypes_types_296;
}

+ (int64_t)minimumRapportVersion
{
  return 5000000;
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
  SidecarRequest_ScanLosslessDocument *v5;

  -[SidecarService devices](self, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = -[SidecarRequest initWithService:device:]([SidecarRequest_ScanLosslessDocument alloc], "initWithService:device:", self, v4);
  else
    v5 = 0;

  return v5;
}

@end
