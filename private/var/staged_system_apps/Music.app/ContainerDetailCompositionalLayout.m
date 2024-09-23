@implementation ContainerDetailCompositionalLayout

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC5Music34ContainerDetailCompositionalLayout *v9;
  Class isa;
  objc_class *v11;
  id v12;
  void (*v13)(id, char *, __n128);
  uint64_t v14;
  __n128 v15;
  objc_super v17;

  v5 = type metadata accessor for IndexPath(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v11 = (objc_class *)type metadata accessor for ContainerDetailCompositionalLayout();
  v17.receiver = v9;
  v17.super_class = v11;
  v12 = -[ContainerDetailCompositionalLayout layoutAttributesForItemAtIndexPath:](&v17, "layoutAttributesForItemAtIndexPath:", isa);

  v13 = *(void (**)(id, char *, __n128))((char *)&v9->super.super.super.isa
                                                  + OBJC_IVAR____TtC5Music34ContainerDetailCompositionalLayout_willLayoutAttributes);
  if (v13)
  {
    v14 = *(_QWORD *)&v9->willLayoutAttributes[OBJC_IVAR____TtC5Music34ContainerDetailCompositionalLayout_willLayoutAttributes];
    v15 = swift_retain();
    v13(v12, v8, v15);
    sub_10004BA30((uint64_t)v13, v14);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v12;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC5Music34ContainerDetailCompositionalLayout *v7;
  uint64_t v8;
  NSArray v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_1007165F4(x, y, width, height);

  if (v8)
  {
    sub_10004A07C(0, (unint64_t *)&qword_1011BA810, UICollectionViewLayoutAttributes_ptr);
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  return v9.super.isa;
}

- (_TtC5Music34ContainerDetailCompositionalLayout)initWithSection:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5Music34ContainerDetailCompositionalLayout_willLayoutAttributes);
  v6 = (objc_class *)type metadata accessor for ContainerDetailCompositionalLayout();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[ContainerDetailCompositionalLayout initWithSection:](&v8, "initWithSection:", a3);
}

- (_TtC5Music34ContainerDetailCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  _QWORD *v7;
  objc_class *v8;
  objc_super v10;

  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5Music34ContainerDetailCompositionalLayout_willLayoutAttributes);
  v8 = (objc_class *)type metadata accessor for ContainerDetailCompositionalLayout();
  *v7 = 0;
  v7[1] = 0;
  v10.receiver = self;
  v10.super_class = v8;
  return -[ContainerDetailCompositionalLayout initWithSection:configuration:](&v10, "initWithSection:configuration:", a3, a4);
}

- (_TtC5Music34ContainerDetailCompositionalLayout)initWithSectionProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  _TtC5Music34ContainerDetailCompositionalLayout *v8;
  objc_super v10;
  _QWORD aBlock[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1010D8578, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5Music34ContainerDetailCompositionalLayout_willLayoutAttributes);
  *v6 = 0;
  v6[1] = 0;
  aBlock[4] = sub_10071CC60;
  aBlock[5] = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1008E31AC;
  aBlock[3] = &unk_1010D8590;
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

- (_TtC5Music34ContainerDetailCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  _TtC5Music34ContainerDetailCompositionalLayout *v11;
  objc_super v13;
  _QWORD aBlock[6];

  v6 = _Block_copy(a3);
  v7 = swift_allocObject(&unk_1010D8528, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5Music34ContainerDetailCompositionalLayout_willLayoutAttributes);
  *v8 = 0;
  v8[1] = 0;
  aBlock[4] = sub_10071CC60;
  aBlock[5] = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1008E31AC;
  aBlock[3] = &unk_1010D8540;
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

- (_TtC5Music34ContainerDetailCompositionalLayout)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5Music34ContainerDetailCompositionalLayout_willLayoutAttributes);
  v6 = (objc_class *)type metadata accessor for ContainerDetailCompositionalLayout();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[ContainerDetailCompositionalLayout initWithCoder:](&v8, "initWithCoder:", a3);
}

- (_TtC5Music34ContainerDetailCompositionalLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;

  v7 = _Block_copy(a4);
  if (v7)
  {
    v8 = swift_allocObject(&unk_1010D84D8, 24, 7);
    *(_QWORD *)(v8 + 16) = v7;
    v7 = sub_100719300;
  }
  else
  {
    v8 = 0;
  }
  v9 = a3;
  return (_TtC5Music34ContainerDetailCompositionalLayout *)sub_100716BD0(a3, (uint64_t)v7, v8, a5);
}

- (void).cxx_destruct
{
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC5Music34ContainerDetailCompositionalLayout_willLayoutAttributes), *(_QWORD *)&self->willLayoutAttributes[OBJC_IVAR____TtC5Music34ContainerDetailCompositionalLayout_willLayoutAttributes]);
}

@end
