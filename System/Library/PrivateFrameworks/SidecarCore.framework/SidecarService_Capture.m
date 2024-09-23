@implementation SidecarService_Capture

+ (id)name
{
  __CFString *v2;

  v2 = CFSTR("SidecarServiceNameCapture");
  return CFSTR("SidecarServiceNameCapture");
}

+ (id)returnTypes
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (int64_t)minimumRapportVersion
{
  return 4000000;
}

- (id)serviceIdentifier
{
  return CFSTR("com.apple.sidecar.capture");
}

- (id)serviceExtension
{
  return CFSTR("com.apple.sidecar.extension.capture");
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

  return SidecarLocalizedString(CFSTR("Capture"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return SidecarLocalizedString(CFSTR("Capture"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

@end
