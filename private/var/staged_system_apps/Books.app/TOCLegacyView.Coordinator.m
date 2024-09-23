@implementation TOCLegacyView.Coordinator

- (void)directoryContent:(id)a3 didSelectBookmarkForLocation:(id)a4 annotationUUID:(id)a5
{
  sub_1005B7898(self, (uint64_t)a2, a3, a4, (uint64_t)a5, 0);
}

- (void)directoryContent:(id)a3 didSelectHighlightForLocation:(id)a4 annotationUUID:(id)a5
{
  sub_1005B7898(self, (uint64_t)a2, a3, a4, (uint64_t)a5, 1);
}

- (int64_t)directoryContent:(id)a3 pageNumberForLocation:(id)a4
{
  id v6;
  id v7;
  _TtCV5Books13TOCLegacyView11Coordinator *v8;
  int64_t v9;
  int64_t v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1005B951C(v7);
  v10 = v9;

  return v10;
}

- (id)directoryContent:(id)a3 locationForPageNumber:(int64_t)a4
{
  void **v7;
  __n128 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtCV5Books13TOCLegacyView11Coordinator *v13;
  id v14;
  void *v15;
  _BYTE v17[24];

  v7 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtCV5Books13TOCLegacyView11Coordinator_parent);
  v8 = swift_beginAccess((char *)self + OBJC_IVAR____TtCV5Books13TOCLegacyView11Coordinator_parent, v17, 0, 0);
  v9 = *v7;
  v10 = *(_QWORD *)(*(_QWORD *)((char *)*v7 + OBJC_IVAR____TtC5Books19BookReaderPresenter_interactor) + 96);
  v11 = type metadata accessor for PaginatingService(0, v8);
  if (!swift_dynamicCastClass(v10, v11))
    return 0;
  v12 = a3;
  v13 = self;
  v14 = v9;
  swift_unknownObjectRetain(v10);
  v15 = (void *)sub_100436E4C(a4);

  swift_unknownObjectRelease(v10);
  return v15;
}

- (void)tocViewController:(id)a3 didSelectChapter:(id)a4
{
  id v7;
  _TtCV5Books13TOCLegacyView11Coordinator *v8;

  swift_unknownObjectRetain(a3);
  v7 = a4;
  v8 = self;
  sub_1005B9A3C(a4);
  swift_unknownObjectRelease(a3);

}

- (id)tocViewController:(id)a3 pageTitleForChapter:(id)a4
{
  return sub_1005B7AF4(self, (uint64_t)a2, a3, a4, (void (*)(void *))sub_1005B9B30);
}

- (id)tocViewController:(id)a3 pageTitleForAnnotation:(id)a4
{
  return sub_1005B7AF4(self, (uint64_t)a2, a3, a4, (void (*)(void *))sub_1005B9C58);
}

- (id)tocViewController:(id)a3 chapterTitleForAnnotation:(id)a4
{
  return sub_1005B7AF4(self, (uint64_t)a2, a3, a4, (void (*)(void *))sub_1005B9DF4);
}

- (int64_t)tocViewController:(id)a3 pageNumberForAnnotation:(id)a4
{
  id v6;
  id v7;
  _TtCV5Books13TOCLegacyView11Coordinator *v8;
  int64_t v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1005B9EC8(a4);

  return v9;
}

- (int64_t)tocViewController:(id)a3 pageNumberForChapter:(id)a4
{
  id v6;
  id v7;
  _TtCV5Books13TOCLegacyView11Coordinator *v8;
  int64_t v9;
  int64_t v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1005BA054(a4);
  v10 = v9;

  return v10;
}

- (void)tocViewController:(id)a3 shareAnnotations:(id)a4 sourceView:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(uint64_t, char *);
  id v18;
  id v19;
  _TtCV5Books13TOCLegacyView11Coordinator *v20;
  __n128 v21;
  __n128 v22;
  _BYTE v24[24];

  v9 = sub_10004CFD4((uint64_t *)&unk_1009E7640);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = &v24[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v13 = sub_100009E04(0, &qword_1009E6E28, AEAnnotation_ptr);
  v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v13);
  v15 = (char *)self + OBJC_IVAR____TtCV5Books13TOCLegacyView11Coordinator_parent;
  swift_beginAccess((char *)self + OBJC_IVAR____TtCV5Books13TOCLegacyView11Coordinator_parent, v24, 0, 0);
  v17 = (void (*)(uint64_t, char *))*((_QWORD *)v15 + 9);
  v16 = *((_QWORD *)v15 + 10);
  v18 = a3;
  v19 = a5;
  v20 = self;
  v21 = swift_retain(v16);
  static RelativeValue<>.bounds(of:)(v19, v21);
  v17(v14, v12);
  v22 = swift_release(v16);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v22);

  swift_bridgeObjectRelease(v14);
}

