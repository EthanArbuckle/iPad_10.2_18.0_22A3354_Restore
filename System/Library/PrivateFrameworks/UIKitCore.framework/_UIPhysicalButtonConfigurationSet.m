@implementation _UIPhysicalButtonConfigurationSet

- (void)encodeWithBSXPCCoder:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58___UIPhysicalButtonConfigurationSet_encodeWithBSXPCCoder___block_invoke;
  v3[3] = &unk_1E16ECFC0;
  v3[4] = a3;
  -[_UIPhysicalButtonConfigurationSet _enumerateConfigurationsWithBlock:](self, "_enumerateConfigurationsWithBlock:", v3);
}

- (void)_enumerateConfigurationsWithBlock:(id)a3
{
  _QWORD v3[7];
  _QWORD v4[3];
  char v5;

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  v5 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71___UIPhysicalButtonConfigurationSet__enumerateConfigurationsWithBlock___block_invoke;
  v3[3] = &unk_1E16ECFE8;
  v3[4] = self;
  v3[5] = a3;
  v3[6] = v4;
  _UIPhysicalButtonEnumerateAllButtonsWithBlock((uint64_t)v3);
  _Block_object_dispose(v4, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationsByButton, 0);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (_QWORD)_initWithConfigurationsDictionary:(void *)a1
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  int IsValid;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int IsValidForButton;
  void *v16;
  _BOOL4 IsValidForBehavior;
  int v18;
  int v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  uint64_t v28;
  void *v29;
  _QWORD *v30;
  _QWORD *v31;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[5];
  id v41;
  objc_super v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v3 = a1;
  v4 = objc_opt_class();
  if (v4 == objc_opt_class() || v4 == objc_opt_class())
  {
    if (a2)
    {
LABEL_5:
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v5 = a2;
      v37 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v37)
      {
        v6 = 0;
        v38 = *(_QWORD *)v44;
        v35 = v3;
        v36 = a2;
        while (2)
        {
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v44 != v38)
              objc_enumerationMutation(v5);
            v8 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            v9 = objc_msgSend(v8, "unsignedIntegerValue");
            objc_msgSend(v5, "objectForKey:", v8);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if ((_UIPhysicalButtonIsValid(v9) & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid dictionary key button value: %lu; configuration: %@"),
                v9,
                v10);
              v22 = (id)objc_claimAutoreleasedReturnValue();
              goto LABEL_30;
            }
            IsValid = _UIPhysicalButtonIsValid(v9);
            if (v10)
            {
              v39 = objc_msgSend(v10, "_button");
              v12 = objc_msgSend(v10, "_button");
              v13 = objc_msgSend(v10, "_behavior");
              v14 = _UIPhysicalButtonIsValid(v12);
              IsValidForButton = _UIPhysicalButtonBehaviorIsValidForButton(v13, v12);
              objc_msgSend(v10, "_behaviorOptions");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              IsValidForBehavior = _UIPhysicalButtonBehaviorOptionsIsValidForBehavior(v16, v13);

              if (v39 == v9)
                v18 = v14;
              else
                v18 = 0;
              v19 = v18 & IsValidForButton & IsValidForBehavior;
            }
            else
            {
              v19 = 1;
            }
            if ((IsValid & v19 & 1) == 0)
            {
              v23 = (void *)MEMORY[0x1E0CB3940];
              _NSStringFromUIPhysicalButton(v9);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "stringWithFormat:", CFSTR("Invalid configuration for %@: %@"), v24, v10);
              goto LABEL_29;
            }
            if ((unint64_t)(v9 - 1) >= 5)
              v20 = 0;
            else
              v20 = 1 << v9;
            if ((v20 & ~v6) == 0)
            {
              v25 = (void *)MEMORY[0x1E0CB3940];
              _NSStringFromUIPhysicalButton(v9);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "stringWithFormat:", CFSTR("Configuration dictionary contains more than one %@ button"), v24, v34);
LABEL_29:
              v22 = (id)objc_claimAutoreleasedReturnValue();

LABEL_30:
              v21 = v22;
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v3 = v35;
              objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithConfigurationsDictionary_, v35, CFSTR("_UIPhysicalButtonConfiguration.m"), 799, CFSTR("Invalid configurations dictionary for reason: %@; dictionary: %@"),
                v21,
                v5);

              a2 = v36;
              goto LABEL_31;
            }
            v6 |= v20;

          }
          v3 = v35;
          a2 = v36;
          v37 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
          if (v37)
            continue;
          break;
        }
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithConfigurationsDictionary_, v3, CFSTR("_UIPhysicalButtonConfiguration.m"), 795, CFSTR("_UIPhysicalButtonConfigurationSet cannot be subclassed"));

    if (a2)
      goto LABEL_5;
  }
  v21 = 0;
