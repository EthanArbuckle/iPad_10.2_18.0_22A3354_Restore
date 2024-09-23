@implementation SignpostSupportCompositorInterval

- (SignpostSupportCompositorInterval)initWithStartContinuousTime:(unint64_t)a3 endContinuousTime:(unint64_t)a4 timebaseRatio:(double)a5 contributingPids:(id)a6
{
  id v10;
  SignpostSupportCompositorInterval *v11;
  uint64_t v12;
  NSArray *contributingPids;
  objc_super v15;
  objc_super v16;

  v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SignpostSupportCompositorInterval;
  v15.receiver = -[SignpostAnimationSubInterval initWithStartMCT:endMCT:timebaseRatio:](&v16, sel_initWithStartMCT_endMCT_timebaseRatio_, a3, a4, a5);
  v15.super_class = (Class)SignpostSupportCompositorInterval;
  v11 = -[SignpostSupportCompositorInterval init](&v15, sel_init);
  if (v11)
  {
    objc_msgSend(v10, "allObjects");
    v12 = objc_claimAutoreleasedReturnValue();
    contributingPids = v11->_contributingPids;
    v11->_contributingPids = (NSArray *)v12;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  SignpostSupportCompositorInterval *v4;
  SignpostSupportCompositorInterval *v5;
  BOOL v6;

  v4 = (SignpostSupportCompositorInterval *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  if (-[SignpostSupportCompositorInterval isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    v6 = -[SignpostSupportCompositorInterval isEqualToSignpostSupportCompositorInterval:](self, "isEqualToSignpostSupportCompositorInterval:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToSignpostSupportCompositorInterval:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = a3;
  if (v4 && objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[SignpostAnimationSubInterval startMachContinuousTime](self, "startMachContinuousTime");
    if (v6 == objc_msgSend(v5, "startMachContinuousTime"))
    {
      v7 = -[SignpostAnimationSubInterval endMachContinuousTime](self, "endMachContinuousTime");
      if (v7 == objc_msgSend(v5, "endMachContinuousTime"))
      {
        -[SignpostSupportCompositorInterval contributingPids](self, "contributingPids");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "contributingPids");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v8)
        {

          if (v10)
          {
            -[SignpostSupportCompositorInterval contributingPids](self, "contributingPids");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "contributingPids");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v11, "isEqualToArray:", v12);

            if ((v13 & 1) != 0)
              goto LABEL_8;
          }
        }
        else
        {

          if (!v10)
          {
LABEL_8:
            v14 = 1;
LABEL_12:

            goto LABEL_13;
          }
        }
      }
    }
    v14 = 0;
    goto LABEL_12;
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = -[SignpostAnimationSubInterval startMachContinuousTime](self, "startMachContinuousTime");
  v4 = -[SignpostAnimationSubInterval endMachContinuousTime](self, "endMachContinuousTime") ^ v3;
  -[SignpostSupportCompositorInterval contributingPids](self, "contributingPids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");

  return v6;
}

- (NSArray)contributingPids
{
  return self->_contributingPids;
}

- (void)setContributingPids:(id)a3
{
  objc_storeStrong((id *)&self->_contributingPids, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contributingPids, 0);
}

+ (id)serializationTypeNumber
{
  return 0;
}

- (id)serializeableDictionaryWithShouldRedact:(BOOL)a3
{
  return 0;
}

- (SignpostSupportCompositorInterval)initWithDictionary:(id)a3
{

  return 0;
}

- (id)humanReadableType
{
  return CFSTR("CompositeInterval");
}

- (id)humanReadableDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("StartMCTimestamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SignpostAnimationSubInterval startMachContinuousTime](self, "startMachContinuousTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("EndMCTimestamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SignpostAnimationSubInterval endMachContinuousTime](self, "endMachContinuousTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("SignpostObjectType");
  -[SignpostSupportCompositorInterval humanReadableType](self, "humanReadableType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
