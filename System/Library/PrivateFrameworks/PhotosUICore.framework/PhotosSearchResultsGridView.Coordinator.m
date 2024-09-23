@implementation PhotosSearchResultsGridView.Coordinator

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  _TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1A6E537B4(v8);

}

- (void)photosViewController:(id)a3 scrollViewControllerWillBeginScrolling:(id)a4
{
  sub_1A6847920(0, &qword_1EE8D8540, MEMORY[0x1E0DEAFA0], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0CDFDB8]);
  sub_1A7AE2F24();
}

- (void)photosViewController:(id)a3 didReceiveUserInteraction:(BOOL)a4
{
  sub_1A6847920(0, &qword_1EE8D8540, MEMORY[0x1E0DEAFA0], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0CDFDB8]);
  sub_1A7AE2F24();
}

- (void)photosViewController:(id)a3 didPresentOneUp:(BOOL)a4 forAsset:(id)a5
{
  id v7;
  _TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator *v8;

  swift_unknownObjectRetain();
  v7 = a5;
  v8 = self;
  sub_1A6E538B8(v7);
  swift_unknownObjectRelease();

}

- (id)photosViewController:(id)a3 animationForProposedAnimation:(id)a4
{
  void *ObjCClassFromMetadata;
  id v7;
  _TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator *v8;
  id v9;
  unsigned __int8 v10;

  sub_1A6856488(0, (unint64_t *)&qword_1EE8C4360);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  swift_unknownObjectRetain();
  v7 = a4;
  v8 = self;
  v9 = objc_msgSend(ObjCClassFromMetadata, sel_sharedInstance);
  v10 = objc_msgSend(v9, sel_enableSearchResultDiffAnimation);

  if ((v10 & 1) == 0)
  {

    v7 = 0;
  }

  swift_unknownObjectRelease();
  return v7;
}

- (void)viewController:(id)a3 didUpdateBarsAnimated:(BOOL)a4 isSelecting:(BOOL)a5
{
  id v6;
  _TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator *v7;

  v6 = a3;
  v7 = self;
  sub_1A6E53D70((uint64_t)v6);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  _TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator *v9;
  _QWORD v10[6];

  sub_1A7AE3B9C();
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = self;
  v8 = a3;
  v9 = self;
  sub_1A69C9194(sub_1A6E55D1C, (uint64_t)v10);

}

- (_TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator)init
{
  _TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator *result;

  result = (_TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A67EC0B0((uint64_t)self + OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_parent, type metadata accessor for PhotosSearchResultsGridView);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_dataSourceManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_bodyLayoutProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_viewOptionsModel));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_collectionResultCollection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_topResultCollection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_allResultCollection));
  sub_1A67EC0B0((uint64_t)self + OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_container, (uint64_t (*)(_QWORD))sub_1A6E4F6F4);
  sub_1A694CA34(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_searchResults), *(_QWORD *)&self->_anon_0[OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_searchResults], *(_QWORD *)&self->dataSourceManager[OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_searchResults], *(_QWORD *)&self->bodyLayoutProvider[OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_searchResults], *(_QWORD *)&self->viewOptionsModel[OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_searchResults], *(void **)&self->toolbarModel[OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_searchResults], *(_QWORD *)&self->collectionResultCollection[OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_searchResults], *(void **)&self->topResultCollection[OBJC_IVAR____TtCV12PhotosUICore27PhotosSearchResultsGridView11Coordinator_searchResults]);
}

@end
