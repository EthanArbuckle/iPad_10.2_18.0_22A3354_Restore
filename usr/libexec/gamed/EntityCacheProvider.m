@implementation EntityCacheProvider

- (void)getCacheWithPlayerID:(NSString *)a3 language:(NSString *)a4 completionHandler:(id)a5
{
  sub_10018DE74((uint64_t)self, (int)a2, a3, a4, a5, (uint64_t)&unk_1002C66C0);
}

- (void)deleteCacheWithPlayerID:(NSString *)a3 language:(NSString *)a4 completionHandler:(id)a5
{
  sub_10018DE74((uint64_t)self, (int)a2, a3, a4, a5, (uint64_t)&unk_1002C6698);
}

- (void)deleteAllCachesWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1002C6670, 32, 7);
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  swift_retain(self);
  sub_1001C15C4((uint64_t)&unk_100315B30, v5);
}

@end
