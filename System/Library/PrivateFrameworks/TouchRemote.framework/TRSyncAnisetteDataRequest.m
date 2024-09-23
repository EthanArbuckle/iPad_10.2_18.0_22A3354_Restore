@implementation TRSyncAnisetteDataRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSData *simData;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TRSyncAnisetteDataRequest;
  -[TRMessage encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  simData = self->_simData;
  if (simData)
    objc_msgSend(v4, "encodeObject:forKey:", simData, CFSTR("TRAnisetteDataMessages_sD"));

}

- (TRSyncAnisetteDataRequest)initWithCoder:(id)a3
{
  id v4;
  TRSyncAnisetteDataRequest *v5;
  uint64_t v6;
  NSData *simData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRSyncAnisetteDataRequest;
  v5 = -[TRMessage initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TRAnisetteDataMessages_sD"));
    v6 = objc_claimAutoreleasedReturnValue();
    simData = v5->_simData;
    v5->_simData = (NSData *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("simData:[-%@-]"), self->_simData);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)TRSyncAnisetteDataRequest;
  -[TRMessage description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSData)simData
{
  return self->_simData;
}

- (void)setSimData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simData, 0);
}

@end
