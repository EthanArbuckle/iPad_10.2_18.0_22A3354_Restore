@implementation SVXDeviceProblemsState

- (SVXDeviceProblemsState)initWithIsFixingProblems:(BOOL)a3 problems:(unint64_t)a4
{
  SVXDeviceProblemsState *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SVXDeviceProblemsState;
  result = -[SVXDeviceProblemsState init](&v7, sel_init);
  if (result)
  {
    result->_isFixingProblems = a3;
    result->_problems = a4;
  }
  return result;
}

- (id)description
{
  return -[SVXDeviceProblemsState _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  _BOOL4 isFixingProblems;
  unint64_t problems;
  id v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v15.receiver = self;
  v15.super_class = (Class)SVXDeviceProblemsState;
  -[SVXDeviceProblemsState description](&v15, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isFixingProblems = self->_isFixingProblems;
  problems = self->_problems;
  if (problems)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v9 = v8;
    if ((problems & 1) != 0)
    {
      objc_msgSend(v8, "addObject:", CFSTR("unspecified"));
      if ((problems & 2) == 0)
      {
LABEL_4:
        if ((problems & 4) == 0)
          goto LABEL_5;
        goto LABEL_31;
      }
    }
    else if ((problems & 2) == 0)
    {
      goto LABEL_4;
    }
    objc_msgSend(v9, "addObject:", CFSTR("iCloud"));
    if ((problems & 4) == 0)
    {
LABEL_5:
      if ((problems & 8) == 0)
        goto LABEL_6;
      goto LABEL_32;
    }
LABEL_31:
    objc_msgSend(v9, "addObject:", CFSTR("iTunes"));
    if ((problems & 8) == 0)
    {
LABEL_6:
      if ((problems & 0x10) == 0)
        goto LABEL_7;
      goto LABEL_33;
    }
LABEL_32:
    objc_msgSend(v9, "addObject:", CFSTR("HomeKit"));
    if ((problems & 0x10) == 0)
    {
LABEL_7:
      if ((problems & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_34;
    }
LABEL_33:
    objc_msgSend(v9, "addObject:", CFSTR("wiFi"));
    if ((problems & 0x20) == 0)
    {
LABEL_8:
      if ((problems & 0x40) == 0)
        goto LABEL_9;
      goto LABEL_35;
    }
LABEL_34:
    objc_msgSend(v9, "addObject:", CFSTR("wiFiPerformance"));
    if ((problems & 0x40) == 0)
    {
LABEL_9:
      if ((problems & 0x80) == 0)
        goto LABEL_10;
      goto LABEL_36;
    }
LABEL_35:
    objc_msgSend(v9, "addObject:", CFSTR("internet"));
    if ((problems & 0x80) == 0)
    {
LABEL_10:
      if ((problems & 0x100) == 0)
        goto LABEL_11;
      goto LABEL_37;
    }
LABEL_36:
    objc_msgSend(v9, "addObject:", CFSTR("hardware"));
    if ((problems & 0x100) == 0)
    {
LABEL_11:
      if ((problems & 0x200) == 0)
        goto LABEL_12;
      goto LABEL_38;
    }
LABEL_37:
    objc_msgSend(v9, "addObject:", CFSTR("bluetooth"));
    if ((problems & 0x200) == 0)
    {
LABEL_12:
      if ((problems & 0x400) == 0)
        goto LABEL_13;
      goto LABEL_39;
    }
LABEL_38:
    objc_msgSend(v9, "addObject:", CFSTR("thermal"));
    if ((problems & 0x400) == 0)
    {
LABEL_13:
      if ((problems & 0x800) == 0)
        goto LABEL_14;
      goto LABEL_40;
    }
LABEL_39:
    objc_msgSend(v9, "addObject:", CFSTR("recovery"));
    if ((problems & 0x800) == 0)
    {
LABEL_14:
      if ((problems & 0x1000) == 0)
        goto LABEL_15;
      goto LABEL_41;
    }
LABEL_40:
    objc_msgSend(v9, "addObject:", CFSTR("stereoNotFound"));
    if ((problems & 0x1000) == 0)
    {
LABEL_15:
      if ((problems & 0x2000) == 0)
        goto LABEL_16;
      goto LABEL_42;
    }
LABEL_41:
    objc_msgSend(v9, "addObject:", CFSTR("stereoVersion"));
    if ((problems & 0x2000) == 0)
    {
LABEL_16:
      if ((problems & 0x4000) == 0)
        goto LABEL_17;
      goto LABEL_43;
    }
LABEL_42:
    objc_msgSend(v9, "addObject:", CFSTR("stereoError"));
    if ((problems & 0x4000) == 0)
    {
LABEL_17:
      if ((problems & 0x8000) == 0)
        goto LABEL_18;
      goto LABEL_44;
    }
LABEL_43:
    objc_msgSend(v9, "addObject:", CFSTR("VPN"));
    if ((problems & 0x8000) == 0)
    {
LABEL_18:
      if ((problems & 0x10000) == 0)
        goto LABEL_19;
      goto LABEL_45;
    }
LABEL_44:
    objc_msgSend(v9, "addObject:", CFSTR("WiFi8021x"));
    if ((problems & 0x10000) == 0)
    {
LABEL_19:
      if ((problems & 0x20000) == 0)
        goto LABEL_20;
      goto LABEL_46;
    }
LABEL_45:
    objc_msgSend(v9, "addObject:", CFSTR("CDP"));
    if ((problems & 0x20000) == 0)
    {
LABEL_20:
      if ((problems & 0x40000) == 0)
        goto LABEL_21;
      goto LABEL_47;
    }
LABEL_46:
    objc_msgSend(v9, "addObject:", CFSTR("networkProfile"));
    if ((problems & 0x40000) == 0)
    {
LABEL_21:
      if ((problems & 0x80000) == 0)
      {
LABEL_23:
        v10 = (void *)objc_msgSend(v9, "copy");

        goto LABEL_25;
      }
LABEL_22:
      objc_msgSend(v9, "addObject:", CFSTR("networkProfileRequired"));
      goto LABEL_23;
    }
LABEL_47:
    objc_msgSend(v9, "addObject:", CFSTR("networkNotShareable"));
    if ((problems & 0x80000) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
  v10 = (void *)MEMORY[0x24BDBD1A8];
LABEL_25:
  if (isFixingProblems)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR("|"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {isFixingProblems = %@, problems = %@}"), v5, v11, v12);

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isFixingProblems);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_problems);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  SVXDeviceProblemsState *v4;
  SVXDeviceProblemsState *v5;
  _BOOL4 isFixingProblems;
  unint64_t problems;
  BOOL v8;

  v4 = (SVXDeviceProblemsState *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      isFixingProblems = self->_isFixingProblems;
      if (isFixingProblems == -[SVXDeviceProblemsState isFixingProblems](v5, "isFixingProblems"))
      {
        problems = self->_problems;
        v8 = problems == -[SVXDeviceProblemsState problems](v5, "problems");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (SVXDeviceProblemsState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeviceProblemsState::isFixingProblems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SVXDeviceProblemsState::problems"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  return -[SVXDeviceProblemsState initWithIsFixingProblems:problems:](self, "initWithIsFixingProblems:problems:", v6, v8);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 isFixingProblems;
  id v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD16E0];
  isFixingProblems = self->_isFixingProblems;
  v6 = a3;
  objc_msgSend(v4, "numberWithBool:", isFixingProblems);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("SVXDeviceProblemsState::isFixingProblems"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_problems);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("SVXDeviceProblemsState::problems"));

}

- (BOOL)isFixingProblems
{
  return self->_isFixingProblems;
}

- (unint64_t)problems
{
  return self->_problems;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _SVXDeviceProblemsStateMutation *);
  _SVXDeviceProblemsStateMutation *v5;
  void *v6;

  v4 = (void (**)(id, _SVXDeviceProblemsStateMutation *))a3;
  if (v4)
  {
    v5 = -[_SVXDeviceProblemsStateMutation initWithBaseModel:]([_SVXDeviceProblemsStateMutation alloc], "initWithBaseModel:", self);
    v4[2](v4, v5);
    -[_SVXDeviceProblemsStateMutation generate](v5, "generate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)-[SVXDeviceProblemsState copy](self, "copy");
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  void (**v3)(id, _SVXDeviceProblemsStateMutation *);
  _SVXDeviceProblemsStateMutation *v4;
  void *v5;

  v3 = (void (**)(id, _SVXDeviceProblemsStateMutation *))a3;
  v4 = objc_alloc_init(_SVXDeviceProblemsStateMutation);
  if (v3)
    v3[2](v3, v4);
  -[_SVXDeviceProblemsStateMutation generate](v4, "generate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
