@implementation SNSetRestrictionsThunk

- (SNSetRestrictionsThunk)initWithThunk:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  SNSetRestrictionsThunk *result;

  v3 = _Block_copy(a3);
  if (v3)
  {
    v4 = v3;
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v3 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned SNLinkRecommendationInfo?) -> ();
  }
  else
  {
    v5 = 0;
  }
  SNSetRestrictionsThunk.init(thunk:)((uint64_t)v3, v5);
  return result;
}

- (SNSetRestrictionsThunk)initWithCoder:(id)a3
{
  return (SNSetRestrictionsThunk *)SNSetRestrictionsThunk.init(coder:)(a3);
}

- (SNSetRestrictionsThunk)initWithDictionary:(id)a3 context:(id)a4
{
  uint64_t v5;
  SNSetRestrictionsThunk *result;

  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  SNSetRestrictionsThunk.init(dictionary:context:)(v5, (uint64_t)a4);
  return result;
}

- (SNSetRestrictionsThunk)initWithDictionary:(id)a3
{
  SNSetRestrictionsThunk *result;

  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  SNSetRestrictionsThunk.init(dictionary:)();
  return result;
}

- (void)siriNetwork_invokeThunk
{
  SNSetRestrictionsThunk *v2;

  v2 = self;
  SNSetRestrictionsThunk.siriNetwork_invokeThunk()();

}

- (SNSetRestrictionsThunk)init
{
  SNSetRestrictionsThunk.init()();
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___SNSetRestrictionsThunk_thunk));
}

@end