LABEL_31:
  v42.receiver = v3;
  v42.super_class = (Class)_UIPhysicalButtonConfigurationSet;
  v27 = objc_msgSendSuper2(&v42, sel_init);
  if (v27)
  {
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 6);
    v29 = (void *)v27[1];
    v27[1] = v28;

    if (a2)
    {
      if (objc_msgSend(a2, "count"))
      {
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __71___UIPhysicalButtonConfigurationSet__initWithConfigurationsDictionary___block_invoke;
        v40[3] = &unk_1E16B2978;
        v40[4] = a2;
        v30 = v27;
        v41 = v30;
        _UIPhysicalButtonEnumerateAllButtonsWithBlock((uint64_t)v40);
        -[_UIPhysicalButtonConfigurationSet _validateButtonRequirements](v30);

      }
    }
  }
  v31 = v27;

  return v31;
}

- (uint64_t)_validateRequirementsForCandidateButton:(void *)a3 andConfiguration:(char)a4 allowingNilRequiredConfiguration:(_QWORD *)a5 withOutErrorMessage:
{
  int IsValid;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  int v14;
  int IsValidForButton;
  void *v16;
  _BOOL4 IsValidForBehavior;
  int v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD aBlock[8];
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  if (!a1)
    return 0;
  IsValid = _UIPhysicalButtonIsValid(a2);
  if (a3)
  {
    v10 = objc_msgSend(a3, "_button");
    v11 = objc_msgSend(a3, "_button");
    v12 = objc_msgSend(a3, "_behavior");
    v13 = a5;
    v14 = _UIPhysicalButtonIsValid(v11);
    IsValidForButton = _UIPhysicalButtonBehaviorIsValidForButton(v12, v11);
    objc_msgSend(a3, "_behaviorOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    IsValidForBehavior = _UIPhysicalButtonBehaviorOptionsIsValidForBehavior(v16, v12);

    if (v10 == a2)
      v18 = v14;
    else
      v18 = 0;
    a5 = v13;
    v19 = v18 & IsValidForButton & IsValidForBehavior;
  }
  else
  {
    v19 = 1;
  }
  if ((IsValid & v19 & 1) == 0)
  {
    if (a5)
    {
      v21 = (void *)MEMORY[0x1E0CB3940];
      _NSStringFromUIPhysicalButton(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("Invalid configuration for %@: %@"), v22, a3);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  if (a1[16])
    return 1;
  _UIPhysicalButtonRequiredButtonsForButton(a2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__245;
  v40 = __Block_byref_object_dispose__245;
  v41 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __147___UIPhysicalButtonConfigurationSet__validateRequirementsForCandidateButton_andConfiguration_allowingNilRequiredConfiguration_withOutErrorMessage___block_invoke;
  aBlock[3] = &unk_1E16ECF98;
  v35 = a4;
  aBlock[4] = a1;
  aBlock[5] = a3;
  aBlock[6] = &v36;
  aBlock[7] = a2;
  v24 = _Block_copy(aBlock);
  v25 = v24;
  if (v23)
  {
    v20 = (*((unsigned int (**)(void *, void *))v24 + 2))(v24, v23) ^ 1;
    if (a5)
      v26 = v20;
    else
      v26 = 1;
    if ((v26 & 1) == 0)
    {
      v27 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a1, "succinctDescription");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _NSStringFromUIPhysicalButton(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a3, "succinctDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v37[5], "succinctDescription");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("The candidate button configuration is not valid as its behavior differs from an existing configuration of a required button: self: %@; candidateButton: %@; candidateConfiguration: %@; configurationWithFailingRequirement: %@"),
        v28,
        v29,
        v30,
        v31);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v20 = 1;
  }

  _Block_object_dispose(&v36, 8);
  return v20;
}

- (unint64_t)_countByEnumeratingWithState:(unint64_t)a3 objects:(unint64_t)a4 count:(unint64_t)a5 mutationPointer:
{
  unint64_t v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t *v19;

  if (!a1)
    return 0;
  v9 = *a2;
  if (!*a2)
    a2[2] = a5;
  _UIPhysicalButtonAllAvailableButtons();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (v9 >= v11)
  {
    v13 = 0;
  }
  else
  {
    v19 = a2;
    a2[1] = a3;
    if (a4)
    {
      v12 = v11;
      v13 = 0;
      v14 = v9;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "unsignedIntegerValue");

        objc_msgSend(a1, "_configurationForButton:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          *(_QWORD *)(a3 + 8 * v13++) = v17;

        ++v14;
      }
      while (v14 < v12 && v13 < a4);
    }
    else
    {
      v13 = 0;
    }
    *v19 = v13 + v9;
  }

  return v13;
}

- (id)_configurationForButton:(unint64_t)a3
{
  NSMutableDictionary *configurationsByButton;
  void *v4;
  void *v5;

  configurationsByButton = self->_configurationsByButton;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](configurationsByButton, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_validateButtonRequirements
{
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  int v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v1 = a1;
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v2)
    {
      v3 = v2;
      v4 = 0;
      v5 = *(_QWORD *)v14;
      while (2)
      {
        v6 = 0;
        v7 = v4;
        do
        {
          if (*(_QWORD *)v14 != v5)
            objc_enumerationMutation(v1);
          v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v6);
          v9 = objc_msgSend(v8, "_button");
          v12 = v7;
          v10 = -[_UIPhysicalButtonConfigurationSet _validateRequirementsForCandidateButton:andConfiguration:allowingNilRequiredConfiguration:withOutErrorMessage:](v1, v9, v8, 0, &v12);
          v4 = v12;

          if (!v10)
          {

            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__validateButtonRequirements, v1, CFSTR("_UIPhysicalButtonConfiguration.m"), 912, CFSTR("Invalid for reason: %@"), v4);
            v1 = v11;
            goto LABEL_12;
          }
          ++v6;
          v7 = v4;
        }
        while (v3 != v6);
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v3)
          continue;
        break;
      }
LABEL_12:

    }
    else
    {
      v4 = v1;
    }

  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[_UIPhysicalButtonConfigurationSet _countByEnumeratingWithState:objects:count:mutationPointer:](self, &a3->var0, (unint64_t)a4, a5, (unint64_t)&countByEnumeratingWithState_objects_count__mutations);
}

