@implementation CKShareParticipant(WBSCKShareParticipantExtras)

- (id)safari_shareParticipantIdentifier
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "userIdentity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "userRecordID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
