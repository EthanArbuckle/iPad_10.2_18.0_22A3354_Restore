@implementation CLDaemonMonitoringRecord

- (CLDaemonMonitoringRecord)initWithClientMonitoringRecord:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 identifier:(id)a7 initForStopMonitoring:(BOOL)a8 callbackHandler:(id)a9
{
  _BOOL8 v9;
  CLDaemonMonitoringRecord *v15;
  objc_super v17;

  v9 = a8;
  v17.receiver = self;
  v17.super_class = (Class)CLDaemonMonitoringRecord;
  v15 = (CLDaemonMonitoringRecord *)-[CLDaemonMonitoringRecord initRecordWithMonitoringRecord:](&v17, "initRecordWithMonitoringRecord:");
  if (v15)
  {
    if (!v9)
      a7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@@%@"), a7, objc_msgSend(a3, "identifier"));
    -[CLDaemonMonitoringRecord setRecordIdentifier:](v15, "setRecordIdentifier:", a7);
    -[CLDaemonMonitoringRecord setupDaemonPartOfConditionWithAuthContext:clientKeyPath:universe:identifier:stopMonitoring:callbackHandler:](v15, "setupDaemonPartOfConditionWithAuthContext:clientKeyPath:universe:identifier:stopMonitoring:callbackHandler:", a5, a4, a6, -[CLDaemonMonitoringRecord recordIdentifier](v15, "recordIdentifier"), v9, a9);
  }
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  self->_daemonCondition = 0;
  -[CLDaemonMonitoringRecord setDaemonEvent:](self, "setDaemonEvent:", 0);

  self->_recordIdentifier = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLDaemonMonitoringRecord;
  -[CLDaemonMonitoringRecord dealloc](&v3, "dealloc");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *v6;
  objc_super v7;

  if ((objc_msgSend(a3, "requiresSecureCoding") & 1) == 0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CLDaemonMonitoringRecord.mm"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coder.requiresSecureCoding"));
  v6 = -[CLDaemonMonitoringRecord recordIdentifier](self, "recordIdentifier");
  objc_msgSend(a3, "encodeObject:forKey:", v6, off_1022A46F8);
  v7.receiver = self;
  v7.super_class = (Class)CLDaemonMonitoringRecord;
  -[CLDaemonMonitoringRecord encodeWithCoder:](&v7, "encodeWithCoder:", a3);
}

- (CLDaemonMonitoringRecord)initWithCoder:(id)a3
{
  uint64_t v6;
  CLDaemonMonitoringRecord *v7;
  objc_super v9;

  if ((objc_msgSend(a3, "requiresSecureCoding") & 1) == 0)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CLDaemonMonitoringRecord.mm"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coder.requiresSecureCoding"));
  v9.receiver = self;
  v9.super_class = (Class)CLDaemonMonitoringRecord;
  v7 = -[CLDaemonMonitoringRecord initWithCoder:](&v9, "initWithCoder:", a3);
  if (v7)
    -[CLDaemonMonitoringRecord setRecordIdentifier:](v7, "setRecordIdentifier:", objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v6), off_1022A46F8));
  return v7;
}

- (void)setupDaemonPartOfConditionWithAuthContext:(id)a3 clientKeyPath:(id)a4 universe:(id)a5 identifier:(id)a6 stopMonitoring:(BOOL)a7 callbackHandler:(id)a8
{
  _BOOL8 v9;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v9 = a7;
  v15 = -[CLDaemonMonitoringRecord condition](self, "condition");
  v17 = objc_opt_class(v15, v16);
  if (v17 == objc_opt_class(CLCircularGeographicCondition, v18))
  {
    if (objc_msgSend(objc_msgSend(a5, "vendor"), "isServiceEnabled:", CFSTR("CLFenceManager")))
    {
      v21 = -[CLDaemonCircularGeographicCondition initFromClientCondition:clientKeyPath:authorizationContext:universe:identifier:removePersistingFenceFromMonitoring:callbackHandler:]([CLDaemonCircularGeographicCondition alloc], "initFromClientCondition:clientKeyPath:authorizationContext:universe:identifier:removePersistingFenceFromMonitoring:callbackHandler:", -[CLDaemonMonitoringRecord condition](self, "condition"), a4, a3, a5, a6, v9, a8);
      goto LABEL_10;
    }
LABEL_11:
    -[CLDaemonMonitoringRecord setConditionUnsupported:](self, "setConditionUnsupported:", 1);
    goto LABEL_12;
  }
  if (v17 == objc_opt_class(CLBeaconIdentityCondition, v19))
  {
    if (objc_msgSend(objc_msgSend(a5, "vendor"), "isServiceEnabled:", CFSTR("CLBTLEFenceManager")))
    {
      v21 = -[CLDaemonBeaconIdentityCondition initFromClientCondition:clientKeyPath:authorizationContext:universe:identifier:removePersistingFenceFromMonitoring:callbackHandler:]([CLDaemonBeaconIdentityCondition alloc], "initFromClientCondition:clientKeyPath:authorizationContext:universe:identifier:removePersistingFenceFromMonitoring:callbackHandler:", -[CLDaemonMonitoringRecord condition](self, "condition"), a4, a3, a5, -[CLDaemonMonitoringRecord recordIdentifier](self, "recordIdentifier"), v9, a8);
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v17 != objc_opt_class(CLMinimumAltitudeCondition, v20))
    sub_10190C538();
  if (!objc_msgSend(objc_msgSend(a5, "vendor"), "isServiceEnabled:", CFSTR("CLBarometerCalibration")))
    goto LABEL_11;
  v21 = -[CLDaemonMinimumAltitudeCondition initFromClientCondition:clientKeyPath:authorizationContext:universe:identifier:callbackHandler:]([CLDaemonMinimumAltitudeCondition alloc], "initFromClientCondition:clientKeyPath:authorizationContext:universe:identifier:callbackHandler:", -[CLDaemonMonitoringRecord condition](self, "condition"), a4, a3, a5, a6, a8);
LABEL_10:
  -[CLDaemonMonitoringRecord setDaemonCondition:](self, "setDaemonCondition:", v21);
LABEL_12:
  -[CLDaemonMonitoringRecord setDaemonEvent:](self, "setDaemonEvent:", objc_msgSend(objc_alloc((Class)CLMonitoringEvent), "initWithIdentifier:refinement:state:date:diagnostics:", -[CLMonitoringEvent identifier](-[CLDaemonMonitoringRecord clientEvent](self, "clientEvent"), "identifier"), 0, 0, +[NSDate now](NSDate, "now"), 0));
}

- (void)resetDaemonPartOfCondition
{
  -[CLCondition stopMonitoring](-[CLDaemonMonitoringRecord daemonCondition](self, "daemonCondition"), "stopMonitoring");
  self->_daemonCondition = 0;
  -[CLDaemonMonitoringRecord setDaemonEvent:](self, "setDaemonEvent:", 0);
}

- (unint64_t)clientState
{
  return -[CLMonitoringEvent state](-[CLDaemonMonitoringRecord clientEvent](self, "clientEvent"), "state");
}

- (unint64_t)daemonState
{
  return -[CLMonitoringEvent state](-[CLDaemonMonitoringRecord daemonEvent](self, "daemonEvent"), "state");
}

- (BOOL)shouldSendEvent
{
  CLMonitoringState v3;
  unint64_t v4;

  v3 = -[CLMonitoringEvent state](-[CLDaemonMonitoringRecord daemonEvent](self, "daemonEvent"), "state");
  if (v3)
  {
    v4 = -[CLDaemonMonitoringRecord clientState](self, "clientState");
    LOBYTE(v3) = v4 != -[CLMonitoringEvent state](-[CLDaemonMonitoringRecord daemonEvent](self, "daemonEvent"), "state");
  }
  return v3;
}

- (void)updateClientEvent:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDaemonMonitoringRecord;
  -[CLDaemonMonitoringRecord updateEvent:](&v3, "updateEvent:", a3);
}

