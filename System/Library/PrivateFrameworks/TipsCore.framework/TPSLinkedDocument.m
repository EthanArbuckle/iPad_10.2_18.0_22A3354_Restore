@implementation TPSLinkedDocument

- (NSString)bundleId
{
  return (NSString *)sub_19A95A0E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSLinkedDocument_bundleId);
}

- (void)setBundleId:(id)a3
{
  sub_19A95A170((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSLinkedDocument_bundleId);
}

- (NSString)documentId
{
  return (NSString *)sub_19A95A0E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSLinkedDocument_documentId);
}

- (void)setDocumentId:(id)a3
{
  sub_19A95A170((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSLinkedDocument_documentId);
}

- (NSString)platform
{
  return (NSString *)sub_19A95A0E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSLinkedDocument_platform);
}

- (void)setPlatform:(id)a3
{
  sub_19A95A170((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSLinkedDocument_platform);
}

- (NSString)product
{
  return (NSString *)sub_19A95A0E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSLinkedDocument_product);
}

- (void)setProduct:(id)a3
{
  sub_19A95A170((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSLinkedDocument_product);
}

- (NSString)productVersion
{
  return (NSString *)sub_19A95A0E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSLinkedDocument_productVersion);
}

- (void)setProductVersion:(id)a3
{
  sub_19A95A170((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSLinkedDocument_productVersion);
}

+ (id)linkedDocumentFromDictionary:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = sub_19A990CC8();
  v4 = _s8TipsCore14LinkedDocumentC06linkedD14FromDictionary10dictionarySDys11AnyHashableVypGSgAH_tFZ_0(v3);
  swift_bridgeObjectRelease();
  if (v4)
  {
    v5 = (void *)sub_19A990CBC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSLinkedDocument)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19A990CC8();
  return (TPSLinkedDocument *)sub_19A95A39C(v3);
}

- (TPSLinkedDocument)initWithCoder:(id)a3
{
  return (TPSLinkedDocument *)sub_19A95AA38(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TPSLinkedDocument *v5;

  v4 = a3;
  v5 = self;
  sub_19A95AD90(v4);

}

- (id)copyWithZone:(void *)a3
{
  TPSLinkedDocument *v4;
  void *v5;
  uint64_t (*v7[4])();

  v4 = self;
  sub_19A95B118((uint64_t)a3, v7);

  __swift_project_boxed_opaque_existential_0(v7, (uint64_t)v7[3]);
  v5 = (void *)sub_19A99128C();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

- (TPSLinkedDocument)init
{
  TPSLinkedDocument *result;

  result = (TPSLinkedDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
