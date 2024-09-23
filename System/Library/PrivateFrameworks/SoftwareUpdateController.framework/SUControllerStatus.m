@implementation SUControllerStatus

- (SUControllerStatus)init
{
  SUControllerStatus *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUControllerStatus;
  result = -[SUControllerStatus init](&v3, sel_init);
  if (result)
  {
    result->_failForwardMode = 0;
    result->_managerState = 0;
    result->_updateState = 0;
  }
  return result;
}

- (SUControllerStatus)initWithCoder:(id)a3
{
  id v4;
  SUControllerStatus *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUControllerStatus;
  v5 = -[SUControllerStatus init](&v7, sel_init);
  if (v5)
  {
    v5->_managerState = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("managerState"));
    v5->_updateState = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("updateState"));
    v5->_failForwardMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("failForwardMode"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUControllerStatus managerState](self, "managerState"), CFSTR("managerState"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[SUControllerStatus updateState](self, "updateState"), CFSTR("updateState"));
  objc_msgSend(v4, "encodeBool:forKey:", -[SUControllerStatus failForwardMode](self, "failForwardMode"), CFSTR("failForwardMode"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  SUControllerStringForManagerState(-[SUControllerStatus managerState](self, "managerState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SUControllerStringForManagerState(-[SUControllerStatus updateState](self, "updateState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SUControllerStatus failForwardMode](self, "failForwardMode");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n       ManagerState: %@\n        UpdateState: %@\n    FailForwardMode: %@\n"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  SUControllerStringForManagerState(-[SUControllerStatus managerState](self, "managerState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SUControllerStringForManagerState(-[SUControllerStatus updateState](self, "updateState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)managerState
{
  return self->_managerState;
}

- (void)setManagerState:(int64_t)a3
{
  self->_managerState = a3;
}

- (int64_t)updateState
{
  return self->_updateState;
}

- (void)setUpdateState:(int64_t)a3
{
  self->_updateState = a3;
}

- (BOOL)failForwardMode
{
  return self->_failForwardMode;
}

- (void)setFailForwardMode:(BOOL)a3
{
  self->_failForwardMode = a3;
}

@end
