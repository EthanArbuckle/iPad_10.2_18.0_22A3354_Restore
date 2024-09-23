@implementation SCRCArgumentSubcommand

+ (id)subcommandWithName:(id)a3
{
  id v3;
  SCRCArgumentSubcommand *v4;

  v3 = a3;
  v4 = -[SCRCArgumentSubcommand initWithName:]([SCRCArgumentSubcommand alloc], "initWithName:", v3);

  return v4;
}

- (SCRCArgumentSubcommand)initWithName:(id)a3
{
  id v5;
  SCRCArgumentSubcommand *v6;
  SCRCArgumentSubcommand *v7;
  NSMutableArray *v8;
  NSMutableArray *optionMutableArray;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCRCArgumentSubcommand;
  v6 = -[SCRCArgumentSubcommand init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subcommandName, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    optionMutableArray = v7->__optionMutableArray;
    v7->__optionMutableArray = v8;

  }
  return v7;
}

- (SCRCArgumentSubcommand)init
{
  SCRCArgumentSubcommand *v2;
  NSMutableArray *v3;
  NSMutableArray *optionMutableArray;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCRCArgumentSubcommand;
  v2 = -[SCRCArgumentSubcommand init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    optionMutableArray = v2->__optionMutableArray;
    v2->__optionMutableArray = v3;

  }
  return v2;
}

- (NSArray)optionArray
{
  void *v2;
  void *v3;

  -[SCRCArgumentSubcommand _optionMutableArray](self, "_optionMutableArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "subcommandName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SCRCArgumentSubcommand subcommandName](self, "subcommandName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SCRCArgumentSubcommand;
    v7 = -[SCRCArgumentSubcommand isEqual:](&v9, sel_isEqual_, v4);

  }
  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SCRCArgumentSubcommand subcommandName](self, "subcommandName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[SCRCArgumentSubcommand subcommandName](self, "subcommandName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subcommandName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:options:", v6, 1);
  return v7;
}

- (id)formattedHelpHeader
{
  return 0;
}

- (id)formattedHelpFooter
{
  return 0;
}

- (void)addOption:(char)a3 argument:(id)a4 target:(id)a5 action:(SEL)a6 argumentDescription:(id)a7 required:(BOOL)a8
{
  _BOOL8 v8;
  int v12;
  void *v14;
  id v15;
  id v16;
  id v17;
  SCRCArgumentHolder *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v8 = a8;
  v12 = a3;
  v14 = (void *)MEMORY[0x24BDD17C8];
  v15 = a7;
  v16 = a5;
  v17 = a4;
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%c"), v12);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v18 = -[SCRCArgumentHolder initWithArgument:option:description:target:action:required:]([SCRCArgumentHolder alloc], "initWithArgument:option:description:target:action:required:", v17, v23, v15, v16, a6, v8);

  -[SCRCArgumentSubcommand _optionMutableArray](self, "_optionMutableArray");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "indexOfObject:", v18);

  if (v20 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SCRCArgumentSubcommand _optionMutableArray](self, "_optionMutableArray");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeObjectAtIndex:", v20);

  }
  -[SCRCArgumentSubcommand _optionMutableArray](self, "_optionMutableArray");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v18);

}

- (int)run
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)SCRCArgumentSubcommand;
  -[SCRCArgumentSubcommand description](&v18, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SCRCArgumentSubcommand optionArray](self, "optionArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "appendFormat:", CFSTR(" %@"), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);
  }

  v10 = (void *)MEMORY[0x24BDD17C8];
  -[SCRCArgumentSubcommand subcommandName](self, "subcommandName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ { %@%@ }"), v3, v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)subcommandName
{
  return self->_subcommandName;
}

- (void)setSubcommandName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableArray)_optionMutableArray
{
  return self->__optionMutableArray;
}

- (void)set_optionMutableArray:(id)a3
{
  objc_storeStrong((id *)&self->__optionMutableArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__optionMutableArray, 0);
  objc_storeStrong((id *)&self->_subcommandName, 0);
}

@end
