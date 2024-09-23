@implementation ICSystemPaperChromeLayerGenerator

- (id)generateChromeThumbnailsWithError:(id *)a3
{
  _TtC11MobileNotes33ICSystemPaperChromeLayerGenerator *v3;
  uint64_t v4;
  _TtC11MobileNotes33ICSystemPaperChromeLayerGenerator *v5;
  uint64_t v6;
  Class isa;

  v3 = self;
  v4 = sub_1001CBD10();
  v5 = v3;
  v6 = sub_1001CCB2C(v4);
  swift_bridgeObjectRelease(v4);

  type metadata accessor for URL(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

- (_TtC11MobileNotes33ICSystemPaperChromeLayerGenerator)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC11MobileNotes33ICSystemPaperChromeLayerGenerator____lazy_storage___chromeLayerTraitCollections) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[ICSystemPaperChromeLayerGenerator init](&v5, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11MobileNotes33ICSystemPaperChromeLayerGenerator____lazy_storage___chromeLayerTraitCollections));
}

@end
