@implementation REMSharedEntitySyncActivity_Codable

- (REMSharedEntitySyncActivity_Codable)initWithAccountIdentifier:(id)a3 activityDate:(id)a4 activityType:(int64_t)a5 authorUserRecordIDString:(id)a6 ckParentCloudObjectEntityName:(id)a7 ckParentCloudObjectIdentifier:(id)a8 ckIdentifier:(id)a9 sharedEntityName:(id)a10 uuidForChangeTracking:(id)a11
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  REMSharedEntitySyncActivity_Codable *v44;

  v43 = a5;
  v44 = self;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED243170);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1A46900B4();
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  v41 = v20;
  v42 = v19;
  sub_1A4690084();
  v21 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  v39 = v22;
  v40 = v21;
  if (a7)
  {
    v38 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
    v24 = v23;
    v25 = a11;
    if (a8)
    {
LABEL_3:
      a8 = (id)_sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
      v27 = v26;
      goto LABEL_6;
    }
  }
  else
  {
    v38 = 0;
    v24 = 0;
    v25 = a11;
    if (a8)
      goto LABEL_3;
  }
  v27 = 0;
LABEL_6:
  v28 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  v30 = v29;
  v31 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
  v33 = v32;
  if (v25)
  {
    sub_1A46900F0();
    v34 = sub_1A46900FC();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v15, 0, 1, v34);
  }
  else
  {
    v35 = sub_1A46900FC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v15, 1, 1, v35);
  }
  return (REMSharedEntitySyncActivity_Codable *)REMSharedEntitySyncActivity_Codable.init(accountIdentifier:activityDate:activityType:authorUserRecordIDString:ckParentCloudObjectEntityName:ckParentCloudObjectIdentifier:ckIdentifier:sharedEntityName:uuidForChangeTracking:)(v42, v41, (uint64_t)v18, v43, v40, v39, v38, v24, (uint64_t)a8, v27, v28, v30, v31, v33, (uint64_t)v15);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
