@implementation AnnotationProviderService

- (_TtC5Books25AnnotationProviderService)init
{
  _TtC5Books25AnnotationProviderService *result;

  result = (_TtC5Books25AnnotationProviderService *)_swift_stdlib_reportUnimplementedInitializer("Books.AnnotationProviderService", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books25AnnotationProviderService_annotationMOCHost);
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.isa
                                          + OBJC_IVAR____TtC5Books25AnnotationProviderService_bookEntity));

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books25AnnotationProviderService_annotationModifier));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Books25AnnotationProviderService_engagementManager);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC5Books25AnnotationProviderService_analyticsProvider);
  v3 = (char *)self + OBJC_IVAR____TtC5Books25AnnotationProviderService__bookAnnotationEntity;
  v4 = sub_10004CFD4(&qword_1009EA0C0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Books25AnnotationProviderService_annotationsChangeSubject));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Books25AnnotationProviderService_bookmarkChangeSubject));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Books25AnnotationProviderService_highlightChangeSubject));
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  _TtC5Books25AnnotationProviderService *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];

  v13 = sub_10004CFD4((uint64_t *)&unk_1009DE3E0);
  __chkstk_darwin(v13);
  v15 = (char *)v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v18 = (char *)v28 - v17;
  v19 = a3;
  swift_unknownObjectRetain(a4);
  v20 = self;
  v21 = a5;
  v22 = a7;
  _bridgeAnyObjectToAny(_:)(a4);
  swift_unknownObjectRelease(a4);
  if (v21)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(v21);

    v23 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v18, 0, 1, v23);
  }
  else
  {
    v24 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v18, 1, 1, v24);
  }
  if (v22)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a7);

    v25 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v15, 0, 1, v25);
  }
  else
  {
    v27 = type metadata accessor for IndexPath(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v15, 1, 1, v27);
  }
  AnnotationProviderService.controller(_:didChange:at:for:newIndexPath:)(v19, (uint64_t)v28, v26, a6);

  sub_100010960((uint64_t)v15, (uint64_t *)&unk_1009DE3E0);
  sub_100010960((uint64_t)v18, (uint64_t *)&unk_1009DE3E0);
  _s5Books15CurrentPageViewVwxx_0(v28);
}

@end
