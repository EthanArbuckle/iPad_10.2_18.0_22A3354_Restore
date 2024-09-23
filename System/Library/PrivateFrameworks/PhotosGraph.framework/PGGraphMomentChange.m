@implementation PGGraphMomentChange

- (PGGraphMomentChange)initWithMomentUUID:(id)a3 updateTypes:(unint64_t)a4
{
  id v7;
  PGGraphMomentChange *v8;
  PGGraphMomentChange *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphMomentChange;
  v8 = -[PGGraphMomentChange init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_momentUUID, a3);
    v9->_updateTypes = a4;
  }

  return v9;
}

- (void)mergeChange:(id)a3
{
  unint64_t updateTypes;

  updateTypes = self->_updateTypes;
  self->_updateTypes = objc_msgSend(a3, "updateTypes") | updateTypes;
}

- (unint64_t)type
{
  return 3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PGGraphMomentChange;
  -[PGGraphChange description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _stringForGraphMomentUpdateTypes(self->_updateTypes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [updateTypes:%@][momentUUID:%@]"), v4, v5, self->_momentUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)momentUUID
{
  return self->_momentUUID;
}

- (unint64_t)updateTypes
{
  return self->_updateTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentUUID, 0);
}

@end
