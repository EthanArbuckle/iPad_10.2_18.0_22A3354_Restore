@implementation WFActionDescriptionDefinition

- (WFActionDescriptionDefinition)initWithDictionary:(id)a3
{
  id v5;
  WFActionDescriptionDefinition *v6;
  uint64_t v7;
  NSDictionary *definition;
  WFActionDescriptionDefinition *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionDefinition.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionary"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFActionDescriptionDefinition;
  v6 = -[WFActionDescriptionDefinition init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    definition = v6->_definition;
    v6->_definition = (NSDictionary *)v7;

    v9 = v6;
  }

  return v6;
}

- (id)definitionByAddingEntriesInDictionary:(id)a3
{
  id v4;
  WFActionDescriptionDefinition *v5;
  NSDictionary *definition;
  void *v7;
  WFActionDescriptionDefinition *v8;

  v4 = a3;
  v5 = [WFActionDescriptionDefinition alloc];
  if (self)
    definition = self->_definition;
  else
    definition = 0;
  -[NSDictionary if_dictionaryByAddingEntriesFromDictionary:](definition, "if_dictionaryByAddingEntriesFromDictionary:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFActionDescriptionDefinition initWithDictionary:](v5, "initWithDictionary:", v7);
  return v8;
}

- (id)objectForKey:(id)a3
{
  if (self)
    self = (WFActionDescriptionDefinition *)self->_definition;
  return -[WFActionDescriptionDefinition objectForKey:](self, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definition, 0);
}

@end
