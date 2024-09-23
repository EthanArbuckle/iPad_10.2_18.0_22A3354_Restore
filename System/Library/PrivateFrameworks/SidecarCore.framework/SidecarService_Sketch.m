@implementation SidecarService_Sketch

+ (id)name
{
  __CFString *v2;

  v2 = CFSTR("SidecarServiceNameSketch");
  return CFSTR("SidecarServiceNameSketch");
}

+ (id)returnTypes
{
  if (returnTypes_once_933 != -1)
    dispatch_once(&returnTypes_once_933, &__block_literal_global_934);
  return (id)returnTypes_types_935;
}

+ (int64_t)minimumRapportVersion
{
  return 1820000;
}

- (id)serviceIdentifier
{
  return CFSTR("com.apple.sidecar.sketch");
}

- (id)serviceExtension
{
  return CFSTR("com.apple.sidecar.extension.sketch");
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

  return SidecarLocalizedString(CFSTR("Add Sketch"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return SidecarLocalizedString(CFSTR("Sketch"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

@end
