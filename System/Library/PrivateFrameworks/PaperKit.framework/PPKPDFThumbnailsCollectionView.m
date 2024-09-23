@implementation PPKPDFThumbnailsCollectionView

- (void)updateImageForCell:(id)a3 indexPath:(id)a4 page:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  PPKPDFThumbnailsCollectionView *v15;
  uint64_t v16;

  v8 = type metadata accessor for IndexPath();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = a3;
  v14 = a5;
  v15 = self;
  specialized PPKPDFThumbnailsCollectionView.getImage(forCell:indexPath:page:completion:)((uint64_t)a3, (uint64_t)v12, v14, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)reloadPage:(id)a3
{
  PDFPage *v4;
  PPKPDFThumbnailsCollectionView *v5;

  v4 = (PDFPage *)a3;
  v5 = self;
  PPKPDFThumbnailsCollectionView.reload(_:)(v4);

}

- (id)initFromThumbnailView:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PPKPDFThumbnailsCollectionView();
  return -[PPKPDFThumbnailsCollectionViewBase initFromThumbnailView:](&v5, sel_initFromThumbnailView_, a3);
}

- (PPKPDFThumbnailsCollectionView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PPKPDFThumbnailsCollectionView();
  return -[PPKPDFThumbnailsCollectionView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (PPKPDFThumbnailsCollectionView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PPKPDFThumbnailsCollectionView();
  return -[PPKPDFThumbnailsCollectionView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
