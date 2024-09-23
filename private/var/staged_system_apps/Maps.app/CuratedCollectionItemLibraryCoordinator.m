@implementation CuratedCollectionItemLibraryCoordinator

- (MKMapItem)initialMapItem
{
  return (MKMapItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_initialMapItem));
}

- (_TtC4Maps29LibraryDataOperationsProvider)dataOperationsProvider
{
  return (_TtC4Maps29LibraryDataOperationsProvider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                             + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_dataOperationsProvider));
}

- (_TtC4Maps39CuratedCollectionItemLibraryCoordinator)initWithInitialMapItem:(id)a3 dataOperationsProvider:(id)a4
{
  id v6;
  id v7;
  objc_super v9;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_placeItemInLibrary) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_isAddingToLibrary) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_initialMapItem) = (Class)a3;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_dataOperationsProvider) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CuratedCollectionItemLibraryCoordinator();
  v6 = a3;
  v7 = a4;
  return -[CuratedCollectionItemLibraryCoordinator init](&v9, "init");
}

- (BOOL)isPlaceInLibrary
{
  return (*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_isAddingToLibrary) & 1) != 0
      || *(Class *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_placeItemInLibrary) != 0;
}

- (void)determineSavedStateWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _TtC4Maps39CuratedCollectionItemLibraryCoordinator *v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1011A8550, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_initialMapItem);
  v7 = swift_allocObject(&unk_1011A8528, 24, 7);
  swift_unknownObjectWeakInit(v7 + 16);
  v8 = self;
  sub_1001B83A8(v6, v7, (void (*)(uint64_t))sub_1001A3920, v5);

  swift_release();
  swift_release();
}

- (void)addPlaceToLibraryWithRefinedMapItem:(id)a3
{
  id v4;
  _TtC4Maps39CuratedCollectionItemLibraryCoordinator *v5;

  v4 = a3;
  v5 = self;
  CuratedCollectionItemLibraryCoordinator.addPlaceToLibrary(refinedMapItem:)((MKMapItem)v4);

}

- (void)deletePlaceFromLibraryWithViewControllerForPresentingAlert:(id)a3
{
  id v4;
  _TtC4Maps39CuratedCollectionItemLibraryCoordinator *v5;

  v4 = a3;
  v5 = self;
  CuratedCollectionItemLibraryCoordinator.deletePlaceFromLibrary(viewControllerForPresentingAlert:)((UIViewController)v4);

}

- (_TtC4Maps39CuratedCollectionItemLibraryCoordinator)init
{
  _TtC4Maps39CuratedCollectionItemLibraryCoordinator *result;

  result = (_TtC4Maps39CuratedCollectionItemLibraryCoordinator *)_swift_stdlib_reportUnimplementedInitializer("Maps.CuratedCollectionItemLibraryCoordinator", 44, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_initialMapItem));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_dataOperationsProvider));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC4Maps39CuratedCollectionItemLibraryCoordinator_placeItemInLibrary));
}

@end
