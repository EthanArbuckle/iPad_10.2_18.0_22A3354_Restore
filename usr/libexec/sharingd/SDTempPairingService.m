@implementation SDTempPairingService

- (void)handleRapportIdentitiesChanged
{
  void *v2;
  id v4;

  v2 = *(void **)&self->_anon_0[OBJC_IVAR____TtC16DaemoniOSLibrary20SDTempPairingService_client];
  if (v2)
  {
    swift_retain(self);
    v4 = v2;
    sub_100356FE0((uint64_t)v4);
    swift_release(self);

  }
}

@end
