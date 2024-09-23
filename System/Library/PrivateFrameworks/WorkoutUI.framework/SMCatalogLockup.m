@implementation SMCatalogLockup

- (NSAttributedString)title
{
  return (NSAttributedString *)sub_24A6B4F30((char *)self, (uint64_t)a2, MEMORY[0x24BE890C0]);
}

- (NSAttributedString)subtitle
{
  return (NSAttributedString *)sub_24A6B4F30((char *)self, (uint64_t)a2, MEMORY[0x24BE88FE0]);
}

- (NSAttributedString)detail
{
  return (NSAttributedString *)sub_24A6B4F30((char *)self, (uint64_t)a2, MEMORY[0x24BE88FB0]);
}

- (NSString)identifier
{
  return (NSString *)sub_24A6B5658(self, (uint64_t)a2, (void (*)(void))MEMORY[0x24BE88FB8]);
}

- (SMArtwork)artwork
{
  SMCatalogLockup *v2;
  id v3;

  v2 = self;
  v3 = sub_24A6B51F8();

  return (SMArtwork *)v3;
}

- (NSNumber)mediaTypeRawValue
{
  SMCatalogLockup *v2;
  id v3;

  v2 = self;
  v3 = sub_24A6B5424();

  return (NSNumber *)v3;
}

- (int64_t)assetLoadStatus
{
  SMCatalogLockup *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_24A6B5568();

  return v3;
}

- (int64_t)bundleReason
{
  SMCatalogLockup *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_24A6B55F0();

  return v3;
}

- (NSString)description
{
  return (NSString *)sub_24A6B5658(self, (uint64_t)a2, MEMORY[0x24BE88FC8]);
}

- (NSString)recencyTag
{
  SMCatalogLockup *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_24A778BC0();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_24A77B980();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (SMCatalogLockup)init
{
  SMCatalogLockup *result;

  result = (SMCatalogLockup *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___SMCatalogLockup_catalogLockup;
  v4 = sub_24A778C2C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___SMCatalogLockup_mediaTagStringBuilder);
}

@end
