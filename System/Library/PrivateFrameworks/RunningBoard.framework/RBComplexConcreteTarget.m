@implementation RBComplexConcreteTarget

- (id)environment
{
  return self->_environment;
}

- (BOOL)isSystem
{
  return 0;
}

- (id)identity
{
  return self->_identity;
}

- (id)process
{
  return self->_process;
}

- (BOOL)isEqual:(id)a3
{
  RBComplexConcreteTarget *v4;
  uint64_t v5;
  char v6;
  NSString *environment;
  NSString *v8;
  BOOL v9;

  v4 = (RBComplexConcreteTarget *)a3;
  if (self == v4)
    goto LABEL_13;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class()
    || self->_process != v4->_process
    || v4->_identity && !-[RBSProcessIdentity isEqualToIdentity:](self->_identity, "isEqualToIdentity:"))
  {
    goto LABEL_4;
  }
  environment = self->_environment;
  v8 = v4->_environment;
  if (environment == v8)
  {
LABEL_13:
    v6 = 1;
    goto LABEL_14;
  }
  if (environment)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v6 = -[NSString isEqualToString:](environment, "isEqualToString:");
    goto LABEL_14;
  }
LABEL_4:
  v6 = 0;
LABEL_14:

  return v6;
}

- (id)description
{
  return objc_getProperty(self, a2, 8, 1);
}

- (id)_initWithProcess:(void *)a3 identity:(void *)a4 environment:
{
  id v8;
  id v9;
  id v10;
  id *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  objc_super v21;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)RBComplexConcreteTarget;
    v11 = (id *)objc_msgSendSuper2(&v21, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      v12 = objc_msgSend(v10, "copy");
      v13 = a1[4];
      a1[4] = (id)v12;

      if (a1[4])
      {
        v14 = objc_alloc(MEMORY[0x24BDD17C8]);
        v15 = a1[2];
        if (!v15)
          v15 = a1[3];
        objc_msgSend(v15, "shortDescription");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@(%@)"), v16, a1[4]);
        v18 = a1[1];
        a1[1] = (id)v17;

      }
      else
      {
        objc_msgSend(a1[3], "shortDescription");
        v19 = objc_claimAutoreleasedReturnValue();
        v16 = a1[1];
        a1[1] = (id)v19;
      }

    }
  }

  return a1;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = -[RBSProcessIdentity hash](self->_identity, "hash");
  v4 = -[NSString hash](self->_environment, "hash") ^ v3;
  return v4 ^ -[RBProcess hash](self->_process, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_description, 0);
}

- (id)createRBSTarget
{
  void *v3;
  RBProcess *process;

  if (-[RBComplexConcreteTarget isSystem](self, "isSystem"))
  {
    objc_msgSend(MEMORY[0x24BE80D38], "systemTarget");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    process = self->_process;
    if (process)
      objc_msgSend(MEMORY[0x24BE80D38], "targetWithPid:environmentIdentifier:", -[RBProcess rbs_pid](process, "rbs_pid"), self->_environment);
    else
      objc_msgSend(MEMORY[0x24BE80D38], "targetWithProcessIdentity:environmentIdentifier:", self->_identity, self->_environment);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
