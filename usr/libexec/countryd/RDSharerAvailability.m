@implementation RDSharerAvailability

+ (BOOL)hasLocalStatusKit
{
  BOOL v2;
  uint64_t v6;
  void *v7;
  BOOL v8;

  if (&class metadata base offset for LSKLocalStatusClient)
    v2 = &type metadata accessor for LSKLocalStatusClient == 0;
  else
    v2 = 1;
  if (v2
    || &type metadata for LSKLocalStatusClient == 0
    || &nominal type descriptor for LSKLocalStatusClient == 0
    || &metaclass for LSKLocalStatusClient == 0)
  {
    v6 = static os_log_type_t.info.getter(a1, a2);
    sub_10000AE40(0, &qword_100019190, OS_os_log_ptr);
    v7 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)(v6, &_mh_execute_header, v7, "This platform does not have LocalStatusKit", 42, 2, &_swiftEmptyArrayStorage);

  }
  if (&metaclass for LSKLocalStatusClient)
    v8 = &nominal type descriptor for LSKLocalStatusClient == 0;
  else
    v8 = 1;
  return !v8
      && &type metadata for LSKLocalStatusClient != 0
      && &type metadata accessor for LSKLocalStatusClient != 0
      && &class metadata base offset for LSKLocalStatusClient != 0;
}

- (_TtC8countryd20RDSharerAvailability)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RDSharerAvailability();
  return -[RDSharerAvailability init](&v3, "init");
}

@end
