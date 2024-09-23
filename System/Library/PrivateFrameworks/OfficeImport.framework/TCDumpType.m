@implementation TCDumpType

- (TCDumpType)init
{
  return -[TCDumpType initWithName:](self, "initWithName:", 0);
}

- (TCDumpType)initWithName:(id)a3
{
  id v5;
  TCDumpType *v6;
  TCDumpType *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TCDumpType;
  v6 = -[TCDumpType init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->mName, a3);

  return v7;
}

- (id)name
{
  return self->mName;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->mName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
}

@end
