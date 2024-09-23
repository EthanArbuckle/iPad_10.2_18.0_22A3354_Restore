@implementation CKRecordZoneID

- (id)fmf_withCurrentUserDefaultName
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc((Class)CKRecordZoneID);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZoneID zoneName](self, "zoneName"));
  v5 = objc_msgSend(v3, "initWithZoneName:ownerName:", v4, CKCurrentUserDefaultName);

  return v5;
}

@end
