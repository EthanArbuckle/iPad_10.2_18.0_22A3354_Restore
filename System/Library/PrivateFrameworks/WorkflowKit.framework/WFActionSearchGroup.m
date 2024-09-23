@implementation WFActionSearchGroup

- (WFActionSearchGroup)initWithIdentifier:(id)a3 localizedName:(id)a4 actions:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFActionSearchGroup *v12;
  uint64_t v13;
  NSString *identifier;
  uint64_t v15;
  NSString *localizedName;
  uint64_t v17;
  NSArray *actions;
  WFActionSearchGroup *v19;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionSearch.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localizedName"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionSearch.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFActionSearch.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actions"));

LABEL_4:
  v24.receiver = self;
  v24.super_class = (Class)WFActionSearchGroup;
  v12 = -[WFActionSearchGroup init](&v24, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    localizedName = v12->_localizedName;
    v12->_localizedName = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    actions = v12->_actions;
    v12->_actions = (NSArray *)v17;

    v19 = v12;
  }

  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