- (id)getMonitoringRecordToNotifyClient
{
  return objc_msgSend(objc_alloc((Class)CLMonitoringRecord), "initRecordWithCondition:options:event:", -[CLDaemonMonitoringRecord condition](self, "condition"), -[CLDaemonMonitoringRecord options](self, "options"), -[CLDaemonMonitoringRecord daemonEvent](self, "daemonEvent"));
}

- (id)debugDescription
{
  NSMutableString *v3;

  v3 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", -[CLDaemonMonitoringRecord description](self, "description"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR(", obj: %p"), self);
  return v3;
}

- (id)description
{
  id v3;

  v3 = +[NSMutableString string](NSMutableString, "string");
  objc_msgSend(v3, "appendString:", objc_msgSend(-[CLDaemonMonitoringRecord condition](self, "condition"), "description"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", options: %lu"), -[CLDaemonMonitoringRecord options](self, "options"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", clientEvent: %@"), -[CLDaemonMonitoringRecord clientEvent](self, "clientEvent"));
  objc_msgSend(v3, "appendFormat:", CFSTR(", daemonEvent: %@"), -[CLDaemonMonitoringRecord daemonEvent](self, "daemonEvent"));
  return v3;
}

- (BOOL)isMonitoring
{
  return -[CLCondition isMonitoring](-[CLDaemonMonitoringRecord daemonCondition](self, "daemonCondition"), "isMonitoring");
}

- (unint64_t)diagnosticMaskIfMonitoringIsNonFunctional
{
  unint64_t v3;

  v3 = (unint64_t)objc_msgSend(-[CLCondition authorizationContext](-[CLDaemonMonitoringRecord daemonCondition](self, "daemonCondition"), "authorizationContext"), "diagnosticMask") & 3;
  if (!-[CLDaemonMonitoringRecord conditionLimitExceeded](self, "conditionLimitExceeded")
    && !-[CLDaemonMonitoringRecord conditionUnsupported](self, "conditionUnsupported")
    && !-[CLDaemonMonitoringRecord persistenceUnavailable](self, "persistenceUnavailable"))
  {
    v3 |= (unint64_t)-[CLCondition diagnosticMaskIfNonFunctional](-[CLDaemonMonitoringRecord daemonCondition](self, "daemonCondition"), "diagnosticMaskIfNonFunctional");
  }
  return v3;
}

- (CLCondition)daemonCondition
{
  return self->_daemonCondition;
}

- (void)setDaemonCondition:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (CLMonitoringEvent)daemonEvent
{
  return self->_daemonEvent;
}

- (void)setDaemonEvent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)recordIdentifier
{
  return self->_recordIdentifier;
}

- (void)setRecordIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (BOOL)conditionLimitExceeded
{
  return self->_conditionLimitExceeded;
}

- (void)setConditionLimitExceeded:(BOOL)a3
{
  self->_conditionLimitExceeded = a3;
}

- (BOOL)persistenceUnavailable
{
  return self->_persistenceUnavailable;
}

- (void)setPersistenceUnavailable:(BOOL)a3
{
  self->_persistenceUnavailable = a3;
}

- (BOOL)conditionUnsupported
{
  return self->_conditionUnsupported;
}

- (void)setConditionUnsupported:(BOOL)a3
{
  self->_conditionUnsupported = a3;
}

@end
