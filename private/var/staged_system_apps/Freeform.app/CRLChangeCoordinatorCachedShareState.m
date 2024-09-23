@implementation CRLChangeCoordinatorCachedShareState

- (void)shareStateUpdatedWithShare:(id)a3
{
  void *v4;
  id v5;
  unint64_t v6;
  _BYTE v7[24];

  v4 = *(void **)self->cachedShare;
  *(_QWORD *)self->cachedShare = a3;
  v5 = a3;
  swift_retain(self);

  v6 = sub_1008D5D50((uint64_t)_swiftEmptyArrayStorage);
  swift_beginAccess(self->handleToPermissionsLookup, v7, 1, 0);
  *(_QWORD *)self->handleToPermissionsLookup = v6;

  swift_release(self);
  swift_bridgeObjectRelease();
}

@end
