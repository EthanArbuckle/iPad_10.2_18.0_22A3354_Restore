@implementation GlyphPlayButton

- (BOOL)isSelected
{
  return sub_95448(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  sub_157C30(self, (uint64_t)a2, a3, (const char **)&selRef_setSelected_);
}

- (BOOL)isEnabled
{
  return sub_95448(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  sub_157C30(self, (uint64_t)a2, a3, (const char **)&selRef_setEnabled_);
}

- (_TtC23ShelfKitCollectionViews15GlyphPlayButton)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  *((_BYTE *)&self->super.super.super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews15GlyphPlayButton_isHovering) = 0;
  v6 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews15GlyphPlayButton_playButtonState;
  *(_QWORD *)v6 = 0;
  v6[8] = 1;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[GlyphButton initWithCoder:](&v8, "initWithCoder:", a3);
}

@end
