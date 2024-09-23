@implementation ICCloudSyncingObject

+ (void)undoablyPersistActivityEventsForMoveAction:(id)a3 oldObject:(id)a4 newObject:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  _sSo20ICCloudSyncingObjectC45com_apple_mobilenotes_SpotlightIndexExtensionE29undoablyPersistActivityEvents3for03oldC003newC0yAbCE10MoveActionC_ABSgAJtFZ_0((uint64_t)v7, a4, a5);

}

- (void)persistParticipantActivityEventsWithOldShare:(id)a3 newShare:(id)a4
{
  id v7;
  id v8;
  Class isa;
  CKShare_optional v10;
  CKShare_optional v11;

  v7 = a3;
  v8 = a4;
  v11.value.super.super.isa = self;
  isa = v11.value.super.super.isa;
  v10.value.super.super.isa = (Class)a3;
  v10.is_nil = (char)a4;
  ICCloudSyncingObject.persistParticipantActivityEvents(oldShare:newShare:)(v10, v11);

}

- (void)persistJoinActivityEvent
{
  ICCloudSyncingObject *v2;

  v2 = self;
  ICCloudSyncingObject.persistJoinActivityEvent()();

}

- (void)persistLeaveActivityEvent
{
  ICCloudSyncingObject *v2;

  v2 = self;
  ICCloudSyncingObject.persistLeaveActivityEvent()();

}

@end
