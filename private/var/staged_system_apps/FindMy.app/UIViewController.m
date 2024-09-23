@implementation UIViewController

- (void)presentCard:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  UIViewController *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100567088, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_100443D94;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_100443AE8(v8, (uint64_t)v6, v7);
  sub_1000327F0((uint64_t)v6, v7);

}

@end
