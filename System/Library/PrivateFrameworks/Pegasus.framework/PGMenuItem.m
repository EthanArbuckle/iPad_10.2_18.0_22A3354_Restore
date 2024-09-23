@implementation PGMenuItem

- (PGMenuItem)initWithTitle:(id)a3 symbolName:(id)a4 action:(id)a5
{
  id v8;
  id v9;
  id v10;
  PGMenuItem *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSDictionary *dictionaryRepresentation;
  uint64_t v16;
  id action;
  objc_super v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PGMenuItem;
  v11 = -[PGMenuItem init](&v19, sel_init);
  if (v11)
  {
    if (PGMenuItemIdentifier == 0x7FFFFFFFFFFFFFFFLL)
      v12 = 0;
    else
      v12 = PGMenuItemIdentifier + 1;
    PGMenuItemIdentifier = v12;
    v20[0] = &unk_1E6242990;
    v20[1] = &unk_1E62429A8;
    v21[0] = v8;
    v21[1] = v9;
    v20[2] = &unk_1E62429C0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v14 = objc_claimAutoreleasedReturnValue();
    dictionaryRepresentation = v11->_dictionaryRepresentation;
    v11->_dictionaryRepresentation = (NSDictionary *)v14;

    v16 = MEMORY[0x1B5E0FE80](v10);
    action = v11->_action;
    v11->_action = (id)v16;

  }
  return v11;
}

- (PGMenuItem)initWithDictionary:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  PGMenuItem *v8;
  uint64_t v9;
  NSDictionary *dictionaryRepresentation;
  uint64_t v11;
  id action;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGMenuItem;
  v8 = -[PGMenuItem init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    dictionaryRepresentation = v8->_dictionaryRepresentation;
    v8->_dictionaryRepresentation = (NSDictionary *)v9;

    v11 = MEMORY[0x1B5E0FE80](v7);
    action = v8->_action;
    v8->_action = (id)v11;

  }
  return v8;
}

- (NSString)title
{
  return (NSString *)-[NSDictionary objectForKey:](self->_dictionaryRepresentation, "objectForKey:", &unk_1E6242990);
}

- (NSString)symbolName
{
  return (NSString *)-[NSDictionary objectForKey:](self->_dictionaryRepresentation, "objectForKey:", &unk_1E62429A8);
}

- (int64_t)identifier
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_dictionaryRepresentation, "objectForKey:", &unk_1E62429C0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)invokeAction
{
  (*((void (**)(void))self->_action + 2))();
}

- (NSString)description
{
  return (NSString *)-[PGMenuItem descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[PGMenuItem succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[PGMenuItem descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PGMenuItem succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMenuItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("title"));

  -[PGMenuItem symbolName](self, "symbolName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v6, CFSTR("symbolName"));

  v7 = (id)objc_msgSend(v4, "appendInteger:withName:", -[PGMenuItem identifier](self, "identifier"), CFSTR("identifier"));
  return v4;
}

- (id)action
{
  return self->_action;
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
  objc_storeStrong(&self->_action, 0);
}

@end
