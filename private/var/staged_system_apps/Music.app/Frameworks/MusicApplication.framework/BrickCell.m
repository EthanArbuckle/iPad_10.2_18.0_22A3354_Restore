@implementation BrickCell

- (_TtC16MusicApplication9BrickCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication9BrickCell *)sub_8F5904(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication9BrickCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_8F7DF0();
}

- (NSString)headline
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication9BrickCell_headline);
}

- (void)setHeadline:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_8F5708);
}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication9BrickCell_title);
}

- (void)setTitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_8F57A8);
}

- (NSString)subtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication9BrickCell_subtitle);
}

- (void)setSubtitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_8F584C);
}

- (void)layoutSubviews
{
  _TtC16MusicApplication9BrickCell *v2;

  v2 = self;
  sub_8F5E0C();

}

- (void)clearArtworkCatalogs
{
  _QWORD *v2;
  void *v3;
  _TtC16MusicApplication9BrickCell *v4;
  uint64_t v5;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication9BrickCell_artworkComponent);
  v3 = (void *)v2[18];
  v4 = self;
  objc_msgSend(v3, "clearArtworkCatalogs");
  *(_QWORD *)((char *)v2
            + OBJC_IVAR____TtCE16MusicApplicationV11MusicCoreUI7Artwork9Component_representationsUpdatedFromConfigurationBlock) = 0;
  v5 = v2[30];
  v2[29] = 0;
  v2[30] = 0;

  swift_bridgeObjectRelease(v5);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication9BrickCell *v6;

  v5 = a3;
  v6 = self;
  sub_8F69EC(a3);

}

+ (UIEdgeInsets)visualContentInsets
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BYTE v12[24];
  UIEdgeInsets result;

  v2 = sub_8F77AC();
  v4 = v3;
  v6 = v5;
  swift_beginAccess(v5 + 32, v12, 0, 0);
  v7 = *(double *)(v6 + 104);
  swift_bridgeObjectRelease();
  swift_release(v6);
  swift_release(v4);
  swift_release(v2);
  v8 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  v11 = v7;
  result.right = v10;
  result.bottom = v11;
  result.left = v9;
  result.top = v8;
  return result;
}

- (BOOL)isHighlighted
{
  return sub_188BF8(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC16MusicApplication9BrickCell *v6;
  unsigned int v7;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v10.receiver = self;
  v10.super_class = ObjectType;
  v6 = self;
  v7 = -[BrickCell isHighlighted](&v10, "isHighlighted");
  v9.receiver = v6;
  v9.super_class = ObjectType;
  -[BrickCell setHighlighted:](&v9, "setHighlighted:", v3);
  v8.receiver = v6;
  v8.super_class = ObjectType;
  if (v7 != -[BrickCell isHighlighted](&v8, "isHighlighted"))
    sub_8F6DD0();

}

- (BOOL)isSelected
{
  return sub_188BF8(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC16MusicApplication9BrickCell *v6;
  unsigned int v7;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v10.receiver = self;
  v10.super_class = ObjectType;
  v6 = self;
  v7 = -[BrickCell isSelected](&v10, "isSelected");
  v9.receiver = v6;
  v9.super_class = ObjectType;
  -[BrickCell setSelected:](&v9, "setSelected:", v3);
  v8.receiver = v6;
  v8.super_class = ObjectType;
  if (v7 != -[BrickCell isSelected](&v8, "isSelected"))
  {
    sub_8F6DD0();
    sub_8F6F1C();
  }

}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication9BrickCell_lockupImageArtworkCatalog));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication9BrickCell_artworkCachingReference));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication9BrickCell_textDrawingCache));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication9BrickCell_artworkComponent));
  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication9BrickCell_textComponents);
  v4 = *(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication9BrickCell_textComponents];
  v5 = *(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication9BrickCell_textComponents + 8];
  swift_bridgeObjectRelease();
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication9BrickCell_headlineTextDrawingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication9BrickCell_titleTextDrawingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication9BrickCell_subtitleTextDrawingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication9BrickCell____lazy_storage___selectedIndicatorView));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication9BrickCell_layoutInvalidationHandler), *(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication9BrickCell_layoutInvalidationHandler]);
}

@end
