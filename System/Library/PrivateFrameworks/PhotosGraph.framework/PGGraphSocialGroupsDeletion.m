@implementation PGGraphSocialGroupsDeletion

- (PGGraphSocialGroupsDeletion)initWithSocialGroupUUIDs:(id)a3
{
  id v5;
  PGGraphSocialGroupsDeletion *v6;
  PGGraphSocialGroupsDeletion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphSocialGroupsDeletion;
  v6 = -[PGGraphSocialGroupsDeletion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_socialGroupUUIDs, a3);

  return v7;
}

- (unint64_t)type
{
  return 11;
}

- (unint64_t)changeCount
{
  return -[NSSet count](self->_socialGroupUUIDs, "count");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PGGraphSocialGroupsDeletion;
  -[PGGraphChange description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, socialGroupUUIDs (%ld): %@"), v4, -[NSSet count](self->_socialGroupUUIDs, "count"), self->_socialGroupUUIDs);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSSet)socialGroupUUIDs
{
  return self->_socialGroupUUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialGroupUUIDs, 0);
}

@end
