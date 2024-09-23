@implementation SBLayoutState

- (BOOL)layoutContainsRole:(int64_t)a3
{
  void *v3;
  BOOL v4;

  -[SBLayoutState elementWithRole:](self, "elementWithRole:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (int64_t)interfaceOrientation
{
  if (self->_interfaceOrientation)
    return self->_interfaceOrientation;
  else
    return -[SBLayoutState _defaultInterfaceOrientation](self, "_defaultInterfaceOrientation");
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  SBLayoutState *v7;
  void *v8;
  int v9;
  char v10;
  int64_t v11;
  void *v12;
  void *v13;

  v7 = (SBLayoutState *)a3;
  if (self == v7)
  {
    v10 = 1;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = 0;
    goto LABEL_19;
  }
  -[SBLayoutState elements](self, "elements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (-[SBLayoutState elements](v7, "elements"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SBLayoutState elements](self, "elements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLayoutState elements](v7, "elements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToSet:", v5) & 1) == 0)
    {

      v10 = 0;
      goto LABEL_16;
    }
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  v11 = -[SBLayoutState interfaceOrientation](self, "interfaceOrientation");
  if (v11 == -[SBLayoutState interfaceOrientation](v7, "interfaceOrientation"))
  {
    -[SBLayoutState interfaceOrientationByLayoutElementIdentifier](self, "interfaceOrientationByLayoutElementIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLayoutState interfaceOrientationByLayoutElementIdentifier](v7, "interfaceOrientationByLayoutElementIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = SBEqualObjects(v12, v13);

    if (!v9)
      goto LABEL_16;
    goto LABEL_15;
  }
  v10 = 0;
  if ((v9 & 1) != 0)
  {
LABEL_15:

  }
LABEL_16:
  if (!v8)

LABEL_19:
  return v10;
}

- (id)elementWithRole:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SBLayoutState elements](self, "elements", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "layoutRole") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (NSSet)elements
{
  return self->_elements;
}

- (NSDictionary)interfaceOrientationByLayoutElementIdentifier
{
  return self->_interfaceOrientationByLayoutElementIdentifier;
}

- (id)_initWithLayoutElements:(id)a3 interfaceOrientation:(int64_t)a4 interfaceOrientationByLayoutElement:(id)a5
{
  id v8;
  id v9;
  SBLayoutState *v10;
  uint64_t v11;
  NSSet *elements;
  uint64_t v13;
  NSDictionary *interfaceOrientationByLayoutElementIdentifier;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBLayoutState;
  v10 = -[SBLayoutState init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    elements = v10->_elements;
    v10->_elements = (NSSet *)v11;

    v10->_interfaceOrientation = a4;
    v13 = objc_msgSend(v9, "copy");
    interfaceOrientationByLayoutElementIdentifier = v10->_interfaceOrientationByLayoutElementIdentifier;
    v10->_interfaceOrientationByLayoutElementIdentifier = (NSDictionary *)v13;

  }
  return v10;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBLayoutState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLayoutState elements](self, "elements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", objc_msgSend(v4, "count"), CFSTR("elements"));

  return v3;
}

- (void)setInterfaceOrientationByLayoutElementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceOrientationByLayoutElementIdentifier, 0);
  objc_storeStrong((id *)&self->_elements, 0);
}

- (int64_t)interfaceOrientationForLayoutRole:(int64_t)a3
{
  void *v4;
  int64_t v5;

  -[SBLayoutState elementWithRole:](self, "elementWithRole:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBLayoutState interfaceOrientationForLayoutElement:](self, "interfaceOrientationForLayoutElement:", v4);

  return v5;
}

- (int64_t)interfaceOrientationForLayoutElement:(id)a3
{
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBLayoutState interfaceOrientationForElementIdentifier:](self, "interfaceOrientationForElementIdentifier:", v4);

  return v5;
}

