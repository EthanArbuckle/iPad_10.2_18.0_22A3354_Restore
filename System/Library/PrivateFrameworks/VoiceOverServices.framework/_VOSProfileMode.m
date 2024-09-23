@implementation _VOSProfileMode

+ (id)profileModeWitMode:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[_VOSProfileMode _initWithMode:commands:]([_VOSProfileMode alloc], "_initWithMode:commands:", v3, 0);

  return v4;
}

+ (_VOSProfileMode)profileModeWithStringValue:(id)a3
{
  void *v4;
  void *v5;

  +[VOSScreenreaderMode modeWithStringValue:](VOSScreenreaderMode, "modeWithStringValue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "profileModeWitMode:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (_VOSProfileMode *)v5;
}

- (id)_initWithMode:(id)a3 commands:(id)a4
{
  id v7;
  id v8;
  _VOSProfileMode *v9;
  _VOSProfileMode *v10;
  NSMutableSet *v11;
  NSMutableSet *commands;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)_VOSProfileMode;
  v9 = -[_VOSProfileMode init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mode, a3);
    if (v8)
    {
      v11 = (NSMutableSet *)v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    }
    commands = v10->_commands;
    v10->_commands = v11;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17++), "setMode:", v10, (_QWORD)v19);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v15);
    }

  }
  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VOSProfileMode mode](self, "mode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rawValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p>: rawValue '%@'"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_VOSProfileMode)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _VOSProfileMode *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VOSScreenreaderMode modeWithStringValue:](VOSScreenreaderMode, "modeWithStringValue:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[VOSScreenreaderMode Invalid](VOSScreenreaderMode, "Invalid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("commands"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[_VOSProfileMode _initWithMode:commands:](self, "_initWithMode:commands:", v6, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  VOSScreenreaderMode *mode;
  void *v5;
  id v6;

  mode = self->_mode;
  v6 = a3;
  -[VOSScreenreaderMode rawValue](mode, "rawValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("mode"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_commands, CFSTR("commands"));
}

- (void)addCommand:(id)a3
{
  NSMutableSet *commands;
  id v5;

  commands = self->_commands;
  v5 = a3;
  -[NSMutableSet addObject:](commands, "addObject:", v5);
  objc_msgSend(v5, "setMode:", self);

}

- (VOSScreenreaderMode)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
  objc_storeStrong((id *)&self->_mode, a3);
}

- (NSMutableSet)commands
{
  return self->_commands;
}

- (void)setCommands:(id)a3
{
  objc_storeStrong((id *)&self->_commands, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_mode, 0);
}

@end
