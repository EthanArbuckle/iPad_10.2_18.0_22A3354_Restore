@implementation ASFinanceStoreHelper

- (NSString)errorDomain
{
  return (NSString *)ASFinanceStoreHelper.errorDomain.getter();
}

- (_TtC3asd20ASFinanceStoreHelper)init
{
  return (_TtC3asd20ASFinanceStoreHelper *)ASFinanceStoreHelper.init()((uint64_t)self);
}

- (void)queryTransactionsWithStartDateOffset:(unint64_t)a3 endDateOffset:(unint64_t)a4 transactionSources:(unint64_t)a5 locationType:(unint64_t)a6 locationFilterDistance:(int64_t)a7 lat:(NSString *)a8 lon:(NSString *)a9 maxCount:(unint64_t)a10 sortOrder:(unint64_t)a11 sortByAttributes:(unint64_t)a12 attributes:(unint64_t)a13 completionHandler:(id)aBlock
{
  void *v20;
  uint64_t v21;
  NSString *v22;
  NSString *v23;
  _TtC3asd20ASFinanceStoreHelper *v24;

  v20 = _Block_copy(aBlock);
  v21 = swift_allocObject(&unk_1004CFBE0, 120, 7);
  *(_QWORD *)(v21 + 16) = a3;
  *(_QWORD *)(v21 + 24) = a4;
  *(_QWORD *)(v21 + 32) = a5;
  *(_QWORD *)(v21 + 40) = a6;
  *(_QWORD *)(v21 + 48) = a7;
  *(_QWORD *)(v21 + 56) = a8;
  *(_QWORD *)(v21 + 64) = a9;
  *(_OWORD *)(v21 + 72) = *(_OWORD *)&a10;
  *(_QWORD *)(v21 + 88) = a12;
  *(_QWORD *)(v21 + 96) = a13;
  *(_QWORD *)(v21 + 104) = v20;
  *(_QWORD *)(v21 + 112) = self;
  v22 = a8;
  v23 = a9;
  v24 = self;
  sub_10008F82C((uint64_t)&unk_100503BF8, v21);
}

- (void)countTransactionsWithStartDateOffset:(unint64_t)a3 endDateOffset:(unint64_t)a4 transactionSources:(unint64_t)a5 locationType:(unint64_t)a6 locationFilterDistance:(int64_t)a7 lat:(NSString *)a8 lon:(NSString *)a9 maxCount:(unint64_t)a10 completionHandler:(id)aBlock
{
  void *v17;
  _QWORD *v18;
  NSString *v19;
  NSString *v20;
  _TtC3asd20ASFinanceStoreHelper *v21;

  v17 = _Block_copy(aBlock);
  v18 = (_QWORD *)swift_allocObject(&unk_1004CFBB8, 96, 7);
  v18[2] = a3;
  v18[3] = a4;
  v18[4] = a5;
  v18[5] = a6;
  v18[6] = a7;
  v18[7] = a8;
  v18[8] = a9;
  v18[9] = a10;
  v18[10] = v17;
  v18[11] = self;
  v19 = a8;
  v20 = a9;
  v21 = self;
  sub_10008F82C((uint64_t)&unk_100503BE8, (uint64_t)v18);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3asd20ASFinanceStoreHelper_store));

}

@end
