@implementation PXPhotosFileProviderRegisterFileRepresentation

- (NSURL)fileProviderURL
{
  return (NSURL *)(id)sub_1A7ADC7C8();
}

- (UTType)contentType
{
  return (UTType *)(id)sub_1A7ADFD5C();
}

- (BOOL)hasLimitedVisibility
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___PXPhotosFileProviderRegisterFileRepresentation_hasLimitedVisibility);
}

- (NSString)uuid
{
  return (NSString *)sub_1A6959214();
}

- (NSString)identifierCode
{
  return (NSString *)sub_1A6959214();
}

- (BOOL)isThumbnail
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___PXPhotosFileProviderRegisterFileRepresentation_isThumbnail);
}

- (PXPhotosFileProviderRegisterFileRepresentation)init
{
  PXPhotosFileProviderRegisterFileRepresentation *result;

  result = (PXPhotosFileProviderRegisterFileRepresentation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR___PXPhotosFileProviderRegisterFileRepresentation_fileProviderURL;
  v4 = sub_1A7ADC8A0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___PXPhotosFileProviderRegisterFileRepresentation_contentType;
  v6 = sub_1A7ADFE1C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
