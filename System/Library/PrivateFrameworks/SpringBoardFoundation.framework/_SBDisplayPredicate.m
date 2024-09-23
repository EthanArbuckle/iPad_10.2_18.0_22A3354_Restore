@implementation _SBDisplayPredicate

- (_SBDisplayPredicate)initWithDisplayHardwareIdentifier:(id)a3 productName:(id)a4
{
  id v8;
  id v9;
  id *v10;
  _SBDisplayPredicate *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayModePredicate.m"), 258, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayHardwareIdentifier"));

  }
  v14.receiver = self;
  v14.super_class = (Class)_SBDisplayPredicate;
  v10 = -[SBDisplayModePredicate _init](&v14, sel__init);
  v11 = (_SBDisplayPredicate *)v10;
  if (v10)
  {
    objc_storeStrong(v10 + 1, a3);
    objc_storeStrong((id *)&v11->_displayProductName, a4);
  }

  return v11;
}

- (_SBDisplayPredicate)initWithDisplay:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _SBDisplayPredicate *v8;

  v4 = a3;
  objc_msgSend(v4, "hardwareIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CADisplay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "productName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_SBDisplayPredicate initWithDisplayHardwareIdentifier:productName:](self, "initWithDisplayHardwareIdentifier:productName:", v5, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD *v8;
  BOOL v9;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8)
    v9 = -[NSString isEqualToString:](self->_displayHardwareIdentifier, "isEqualToString:", v8[1]);
  else
    v9 = 0;

  return v9;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_displayHardwareIdentifier, "hash");
}

- (BOOL)matchesDisplay:(id)a3
{
  id v5;
  NSString *displayHardwareIdentifier;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDisplayModePredicate.m"), 283, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayConfiguration != nil"));

  }
  displayHardwareIdentifier = self->_displayHardwareIdentifier;
  objc_msgSend(v5, "hardwareIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(displayHardwareIdentifier) = -[NSString isEqualToString:](displayHardwareIdentifier, "isEqualToString:", v7);

  return (char)displayHardwareIdentifier;
}

+ (id)fromDefaultsKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("^\\(\\.%@ \\[(%@)\\] \\[(.*)\\]\\)$"), CFSTR("display"), CFSTR("[0-9a-fA-F]{8}\\b-[0-9a-fA-F]{4}\\b-[0-9a-fA-F]{4}\\b-[0-9a-fA-F]{4}\\b-[0-9a-fA-F]{12}"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "rangeAtIndex:", 1);
    objc_msgSend(v4, "substringWithRange:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "rangeAtIndex:", 2);
    objc_msgSend(v4, "substringWithRange:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v11)
      v16 = v14 == 0;
    else
      v16 = 1;
    if (v16)
      v17 = 0;
    else
      v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDisplayHardwareIdentifier:productName:", v11, v14);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)defaultsKeyRepresentation
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(.%@ [%@] [%@])"), CFSTR("display"), self->_displayHardwareIdentifier, self->_displayProductName);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> [display: %@] [productName: %@]"), objc_opt_class(), self, self->_displayHardwareIdentifier, self->_displayProductName);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayProductName, 0);
  objc_storeStrong((id *)&self->_displayHardwareIdentifier, 0);
}

@end
