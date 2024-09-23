@implementation SystemInfoDynamic

- (void)systemClockDidChangeHandler
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)self->_TtCs12_SwiftObject_opaque;
  v3 = *(_QWORD *)self->clockLock;
  v4[2] = self;
  v4[3] = v2;
  swift_retain();
  OSAllocatedUnfairLock.callAsFunction<A>(_:)(sub_100DFDD0C, v4, v3, &type metadata for () + 1, &type metadata for () + 1);
  swift_release();
}

@end
