@implementation PXPhotoStyleCollection

- (NSString)description
{
  PXPhotoStyleCollection *v2;
  void *v3;

  v2 = self;
  PhotoStyleCollection.description.getter();

  v3 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (PXPhotoStyleCollection)init
{
  PXPhotoStyleCollection *result;

  result = (PXPhotoStyleCollection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___PXPhotoStyleCollection__selectedIndex;
  sub_1A6FC4D34();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

+ (id)allDefaultStyles
{
  void *v2;

  sub_1A6FC6D20();
  type metadata accessor for PhotoStyleElement(0);
  v2 = (void *)sub_1A7AE39F8();
  swift_bridgeObjectRelease();
  return v2;
}

@end
