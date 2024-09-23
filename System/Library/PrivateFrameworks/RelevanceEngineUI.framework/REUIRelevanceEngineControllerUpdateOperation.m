@implementation REUIRelevanceEngineControllerUpdateOperation

+ (id)showElement:(id)a3 atPath:(id)a4
{
  id result;

  result = (id)objc_msgSend(a1, "reloadElement:atPath:", a3, a4);
  *((_QWORD *)result + 5) = 1;
  return result;
}

+ (id)hideElement:(id)a3 atPath:(id)a4
{
  id result;

  result = (id)objc_msgSend(a1, "reloadElement:atPath:", a3, a4);
  *((_QWORD *)result + 5) = 2;
  return result;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_updateType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v7.receiver = self;
  v7.super_class = (Class)REUIRelevanceEngineControllerUpdateOperation;
  v5 = -[REElementUpdateOperation hash](&v7, sel_hash) ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && (v7.receiver = self,
        v7.super_class = (Class)REUIRelevanceEngineControllerUpdateOperation,
        -[REElementUpdateOperation isEqual:](&v7, sel_isEqual_, v4))
    && v4[5] == self->_updateType;

  return v5;
}

- (id)description
{
  unint64_t updateType;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  objc_super v12;

  updateType = self->_updateType;
  if (updateType == 1)
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    -[REElementUpdateOperation path](self, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    REStringForSectionPath();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR(" Show: %@"), v6);
  }
  else
  {
    if (updateType != 2)
    {
      v8 = &stru_24CF7A2B0;
      goto LABEL_7;
    }
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[REElementUpdateOperation path](self, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    REStringForSectionPath();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR(" Hide: %@"), v6);
  }
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  v12.receiver = self;
  v12.super_class = (Class)REUIRelevanceEngineControllerUpdateOperation;
  -[REElementUpdateOperation description](&v12, sel_description);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)updateType
{
  return self->_updateType;
}

@end
