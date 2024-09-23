@implementation EntityCacheProvider.NoopEntityCache

- (void)deleteWithBagKey:(NSString *)a3 completionHandler:(id)a4
{
  sub_10018D208((uint64_t)self, (int)a2, a3, a4, (uint64_t)&unk_1002C6648);
}

- (void)fetchWithBagKey:(NSString *)a3 id:(NSString *)a4 completionHandler:(id)a5
{
  sub_10018DE74((uint64_t)self, (int)a2, a3, a4, a5, (uint64_t)&unk_1002C6620);
}

- (void)storeWithBagKey:(NSString *)a3 id:(NSString *)a4 entity:(NSSecureCoding *)a5 expiresAt:(NSDate *)a6 completionHandler:(id)a7
{
  sub_10018D4C4((uint64_t)self, (int)a2, a3, a4, (uint64_t)a5, a6, a7, (uint64_t)&unk_1002C65F8, (uint64_t)&unk_100315AA0);
}

@end
