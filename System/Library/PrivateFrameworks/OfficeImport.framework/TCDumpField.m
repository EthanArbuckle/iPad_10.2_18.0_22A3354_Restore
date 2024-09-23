@implementation TCDumpField

- (TCDumpField)initWithType:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  TCDumpField *v9;
  TCDumpField *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TCDumpField;
  v9 = -[TCDumpField init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mType, a3);
    objc_storeStrong((id *)&v10->mName, a4);
  }

  return v10;
}

- (id)type
{
  return self->mType;
}

- (id)name
{
  return self->mName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
  objc_storeStrong((id *)&self->mType, 0);
}

@end
