@implementation MutableDeviceUnit

- (NSString)name
{
  void *v2;

  if (*(_QWORD *)&self->name[8])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1C2EF7410();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setName:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  if (a3)
  {
    v4 = sub_1C2EF741C();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  *(_QWORD *)self->name = v4;
  *(_QWORD *)&self->name[8] = v5;
  swift_retain();
  swift_release();
  swift_bridgeObjectRelease();
}

- (NSString)roomName
{
  void *v2;

  if (*(_QWORD *)&self->roomName[8])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1C2EF7410();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setRoomName:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  if (a3)
  {
    v4 = sub_1C2EF741C();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  *(_QWORD *)self->roomName = v4;
  *(_QWORD *)&self->roomName[8] = v5;
  swift_retain();
  swift_release();
  swift_bridgeObjectRelease();
}

- (int64_t)proximity
{
  return *(_QWORD *)self->proximity;
}

- (void)setProximity:(int64_t)a3
{
  *(_QWORD *)self->proximity = a3;
}

- (NSString)mediaRouteIdentifier
{
  void *v2;

  if (*(_QWORD *)&self->mediaRouteIdentifier[8])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1C2EF7410();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setMediaRouteIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  if (a3)
  {
    v4 = sub_1C2EF741C();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  *(_QWORD *)self->mediaRouteIdentifier = v4;
  *(_QWORD *)&self->mediaRouteIdentifier[8] = v5;
  swift_retain();
  swift_release();
  swift_bridgeObjectRelease();
}

- (BOOL)isCommunalDevice
{
  return self->isCommunalDevice[0];
}

- (void)setIsCommunalDevice:(BOOL)a3
{
  self->isCommunalDevice[0] = a3;
}

- (NSString)homeKitAccessoryIdentifier
{
  void *v2;

  if (*(_QWORD *)&self->homeKitAccessoryIdentifier[15])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1C2EF7410();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setHomeKitAccessoryIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  if (a3)
  {
    v4 = sub_1C2EF741C();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  *(_QWORD *)&self->homeKitAccessoryIdentifier[7] = v4;
  *(_QWORD *)&self->homeKitAccessoryIdentifier[15] = v5;
  swift_retain();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
