@implementation WFWorkflowFolderPickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (id)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    +[WFDatabaseProxy defaultDatabase](WFDatabaseProxy, "defaultDatabase");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedVisibleFoldersWithError:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x1E0C9AA60];
    if (v5)
      v7 = (void *)v5;
    v8 = v7;

    objc_msgSend(v8, "if_map:", &__block_literal_global_60373);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    WFAllShortcutsParameterState();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v9);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v13 = self->_possibleStates;
    self->_possibleStates = v12;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (id)defaultSerializedRepresentation
{
  void *v2;
  void *v3;

  WFAllShortcutsParameterState();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serializedRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessoryImageForPossibleState:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[WFWorkflowFolderPickerParameter accessoryIconForPossibleState:](self, "accessoryIconForPossibleState:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = (void *)MEMORY[0x1E0DC7B70];
    objc_msgSend(v3, "symbolName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "glyphNamed:pointSize:", v5, 25.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithRenderingMode:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)accessoryIconForPossibleState:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", CFSTR("AllShortcuts")))
  {
    v5 = objc_alloc(MEMORY[0x1E0DC7DB0]);
    objc_msgSend(MEMORY[0x1E0DC7B68], "clearBackground");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithSymbolName:background:", CFSTR("app.2.stack.3d"), v6);
  }
  else
  {
    +[WFDatabase defaultDatabase](WFDatabase, "defaultDatabase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionWithIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "glyphCharacter");
    WFSystemImageNameForOutlineGlyphCharacter();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_alloc(MEMORY[0x1E0DC7DB0]);
      objc_msgSend(MEMORY[0x1E0DC7B68], "clearBackground");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v10, "initWithSymbolName:background:", v9, v11);

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

WFINObjectSubstitutableState *__49__WFWorkflowFolderPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WFINObjectSubstitutableState *v8;

  v2 = (objc_class *)MEMORY[0x1E0CBDA08];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v4, "initWithIdentifier:displayString:", v5, v6);
  v8 = -[WFVariableSubstitutableParameterState initWithValue:]([WFINObjectSubstitutableState alloc], "initWithValue:", v7);

  return v8;
}

@end
