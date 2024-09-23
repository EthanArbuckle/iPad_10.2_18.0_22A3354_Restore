@implementation DOCMetadataView

- (NSArray)nodes
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Files15DOCMetadataView_nodes);
  swift_bridgeObjectRetain(v2);
  sub_10006922C((uint64_t *)&unk_1006424B0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void)setNodes:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  _TtC5Files15DOCMetadataView *v8;

  v5 = sub_10006922C((uint64_t *)&unk_1006424B0);
  v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Files15DOCMetadataView_nodes);
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Files15DOCMetadataView_nodes) = v6;
  v8 = self;
  swift_bridgeObjectRelease(v7);
  sub_1003D26E8();

}

- (BOOL)showsItemLocation
{
  return *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Files15DOCMetadataView_showsItemLocation);
}

- (void)setShowsItemLocation:(BOOL)a3
{
  int v3;
  _TtC5Files15DOCMetadataView *v4;

  v3 = *((unsigned __int8 *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC5Files15DOCMetadataView_showsItemLocation);
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Files15DOCMetadataView_showsItemLocation) = a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_1003D26E8();

  }
}

- (BOOL)showsSeparators
{
  return *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Files15DOCMetadataView_showsSeparators);
}

- (void)setShowsSeparators:(BOOL)a3
{
  _TtC5Files15DOCMetadataView *v4;

  v4 = self;
  sub_1003D0CCC(a3);

}

- (double)columnWidth
{
  return *(double *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC5Files15DOCMetadataView_columnWidth);
}

- (void)setColumnWidth:(double)a3
{
  _TtC5Files15DOCMetadataView *v4;

  v4 = self;
  sub_1003D0E2C(a3);

}

+ (Class)layerClass
{
  uint64_t v2;

  v2 = sub_10004F2F0(0, &qword_100652BF8, CALayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (int64_t)levelOfDetail
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC5Files15DOCMetadataView_levelOfDetail);
}

- (void)setLevelOfDetail:(int64_t)a3
{
  uint64_t v3;
  _TtC5Files15DOCMetadataView *v4;

  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC5Files15DOCMetadataView_levelOfDetail);
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Files15DOCMetadataView_levelOfDetail) = (Class)a3;
  v4 = self;
  sub_1003D10C0(v3);

}

- (_TtC5Files15DOCMetadataView)init
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  char *v6;
  uint64_t ObjectType;

  if (qword_100641120 != -1)
    swift_once(&qword_100641120, sub_1003CE2F0);
  v3 = qword_100672D80;
  v4 = objc_allocWithZone((Class)type metadata accessor for DOCMetadataView());
  swift_bridgeObjectRetain(v3);
  v6 = sub_1003D12DC(v5, 0);
  ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, ObjectType, 98, 7);
  return (_TtC5Files15DOCMetadataView *)v6;
}

- (void)didMoveToWindow
{
  _TtC5Files15DOCMetadataView *v2;

  v2 = self;
  sub_1003D1570();

}

- (_TtC5Files15DOCMetadataView)initWithFrame:(CGRect)a3
{
  sub_100226BB0((uint64_t)self, (uint64_t)a2, (uint64_t)"Files.DOCMetadataView", 21);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files15DOCMetadataView_nodes));
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files15DOCMetadataView_metadataViewDelegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files15DOCMetadataView_initialMetadataKeys));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files15DOCMetadataView_metadataEntries));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files15DOCMetadataView_configuration));
}

@end