- (unint64_t)_count
{
  return -[NSMutableDictionary count](self->_configurationsByButton, "count");
}

- (BOOL)_isFull
{
  uint64_t v1;
  void *v2;
  _BOOL8 v3;

  if (!a1)
    return 0;
  v1 = objc_msgSend(*(id *)(a1 + 8), "count");
  _UIPhysicalButtonAllAvailableButtons();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v1 == objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  NSMutableDictionary *configurationsByButton;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  char v14;

  if (a3 == self)
    return 1;
  if (!a3 || !_NSIsNSObject())
    return 0;
  v5 = a3;
  v6 = objc_opt_class();
  if ((v6 == objc_opt_class() || (v7 = objc_opt_class(), v7 == objc_opt_class()))
    && (v8 = -[_UIPhysicalButtonConfigurationSet hash](self, "hash"), v8 == objc_msgSend(v5, "hash")))
  {
    configurationsByButton = self->_configurationsByButton;
    v10 = (void *)v5[1];
    v11 = configurationsByButton;
    v12 = v10;
    v13 = v12;
    if (v11 == v12)
    {
      v14 = 1;
    }
    else
    {
      v14 = 0;
      if (v11 && v12)
        v14 = -[NSMutableDictionary isEqual:](v11, "isEqual:", v12);
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)_configurationSetFromNSSet:(uint64_t)a1
{
  uint64_t v3;
  char IsMostlyValid;
  id v5;
  uint64_t v6;
  _BYTE *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_self();
  v19 = 0;
  IsMostlyValid = _UIPhysicalButtonConfigurationNSSetIsMostlyValid(a2, &v19);
  v5 = v19;
  if ((IsMostlyValid & 1) != 0)
  {
    v6 = objc_opt_new();
    v7 = (_BYTE *)v6;
    if (v6)
      *(_BYTE *)(v6 + 16) = 1;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = a2;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "_setConfiguration:forButton:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "_button"));
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v10);
    }

    if (v7)
      v7[16] = 0;
    -[_UIPhysicalButtonConfigurationSet _validateButtonRequirements](v7);
    v13 = (void *)objc_msgSend(v7, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__configurationSetFromNSSet_, v3, CFSTR("_UIPhysicalButtonConfiguration.m"), 762, CFSTR("Invalid configurations set for reason: %@; set: %@"),
      v5,
      a2);
    v13 = 0;
  }

  return v13;
}

