@implementation WFRuntimeRunnableDataSourceImpl

- (void)loadEntriesFor:(Class)a3 parameterKey:(NSString *)a4 collectionIdentifier:(NSString *)a5 limit:(int64_t)a6 completionHandler:(id)a7
{
  void *v12;
  _QWORD *v13;
  NSString *v14;
  NSString *v15;
  WFRuntimeRunnableDataSourceImpl *v16;

  v12 = _Block_copy(a7);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  v13[6] = v12;
  v13[7] = self;
  v14 = a4;
  v15 = a5;
  v16 = self;
  sub_1C18B1138((uint64_t)&unk_1EF700180, (uint64_t)v13);
}

- (WFRuntimeRunnableDataSourceImpl)init
{
  return (WFRuntimeRunnableDataSourceImpl *)RuntimeRunnableDataSource.init()();
}

@end
