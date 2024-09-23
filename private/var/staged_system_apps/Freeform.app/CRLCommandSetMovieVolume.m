@implementation CRLCommandSetMovieVolume

- (NSUUID)id
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (float)volume
{
  return *(float *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform24CRLCommandSetMovieVolume_volume);
}

- (_TtC8Freeform24CRLCommandSetMovieVolume)initWithId:(id)a3 volume:(float)a4
{
  return (_TtC8Freeform24CRLCommandSetMovieVolume *)sub_1008A10A8((char *)self, a4, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC8Freeform24CRLCommandSetMovieVolume_id, &OBJC_IVAR____TtC8Freeform24CRLCommandSetMovieVolume_volume, type metadata accessor for CRLCommandSetMovieVolume);
}

- (_TtC8Freeform24CRLCommandSetMovieVolume)initWithMovieItem:(id)a3 volume:(float)a4
{
  return (_TtC8Freeform24CRLCommandSetMovieVolume *)sub_1008A11A4(self, a4, (uint64_t)a2, (char *)a3, (SEL *)&selRef_initWithId_volume_);
}

- (BOOL)supportsSimultaneousExecutionWithOtherCommands
{
  return 1;
}

- (_TtC8Freeform24CRLCommandSetMovieVolume)init
{
  _TtC8Freeform24CRLCommandSetMovieVolume *result;

  result = (_TtC8Freeform24CRLCommandSetMovieVolume *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandSetMovieVolume", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1008A1A60((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform24CRLCommandSetMovieVolume_id);
}

@end