- (_UIPhysicalButtonConfigurationSet)initWithBSXPCCoder:(id)a3
{
  uint64_t v5;
  _UIPhysicalButtonConfigurationSet *v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v5 = objc_opt_class();
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__245;
  v13 = __Block_byref_object_dispose__245;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56___UIPhysicalButtonConfigurationSet_initWithBSXPCCoder___block_invoke;
  v8[3] = &unk_1E16ED038;
  v8[5] = &v9;
  v8[6] = v5;
  v8[4] = a3;
  _UIPhysicalButtonEnumerateAllButtonsWithBlock((uint64_t)v8);
  v6 = (_UIPhysicalButtonConfigurationSet *)-[_UIPhysicalButtonConfigurationSet _initWithConfigurationsDictionary:](self, (void *)v10[5]);
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (_UIPhysicalButtonConfigurationSet)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonConfiguration.m"), 788, CFSTR("%s: init is not allowed on %@"), "-[_UIPhysicalButtonConfigurationSet init]", objc_opt_class());

  return 0;
}

- (id)_nsSetRepresentation
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v1 = a1;
  if (a1)
  {
    v2 = (void *)a1[1];
    if (v2 && objc_msgSend(v2, "count"))
    {
      v3 = (void *)objc_opt_new();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __57___UIPhysicalButtonConfigurationSet__nsSetRepresentation__block_invoke;
      v7[3] = &unk_1E16ECFC0;
      v8 = v3;
      v4 = v3;
      objc_msgSend(v1, "_enumerateConfigurationsWithBlock:", v7);
      v5 = (void *)objc_msgSend(v4, "copy");

      return v5;
    }
    v1 = (id)objc_opt_new();
  }
  return v1;
}

