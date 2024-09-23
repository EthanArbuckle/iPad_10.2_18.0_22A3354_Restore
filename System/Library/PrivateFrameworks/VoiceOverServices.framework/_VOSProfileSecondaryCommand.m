@implementation _VOSProfileSecondaryCommand

+ (id)profileSecondaryCommandWithCommand:(id)a3 context:(unint64_t)a4 pressCount:(unint64_t)a5
{
  id v7;
  id v8;

  v7 = a3;
  v8 = -[_VOSProfileSecondaryCommand _initWithCommand:context:pressCount:]([_VOSProfileSecondaryCommand alloc], "_initWithCommand:context:pressCount:", v7, a4, a5);

  return v8;
}

+ (id)profileSecondaryCommandWithStringValue:(id)a3 context:(unint64_t)a4 pressCount:(unint64_t)a5
{
  void *v8;
  void *v9;

  +[VOSCommand builtInCommandWithStringValue:](VOSCommand, "builtInCommandWithStringValue:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "profileSecondaryCommandWithCommand:context:pressCount:", v8, a4, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_initWithCommand:(id)a3 context:(unint64_t)a4 pressCount:(unint64_t)a5
{
  id v9;
  _VOSProfileSecondaryCommand *v10;
  _VOSProfileSecondaryCommand *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_VOSProfileSecondaryCommand;
  v10 = -[_VOSProfileSecondaryCommand init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_command, a3);
    v11->_context = a4;
    v11->_pressCount = a5;
  }

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_VOSProfileSecondaryCommand command](self, "command");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p>: cmd '%@' context: '%d' pressCount: '%d'"), v5, self, v6, -[_VOSProfileSecondaryCommand context](self, "context"), -[_VOSProfileSecondaryCommand pressCount](self, "pressCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_VOSProfileSecondaryCommand)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _VOSProfileSecondaryCommand *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("commandType"));
  if (v5 == 1)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("siriShortcut"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VOSCommand commandWithSiriShortcut:](VOSCommand, "commandWithSiriShortcut:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
    {
LABEL_6:
      +[VOSCommand Invalid](VOSCommand, "Invalid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("command"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VOSCommand builtInCommandWithStringValue:](VOSCommand, "builtInCommandWithStringValue:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  if (!v8)
    goto LABEL_6;
LABEL_7:
  v9 = -[_VOSProfileSecondaryCommand _initWithCommand:context:pressCount:](self, "_initWithCommand:context:pressCount:", v8, objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("context")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pressCount")));

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t v4;
  void *v5;
  const __CFString *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", -[VOSCommand commandType](self->_command, "commandType"), CFSTR("commandType"));
  v4 = -[VOSCommand commandType](self->_command, "commandType");
  if (v4 == 1)
  {
    -[VOSCommand siriShortcut](self->_command, "siriShortcut");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("siriShortcut");
    goto LABEL_5;
  }
  if (!v4)
  {
    -[VOSCommand rawValue](self->_command, "rawValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("command");
LABEL_5:
    objc_msgSend(v7, "encodeObject:forKey:", v5, v6);

  }
  objc_msgSend(v7, "encodeInteger:forKey:", -[_VOSProfileSecondaryCommand context](self, "context"), CFSTR("context"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[_VOSProfileSecondaryCommand pressCount](self, "pressCount"), CFSTR("pressCount"));

}

- (unint64_t)pressCount
{
  if (self->_pressCount <= 1)
    return 1;
  else
    return self->_pressCount;
}

- (VOSCommand)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
  objc_storeStrong((id *)&self->_command, a3);
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (void)setPressCount:(unint64_t)a3
{
  self->_pressCount = a3;
}

- (_VOSProfileCommand)primaryProfileCommand
{
  return (_VOSProfileCommand *)objc_loadWeakRetained((id *)&self->_primaryProfileCommand);
}

- (void)setPrimaryProfileCommand:(id)a3
{
  objc_storeWeak((id *)&self->_primaryProfileCommand, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_primaryProfileCommand);
  objc_storeStrong((id *)&self->_command, 0);
}

@end
