@implementation DPDPushManager

+ (id)sharedInstance
{
  if (qword_100010950 != -1)
    swift_once(&qword_100010950, sub_1000018D8);
  return (id)qword_100010DD8;
}

- (DPDPushManager)init
{
  DPDPushManager *result;

  sub_100001944();
  return result;
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  id v7;
  DPDPushManager *v8;

  v7 = a3;
  v8 = self;
  sub_1000027D4(a3, a4);

}

- (void)connectionDidReconnect:(id)a3
{
  id v5;
  DPDPushManager *v6;

  v5 = a3;
  v6 = self;
  sub_100002A94(a3);

}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v4;
  id v6;
  DPDPushManager *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  DPDPushManager *v12;

  v4 = a4;
  if (a4)
  {
    v6 = a3;
    v7 = self;
    v8 = v4;
    v4 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v10 = v9;

  }
  else
  {
    v11 = a3;
    v12 = self;
    v10 = 0xF000000000000000;
  }
  sub_100002D2C(a3, (uint64_t)v4, v10);
  sub_100003DC4((uint64_t)v4, v10);

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  id v7;
  DPDPushManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10000306C(a4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->pushTopic[OBJC_IVAR___DPDPushManager_pushTopic], a2);

}

@end
