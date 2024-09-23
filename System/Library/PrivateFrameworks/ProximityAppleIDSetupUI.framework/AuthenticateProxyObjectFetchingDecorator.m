@implementation AuthenticateProxyObjectFetchingDecorator

- (void)authenticateWithAccount:(id)a3 with:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  swift_retain();
  sub_220D6E3D8(v9, v10, (uint64_t)self, (void (**)(_QWORD, _QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release();
}

@end
