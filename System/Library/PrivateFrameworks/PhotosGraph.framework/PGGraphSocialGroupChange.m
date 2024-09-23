@implementation PGGraphSocialGroupChange

- (PGGraphSocialGroupChange)initWithSocialGroupUUID:(id)a3 propertyNames:(id)a4
{
  id v7;
  id v8;
  PGGraphSocialGroupChange *v9;
  PGGraphSocialGroupChange *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGGraphSocialGroupChange;
  v9 = -[PGGraphSocialGroupChange init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_socialGroupUUID, a3);
    objc_storeStrong((id *)&v10->_propertyNames, a4);
  }

  return v10;
}

- (unint64_t)type
{
  return 12;
}

- (void)mergeChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *propertyNames;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "socialGroupUUID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "length");
  v5 = (void *)-[NSSet mutableCopy](self->_propertyNames, "mutableCopy");
  objc_msgSend(v4, "propertyNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "unionSet:", v6);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v5);
  v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
  propertyNames = self->_propertyNames;
  self->_propertyNames = v7;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)PGGraphSocialGroupChange;
  -[PGGraphChange description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphSocialGroupChange socialGroupUUID](self, "socialGroupUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphSocialGroupChange propertyNames](self, "propertyNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ social group uuid: %@, propertyNames: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)socialGroupUUID
{
  return self->_socialGroupUUID;
}

- (NSSet)propertyNames
{
  return self->_propertyNames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyNames, 0);
  objc_storeStrong((id *)&self->_socialGroupUUID, 0);
}

@end
