@implementation SignpostContextFrameLifetime

- (SignpostContextFrameLifetime)initWithFrameLifetime:(id)a3 contextInfo:(id)a4
{
  id v7;
  id v8;
  void *v9;
  SignpostContextFrameLifetime *v10;
  uint64_t v11;
  uint64_t v12;
  SignpostContextFrameLifetime *v13;
  id *p_isa;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v11 = objc_msgSend(v8, "earliestMCT");
    v12 = objc_msgSend(v7, "endMachContinuousTime");
    objc_msgSend(v7, "timebaseRatio");
    v16.receiver = self;
    v16.super_class = (Class)SignpostContextFrameLifetime;
    v13 = -[SignpostAnimationSubInterval initWithStartMCT:endMCT:timebaseRatio:](&v16, sel_initWithStartMCT_endMCT_timebaseRatio_, v11, v12);
    p_isa = (id *)&v13->super.super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_parentFrameLifetime, a3);
      objc_storeStrong(p_isa + 5, a4);
    }
    self = p_isa;
    v10 = self;
  }

  return v10;
}

- (unsigned)frameSeed
{
  void *v2;
  unsigned int v3;

  -[SignpostContextFrameLifetime parentFrameLifetime](self, "parentFrameLifetime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "frameSeed");

  return v3;
}

- (SignpostFrameLifetimeInterval)parentFrameLifetime
{
  return self->_parentFrameLifetime;
}

- (SignpostContextInfo)contextInfo
{
  return self->_contextInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextInfo, 0);
  objc_storeStrong((id *)&self->_parentFrameLifetime, 0);
}

@end
