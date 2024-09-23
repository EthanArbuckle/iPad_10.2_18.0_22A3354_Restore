@implementation PLProcessExitAggregator

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setLabelIdx:", -[PLProcessExitAggregator labelIdx](self, "labelIdx"));
  objc_msgSend(v4, "setLastTTR:", -[PLProcessExitAggregator lastTTR](self, "lastTTR"));
  objc_msgSend(v4, "setExitReasonNamespace:", -[PLProcessExitAggregator exitReasonNamespace](self, "exitReasonNamespace"));
  objc_msgSend(v4, "setExitReasonCode:", -[PLProcessExitAggregator exitReasonCode](self, "exitReasonCode"));
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("labelIdx=%u, lastTTR=%u, exitReasonNamespace=%ud, exitReasonCode=%llu"), -[PLProcessExitAggregator labelIdx](self, "labelIdx"), -[PLProcessExitAggregator lastTTR](self, "lastTTR"), -[PLProcessExitAggregator exitReasonNamespace](self, "exitReasonNamespace"), -[PLProcessExitAggregator exitReasonCode](self, "exitReasonCode"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  unint64_t v8;
  BOOL v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (v5 = -[PLProcessExitAggregator labelIdx](self, "labelIdx"), v5 == objc_msgSend(v4, "labelIdx"))
    && (v6 = -[PLProcessExitAggregator lastTTR](self, "lastTTR"), v6 == objc_msgSend(v4, "lastTTR"))
    && (v7 = -[PLProcessExitAggregator exitReasonNamespace](self, "exitReasonNamespace"),
        v7 == objc_msgSend(v4, "exitReasonNamespace")))
  {
    v8 = -[PLProcessExitAggregator exitReasonCode](self, "exitReasonCode");
    v9 = v8 == objc_msgSend(v4, "exitReasonCode");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PLProcessExitAggregator labelIdx](self, "labelIdx"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PLProcessExitAggregator lastTTR](self, "lastTTR"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PLProcessExitAggregator exitReasonNamespace](self, "exitReasonNamespace"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PLProcessExitAggregator exitReasonCode](self, "exitReasonCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (unsigned)labelIdx
{
  return self->_labelIdx;
}

- (void)setLabelIdx:(unsigned int)a3
{
  self->_labelIdx = a3;
}

- (unsigned)lastTTR
{
  return self->_lastTTR;
}

- (void)setLastTTR:(unsigned int)a3
{
  self->_lastTTR = a3;
}

- (unsigned)exitReasonNamespace
{
  return self->_exitReasonNamespace;
}

- (void)setExitReasonNamespace:(unsigned __int8)a3
{
  self->_exitReasonNamespace = a3;
}

- (unint64_t)exitReasonCode
{
  return self->_exitReasonCode;
}

- (void)setExitReasonCode:(unint64_t)a3
{
  self->_exitReasonCode = a3;
}

- (unint64_t)jetsamPriority
{
  return self->_jetsamPriority;
}

- (void)setJetsamPriority:(unint64_t)a3
{
  self->_jetsamPriority = a3;
}

@end
