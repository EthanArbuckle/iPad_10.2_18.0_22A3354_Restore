@implementation PLLoggingServiceClient

- (PLLoggingServiceClient)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLLoggingServiceClient;
  return -[PLLoggingServiceClient init](&v3, sel_init);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (NSXPCConnection)clientConnection
{
  return self->_clientConnection;
}

- (void)setClientConnection:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

+ (id)makeClient
{
  return _sSo22PLLoggingServiceClientC26SiriPrivateLearningLoggingE04makeC0AByFZ_0();
}

- (void)storeInstrumentationWithEvents:(id)a3 completion:(id)a4
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();
  PLLoggingServiceClient *v9;

  v5 = _Block_copy(a4);
  sub_21188F338(0, (unint64_t *)&qword_254AC4998);
  v6 = sub_2118967A0();
  if (v5)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v5;
    v8 = sub_21188DDA4;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = self;
  PLLoggingServiceClient.storeInstrumentation(events:completion:)(v6, (uint64_t)v8, v7);
  sub_21188DD70((uint64_t)v8);

  swift_bridgeObjectRelease();
}

@end
