@implementation SOSKappaStatus

- (SOSKappaStatus)init
{
  -[SOSKappaStatus doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (SOSKappaStatus)initWithSOSStatus:(id)a3
{
  id v5;
  SOSKappaStatus *v6;
  SOSKappaStatus *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SOSKappaStatus;
  v6 = -[SOSKappaStatus init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sosStatus, a3);

  return v7;
}

- (BOOL)isKappaFlow
{
  void *v2;
  BOOL v3;

  -[SOSKappaStatus sosStatus](self, "sosStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "trigger") == 7;

  return v3;
}

- (BOOL)isKappaFlowActive
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[SOSKappaStatus isKappaFlow](self, "isKappaFlow");
  if (v3)
  {
    -[SOSKappaStatus sosStatus](self, "sosStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isFlowActiveAndNotResting");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)description
{
  void *v2;
  void *v3;

  -[SOSKappaStatus sosStatus](self, "sosStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SOSStatus)sosStatus
{
  return self->_sosStatus;
}

- (int64_t)sosKappaState
{
  return self->_sosKappaState;
}

- (void)setSosKappaState:(int64_t)a3
{
  self->_sosKappaState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sosStatus, 0);
}

@end
