@implementation FlowcaseCell

- (_TtC16MusicApplication12FlowcaseCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication12FlowcaseCell *)sub_1853E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication12FlowcaseCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18A634();
}

- (NSString)headline
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_headline);
}

- (void)setHeadline:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_185B28);
}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_title);
}

- (void)setTitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_185CC0);
}

- (NSString)subtitle
{
  return (NSString *)sub_1866A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_subtitle);
}

- (void)setSubtitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC16MusicApplication12FlowcaseCell *v9;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_subtitle);
  v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_subtitle);
  v8 = *(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_subtitle];
  *v6 = v4;
  v6[1] = v5;
  v9 = self;
  sub_185E4C(v7, v8);

  swift_bridgeObjectRelease(v8);
}

- (NSString)descriptionTitle
{
  return (NSString *)sub_1866A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_descriptionTitle);
}

- (void)setDescriptionTitle:(id)a3
{
  sub_18670C((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_descriptionTitle, (void (*)(uint64_t))sub_186040);
}

- (NSString)descriptionText
{
  return (NSString *)sub_1866A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_descriptionText);
}

- (void)setDescriptionText:(id)a3
{
  sub_18670C((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_descriptionText, (void (*)(uint64_t))sub_186784);
}

- (void)prepareForReuse
{
  _TtC16MusicApplication12FlowcaseCell *v2;

  v2 = self;
  sub_187794();

}

- (void)layoutSubviews
{
  _TtC16MusicApplication12FlowcaseCell *v2;

  v2 = self;
  sub_187834();

}

- (void)clearArtworkCatalogs
{
  _TtC16MusicApplication12FlowcaseCell *v2;

  v2 = self;
  sub_1887A0();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication12FlowcaseCell *v6;

  v5 = a3;
  v6 = self;
  sub_18887C(a3);

}

- (BOOL)isHighlighted
{
  return sub_188BF8(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC16MusicApplication12FlowcaseCell *v6;
  unsigned int v7;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v10.receiver = self;
  v10.super_class = ObjectType;
  v6 = self;
  v7 = -[FlowcaseCell isHighlighted](&v10, "isHighlighted");
  v9.receiver = v6;
  v9.super_class = ObjectType;
  -[FlowcaseCell setHighlighted:](&v9, "setHighlighted:", v3);
  v8.receiver = v6;
  v8.super_class = ObjectType;
  if (v7 != -[FlowcaseCell isHighlighted](&v8, "isHighlighted"))
    sub_188B4C();

}

- (BOOL)isSelected
{
  return sub_188BF8(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC16MusicApplication12FlowcaseCell *v6;
  unsigned int v7;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v10.receiver = self;
  v10.super_class = ObjectType;
  v6 = self;
  v7 = -[FlowcaseCell isSelected](&v10, "isSelected");
  v9.receiver = v6;
  v9.super_class = ObjectType;
  -[FlowcaseCell setSelected:](&v9, "setSelected:", v3);
  v8.receiver = v6;
  v8.super_class = ObjectType;
  if (v7 != -[FlowcaseCell isSelected](&v8, "isSelected"))
  {
    sub_188B4C();
    sub_188CD4();
  }

}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease(*(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_headline]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_subtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_descriptionTitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_descriptionText]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_backgroundArtworkCatalog));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_thumbnailArtworkCatalog));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_artworkCachingReference));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_textDrawingCache));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_backgroundArtworkComponent));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_thumbnailArtworkComponent));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_topTextStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_descriptionTextStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_durationTextStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell____lazy_storage___selectedIndicatorView));
  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_topTextComponents);
  v4 = *(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_topTextComponents];
  v5 = *(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_topTextComponents + 8];
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_topTextComponents]);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  v6 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_descriptionTextComponent);
  v7 = *(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_descriptionTextComponent];
  swift_bridgeObjectRelease(*(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_descriptionTextComponent
                                                     + 8]);
  swift_release(v7);
  swift_release(v6);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_durationTextComponent));
}

@end
