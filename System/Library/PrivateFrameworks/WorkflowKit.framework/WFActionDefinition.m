@implementation WFActionDefinition

- (WFActionDefinition)initWithDictionary:(id)a3
{
  id v5;
  WFActionDefinition *v6;
  uint64_t v7;
  NSDictionary *definition;
  WFActionDefinition *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionDefinition.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFActionDefinition;
  v6 = -[WFActionDefinition init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    definition = v6->_definition;
    v6->_definition = (NSDictionary *)v7;

    v9 = v6;
  }

  return v6;
}

- (id)objectForKey:(id)a3
{
  if (self)
    self = (WFActionDefinition *)self->_definition;
  return -[WFActionDefinition objectForKey:](self, "objectForKey:", a3);
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionDefinition.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("definition"));

    v4 = 0;
  }
  return -[WFActionDefinition definitionByAddingEntriesInDictionary:](self, "definitionByAddingEntriesInDictionary:", v4);
}

- (id)definitionByAddingEntriesInDictionary:(id)a3
{
  id v4;
  WFActionDefinition *v5;
  NSDictionary *definition;
  void *v7;
  WFActionDefinition *v8;

  v4 = a3;
  v5 = [WFActionDefinition alloc];
  if (self)
    definition = self->_definition;
  else
    definition = 0;
  -[NSDictionary if_dictionaryByAddingEntriesFromDictionary:](definition, "if_dictionaryByAddingEntriesFromDictionary:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFActionDefinition initWithDictionary:](v5, "initWithDictionary:", v7);
  return v8;
}

- (id)definitionByRemovingKey:(id)a3
{
  NSDictionary *definition;
  id v4;
  void *v5;
  WFActionDefinition *v6;

  if (self)
    definition = self->_definition;
  else
    definition = 0;
  v4 = a3;
  v5 = (void *)-[NSDictionary mutableCopy](definition, "mutableCopy");
  objc_msgSend(v5, "removeObjectForKey:", v4);

  v6 = -[WFActionDefinition initWithDictionary:]([WFActionDefinition alloc], "initWithDictionary:", v5);
  return v6;
}

- (_NSLocalizedStringResource)name
{
  void *v2;
  void *v3;
  _NSLocalizedStringResource *v4;

  -[WFActionDefinition objectForKey:](self, "objectForKey:", CFSTR("Name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

- (WFActionDescriptionDefinition)descriptionDefinition
{
  WFActionDescriptionDefinition *v2;
  WFActionDescriptionDefinition *v3;

  -[WFActionDefinition objectForKey:](self, "objectForKey:", CFSTR("Description"));
  v2 = (WFActionDescriptionDefinition *)objc_claimAutoreleasedReturnValue();
  if (!v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v3 = [WFActionDescriptionDefinition alloc];
    v2 = -[WFActionDescriptionDefinition initWithDictionary:](v3, "initWithDictionary:", MEMORY[0x1E0C9AA70]);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definition, 0);
}

@end
