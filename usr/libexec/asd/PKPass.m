@implementation PKPass

- (NSNumber)arrivalAirportLat
{
  PKPass *v2;
  void *v3;
  void *v4;

  v2 = self;
  PKPass.arrivalAirportLat.getter();
  v4 = v3;

  return (NSNumber *)v4;
}

- (NSNumber)arrivalAirportLong
{
  PKPass *v2;
  void *v3;
  void *v4;

  v2 = self;
  PKPass.arrivalAirportLong.getter();
  v4 = v3;

  return (NSNumber *)v4;
}

- (NSNumber)departureAirportLat
{
  PKPass *v2;
  void *v3;
  void *v4;

  v2 = self;
  PKPass.departureAirportLat.getter();
  v4 = v3;

  return (NSNumber *)v4;
}

- (NSNumber)departureAirportLong
{
  PKPass *v2;
  void *v3;
  void *v4;

  v2 = self;
  PKPass.departureAirportLong.getter();
  v4 = v3;

  return (NSNumber *)v4;
}

- (NSDate)anyDate
{
  PKPass *v2;
  Class v3;

  v2 = self;
  v3 = PKPass.anyDate.getter();

  return (NSDate *)v3;
}

- (NSString)boardingPassFirstName
{
  PKPass *v2;
  void *v3;
  void *v4;

  v2 = self;
  PKPass.boardingPassFirstName.getter();
  v4 = v3;

  return (NSString *)v4;
}

- (NSString)boardingPassLastName
{
  PKPass *v2;
  void *v3;
  void *v4;

  v2 = self;
  PKPass.boardingPassLastName.getter();
  v4 = v3;

  return (NSString *)v4;
}

- (id)evaluateWithAttribute:(id)a3 expression:(id)a4
{
  id v6;
  id v7;
  PKPass *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD v16[3];
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v8 = self;
  PKPass.evaluate(attribute:expression:)((uint64_t)v6, v7, (uint64_t)v16);

  v9 = v17;
  if (!v17)
    return 0;
  v10 = sub_100032EFC(v16, v17);
  v11 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v11 + 16))(v13);
  v14 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v13, v9);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v9);
  sub_100032F94(v16);
  return v14;
}

@end
