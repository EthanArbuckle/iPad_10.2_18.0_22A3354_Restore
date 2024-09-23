@implementation XPCClient

- (void)receiveEvent:(int64_t)a3 data:(id)a4
{
  NSObject *v4;
  NSObject *v6;
  unint64_t v7;
  unint64_t v8;

  v4 = a4;
  if (a4)
  {
    swift_retain();
    v6 = v4;
    v4 = sub_1CE0B3D64();
    v8 = v7;

  }
  else
  {
    swift_retain();
    v8 = 0xF000000000000000;
  }
  sub_1CDFAEDFC(a3, v4, v8);
  sub_1CDFC094C((uint64_t)v4, v8);
  swift_release();
}

- (void)receiveRequest:(int64_t)a3 data:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  v8 = _Block_copy(a5);
  swift_retain();
  if (a4)
  {
    v9 = a4;
    a4 = (id)sub_1CE0B3D64();
    v11 = v10;

  }
  else
  {
    v11 = 0xF000000000000000;
  }
  v12 = *(_QWORD **)self->dispatchService;
  _Block_copy(v8);
  sub_1CDFC1CB8(a3, (uint64_t)a4, v11, v12, (void (**)(_QWORD, _QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);
  sub_1CDFC094C((uint64_t)a4, v11);
  swift_release();
}

@end
