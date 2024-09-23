@implementation QLThumbnailExtension

- (BOOL)supportsInteractiveThumbnailBadges
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___QLThumbnailExtension_supportsInteractiveThumbnailBadges);
}

- (NSString)generatorIdentifier
{
  return (NSString *)sub_1D54EF540();
}

- (NSString)generatorVersion
{
  return (NSString *)sub_1D54EF540();
}

- (double)minimumThumbnailDimension
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___QLThumbnailExtension_minimumThumbnailDimension);
}

- (_EXExtensionIdentity)exIdentity
{
  QLThumbnailExtension *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1D54FC4DC();

  return (_EXExtensionIdentity *)v3;
}

- (BOOL)supportsConcurrentRequests
{
  return (6u >> (*((_BYTE *)&self->super.isa + OBJC_IVAR___QLThumbnailExtension_supportedConcurrencyLevel) & 7)) & 1;
}

- (NSString)debugDescription
{
  QLThumbnailExtension *v2;
  void *v3;

  v2 = self;
  sub_1D54EF6D8();

  v3 = (void *)sub_1D54FC644();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (QLThumbnailExtension)init
{
  QLThumbnailExtension *result;

  result = (QLThumbnailExtension *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___QLThumbnailExtension_identity;
  v3 = sub_1D54FC4F4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
