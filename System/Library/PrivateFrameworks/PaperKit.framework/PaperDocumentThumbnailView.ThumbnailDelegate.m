@implementation PaperDocumentThumbnailView.ThumbnailDelegate

- (void)didSelectPage
{
  void *v3;
  _TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate *v4;
  id v5;
  NSNotificationName v6;
  id v7;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  if (one-time initialization token for PaperKitPDFThumbnailViewDidSelectPageNotification != -1)
    swift_once();
  v6 = PaperKitPDFThumbnailViewDidSelectPageNotification;
  v7 = (id)MEMORY[0x1DF0E666C]((char *)v4 + OBJC_IVAR____TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate_thumbnailView);
  objc_msgSend(v5, sel_postNotificationName_object_, v6, v7);

}

- (id)menuElementsForPage:(id)a3
{
  id v4;
  _TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate *v5;
  uint64_t v6;
  NSArray v7;

  v4 = a3;
  v5 = self;
  v6 = PaperDocumentThumbnailView.ThumbnailDelegate.menuElements(for:)((uint64_t)v4, (uint64_t (*)(uint64_t))PaperDocumentView.menuElements(for:));

  if (v6)
  {
    type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIMenuElement);
    v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }
  return v7.super.isa;
}

- (void)handlePageOrderedCollectionDifference:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate *v13;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CollectionDifference<PDFPage>);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for PDFPage);
  static CollectionDifference._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate_thumbnailView);
  if (v9)
  {
    v10 = (void *)v9;
    v11 = v9 + OBJC_IVAR____TtC8PaperKit26PaperDocumentThumbnailView_documentView;
    swift_beginAccess();
    v12 = MEMORY[0x1DF0E666C](v11);
    v13 = self;

    if (v12)
    {
      PaperDocumentView.handlePageOrderedCollectionDifference(_:)();

      v13 = (_TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate *)v12;
    }

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)insertFileAtURL:(id)a3 atIndex:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  _TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate *v15;
  uint64_t v16;

  v8 = type metadata accessor for URL();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v13;
  v15 = self;
  PaperDocumentThumbnailView.ThumbnailDelegate.insertFile(at:at:completionHandler:)((uint64_t)v12, a4, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned UITargetedDragPreview) -> (), v14);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)registerFileRepresentationsForPage:(int64_t)a3 toItemProvider:(id)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate *v11;
  _TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate *v12;

  v7 = MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate_thumbnailView, a2);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = v7 + OBJC_IVAR____TtC8PaperKit26PaperDocumentThumbnailView_documentView;
    swift_beginAccess();
    v10 = MEMORY[0x1DF0E666C](v9);
    v11 = (_TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate *)a4;
    v12 = self;

    if (v10)
    {
      PaperDocumentView.registerFileRepresentations(forPage:to:)(a3, (NSItemProvider)v11);

      v11 = v12;
      v12 = (_TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate *)v10;
    }

  }
}

- (id)pasteActionForPage:(id)a3
{
  id v5;
  _TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate *v6;
  void *v7;

  v5 = a3;
  v6 = self;
  v7 = (void *)PaperDocumentThumbnailView.ThumbnailDelegate.menuElements(for:)((uint64_t)a3, (uint64_t (*)(uint64_t))PaperDocumentView.pasteAction(for:));

  return v7;
}

- (_TtCC8PaperKit26PaperDocumentThumbnailView17ThumbnailDelegate)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[PaperDocumentThumbnailView.ThumbnailDelegate init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
