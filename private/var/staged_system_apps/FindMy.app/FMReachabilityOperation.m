@implementation FMReachabilityOperation

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  id v7;
  uint64_t v10;
  id v11;
  id v12;
  _TtC6FindMy23FMReachabilityOperation *v13;

  v7 = a4;
  if (a4)
  {
    v10 = sub_100006C5C(0, &qword_1005D3858, NSNumber_ptr);
    v7 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v7, &type metadata for String, v10, &protocol witness table for String);
  }
  v11 = a3;
  v12 = a6;
  v13 = self;
  sub_1003D3D88((uint64_t)v7, (uint64_t)a6);

  swift_bridgeObjectRelease(v7);
}

@end