- (id)tocViewControllerTocIdCssRules:(id)a3
{
  void **v5;
  void *v6;
  uint64_t v7;
  uint64_t ObjectType;
  _TtCV5Books13TOCLegacyView11Coordinator *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString v15;
  _BYTE v17[24];

  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtCV5Books13TOCLegacyView11Coordinator_parent);
  swift_beginAccess((char *)self + OBJC_IVAR____TtCV5Books13TOCLegacyView11Coordinator_parent, v17, 0, 0);
  v6 = *v5;
  v7 = *(_QWORD *)(*(_QWORD *)((char *)*v5 + OBJC_IVAR____TtC5Books19BookReaderPresenter_interactor) + 104);
  ObjectType = swift_getObjectType();
  v9 = self;
  v10 = v6;
  v11 = a3;
  v12 = dispatch thunk of Paginating.bookPaginationEntity.getter(ObjectType, v7);
  dispatch thunk of BookPaginationEntity.tocIdCssRules.getter();
  v14 = v13;

  swift_release(v12);
  if (!v14)
    return 0;
  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14);
  return v15;
}

- (id)tocViewControllerCurrentLocation:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  id v9;
  _TtCV5Books13TOCLegacyView11Coordinator *v10;
  id v11;
  _BYTE v14[24];

  v5 = type metadata accessor for TOCLegacyView(0);
  __chkstk_darwin(v5);
  v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = (char *)self + OBJC_IVAR____TtCV5Books13TOCLegacyView11Coordinator_parent;
  swift_beginAccess((char *)self + OBJC_IVAR____TtCV5Books13TOCLegacyView11Coordinator_parent, v14, 0, 0);
  sub_100397954((uint64_t)v8, (uint64_t)v7);
  v9 = a3;
  v10 = self;
  v11 = sub_1005B6A48();
  sub_100397998((uint64_t)v7);

  return v11;
}

- (void)tocViewController:(id)a3 willTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
  _TtCV5Books13TOCLegacyView11Coordinator *v8;

  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a5);
  v8 = self;
  sub_1005BA418((uint64_t)a3, a5);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a5);

}

- (void)tocViewControllerContentDidChange:(id)a3
{
  id v4;
  _TtCV5Books13TOCLegacyView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1005BA51C();

}

- (void)tocViewControllerDidChangeEditing:(BOOL)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _TtCV5Books13TOCLegacyView11Coordinator *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  _BYTE v19[24];

  v5 = type metadata accessor for TOCLegacyView(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (char *)self + OBJC_IVAR____TtCV5Books13TOCLegacyView11Coordinator_parent;
  swift_beginAccess((char *)self + OBJC_IVAR____TtCV5Books13TOCLegacyView11Coordinator_parent, v19, 0, 0);
  sub_100397954((uint64_t)v8, (uint64_t)v7);
  v9 = &v7[*(int *)(v5 + 60)];
  v10 = *(_QWORD *)v9;
  v11 = *((_QWORD *)v9 + 1);
  LOBYTE(v9) = v9[16];
  v16 = v10;
  v17 = v11;
  v18 = (char)v9;
  v15 = a3;
  v12 = self;
  v13 = sub_10004CFD4(&qword_1009EE730);
  Binding.wrappedValue.setter(&v15, v13);
  sub_100397998((uint64_t)v7);

}

- (_TtCV5Books13TOCLegacyView11Coordinator)init
{
  _TtCV5Books13TOCLegacyView11Coordinator *result;

  result = (_TtCV5Books13TOCLegacyView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer("Books.Coordinator", 17, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100397998((uint64_t)self + OBJC_IVAR____TtCV5Books13TOCLegacyView11Coordinator_parent);
}

@end
