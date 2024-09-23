@implementation InProcessAnimationManager

- (void)screenBasedSceneWillAttachWindow:(id)a3
{
  sub_18577F220((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_18577E93C);
}

- (void)screenBasedSceneDidDisconnect:(id)a3
{
  sub_18577F220((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_18577EEDC);
}

- (void)applicationDidEnterBackground
{
  swift_retain();
  sub_18577F2C8();
  swift_release();
}

- (void)applicationBecameActive
{
  LOBYTE(self[1].super.isa) = 0;
  swift_retain();
  sub_18577ED18();
  swift_release();
}

- (void)displayLinkFire:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_185783198(v3);
  swift_release();

}

@end
