@implementation Versioning

- (_TtC8Stickers10Versioning)init
{
  char *v2;
  char *v3;
  objc_super v5;

  v2 = (char *)self + OBJC_IVAR____TtC8Stickers10Versioning_currentStickerVersionOverride;
  *(_QWORD *)v2 = 0;
  v2[8] = 1;
  v3 = (char *)self + OBJC_IVAR____TtC8Stickers10Versioning_currentStickerRepresentationVersionOverride;
  *(_QWORD *)v3 = 0;
  v3[8] = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for Versioning();
  return -[Versioning init](&v5, sel_init);
}

@end