- (int64_t)_interfaceOrientationForElementIdentifier:(id)a3 unknownAllowed:(BOOL)a4
{
  id v7;
  void *v8;
  NSDictionary *interfaceOrientationByLayoutElementIdentifier;
  void *v10;
  int64_t v11;
  void *v13;

  v7 = a3;
  -[SBLayoutState elementWithIdentifier:](self, "elementWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (interfaceOrientationByLayoutElementIdentifier = self->_interfaceOrientationByLayoutElementIdentifier,
        v8,
        !interfaceOrientationByLayoutElementIdentifier))
  {
    v11 = 0;
LABEL_8:
    if (!a4)
      v11 = -[SBLayoutState _defaultInterfaceOrientation](self, "_defaultInterfaceOrientation");
    goto LABEL_10;
  }
  -[NSDictionary objectForKey:](self->_interfaceOrientationByLayoutElementIdentifier, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLayoutState.m"), 80, CFSTR("Layout state element is known but its orientation is not mapped."));

  }
  v11 = objc_msgSend(v10, "integerValue");

  if (!v11)
    goto LABEL_8;
LABEL_10:

  return v11;
}

- (id)elementWithIdentifier:(id)a3
{
  id v4;
  void *v5;
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

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SBLayoutState elements](self, "elements", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
        objc_msgSend(v9, "uniqueIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (int64_t)interfaceOrientationForElementIdentifier:(id)a3
{
  return -[SBLayoutState _interfaceOrientationForElementIdentifier:unknownAllowed:](self, "_interfaceOrientationForElementIdentifier:unknownAllowed:", a3, 0);
}

BOOL __73__SBLayoutState_SwitcherSupport__isMeaningfullyDifferentFromLayoutState___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "layoutRole") != 3 && objc_msgSend(v2, "layoutRole") != 4;

  return v3;
}

- (BOOL)isMeaningfullyDifferentFromLayoutState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "elements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_filter:", &__block_literal_global_172);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBLayoutState elements](self, "elements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_filter:", &__block_literal_global_172);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v5, "isEqual:", v7) ^ 1;
  return (char)v6;
}

- (int64_t)interfaceOrientationForLayoutElement:(id)a3 unknownAllowed:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  int64_t v7;

  v4 = a4;
  objc_msgSend(a3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBLayoutState _interfaceOrientationForElementIdentifier:unknownAllowed:](self, "_interfaceOrientationForElementIdentifier:unknownAllowed:", v6, v4);

  return v7;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (SBLayoutState)init
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  SBLayoutState *v8;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ does not support initialization."), v6);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBLayoutState _initWithLayoutElements:interfaceOrientation:interfaceOrientationByLayoutElement:](self, "_initWithLayoutElements:interfaceOrientation:interfaceOrientationByLayoutElement:", v7, 0, MEMORY[0x1E0C9AA70]);

  return v8;
}

- (int64_t)_defaultInterfaceOrientation
{
  return 1;
}

