@implementation PaperDocumentThumbnailView

- (_TtC8PaperKit26PaperDocumentThumbnailView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  char *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = objc_allocWithZone((Class)type metadata accessor for PaperDocumentThumbnailView());
  v8 = PaperDocumentThumbnailView.init(frame:supportsLargeThumbnails:)(0, x, y, width, height);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC8PaperKit26PaperDocumentThumbnailView *)v8;
}

- (_TtC8PaperKit26PaperDocumentThumbnailView)initWithCoder:(id)a3
{
  id v5;
  _TtC8PaperKit26PaperDocumentThumbnailView *result;

  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit26PaperDocumentThumbnailView_thumbnailLayout) = 1;
  v5 = a3;

  result = (_TtC8PaperKit26PaperDocumentThumbnailView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26PaperDocumentThumbnailView_thumbnailDelegate));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26PaperDocumentThumbnailView_pdfThumbnailView));
  swift_unknownObjectWeakDestroy();
}

@end
