@implementation ContainerDetailCompositionalLayout

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _TtC16MusicApplication34ContainerDetailCompositionalLayout *v10;
  Class isa;
  objc_class *v12;
  id v13;
  void (*v14)(id, char *, __n128);
  uint64_t v15;
  __n128 v16;
  objc_super v18;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = a3;
  v10 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v12 = (objc_class *)type metadata accessor for ContainerDetailCompositionalLayout();
  v18.receiver = v10;
  v18.super_class = v12;
  v13 = -[ContainerDetailCompositionalLayout layoutAttributesForItemAtIndexPath:](&v18, "layoutAttributesForItemAtIndexPath:", isa);

  v14 = *(void (**)(id, char *, __n128))((char *)&v10->super.super.super.isa
                                                  + OBJC_IVAR____TtC16MusicApplication34ContainerDetailCompositionalLayout_willLayoutAttributes);
  if (v14)
  {
    v15 = *(_QWORD *)&v10->willLayoutAttributes[OBJC_IVAR____TtC16MusicApplication34ContainerDetailCompositionalLayout_willLayoutAttributes];
    v16 = swift_retain();
    v14(v13, v8, v16);
    sub_5C198((uint64_t)v14, v15);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v13;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC16MusicApplication34ContainerDetailCompositionalLayout *v7;
  uint64_t v8;
  NSArray v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_ADDF94(x, y, width, height);

  if (v8)
  {
    sub_4E684(0, (unint64_t *)&qword_14B5940, UICollectionViewLayoutAttributes_ptr);
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  return v9.super.isa;
}

- (_TtC16MusicApplication34ContainerDetailCompositionalLayout)initWithSection:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication34ContainerDetailCompositionalLayout_willLayoutAttributes);
  v6 = (objc_class *)type metadata accessor for ContainerDetailCompositionalLayout();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[ContainerDetailCompositionalLayout initWithSection:](&v8, "initWithSection:", a3);
}

- (_TtC16MusicApplication34ContainerDetailCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  _QWORD *v7;
  objc_class *v8;
  objc_super v10;

  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication34ContainerDetailCompositionalLayout_willLayoutAttributes);
  v8 = (objc_class *)type metadata accessor for ContainerDetailCompositionalLayout();
  *v7 = 0;
  v7[1] = 0;
  v10.receiver = self;
  v10.super_class = v8;
  return -[ContainerDetailCompositionalLayout initWithSection:configuration:](&v10, "initWithSection:configuration:", a3, a4);
}

- (_TtC16MusicApplication34ContainerDetailCompositionalLayout)initWithSectionProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  _TtC16MusicApplication34ContainerDetailCompositionalLayout *v8;
  objc_super v10;
  _QWORD aBlock[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_139B0E0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication34ContainerDetailCompositionalLayout_willLayoutAttributes);
  *v6 = 0;
  v6[1] = 0;
  aBlock[4] = sub_AE3748;
  aBlock[5] = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_AD5E70;
  aBlock[3] = &block_descriptor_31_9;
  v7 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ContainerDetailCompositionalLayout();
  v8 = -[ContainerDetailCompositionalLayout initWithSectionProvider:](&v10, "initWithSectionProvider:", v7);
  swift_release();
  _Block_release(v7);
  return v8;
}

- (_TtC16MusicApplication34ContainerDetailCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  _TtC16MusicApplication34ContainerDetailCompositionalLayout *v11;
  objc_super v13;
  _QWORD aBlock[6];

  v6 = _Block_copy(a3);
  v7 = swift_allocObject(&unk_139B090, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication34ContainerDetailCompositionalLayout_willLayoutAttributes);
  *v8 = 0;
  v8[1] = 0;
  aBlock[4] = sub_AE3748;
  aBlock[5] = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_AD5E70;
  aBlock[3] = &block_descriptor_24_6;
  v9 = _Block_copy(aBlock);
  v10 = a4;
  swift_retain();
  swift_release();
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for ContainerDetailCompositionalLayout();
  v11 = -[ContainerDetailCompositionalLayout initWithSectionProvider:configuration:](&v13, "initWithSectionProvider:configuration:", v9, v10);
  swift_release();
  _Block_release(v9);

  return v11;
}

- (_TtC16MusicApplication34ContainerDetailCompositionalLayout)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC16MusicApplication34ContainerDetailCompositionalLayout *v6;
  objc_super v8;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication34ContainerDetailCompositionalLayout_willLayoutAttributes);
  *v4 = 0;
  v4[1] = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ContainerDetailCompositionalLayout();
  v5 = a3;
  v6 = -[ContainerDetailCompositionalLayout initWithCoder:](&v8, "initWithCoder:", v5);

  return v6;
}

- (_TtC16MusicApplication34ContainerDetailCompositionalLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _TtC16MusicApplication34ContainerDetailCompositionalLayout *v11;

  v7 = _Block_copy(a4);
  if (v7)
  {
    v8 = swift_allocObject(&unk_139B040, 24, 7);
    *(_QWORD *)(v8 + 16) = v7;
    v7 = sub_AE2624;
  }
  else
  {
    v8 = 0;
  }
  v9 = a3;
  v10 = a5;
  v11 = (_TtC16MusicApplication34ContainerDetailCompositionalLayout *)sub_AE250C((uint64_t)a3, (uint64_t)v7, v8, (uint64_t)v10);

  return v11;
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication34ContainerDetailCompositionalLayout_willLayoutAttributes), *(_QWORD *)&self->willLayoutAttributes[OBJC_IVAR____TtC16MusicApplication34ContainerDetailCompositionalLayout_willLayoutAttributes]);
}

@end
