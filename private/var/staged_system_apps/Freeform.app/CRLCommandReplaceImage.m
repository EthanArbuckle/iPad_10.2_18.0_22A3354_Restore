@implementation CRLCommandReplaceImage

- (NSUUID)id
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (_TtC8Freeform8CRLAsset)imageData
{
  return (_TtC8Freeform8CRLAsset *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                           + OBJC_IVAR____TtC8Freeform22CRLCommandReplaceImage_imageData));
}

- (_TtC8Freeform8CRLAsset)thumbnailData
{
  return (_TtC8Freeform8CRLAsset *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                           + OBJC_IVAR____TtC8Freeform22CRLCommandReplaceImage_thumbnailData));
}

- (_TtC8Freeform22CRLCommandReplaceImage)initWithId:(id)a3 imageData:(id)a4 thumbnailData:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  objc_class *v13;
  id v14;
  id v15;
  _TtC8Freeform22CRLCommandReplaceImage *v16;
  objc_super v18;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)self + OBJC_IVAR____TtC8Freeform22CRLCommandReplaceImage_id, v12, v9);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform22CRLCommandReplaceImage_imageData) = (Class)a4;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform22CRLCommandReplaceImage_thumbnailData) = (Class)a5;
  v13 = (objc_class *)type metadata accessor for CRLCommandReplaceImage(0);
  v18.receiver = self;
  v18.super_class = v13;
  v14 = a4;
  v15 = a5;
  v16 = -[CRLCommand init](&v18, "init");
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v16;
}

- (_TtC8Freeform22CRLCommandReplaceImage)initWithImageItem:(id)a3 imageData:(id)a4 thumbnailData:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(__n128);
  id v15;
  id v16;
  id v17;
  __n128 v18;
  Class isa;
  _TtC8Freeform22CRLCommandReplaceImage *v20;
  uint64_t v22;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)((char *)a3 + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v14 = *(void (**)(__n128))(*(_QWORD *)v13 + 256);
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = swift_retain(v13);
  v14(v18);
  swift_release(v13);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v20 = -[CRLCommandReplaceImage initWithId:imageData:thumbnailData:](self, "initWithId:imageData:thumbnailData:", isa, v16, v17);

  return v20;
}

- (_TtC8Freeform22CRLCommandReplaceImage)init
{
  _TtC8Freeform22CRLCommandReplaceImage *result;

  result = (_TtC8Freeform22CRLCommandReplaceImage *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandReplaceImage", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform22CRLCommandReplaceImage_id;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
