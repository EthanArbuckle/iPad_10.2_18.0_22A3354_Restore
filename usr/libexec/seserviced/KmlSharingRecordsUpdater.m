@implementation KmlSharingRecordsUpdater

- (KmlSharingRecordsUpdater)initWithEndpoint:(id)a3
{
  id v5;
  KmlSharingRecordsUpdater *v6;
  KmlSharingRecordsUpdater *v7;
  uint64_t v8;
  NSString *endpointIdentifier;
  uint64_t v10;
  NSMutableDictionary *invitationIdToConfigMap;
  id v12;
  uint64_t v13;
  OS_dispatch_queue *updaterQueue;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)KmlSharingRecordsUpdater;
  v6 = -[KmlSharingRecordsUpdater init](&v16, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpoint, a3);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subjectIdentifier"));
    endpointIdentifier = v7->_endpointIdentifier;
    v7->_endpointIdentifier = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    invitationIdToConfigMap = v7->_invitationIdToConfigMap;
    v7->_invitationIdToConfigMap = (NSMutableDictionary *)v10;

    v12 = sub_10024EA88((uint64_t)KmlSharingRecordsUpdater);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    updaterQueue = v7->_updaterQueue;
    v7->_updaterQueue = (OS_dispatch_queue *)v13;

    sub_10024EBE4((uint64_t)v7);
  }

  return v7;
}

- (NSString)endpointIdentifier
{
  return self->_endpointIdentifier;
}

- (void)setEndpointIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_endpointIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
  objc_storeStrong((id *)&self->_updaterQueue, 0);
  objc_storeStrong((id *)&self->_invitationIdToConfigMap, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
