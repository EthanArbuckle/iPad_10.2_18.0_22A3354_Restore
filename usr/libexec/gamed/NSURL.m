@implementation NSURL

- (void)hasTrustedImageDomainWithStoreBag:(GKStoreBag *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  GKStoreBag *v8;
  NSURL *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject(&unk_1002C7EE8, 40, 7);
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1001C15C4((uint64_t)&unk_100316BC8, (uint64_t)v7);
}

@end
