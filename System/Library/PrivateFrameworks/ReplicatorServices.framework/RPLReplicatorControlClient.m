@implementation RPLReplicatorControlClient

- (RPLReplicatorControlClient)init
{
  RPLReplicatorControlClient *v2;
  _TtC18ReplicatorServices33ReplicatorControlClientObjcBridge *v3;
  _TtC18ReplicatorServices33ReplicatorControlClientObjcBridge *controlClient;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPLReplicatorControlClient;
  v2 = -[RPLReplicatorControlClient init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC18ReplicatorServices33ReplicatorControlClientObjcBridge);
    controlClient = v2->_controlClient;
    v2->_controlClient = v3;

  }
  return v2;
}

- (NSArray)devices
{
  return (NSArray *)-[ReplicatorControlClientObjcBridge devices](self->_controlClient, "devices");
}

- (BOOL)isReplicatorEnabled
{
  return -[ReplicatorControlClientObjcBridge isEnabled](self->_controlClient, "isEnabled");
}

- (void)setIsReplicatorEnabled:(BOOL)a3
{
  -[ReplicatorControlClientObjcBridge setEnabled:](self->_controlClient, "setEnabled:", a3);
}

- (BOOL)isAllowListEnabled
{
  return -[ReplicatorControlClientObjcBridge isAllowListEnabled](self->_controlClient, "isAllowListEnabled");
}

- (NSArray)allowList
{
  return (NSArray *)-[ReplicatorControlClientObjcBridge allowList](self->_controlClient, "allowList");
}

- (void)setAllowList:(id)a3
{
  -[ReplicatorControlClientObjcBridge setAllowList:](self->_controlClient, "setAllowList:", a3);
}

- (id)pushTokenForRelationshipID:(id)a3
{
  return -[ReplicatorControlClientObjcBridge pushToken:](self->_controlClient, "pushToken:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlClient, 0);
}

@end
