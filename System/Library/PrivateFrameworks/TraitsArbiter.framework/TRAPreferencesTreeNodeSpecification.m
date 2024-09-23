@implementation TRAPreferencesTreeNodeSpecification

- (void)setOrder:(double)a3
{
  self->_order = a3;
}

- (TRAParticipant)parentParticipant
{
  return self->_parentParticipant;
}

- (TRAParticipant)participant
{
  return self->_participant;
}

- (double)order
{
  return self->_order;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentParticipant, 0);
  objc_storeStrong((id *)&self->_participant, 0);
}

- (TRAPreferencesTreeNodeSpecification)initWithParticipant:(id)a3 parentParticipant:(id)a4
{
  id v8;
  id v9;
  TRAPreferencesTreeNodeSpecification *v10;
  TRAPreferencesTreeNodeSpecification *v11;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (v8 == v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRAPreferencesTree.m"), 347, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant != parentParticipant"));

  }
  v14.receiver = self;
  v14.super_class = (Class)TRAPreferencesTreeNodeSpecification;
  v10 = -[TRAPreferencesTreeNodeSpecification init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_participant, a3);
    objc_storeStrong((id *)&v11->_parentParticipant, a4);
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  TRAPreferencesTreeNodeSpecification *v4;
  TRAPreferencesTreeNodeSpecification *v5;
  TRAPreferencesTreeNodeSpecification *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v12;

  v4 = (TRAPreferencesTreeNodeSpecification *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_10;
  if (v4 == self)
  {
    v12 = 1;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[TRAPreferencesTreeNodeSpecification participant](v6, "participant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRAPreferencesTreeNodeSpecification participant](self, "participant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[TRAPreferencesTreeNodeSpecification parentParticipant](v6, "parentParticipant");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[TRAPreferencesTreeNodeSpecification parentParticipant](self, "parentParticipant");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v7 == v8 && v9 == v10;
  }
  else
  {
LABEL_10:
    v12 = 0;
  }
LABEL_12:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 1, self->_participant);
    objc_storeStrong(v5 + 2, self->_parentParticipant);
    v5[3] = *(id *)&self->_order;
  }
  return v5;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRAPreferencesTreeNodeSpecification succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  TRAParticipant *parentParticipant;
  __CFString *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[TRAParticipant uniqueIdentifier](self->_participant, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  parentParticipant = self->_parentParticipant;
  if (parentParticipant)
  {
    -[TRAParticipant uniqueIdentifier](parentParticipant, "uniqueIdentifier");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("root");
  }
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ → %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v8, 0);

  if (parentParticipant)
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRAPreferencesTreeNodeSpecification descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_participant, a3);
}

- (void)setParentParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_parentParticipant, a3);
}

@end
