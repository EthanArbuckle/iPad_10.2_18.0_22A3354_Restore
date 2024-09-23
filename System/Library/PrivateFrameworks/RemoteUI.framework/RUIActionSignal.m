@implementation RUIActionSignal

+ (id)signalWithType:(unint64_t)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setTopSignal:", a3);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubActions:", v5);

  return v4;
}

+ (id)signalWithString:(id)a3
{
  void *v3;

  v3 = +[RUIActionSignal signalTypeForString:](RUIActionSignal, "signalTypeForString:", a3);
  if (v3)
  {
    +[RUIActionSignal signalWithType:](RUIActionSignal, "signalWithType:", v3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)stringForActionSignal:(unint64_t)a3
{
  if (a3 > 9)
    return CFSTR("unknown");
  else
    return off_24C297790[a3];
}

+ (unint64_t)signalTypeForString:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(&unk_24C2B1E50, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = -[RUIActionSignal topSignal](self, "topSignal");
    if (v7 != objc_msgSend(v6, "topSignal"))
    {
      v11 = 0;
LABEL_12:

      goto LABEL_13;
    }
    -[RUIActionSignal subActions](self, "subActions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || (objc_msgSend(v6, "subActions"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[RUIActionSignal subActions](self, "subActions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "subActions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (v8)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      v11 = 1;
    }

    goto LABEL_11;
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "stringForActionSignal:", self->_topSignal);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_topSignal);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p - %@ (%@), subactions = %@"), v4, self, v5, v6, self->_subActions);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)topSignal
{
  return self->_topSignal;
}

- (void)setTopSignal:(unint64_t)a3
{
  self->_topSignal = a3;
}

- (NSMutableArray)subActions
{
  return self->_subActions;
}

- (void)setSubActions:(id)a3
{
  objc_storeStrong((id *)&self->_subActions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subActions, 0);
}

@end
