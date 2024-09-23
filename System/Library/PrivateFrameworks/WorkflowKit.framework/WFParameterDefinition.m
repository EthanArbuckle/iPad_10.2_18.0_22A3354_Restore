@implementation WFParameterDefinition

- (WFParameterDefinition)initWithDictionary:(id)a3
{
  id v5;
  WFParameterDefinition *v6;
  uint64_t v7;
  NSDictionary *definition;
  WFParameterDefinition *v9;
  void *v11;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFParameterDefinition.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFParameterDefinition.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dictionary isKindOfClass:[NSDictionary class]]"));

  }
  v13.receiver = self;
  v13.super_class = (Class)WFParameterDefinition;
  v6 = -[WFParameterDefinition init](&v13, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    definition = v6->_definition;
    v6->_definition = (NSDictionary *)v7;

    v9 = v6;
  }

  return v6;
}

- (id)definitionByMergingWithDefinition:(id)a3
{
  uint64_t v4;
  void *v7;

  if (a3)
  {
    v4 = *((_QWORD *)a3 + 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFParameterDefinition.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("definition"));

    v4 = 0;
  }
  return -[WFParameterDefinition definitionByAddingEntriesInDictionary:](self, "definitionByAddingEntriesInDictionary:", v4);
}

- (id)definitionByAddingEntriesInDictionary:(id)a3
{
  id v4;
  WFParameterDefinition *v5;
  NSDictionary *definition;
  void *v7;
  WFParameterDefinition *v8;

  v4 = a3;
  v5 = [WFParameterDefinition alloc];
  if (self)
    definition = self->_definition;
  else
    definition = 0;
  -[NSDictionary if_dictionaryByAddingEntriesFromDictionary:](definition, "if_dictionaryByAddingEntriesFromDictionary:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFParameterDefinition initWithDictionary:](v5, "initWithDictionary:", v7);
  return v8;
}

- (id)definitionByRemovingKey:(id)a3
{
  NSDictionary *definition;
  id v4;
  void *v5;
  WFParameterDefinition *v6;

  if (self)
    definition = self->_definition;
  else
    definition = 0;
  v4 = a3;
  v5 = (void *)-[NSDictionary mutableCopy](definition, "mutableCopy");
  objc_msgSend(v5, "removeObjectForKey:", v4);

  v6 = -[WFParameterDefinition initWithDictionary:]([WFParameterDefinition alloc], "initWithDictionary:", v5);
  return v6;
}

- (id)objectForKey:(id)a3
{
  if (self)
    self = (WFParameterDefinition *)self->_definition;
  return -[WFParameterDefinition objectForKey:](self, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definition, 0);
}

@end
