@implementation _VOSProfileCommand

+ (_VOSProfileCommand)profileCommandWithCommand:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[_VOSProfileCommand _initWithCommand:gestures:keyboardShortcuts:quickNavShortcuts:secondaryCommands:]([_VOSProfileCommand alloc], "_initWithCommand:gestures:keyboardShortcuts:quickNavShortcuts:secondaryCommands:", v3, 0, 0, 0, 0);

  return (_VOSProfileCommand *)v4;
}

+ (_VOSProfileCommand)profileCommandWithStringValue:(id)a3
{
  void *v4;
  void *v5;

  +[VOSCommand builtInCommandWithStringValue:](VOSCommand, "builtInCommandWithStringValue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "profileCommandWithCommand:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (_VOSProfileCommand *)v5;
}

- (id)_initWithCommand:(id)a3 gestures:(id)a4 keyboardShortcuts:(id)a5 quickNavShortcuts:(id)a6 secondaryCommands:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _VOSProfileCommand *v18;
  id *p_isa;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v68.receiver = self;
  v68.super_class = (Class)_VOSProfileCommand;
  v18 = -[_VOSProfileCommand init](&v68, sel_init);
  p_isa = (id *)&v18->super.isa;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_command, a3);
    if (v14)
    {
      v20 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = p_isa[2];
    p_isa[2] = v20;
    v51 = v13;

    if (v15)
    {
      v22 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = p_isa[3];
    p_isa[3] = v22;

    if (v16)
    {
      v24 = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = p_isa[4];
    p_isa[4] = v24;

    v50 = v14;
    v26 = v15;
    if (v17)
    {
      v27 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    v28 = p_isa[5];
    p_isa[5] = v27;

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v29 = p_isa[2];
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v65 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "setCommand:", p_isa);
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      }
      while (v31);
    }

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v34 = p_isa[3];
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
    v15 = v26;
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v61 != v37)
            objc_enumerationMutation(v34);
          objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * j), "setCommand:", p_isa);
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
      }
      while (v36);
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v39 = p_isa[4];
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v57;
      do
      {
        for (k = 0; k != v41; ++k)
        {
          if (*(_QWORD *)v57 != v42)
            objc_enumerationMutation(v39);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * k), "setCommand:", p_isa);
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
      }
      while (v41);
    }

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v44 = p_isa[5];
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v53;
      do
      {
        for (m = 0; m != v46; ++m)
        {
          if (*(_QWORD *)v53 != v47)
            objc_enumerationMutation(v44);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * m), "setPrimaryProfileCommand:", p_isa);
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
      }
      while (v46);
    }

    v14 = v50;
    v13 = v51;
  }

  return p_isa;
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
  -[_VOSProfileCommand command](self, "command");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p>: cmd '%@'"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_VOSProfileCommand)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _VOSProfileCommand *v25;

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
  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("gestures"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDBCF20];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("keyboardShortcuts"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BDBCF20];
  v18 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("quickNavShortcuts"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x24BDBCF20];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("secondaryCommands"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[_VOSProfileCommand _initWithCommand:gestures:keyboardShortcuts:quickNavShortcuts:secondaryCommands:](self, "_initWithCommand:gestures:keyboardShortcuts:quickNavShortcuts:secondaryCommands:", v8, v12, v16, v20, v24);
  return v25;
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
  objc_msgSend(v7, "encodeObject:forKey:", self->_gestures, CFSTR("gestures"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_keyboardShortcuts, CFSTR("keyboardShortcuts"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_quickNavShortcuts, CFSTR("quickNavShortcuts"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_secondaryCommands, CFSTR("secondaryCommands"));

}

- (void)addGesture:(id)a3
{
  NSMutableSet *gestures;
  id v5;

  gestures = self->_gestures;
  v5 = a3;
  -[NSMutableSet addObject:](gestures, "addObject:", v5);
  objc_msgSend(v5, "setCommand:", self);

}

- (void)removeGesture:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setCommand:", 0);
  -[NSMutableSet removeObject:](self->_gestures, "removeObject:", v4);

}

- (id)profileGestureForGesture:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_gestures;
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "gesture", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)addKeyboardShortcut:(id)a3
{
  NSMutableSet *keyboardShortcuts;
  id v5;

  keyboardShortcuts = self->_keyboardShortcuts;
  v5 = a3;
  -[NSMutableSet addObject:](keyboardShortcuts, "addObject:", v5);
  objc_msgSend(v5, "setCommand:", self);

}

- (void)removeKeyboardShortcut:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setCommand:", 0);
  -[NSMutableSet removeObject:](self->_keyboardShortcuts, "removeObject:", v4);

}

