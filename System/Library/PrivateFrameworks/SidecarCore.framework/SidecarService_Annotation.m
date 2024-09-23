@implementation SidecarService_Annotation

+ (id)name
{
  __CFString *v2;

  v2 = CFSTR("SidecarServiceNameAnnotation");
  return CFSTR("SidecarServiceNameAnnotation");
}

+ (id)returnTypes
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (int64_t)minimumRapportVersion
{
  return 1820000;
}

- (id)serviceIdentifier
{
  return CFSTR("com.apple.sidecar.annotation");
}

- (id)serviceExtension
{
  return CFSTR("com.apple.sidecar.extension.markup");
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

  return SidecarLocalizedString(CFSTR("Annotate"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
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

  return SidecarLocalizedString(CFSTR("Annotation"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

@end
