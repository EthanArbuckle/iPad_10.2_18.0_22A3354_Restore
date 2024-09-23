@implementation LyonGeofenceException

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4;
  _TtC10seserviced21LyonGeofenceException *v5;

  v4 = a3;
  v5 = self;
  sub_100156280();

}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC10seserviced21LyonGeofenceException_homeDelegates));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC10seserviced21LyonGeofenceException_assertion));
}

@end
