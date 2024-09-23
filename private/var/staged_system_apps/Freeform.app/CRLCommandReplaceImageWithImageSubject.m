@implementation CRLCommandReplaceImageWithImageSubject

- (BOOL)isBackgroundRemoved
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR____TtC8Freeform38CRLCommandReplaceImageWithImageSubject_isBackgroundRemoved);
}

- (_TtC8Freeform38CRLCommandReplaceImageWithImageSubject)initWithId:(id)a3 imageData:(id)a4 isBackgroundRemoved:(BOOL)a5 thumbnailData:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, char *, uint64_t);
  objc_class *v19;
  id v20;
  id v21;
  _TtC8Freeform38CRLCommandReplaceImageWithImageSubject *v22;
  void (*v23)(char *, uint64_t);
  objc_super v25;

  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v17 = (char *)&v25 - v16;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8Freeform38CRLCommandReplaceImageWithImageSubject_isBackgroundRemoved) = a5;
  v18 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v18(v14, v17, v11);
  v18((char *)self + OBJC_IVAR____TtC8Freeform22CRLCommandReplaceImage_id, v14, v11);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform22CRLCommandReplaceImage_imageData) = (Class)a4;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform22CRLCommandReplaceImage_thumbnailData) = (Class)a6;
  v19 = (objc_class *)type metadata accessor for CRLCommandReplaceImage(0);
  v25.receiver = self;
  v25.super_class = v19;
  v20 = a4;
  v21 = a6;
  v22 = -[CRLCommandReplaceImage init](&v25, "init");
  v23 = *(void (**)(char *, uint64_t))(v12 + 8);
  v23(v14, v11);
  v23(v17, v11);
  return v22;
}

- (_TtC8Freeform38CRLCommandReplaceImageWithImageSubject)initWithImageItem:(id)a3 imageData:(id)a4 isBackgroundRemoved:(BOOL)a5 thumbnailData:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(__n128);
  id v16;
  id v17;
  id v18;
  __n128 v19;
  Class isa;
  _TtC8Freeform38CRLCommandReplaceImageWithImageSubject *v21;
  uint64_t v23;
  _BOOL4 v24;

  v24 = a5;
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)((char *)a3 + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  v15 = *(void (**)(__n128))(*(_QWORD *)v14 + 256);
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = swift_retain(v14);
  v15(v19);
  swift_release(v14);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v21 = -[CRLCommandReplaceImageWithImageSubject initWithId:imageData:isBackgroundRemoved:thumbnailData:](self, "initWithId:imageData:isBackgroundRemoved:thumbnailData:", isa, v17, v24, v18);

  return v21;
}

- (_TtC8Freeform38CRLCommandReplaceImageWithImageSubject)initWithImageItem:(id)a3 imageData:(id)a4 thumbnailData:(id)a5
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
  _TtC8Freeform38CRLCommandReplaceImageWithImageSubject *v20;
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
  v20 = -[CRLCommandReplaceImageWithImageSubject initWithId:imageData:isBackgroundRemoved:thumbnailData:](self, "initWithId:imageData:isBackgroundRemoved:thumbnailData:", isa, v16, 0, v17);

  return v20;
}

- (_TtC8Freeform38CRLCommandReplaceImageWithImageSubject)initWithId:(id)a3 imageData:(id)a4 thumbnailData:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  _TtC8Freeform38CRLCommandReplaceImageWithImageSubject *result;

  v8 = type metadata accessor for UUID(0);
  __chkstk_darwin(v8);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = a4;
  v10 = a5;
  result = (_TtC8Freeform38CRLCommandReplaceImageWithImageSubject *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandReplaceImageWithImageSubject", 47, "init(id:imageData:thumbnailData:)", 33, 0);
  __break(1u);
  return result;
}

@end
