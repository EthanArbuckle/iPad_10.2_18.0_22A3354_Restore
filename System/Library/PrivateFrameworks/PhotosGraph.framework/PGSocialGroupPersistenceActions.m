@implementation PGSocialGroupPersistenceActions

- (int64_t)socialGroupsSkippedBecauseNoCommonAssetsCount
{
  return sub_1CA45EABC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PGSocialGroupPersistenceActions_socialGroupsSkippedBecauseNoCommonAssets);
}

- (int64_t)newAutomaticSocialGroupsToCreateCount
{
  return sub_1CA45EABC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PGSocialGroupPersistenceActions_newAutomaticSocialGroupMembersAndOrders);
}

- (int64_t)currentAutomaticSocialGroupsToModifyCount
{
  PGSocialGroupPersistenceActions *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1CA45EB00();

  return v3;
}

- (int64_t)outdatedAutomaticSocialGroupsToDeleteCount
{
  uint64_t v2;
  PGSocialGroupPersistenceActions *v3;
  int64_t v4;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___PGSocialGroupPersistenceActions_outdatedAutomaticSocialGroupsToDelete);
  if ((v2 & 0xC000000000000001) == 0)
    return *(_QWORD *)(v2 + 16);
  v3 = self;
  v4 = sub_1CA85BE04();

  return v4;
}

- (PGSocialGroupPersistenceActions)init
{
  PGSocialGroupPersistenceActions *result;

  result = (PGSocialGroupPersistenceActions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
