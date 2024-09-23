@implementation _PASArgSubcommand

- (_PASArgSubcommand)initWithName:(id)a3 help:(id)a4 handler:(id)a5
{
  id v10;
  id v11;
  id v12;
  _PASArgSubcommand *v13;
  _PASArgSubcommand *v14;
  uint64_t v15;
  id handler;
  uint64_t v17;
  NSMutableArray *registeredOptions;
  uint64_t v19;
  NSMutableSet *requiredOptions;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "length"))
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASArgParser.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("helpDescription"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASArgParser.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name.length > 0"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASArgParser.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

LABEL_4:
  v25.receiver = self;
  v25.super_class = (Class)_PASArgSubcommand;
  v13 = -[_PASArgSubcommand init](&v25, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    objc_storeStrong((id *)&v14->_helpDescription, a4);
    v15 = MEMORY[0x1A1AFDE78](v12);
    handler = v14->_handler;
    v14->_handler = (id)v15;

    v17 = objc_opt_new();
    registeredOptions = v14->_registeredOptions;
    v14->_registeredOptions = (NSMutableArray *)v17;

    v19 = objc_opt_new();
    requiredOptions = v14->_requiredOptions;
    v14->_requiredOptions = (NSMutableSet *)v19;

  }
  return v14;
}

- (id)description
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("_PASSubcommand. name:%@ help:%@"), self->_name, self->_helpDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_registeredOptions, "count"))
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(" Options:\n"));
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = self->_registeredOptions;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "appendFormat:", CFSTR("  %@\n"), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
  return v3;
}

- (void)registerOption:(id)a3
{
  NSMutableSet *requiredOptions;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMutableArray addObject:](self->_registeredOptions, "addObject:", v6);
  if (objc_msgSend(v6, "required"))
  {
    requiredOptions = self->_requiredOptions;
    objc_msgSend(v6, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](requiredOptions, "addObject:", v5);

  }
}

- (id)optionShortHelp
{
  return makeOptionShortHelp(self->_registeredOptions);
}

- (id)optionLongHelp
{
  return makeOptionLongHelp(self->_registeredOptions);
}

- (id)naiveUsageHelpWithPositionalArgString:(id)a3
{
  return -[_PASArgSubcommand customUsageHelpWithUsageOverride:positionalArgString:optionHelpOverride:additionalHelpText:](self, "customUsageHelpWithUsageOverride:positionalArgString:optionHelpOverride:additionalHelpText:", 0, a3, 0, 0);
}

- (id)customUsageHelpWithUsageOverride:(id)a3 positionalArgString:(id)a4 optionHelpOverride:(id)a5 additionalHelpText:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  NSString *name;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@ -- %@\n\n"), self->_name, self->_helpDescription);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v10)
  {
    objc_msgSend(v14, "appendString:", v10);
    if (!v11)
      goto LABEL_4;
    goto LABEL_3;
  }
  v23 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "processName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  -[_PASArgSubcommand optionShortHelp](self, "optionShortHelp");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("Usage:\n%@ %@%@"), v18, name, v20);
  objc_msgSend(v15, "appendString:", v21);

  if (v11)
  {
LABEL_3:
    objc_msgSend(v15, "appendString:", v11);
    objc_msgSend(v15, "appendString:", CFSTR("\n"));
  }
LABEL_4:
  if (!v12)
  {
    -[_PASArgSubcommand optionLongHelp](self, "optionLongHelp");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendString:", v22);

    if (!v13)
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_msgSend(v15, "appendString:", v12);
  if (v13)
LABEL_6:
    objc_msgSend(v15, "appendString:", v13);
LABEL_7:

  return v15;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)helpDescription
{
  return self->_helpDescription;
}

- (id)handler
{
  return self->_handler;
}

- (NSMutableArray)registeredOptions
{
  return self->_registeredOptions;
}

- (void)setRegisteredOptions:(id)a3
{
  objc_storeStrong((id *)&self->_registeredOptions, a3);
}

- (NSMutableSet)requiredOptions
{
  return self->_requiredOptions;
}

- (void)setRequiredOptions:(id)a3
{
  objc_storeStrong((id *)&self->_requiredOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredOptions, 0);
  objc_storeStrong((id *)&self->_registeredOptions, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_helpDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (_PASArgSubcommand)subcommandWithName:(id)a3 help:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:help:handler:", v10, v9, v8);

  return (_PASArgSubcommand *)v11;
}

+ (id)simpleSubcommandWithHelpGenerator:(id)a3 name:(id)a4 help:(id)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASArgParser.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __73___PASArgSubcommand_simpleSubcommandWithHelpGenerator_name_help_handler___block_invoke;
  v21[3] = &unk_1E442FBE0;
  v22 = v11;
  v23 = v14;
  v15 = v14;
  v16 = v11;
  +[_PASArgSubcommand subcommandWithName:help:handler:](_PASArgSubcommand, "subcommandWithName:help:handler:", v12, v13, v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PASArgOption optionWithName:shortName:help:](_PASArgOption, "optionWithName:shortName:help:", CFSTR("help"), CFSTR("h"), CFSTR("Display a help page."));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "registerOption:", v18);

  return v17;
}

@end
