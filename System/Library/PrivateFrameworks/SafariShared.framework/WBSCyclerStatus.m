@implementation WBSCyclerStatus

- (WBSCyclerStatus)init
{

  return 0;
}

- (WBSCyclerStatus)initWithActiveTestSuiteName:(id)a3 seed:(unint64_t)a4 isConnectedToTestTarget:(BOOL)a5 isRunning:(BOOL)a6 iterationCount:(unint64_t)a7 executionTime:(double)a8
{
  id v14;
  WBSCyclerStatus *v15;
  uint64_t v16;
  NSString *activeTestSuiteName;
  WBSCyclerStatus *v18;
  objc_super v20;

  v14 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WBSCyclerStatus;
  v15 = -[WBSCyclerStatus init](&v20, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v14, "copy");
    activeTestSuiteName = v15->_activeTestSuiteName;
    v15->_activeTestSuiteName = (NSString *)v16;

    v15->_connectedToTestTarget = a5;
    v15->_running = a6;
    v15->_seed = a4;
    v15->_iterationCount = a7;
    v15->_executionTime = a8;
    v18 = v15;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSCyclerStatus)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  WBSCyclerStatus *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeTestSuiteName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("seed"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("connectedToTestTarget"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("running"));
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("iterationCount"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("executionTime"));
  v11 = v10;

  v12 = -[WBSCyclerStatus initWithActiveTestSuiteName:seed:isConnectedToTestTarget:isRunning:iterationCount:executionTime:](self, "initWithActiveTestSuiteName:seed:isConnectedToTestTarget:isRunning:iterationCount:executionTime:", v5, v6, v7, v8, v9, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 connectedToTestTarget;
  id v5;

  connectedToTestTarget = self->_connectedToTestTarget;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", connectedToTestTarget, CFSTR("connectedToTestTarget"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_running, CFSTR("running"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activeTestSuiteName, CFSTR("activeTestSuiteName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_seed, CFSTR("seed"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_iterationCount, CFSTR("iterationCount"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("executionTime"), self->_executionTime);

}

- (NSString)activeTestSuiteName
{
  return self->_activeTestSuiteName;
}

- (unint64_t)seed
{
  return self->_seed;
}

- (BOOL)isConnectedToTestTarget
{
  return self->_connectedToTestTarget;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (unint64_t)iterationCount
{
  return self->_iterationCount;
}

- (double)executionTime
{
  return self->_executionTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTestSuiteName, 0);
}

@end
