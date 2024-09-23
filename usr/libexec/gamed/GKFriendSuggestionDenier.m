@implementation GKFriendSuggestionDenier

- (GKFriendSuggestionDenier)init
{
  GKFriendSuggestionDenier *result;

  FriendSuggestionDenier.init()();
  return result;
}

- (id)initInMemory:(BOOL)a3 legacyDenier:(id)a4
{
  return FriendSuggestionDenier.init(inMemory:legacyDenier:)(a3, a4);
}

- (void)clearDenyList
{
  GKFriendSuggestionDenier *v2;

  v2 = self;
  sub_100197410();

}

- (void)denyContactID:(NSString *)a3 completionHandler:(id)a4
{
  sub_100197D24(self, (int)a2, a3, a4, (uint64_t)&unk_1002C6A90, (uint64_t)&unk_100315FA8);
}

- (void)denyPlayerID:(NSString *)a3 completionHandler:(id)a4
{
  sub_100197D24(self, (int)a2, a3, a4, (uint64_t)&unk_1002C6A68, (uint64_t)&unk_100315F78);
}

- (void)denyListWithCompletionHandler:(id)a3
{
  sub_100198324(self, (int)a2, a3, (uint64_t)&unk_1002C6A40, (uint64_t)&unk_100315F60);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___GKFriendSuggestionDenier_storage));
}

- (void)deleteAllWithCompletionHandler:(id)a3
{
  sub_100198324(self, (int)a2, a3, (uint64_t)&unk_1002C6A18, (uint64_t)&unk_100315F50);
}

@end
