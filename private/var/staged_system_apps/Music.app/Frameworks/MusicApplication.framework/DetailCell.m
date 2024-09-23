@implementation DetailCell

- (_TtC16MusicApplication10DetailCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication10DetailCell *)sub_1CC56C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication10DetailCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D082C();
}

- (NSString)trackCountAndDuration
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication10DetailCell_trackCountAndDuration);
}

- (void)setTrackCountAndDuration:(id)a3
{
  sub_1CCC8C(self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication10DetailCell_trackCountAndDuration, (uint64_t)sub_1D0744);
}

- (NSString)copyright
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication10DetailCell_copyright);
}

- (void)setCopyright:(id)a3
{
  sub_1CCC8C(self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication10DetailCell_copyright, (uint64_t)sub_1D21AC);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC16MusicApplication10DetailCell *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = -[DetailCell contentView](v4, "contentView");
  objc_msgSend(v5, "sizeThatFits:", width, 1.79769313e308);
  v7 = v6;

  v8 = width;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  id v10;
  _TtC16MusicApplication10DetailCell *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[16];
  _TtC16MusicApplication10DetailCell *v17;
  _QWORD v18[5];
  objc_super v19;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14CE2A0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v19.receiver = self;
  v19.super_class = ObjectType;
  v10 = a3;
  v11 = self;
  -[DetailCell traitCollectionDidChange:](&v19, "traitCollectionDidChange:", v10);
  v17 = v11;
  v12 = type metadata accessor for DetailCellTextStack(0);
  v13 = sub_4DD24(&qword_14B7230, type metadata accessor for DetailCellTextStack, (uint64_t)&unk_1065750);
  v14 = UIHostingConfiguration<>.init(content:)(sub_1D21AC, v16, v12, v13);
  v15 = static Edge.Set.all.getter(v14);
  v18[3] = v6;
  v18[4] = sub_5C150(&qword_14CE2B0, (uint64_t *)&unk_14CE2A0, (uint64_t)&protocol conformance descriptor for UIHostingConfiguration<A, B>);
  __swift_allocate_boxed_opaque_existential_1Tm(v18);
  UIHostingConfiguration.margins(_:_:)(v15, v6, 0.0);
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
  UICollectionViewCell.contentConfiguration.setter(v18);

}

- (void)music_inheritedLayoutInsetsDidChange
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _TtC16MusicApplication10DetailCell *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[16];
  _TtC16MusicApplication10DetailCell *v14;
  _QWORD v15[5];
  objc_super v16;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14CE2A0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16.receiver = self;
  v16.super_class = ObjectType;
  v8 = self;
  -[DetailCell music_inheritedLayoutInsetsDidChange](&v16, "music_inheritedLayoutInsetsDidChange");
  v14 = v8;
  v9 = type metadata accessor for DetailCellTextStack(0);
  v10 = sub_4DD24(&qword_14B7230, type metadata accessor for DetailCellTextStack, (uint64_t)&unk_1065750);
  v11 = UIHostingConfiguration<>.init(content:)(sub_1D21AC, v13, v9, v10);
  v12 = static Edge.Set.all.getter(v11);
  v15[3] = v4;
  v15[4] = sub_5C150(&qword_14CE2B0, (uint64_t *)&unk_14CE2A0, (uint64_t)&protocol conformance descriptor for UIHostingConfiguration<A, B>);
  __swift_allocate_boxed_opaque_existential_1Tm(v15);
  UIHostingConfiguration.margins(_:_:)(v12, v4, 0.0);
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  UICollectionViewCell.contentConfiguration.setter(v15);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication10DetailCell_footerAudioTraitDescriptions));
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication10DetailCell_releaseDate, (uint64_t *)&unk_14AD5F0);
  swift_bridgeObjectRelease(*(_QWORD *)&self->footerAudioTraitDescriptions[OBJC_IVAR____TtC16MusicApplication10DetailCell_trackCountAndDuration]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->footerAudioTraitDescriptions[OBJC_IVAR____TtC16MusicApplication10DetailCell_copyright]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication10DetailCell_recordLabelSelectionHandler), *(_QWORD *)&self->footerAudioTraitDescriptions[OBJC_IVAR____TtC16MusicApplication10DetailCell_recordLabelSelectionHandler]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication10DetailCell_recordLabels));
}

@end
