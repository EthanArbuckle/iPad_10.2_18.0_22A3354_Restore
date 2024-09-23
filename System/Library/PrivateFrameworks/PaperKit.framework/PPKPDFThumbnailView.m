@implementation PPKPDFThumbnailView

- (_TtC8PaperKit19PPKPDFThumbnailView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PPKPDFThumbnailView();
  return -[PPKPDFThumbnailViewBase initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC8PaperKit19PPKPDFThumbnailView)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PPKPDFThumbnailView();
  return -[PPKPDFThumbnailView initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
