@implementation GKFriendSuggestionDenyList

+ (GKFriendSuggestionDenyList)empty
{
  return (GKFriendSuggestionDenyList *)sub_100196DB8();
}

- (NSSet)contactIDs
{
  return (NSSet *)sub_100196E30((uint64_t)self, (uint64_t)a2, FriendSuggestionDenyList.contactIDs.getter);
}

- (NSSet)playerIDs
{
  return (NSSet *)sub_100196E30((uint64_t)self, (uint64_t)a2, FriendSuggestionDenyList.playerIDs.getter);
}

- (GKFriendSuggestionDenyList)initWithContactIDs:(id)a3 playerIDs:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, &protocol witness table for String);
  v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, &protocol witness table for String);
  return (GKFriendSuggestionDenyList *)sub_100196E84(v5, v6);
}

- (GKFriendSuggestionDenyList)init
{
  FriendSuggestionDenyList.init()();
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___GKFriendSuggestionDenyList_contactIDs), a2);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___GKFriendSuggestionDenyList_playerIDs), v3);
}

@end
