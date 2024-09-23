@implementation WeakHostWrapper

- (void)extensionDidFinishWith:(id)a3 context:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  swift_retain();
  sub_220D89DE4((uint64_t)v9, (uint64_t)v10, (uint64_t)self, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_release();
}

- (void)promptForFlowCancelWithCompletion:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  _Block_copy(v3);
  v4 = swift_retain();
  sub_220D89F5C(v4, (void (**)(_QWORD, _QWORD))v3);
  _Block_release(v3);
  _Block_release(v3);
  swift_release();
}

@end
