@implementation CRLApplicationCoordinator

- (BOOL)isActivating
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isActivating);
}

- (void)setIsActivating:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isActivating) = a3;
}

- (BOOL)isInBackground
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isInBackground);
}

- (void)setIsInBackground:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isInBackground) = a3;
}

- (BOOL)isTerminating
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isTerminating);
}

- (void)setIsTerminating:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isTerminating) = a3;
}

+ (_TtC8Freeform25CRLApplicationCoordinator)shared
{
  if (qword_1013DD4B0 != -1)
    swift_once(&qword_1013DD4B0, sub_1008FA7E8);
  return (_TtC8Freeform25CRLApplicationCoordinator *)(id)qword_1013F9CF0;
}

- (void)applicationWillEnterForeground
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isActivating) = 1;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isInBackground) = 0;
}

- (void)applicationDidBecomeActive
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isActivating) = 0;
}

- (void)applicationDidEnterBackground
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isInBackground) = 1;
}

- (void)applicationWillTerminate
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isTerminating) = 1;
}

- (_TtC8Freeform25CRLApplicationCoordinator)init
{
  objc_super v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isActivating) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isInBackground) = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLApplicationCoordinator_isTerminating) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLApplicationCoordinator();
  return -[CRLApplicationCoordinator init](&v3, "init");
}

@end
