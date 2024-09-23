@implementation GKPseudonymManager

- (GKPseudonymManager)init
{
  return (GKPseudonymManager *)PseudonymManager.init()();
}

- (void)fetchPseudonymWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  GKPseudonymManager *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1002C6FC0, 32, 7);
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_1001C15C4((uint64_t)&unk_100316318, v5);
}

- (void)revokePseudonym:(NSString *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSString *v8;
  GKPseudonymManager *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject(&unk_1002C6F98, 40, 7);
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1001C15C4((uint64_t)&unk_100316308, (uint64_t)v7);
}

- (void).cxx_destruct
{

}

@end
