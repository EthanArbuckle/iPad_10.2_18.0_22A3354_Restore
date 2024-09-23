@implementation CRLiOSFindSession

- (void)dealloc
{
  void *v2;
  _TtC8Freeform17CRLiOSFindSession *v3;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform17CRLiOSFindSession_findReplaceController);
  v3 = self;
  v4 = objc_msgSend(v2, "findReplaceDelegate");
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "interactiveCanvasControllerForFindController:", v2);
    objc_msgSend(v6, "setShowGrayOverlay:", 0, swift_unknownObjectRelease(v5).n128_f64[0]);

  }
  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for CRLiOSFindSession();
  -[CRLiOSFindSession dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform17CRLiOSFindSession_findReplaceController));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform17CRLiOSFindSession_findInteraction);
}

- (int64_t)resultCount
{
  _TtC8Freeform17CRLiOSFindSession *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_100BE9FFC();
  v4 = v3;

  return v4;
}

- (int64_t)highlightedResultIndex
{
  void *v2;
  _TtC8Freeform17CRLiOSFindSession *v3;
  int64_t result;
  int64_t v5;
  int64_t v6;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform17CRLiOSFindSession_findReplaceController);
  v3 = self;
  result = (int64_t)objc_msgSend(v2, "findResultIndex");
  if (result)
  {
    v5 = result;

    result = v5 - 1;
    if (v5 - 1 >= 0)
      return result;
    __break(1u);
  }
  v6 = NSNotFound.getter(result);

  return v6;
}

- (void)highlightNextResultInDirection:(int64_t)a3
{
  _TtC8Freeform17CRLiOSFindSession *v4;

  v4 = self;
  sub_100BEA11C(a3);

}

- (void)invalidateFoundResults
{
  _TtC8Freeform17CRLiOSFindSession *v2;

  v2 = self;
  sub_100BEA1E4();

}

- (void)performSearchWithQuery:(id)a3 options:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC8Freeform17CRLiOSFindSession *v11;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v9 = v8;
  v10 = a4;
  v11 = self;
  sub_100BEA30C(v7, v9, a4);

  swift_bridgeObjectRelease();
}

- (BOOL)supportsReplacement
{
  _TtC8Freeform17CRLiOSFindSession *v2;
  char v3;

  v2 = self;
  v3 = sub_100BEA464();

  return v3 & 1;
}

- (BOOL)allowsReplacementForCurrentlyHighlightedResult
{
  void *v2;
  _TtC8Freeform17CRLiOSFindSession *v3;
  id v4;
  id v5;
  unsigned __int8 v6;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform17CRLiOSFindSession_findReplaceController);
  v3 = self;
  v4 = objc_msgSend(v2, "primaryFindResultSearchReference");
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "isReplaceable");

    swift_unknownObjectRelease(v5);
    return v6;
  }
  else
  {

    return 0;
  }
}

- (void)performSingleReplacementWithSearchQuery:(id)a3 replacementString:(id)a4 options:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _TtC8Freeform17CRLiOSFindSession *v11;
  id v12;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform17CRLiOSFindSession_findReplaceController);
  v10 = a5;
  v11 = self;
  v12 = String._bridgeToObjectiveC()();
  objc_msgSend(v9, "replaceWithString:findAgain:", v12, 0);

  swift_bridgeObjectRelease(v8);
}

- (void)replaceAllInstancesOfSearchQuery:(id)a3 withReplacementString:(id)a4 options:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _TtC8Freeform17CRLiOSFindSession *v14;
  NSString v15;
  id v16;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  v12 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform17CRLiOSFindSession_findReplaceController);
  v13 = a5;
  v14 = self;
  v15 = String._bridgeToObjectiveC()();
  v16 = String._bridgeToObjectiveC()();
  objc_msgSend(v12, "replaceAllOccurrencesOfString:withString:", v15, v16);

  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v11);

}

- (_TtC8Freeform17CRLiOSFindSession)init
{
  _TtC8Freeform17CRLiOSFindSession *result;

  result = (_TtC8Freeform17CRLiOSFindSession *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSFindSession", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
