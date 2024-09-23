@implementation VOSVoiceOverCommandInfo

- (void)_loadBrailleCommandsIfNecessary
{
  void *v3;
  NSDictionary *v4;
  NSDictionary *brailleCommands;
  id v6;

  if (!self->_brailleCommands)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("BrailleVoiceOverCommands"), CFSTR("plist"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v6);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    brailleCommands = self->_brailleCommands;
    self->_brailleCommands = v4;

  }
}

- (id)brailleVoiceOverCategories
{
  void *v3;
  void *v4;
  id v5;

  -[VOSVoiceOverCommandInfo _loadBrailleCommandsIfNecessary](self, "_loadBrailleCommandsIfNecessary");
  -[NSDictionary allKeys](self->_brailleCommands, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x24BDBD1A8];
  v5 = v3;

  return v5;
}

- (id)brailleCommandsForCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[VOSVoiceOverCommandInfo _loadBrailleCommandsIfNecessary](self, "_loadBrailleCommandsIfNecessary");
  -[NSDictionary objectForKey:](self->_brailleCommands, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "keysOfEntriesPassingTest:", &__block_literal_global_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __54__VOSVoiceOverCommandInfo_brailleCommandsForCategory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    objc_msgSend(v5, "objectForKey:", CFSTR("tvOSAvailable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (AXDeviceIsTV() && v7 && !objc_msgSend(v7, "BOOLValue"))
    {
      v10 = 0;
    }
    else
    {
      objc_opt_class();
      objc_msgSend(v5, "objectForKey:", CFSTR("tvOSAvailable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (AXDeviceIsWatch() && v9 && !objc_msgSend(v9, "BOOLValue"))
      {
        v10 = 0;
      }
      else if ((AXDeviceIsPad() & 1) != 0)
      {
        v10 = 1;
      }
      else
      {
        objc_msgSend(v5, "objectForKey:", CFSTR("MultittaskDeviceOnly"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "BOOLValue");

        v10 = v12 ^ 1u;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)localizedNameForCommand:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, 0, CFSTR("VoiceOverCommands"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedNameForCategory:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, 0, CFSTR("VoiceOverCommands"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brailleCommands, 0);
}

@end