- (id)profileKeyboardShortcutForKeyChord:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_keyboardShortcuts;
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "keyChord", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)addQuickNavShortcut:(id)a3
{
  NSMutableSet *quickNavShortcuts;
  id v5;

  quickNavShortcuts = self->_quickNavShortcuts;
  v5 = a3;
  -[NSMutableSet addObject:](quickNavShortcuts, "addObject:", v5);
  objc_msgSend(v5, "setCommand:", self);

}

- (void)removeQuickNavShortcut:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setCommand:", 0);
  -[NSMutableSet removeObject:](self->_quickNavShortcuts, "removeObject:", v4);

}

- (id)profileQuickNavShortcutForKeyChord:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_quickNavShortcuts;
  v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "keyChord", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)addSecondaryCommand:(id)a3
{
  NSMutableSet *secondaryCommands;
  id v5;

  secondaryCommands = self->_secondaryCommands;
  v5 = a3;
  -[NSMutableSet addObject:](secondaryCommands, "addObject:", v5);
  objc_msgSend(v5, "setPrimaryProfileCommand:", self);

}

- (void)removeSecondaryCommand:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setPrimaryProfileCommand:", 0);
  -[NSMutableSet removeObject:](self->_secondaryCommands, "removeObject:", v4);

}

- (BOOL)hasSecondaryCommands
{
  return -[NSMutableSet count](self->_secondaryCommands, "count") != 0;
}

- (id)secondaryCommandsForPressCount:(int64_t)a3
{
  NSMutableSet *secondaryCommands;
  _QWORD v5[5];

  secondaryCommands = self->_secondaryCommands;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53___VOSProfileCommand_secondaryCommandsForPressCount___block_invoke;
  v5[3] = &__block_descriptor_40_e41_B24__0___VOSProfileSecondaryCommand_8_B16l;
  v5[4] = a3;
  -[NSMutableSet ax_filteredSetUsingBlock:](secondaryCommands, "ax_filteredSetUsingBlock:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (VOSCommand)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
  objc_storeStrong((id *)&self->_command, a3);
}

- (NSMutableSet)gestures
{
  return self->_gestures;
}

- (void)setGestures:(id)a3
{
  objc_storeStrong((id *)&self->_gestures, a3);
}

- (NSMutableSet)keyboardShortcuts
{
  return self->_keyboardShortcuts;
}

- (void)setKeyboardShortcuts:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardShortcuts, a3);
}

- (NSMutableSet)quickNavShortcuts
{
  return self->_quickNavShortcuts;
}

- (void)setQuickNavShortcuts:(id)a3
{
  objc_storeStrong((id *)&self->_quickNavShortcuts, a3);
}

- (NSMutableSet)secondaryCommands
{
  return self->_secondaryCommands;
}

- (void)setSecondaryCommands:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryCommands, a3);
}

- (_VOSProfileMode)mode
{
  return (_VOSProfileMode *)objc_loadWeakRetained((id *)&self->_mode);
}

- (void)setMode:(id)a3
{
  objc_storeWeak((id *)&self->_mode, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mode);
  objc_storeStrong((id *)&self->_secondaryCommands, 0);
  objc_storeStrong((id *)&self->_quickNavShortcuts, 0);
  objc_storeStrong((id *)&self->_keyboardShortcuts, 0);
  objc_storeStrong((id *)&self->_gestures, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

@end
