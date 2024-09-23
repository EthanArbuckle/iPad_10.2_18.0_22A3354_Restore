@implementation PXPlacesLocationAuthorizationMonitor

+ (PXPlacesLocationAuthorizationMonitor)sharedInstance
{
  if (qword_1EE925050 != -1)
    swift_once();
  return (PXPlacesLocationAuthorizationMonitor *)(id)qword_1EE925048;
}

- (PXPlacesLocationAuthorizationMonitor)init
{
  uint64_t ObjectType;
  PXPlacesLocationAuthorizationMonitor *v3;

  ObjectType = swift_getObjectType();
  v3 = (PXPlacesLocationAuthorizationMonitor *)(*(uint64_t (**)(id))(ObjectType + 128))(objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C9E3C8]), sel_init));
  swift_deallocPartialClassInstance();
  return v3;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___PXPlacesLocationAuthorizationMonitor__authorizationStatus;
  sub_1A6F7F278();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  PXPlacesLocationAuthorizationMonitor *v5;

  v4 = a3;
  v5 = self;
  _s12PhotosUICore34PlacesLocationAuthorizationMonitorC024locationManagerDidChangeE0yySo010CLLocationH0CF_0();

}

@end
