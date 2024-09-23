@implementation VUGallery.Bookmark

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_2578FF510;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_2578FF510 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtCC19VisualUnderstanding9VUGallery8Bookmark *v5;

  v4 = a3;
  v5 = self;
  sub_249F7A9C4(v4);

}

- (_TtCC19VisualUnderstanding9VUGallery8Bookmark)initWithCoder:(id)a3
{
  id v3;
  _TtCC19VisualUnderstanding9VUGallery8Bookmark *v4;

  v3 = a3;
  v4 = (_TtCC19VisualUnderstanding9VUGallery8Bookmark *)sub_249F93748();

  return v4;
}

- (id)copyWithZone:(void *)a3
{
  _TtCC19VisualUnderstanding9VUGallery8Bookmark *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_249F7ABB8(v6);

  __swift_project_boxed_opaque_existential_1Tm(v6, v6[3]);
  v4 = (void *)sub_24A01F450();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v6);
  return v4;
}

- (_TtCC19VisualUnderstanding9VUGallery8Bookmark)init
{
  _TtCC19VisualUnderstanding9VUGallery8Bookmark *result;

  result = (_TtCC19VisualUnderstanding9VUGallery8Bookmark *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
