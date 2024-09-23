@implementation _DASDataProtectionStateMonitor

- (BOOL)isDataAvailableFor:(id)a3
{
  return -[_DASDataProtectionMaster isDataAvailableFor:](self->_master, "isDataAvailableFor:", a3);
}

+ (id)dataProtectionClassC
{
  return NSFileProtectionCompleteUntilFirstUserAuthentication;
}

+ (id)dataProtectionClassA
{
  return NSFileProtectionComplete;
}

+ (id)dataProtectionClassB
{
  return NSFileProtectionCompleteUnlessOpen;
}

+ (id)dataProtectionClassD
{
  return NSFileProtectionNone;
}

- (_DASDataProtectionStateMonitor)init
{
  _DASDataProtectionStateMonitor *v2;
  uint64_t v3;
  _DASDataProtectionMaster *master;
  NSUUID *handlerUUID;
  id changeHandler;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DASDataProtectionStateMonitor;
  v2 = -[_DASDataProtectionStateMonitor init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_DASDataProtectionMaster sharedInstance](_DASDataProtectionMaster, "sharedInstance"));
    master = v2->_master;
    v2->_master = (_DASDataProtectionMaster *)v3;

    handlerUUID = v2->_handlerUUID;
    v2->_handlerUUID = 0;

    changeHandler = v2->_changeHandler;
    v2->_changeHandler = 0;

  }
  return v2;
}

- (void)dealloc
{
  id changeHandler;
  _DASDataProtectionMaster *master;
  objc_super v5;

  changeHandler = self->_changeHandler;
  self->_changeHandler = 0;

  master = self->_master;
  self->_master = 0;

  v5.receiver = self;
  v5.super_class = (Class)_DASDataProtectionStateMonitor;
  -[_DASDataProtectionStateMonitor dealloc](&v5, "dealloc");
}

- (void)setChangeHandler:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *handlerUUID;
  id v7;
  id changeHandler;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_handlerUUID)
  {
    -[_DASDataProtectionMaster deregisterStateChangeHandler:](self->_master, "deregisterStateChangeHandler:");
    v4 = v9;
  }
  if (v4)
  {
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[_DASDataProtectionMaster registerStateChangeHandler:](self->_master, "registerStateChangeHandler:", v4));
    handlerUUID = self->_handlerUUID;
    self->_handlerUUID = v5;

    v4 = v9;
  }
  v7 = objc_retainBlock(v4);
  changeHandler = self->_changeHandler;
  self->_changeHandler = v7;

}

- (BOOL)unnotifiedIsDataAvailableForClassC
{
  if (-[_DASDataProtectionMaster deviceHasBeenUnlockedSinceBoot](self->_master, "deviceHasBeenUnlockedSinceBoot"))
    return 1;
  else
    return !-[_DASDataProtectionMaster deviceIsPasswordConfigured](self->_master, "deviceIsPasswordConfigured");
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (_DASDataProtectionMaster)master
{
  return self->_master;
}

- (NSUUID)handlerUUID
{
  return self->_handlerUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlerUUID, 0);
  objc_storeStrong((id *)&self->_master, 0);
  objc_storeStrong(&self->_changeHandler, 0);
}

@end