- (id)_configurationPassingTest:(id)a3
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__245;
  v10 = __Block_byref_object_dispose__245;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63___UIPhysicalButtonConfigurationSet__configurationPassingTest___block_invoke;
  v5[3] = &unk_1E16ED010;
  v5[4] = a3;
  v5[5] = &v6;
  -[_UIPhysicalButtonConfigurationSet _enumerateConfigurationsWithBlock:](self, "_enumerateConfigurationsWithBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_configurationsByButton);
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

- (NSString)debugDescription
{
  return (NSString *)-[_UIPhysicalButtonConfigurationSet debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", &stru_1E16EDF20);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_UIPhysicalButtonConfigurationSet succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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
  _UIPhysicalButtonSuccinctConfigurationsDescriptionForSet(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("configurations"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIPhysicalButtonConfigurationSet descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_UIPhysicalButtonConfigurationSet descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  NSMutableDictionary *configurationsByButton;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _UIPhysicalButtonConfigurationSet *v12;

  if (!self
    || (configurationsByButton = self->_configurationsByButton) != 0
    && -[NSMutableDictionary count](configurationsByButton, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActiveMultilinePrefix:", a3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75___UIPhysicalButtonConfigurationSet_descriptionBuilderWithMultilinePrefix___block_invoke;
    v10[3] = &unk_1E16B1B50;
    v7 = v6;
    v11 = v7;
    v12 = self;
    v8 = (id)objc_msgSend(v7, "modifyBody:", v10);

    return v7;
  }
  else
  {
    -[_UIPhysicalButtonConfigurationSet succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  _UIPhysicalButtonMutableConfigurationSet *v4;
  void *v5;
  _QWORD *v6;

  v4 = [_UIPhysicalButtonMutableConfigurationSet alloc];
  v5 = (void *)-[NSMutableDictionary copy](self->_configurationsByButton, "copy");
  v6 = -[_UIPhysicalButtonConfigurationSet _initWithConfigurationsDictionary:](v4, v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53___UIPhysicalButtonConfigurationSet_encodeWithCoder___block_invoke;
  v3[3] = &unk_1E16ECFC0;
  v3[4] = a3;
  -[_UIPhysicalButtonConfigurationSet _enumerateConfigurationsWithBlock:](self, "_enumerateConfigurationsWithBlock:", v3);
}

- (_UIPhysicalButtonConfigurationSet)initWithCoder:(id)a3
{
  uint64_t v5;
  _UIPhysicalButtonConfigurationSet *v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v5 = objc_opt_class();
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__245;
  v13 = __Block_byref_object_dispose__245;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51___UIPhysicalButtonConfigurationSet_initWithCoder___block_invoke;
  v8[3] = &unk_1E16ED038;
  v8[5] = &v9;
  v8[6] = v5;
  v8[4] = a3;
  _UIPhysicalButtonEnumerateAllButtonsWithBlock((uint64_t)v8);
  v6 = (_UIPhysicalButtonConfigurationSet *)-[_UIPhysicalButtonConfigurationSet _initWithConfigurationsDictionary:](self, (void *)v10[5]);
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61___UIPhysicalButtonConfigurationSet_encodeWithXPCDictionary___block_invoke;
  v3[3] = &unk_1E16ECFC0;
  v3[4] = a3;
  -[_UIPhysicalButtonConfigurationSet _enumerateConfigurationsWithBlock:](self, "_enumerateConfigurationsWithBlock:", v3);
}

- (_UIPhysicalButtonConfigurationSet)initWithXPCDictionary:(id)a3
{
  _UIPhysicalButtonConfigurationSet *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  objc_opt_class();
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__245;
  v12 = __Block_byref_object_dispose__245;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59___UIPhysicalButtonConfigurationSet_initWithXPCDictionary___block_invoke;
  v7[3] = &unk_1E16B83B0;
  v7[4] = a3;
  v7[5] = &v8;
  _UIPhysicalButtonEnumerateAllButtonsWithBlock((uint64_t)v7);
  v5 = (_UIPhysicalButtonConfigurationSet *)-[_UIPhysicalButtonConfigurationSet _initWithConfigurationsDictionary:](self, (void *)v9[5]);
  _Block_object_dispose(&v8, 8);

  return v5;
}

@end
