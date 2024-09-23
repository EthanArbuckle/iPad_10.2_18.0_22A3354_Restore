@implementation SCLSchoolModeConfiguration

- (SCLSchoolModeConfiguration)init
{
  SCLSchoolModeConfiguration *v2;
  uint64_t v3;
  NSUUID *pairingID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCLSchoolModeConfiguration;
  v2 = -[SCLSchoolModeConfiguration init](&v6, sel_init);
  if (v2)
  {
    SCLAutoUpdatingPairingID();
    v3 = objc_claimAutoreleasedReturnValue();
    pairingID = v2->_pairingID;
    v2->_pairingID = (NSUUID *)v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SCLSchoolModeConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init(SCLSchoolModeConfiguration);
  -[SCLSchoolModeConfiguration identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeConfiguration setIdentifier:](v4, "setIdentifier:", v5);

  -[SCLSchoolModeConfiguration targetQueue](self, "targetQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeConfiguration setTargetQueue:](v4, "setTargetQueue:", v6);

  -[SCLSchoolModeConfiguration delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeConfiguration setDelegate:](v4, "setDelegate:", v7);

  -[SCLSchoolModeConfiguration pairingID](self, "pairingID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeConfiguration setPairingID:](v4, "setPairingID:", v8);

  -[SCLSchoolModeConfiguration setLoadsSynchronously:](v4, "setLoadsSynchronously:", -[SCLSchoolModeConfiguration loadsSynchronously](self, "loadsSynchronously"));
  -[SCLSchoolModeConfiguration testingEndpoint](self, "testingEndpoint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeConfiguration setTestingEndpoint:](v4, "setTestingEndpoint:", v9);

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (void)setTargetQueue:(id)a3
{
  objc_storeStrong((id *)&self->_targetQueue, a3);
}

- (SCLSchoolModeDelegate)delegate
{
  return (SCLSchoolModeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)pairingID
{
  return self->_pairingID;
}

- (void)setPairingID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)loadsSynchronously
{
  return self->_loadsSynchronously;
}

- (void)setLoadsSynchronously:(BOOL)a3
{
  self->_loadsSynchronously = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_testingEndpoint, 0);
}

- (void)setTestingEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_testingEndpoint, a3);
}

- (NSXPCListenerEndpoint)testingEndpoint
{
  return self->_testingEndpoint;
}

@end
