@implementation CRLCommandSetMoviePosterTime

- (NSUUID)id
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (_TtC8Freeform8CRLAsset)movieData
{
  return (_TtC8Freeform8CRLAsset *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                           + OBJC_IVAR____TtC8Freeform28CRLCommandSetMoviePosterTime_movieData));
}

- (_TtC8Freeform8CRLAsset)posterImageData
{
  return (_TtC8Freeform8CRLAsset *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                           + OBJC_IVAR____TtC8Freeform28CRLCommandSetMoviePosterTime_posterImageData));
}

- (double)posterTime
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform28CRLCommandSetMoviePosterTime_posterTime);
}

- (double)startTime
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform28CRLCommandSetMoviePosterTime_startTime);
}

- (double)endTime
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform28CRLCommandSetMoviePosterTime_endTime);
}

- (NSString)title
{
  return (NSString *)sub_1006048E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform28CRLCommandSetMoviePosterTime_title);
}

- (NSString)creator
{
  return (NSString *)sub_1006048E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform28CRLCommandSetMoviePosterTime_creator);
}

- (_TtC8Freeform28CRLCommandSetMoviePosterTime)initWithId:(id)a3 movieData:(id)a4 posterImageData:(id)a5 posterTime:(double)a6 startTime:(double)a7 endTime:(double)a8 title:(id)a9 creator:(id)a10
{
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v28;

  v18 = type metadata accessor for UUID(0);
  __chkstk_darwin(v18);
  v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (!a9)
  {
    v22 = 0;
    if (a10)
      goto LABEL_3;
LABEL_5:
    v24 = 0;
    goto LABEL_6;
  }
  a9 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a9);
  v22 = v21;
  if (!a10)
    goto LABEL_5;
LABEL_3:
  a10 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a10);
  v24 = v23;
LABEL_6:
  v25 = a4;
  v26 = a5;
  return (_TtC8Freeform28CRLCommandSetMoviePosterTime *)sub_1006049DC((uint64_t)v20, v25, a5, (uint64_t)a9, v22, (uint64_t)a10, v24, a6, a7, a8);
}

- (_TtC8Freeform28CRLCommandSetMoviePosterTime)initWithMovieItem:(id)a3 movieData:(id)a4 posterImageData:(id)a5 posterTime:(double)a6 startTime:(double)a7 endTime:(double)a8 title:(id)a9 creator:(id)a10
{
  id v10;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  id v23;
  id v24;

  v10 = a10;
  if (!a9)
  {
    v17 = 0;
    v19 = 0;
    if (a10)
      goto LABEL_3;
LABEL_5:
    v21 = 0;
    goto LABEL_6;
  }
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a9);
  v19 = v18;
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v10 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  v21 = v20;
LABEL_6:
  v22 = (char *)a3;
  v23 = a4;
  v24 = a5;
  return (_TtC8Freeform28CRLCommandSetMoviePosterTime *)sub_100604D30(v22, v23, a5, v17, v19, (uint64_t)v10, v21, a6, a7, a8);
}

- (_TtC8Freeform28CRLCommandSetMoviePosterTime)init
{
  _TtC8Freeform28CRLCommandSetMoviePosterTime *result;

  result = (_TtC8Freeform28CRLCommandSetMoviePosterTime *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandSetMoviePosterTime", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform28CRLCommandSetMoviePosterTime_id;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLCommandSetMoviePosterTime_posterImageData));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.committed[OBJC_IVAR____TtC8Freeform28CRLCommandSetMoviePosterTime_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.committed[OBJC_IVAR____TtC8Freeform28CRLCommandSetMoviePosterTime_creator]);
}

@end
