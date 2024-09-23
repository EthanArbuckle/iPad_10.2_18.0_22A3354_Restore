@implementation SettingsServiceScene.RemoteObject

- (void)updateAvailabilityWithAvailable:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;

  v3 = a3;
  swift_retain();
  v4 = (void *)sub_1DB470A90();
  if (v4)
  {
    objc_msgSend(v4, sel_updateAvailabilityWithAvailable_, v3);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
}

- (void)updateSidebarWithItems:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  type metadata accessor for SidebarItem();
  sub_1DB4A16C8();
  swift_retain();
  v3 = sub_1DB470A90();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)sub_1DB4A16BC();
    objc_msgSend(v4, sel_updateSidebarWithItems_, v5);
    swift_release();
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
  }
}

@end
