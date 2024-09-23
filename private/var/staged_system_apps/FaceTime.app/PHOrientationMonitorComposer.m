@implementation PHOrientationMonitorComposer

- (PHOrientationMonitorComposer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for OrientationMonitorComposer();
  return -[PHOrientationMonitorComposer init](&v3, "init");
}

- (id)compose
{
  uint64_t v2;
  PHOrientationMonitorComposer *v3;
  uint64_t v4;
  objc_class *v5;
  char *v6;
  PHOrientationMonitorComposer *v7;
  objc_super v9;

  v2 = qword_1000A1EC0;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_1000A1EC0, sub_100008570);
  v4 = qword_1000A2560;
  v5 = (objc_class *)type metadata accessor for PHOrientationMonitor_OBJC();
  v6 = (char *)objc_allocWithZone(v5);
  *(_QWORD *)&v6[OBJC_IVAR____TtC8FaceTime25PHOrientationMonitor_OBJC_wrapped] = v4;
  v9.receiver = v6;
  v9.super_class = v5;
  swift_retain(v4);
  v7 = -[PHOrientationMonitorComposer init](&v9, "init");

  return v7;
}

@end