- (BOOL)isEqual:(id)a3 withRole:(int64_t)a4
{
  SBLayoutState *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  void *v15;
  void *v16;

  v6 = (SBLayoutState *)a3;
  if (self == v6)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("layoutRole == %d"), a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLayoutState elements](self, "elements");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "filteredSetUsingPredicate:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "anyObject");
      v10 = objc_claimAutoreleasedReturnValue();

      -[SBLayoutState elements](v6, "elements");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "filteredSetUsingPredicate:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "anyObject");
      v13 = objc_claimAutoreleasedReturnValue();

      if (v10 | v13)
      {
        v14 = 0;
        if (v10 && v13)
        {
          objc_msgSend((id)v10, "uniqueIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v13, "uniqueIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v15, "isEqualToString:", v16);

        }
      }
      else
      {
        v14 = 1;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBLayoutState descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  const __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[SBLayoutState succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SBLayoutState interfaceOrientationByLayoutElementIdentifier](self, "interfaceOrientationByLayoutElementIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__SBLayoutState_descriptionBuilderWithMultilinePrefix___block_invoke;
  v14[3] = &unk_1E8EAF960;
  v15 = v6;
  v8 = v6;
  objc_msgSend(v7, "bs_each:", v14);

  if (-[SBLayoutState interfaceOrientation](self, "interfaceOrientation") == 1)
  {
    v9 = CFSTR("UIInterfaceOrientationPortrait");
  }
  else if (-[SBLayoutState interfaceOrientation](self, "interfaceOrientation") == 4)
  {
    v9 = CFSTR("UIInterfaceOrientationLandscapeLeft");
  }
  else if (-[SBLayoutState interfaceOrientation](self, "interfaceOrientation") == 3)
  {
    v9 = CFSTR("UIInterfaceOrientationLandscapeRight");
  }
  else if (-[SBLayoutState interfaceOrientation](self, "interfaceOrientation") == 2)
  {
    v9 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
  }
  else
  {
    v9 = 0;
  }
  v10 = (id)objc_msgSend(v5, "appendObject:withName:", v9, CFSTR("interfaceOrientation"));
  objc_msgSend(v5, "appendDictionarySection:withName:skipIfEmpty:", v8, CFSTR("interfaceOrientationByLayoutElement"), 0);
  -[SBLayoutState elements](self, "elements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v12, CFSTR("elements"), v4, 1);

  return v5;
}

void __55__SBLayoutState_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  const __CFString *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (objc_msgSend(v5, "integerValue") == 1)
  {
    v7 = CFSTR("UIInterfaceOrientationPortrait");
  }
  else if (objc_msgSend(v5, "integerValue") == 4)
  {
    v7 = CFSTR("UIInterfaceOrientationLandscapeLeft");
  }
  else if (objc_msgSend(v5, "integerValue") == 3)
  {
    v7 = CFSTR("UIInterfaceOrientationLandscapeRight");
  }
  else if (objc_msgSend(v5, "integerValue") == 2)
  {
    v7 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v6, "setObject:forKey:", v7, v8);

}

- (unint64_t)hash
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  unint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D01788]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SBLayoutState elements](self, "elements", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = (id)objc_msgSend(v3, "appendObject:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v10 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[SBLayoutState interfaceOrientation](self, "interfaceOrientation"));
  v11 = objc_msgSend(v3, "hash");

  return v11;
}

- (NSString)description
{
  return (NSString *)-[SBLayoutState descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)appLayout
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  SBAppLayout *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  SBDisplayItemLayoutAttributes *v22;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[SBLayoutState elementWithRole:](self, "elementWithRole:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    +[SBDisplayItem displayItemForLayoutElement:](SBDisplayItem, "displayItemForLayoutElement:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v6);

    -[SBLayoutState elementWithRole:](self, "elementWithRole:", 2);
    v7 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v7;
    if (v7)
    {
      +[SBDisplayItem displayItemForLayoutElement:](SBDisplayItem, "displayItemForLayoutElement:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v9);

      v10 = 3;
    }
    else
    {
      v10 = 1;
    }
    v25 = v10;
    -[SBLayoutState elementWithRole:](self, "elementWithRole:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      +[SBDisplayItem displayItemForLayoutElement:](SBDisplayItem, "displayItemForLayoutElement:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

      v24 = 1;
    }
    else
    {
      v24 = 0;
    }
    v15 = (void *)objc_opt_new();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = v4;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(v16, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_alloc_init(SBDisplayItemLayoutAttributes);
          objc_msgSend(v15, "setObject:forKey:", v22, v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v18);
    }

    v11 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:]([SBAppLayout alloc], "initWithItemsForLayoutRoles:configuration:itemsToLayoutAttributes:centerConfiguration:environment:hidden:preferredDisplayOrdinal:", v16, v25, v15, v24, 1, 0, 0);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)floatingAppLayout
{
  return 0;
}

@end
