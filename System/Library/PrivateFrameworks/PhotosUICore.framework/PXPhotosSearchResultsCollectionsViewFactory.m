@implementation PXPhotosSearchResultsCollectionsViewFactory

+ (id)createViewWithCollectionSectionProvider:(id)a3 hostViewController:(id)a4 containerInfo:(id)a5 viewDelegate:(id)a6 selectionDelegate:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v13 = (void *)sub_1A6B6AC44(v10, a4, v12, (uint64_t)a6);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v13;
}

- (PXPhotosSearchResultsCollectionsViewFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosSearchResultsCollectionsViewFactory();
  return -[PXPhotosSearchResultsCollectionsViewFactory init](&v3, sel_init);
}

@end
