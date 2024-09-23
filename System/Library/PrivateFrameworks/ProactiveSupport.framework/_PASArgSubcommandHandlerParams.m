@implementation _PASArgSubcommandHandlerParams

- (_PASArgSubcommandHandlerParams)initWithSubcommand:(id)a3 options:(id)a4 positionalArguments:(id)a5
{
  id v9;
  id v10;
  id v11;
  _PASArgSubcommandHandlerParams *v12;
  _PASArgSubcommandHandlerParams *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_PASArgSubcommandHandlerParams;
  v12 = -[_PASArgSubcommandHandlerParams init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_subcommand, a3);
    objc_storeStrong((id *)&v13->_options, a4);
    objc_storeStrong((id *)&v13->_positionalArguments, a5);
  }

  return v13;
}

- (_PASArgSubcommand)subcommand
{
  return self->_subcommand;
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSArray)positionalArguments
{
  return self->_positionalArguments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positionalArguments, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_subcommand, 0);
}

@end
