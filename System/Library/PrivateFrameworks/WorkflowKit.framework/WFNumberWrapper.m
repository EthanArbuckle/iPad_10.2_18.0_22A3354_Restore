@implementation WFNumberWrapper

+ (id)wrapperWithNumber:(id)a3
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v10;

  v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFNumberSubstitutableState.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("number == nil || [number isKindOfClass:[NSNumber class]]"));

    }
  }
  v7 = objc_opt_new();
  v8 = (void *)v7;
  if (v7)
    objc_storeStrong((id *)(v7 + 8), a3);

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFNumberWrapper number](self, "number");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  WFNumberWrapper *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;

  v4 = (WFNumberWrapper *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFNumberWrapper number](self, "number");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFNumberWrapper number](v4, "number");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {
        v10 = 1;
      }
      else
      {
        v10 = 0;
        if (v7 && v8)
          v10 = objc_msgSend(v7, "isEqual:", v8);
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSNumber)number
{
  return self->_number;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_number, 0);
}

@end
