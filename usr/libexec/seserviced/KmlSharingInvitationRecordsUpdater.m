@implementation KmlSharingInvitationRecordsUpdater

- (KmlSharingInvitationRecordsUpdater)init
{
  KmlSharingInvitationRecordsUpdater *v2;
  uint64_t v3;
  NSMutableDictionary *invitationIdToRecordMap;
  id v5;
  uint64_t v6;
  OS_dispatch_queue *updaterQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)KmlSharingInvitationRecordsUpdater;
  v2 = -[KmlSharingInvitationRecordsUpdater init](&v9, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    invitationIdToRecordMap = v2->_invitationIdToRecordMap;
    v2->_invitationIdToRecordMap = (NSMutableDictionary *)v3;

    v5 = sub_10022B650((uint64_t)KmlSharingInvitationRecordsUpdater);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    updaterQueue = v2->_updaterQueue;
    v2->_updaterQueue = (OS_dispatch_queue *)v6;

    sub_10022B76C((uint64_t)v2);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updaterQueue, 0);
  objc_storeStrong((id *)&self->_invitationIdToRecordMap, 0);
}

@end
