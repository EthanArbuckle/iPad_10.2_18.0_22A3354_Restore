@implementation SBSAAnimatedTransitionDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPathsToAuxillaryBehaviorSettingsMap, 0);
  objc_storeStrong((id *)&self->_milestones, 0);
  objc_storeStrong((id *)&self->_responsibleProviderDebugString, 0);
  objc_storeStrong((id *)&self->_behaviorSettings, 0);
  objc_storeStrong((id *)&self->_animatedTransitionIdentifier, 0);
}

- (id)copyWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)-[SBSAAnimatedTransitionDescription copy](self, "copy");
  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithAnimatedTransitionDescription:", v5);
    v4[2](v4, v6);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAnimatedTransitionDescription:", self);
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

void __147__SBSAAnimatedTransitionDescription_animatedTransitionDescriptionWithAnimatedTransitionIdentifier_behaviorSettings_milestones_responsibleProvider___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  Class v10;
  objc_class *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (!v13)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a1[8];
    v9 = a1[9];
    v10 = NSClassFromString(CFSTR("SBSAAnimatedTransitionDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAAnimatedTransitionDescription.m"), 49, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setAnimatedTransitionIdentifier:", a1[4]);
  objc_msgSend(v6, "setBehaviorSettings:", a1[5]);
  objc_msgSend(v6, "setResponsibleProviderDebugString:", a1[6]);
  objc_msgSend(v6, "setMilestones:", a1[7]);

}

- (void)_setMilestones:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)_setResponsibleProviderDebugString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)_setAnimatedTransitionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)_setBehaviorSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SBSAAnimatedTransitionDescription)initWithAnimatedTransitionDescription:(id)a3
{
  id v4;
  SBSAAnimatedTransitionDescription *v5;
  void *v6;
  uint64_t v7;
  NSUUID *animatedTransitionIdentifier;
  void *v9;
  uint64_t v10;
  SBFFluidBehaviorSettings *behaviorSettings;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *keyPathsToAuxillaryBehaviorSettingsMap;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSString *responsibleProviderDebugString;
  void *v27;
  uint64_t v28;
  NSSet *milestones;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SBSAAnimatedTransitionDescription;
  v5 = -[SBSAAnimatedTransitionDescription init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "animatedTransitionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    animatedTransitionIdentifier = v5->_animatedTransitionIdentifier;
    v5->_animatedTransitionIdentifier = (NSUUID *)v7;

    objc_msgSend(v4, "behaviorSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    behaviorSettings = v5->_behaviorSettings;
    v5->_behaviorSettings = (SBFFluidBehaviorSettings *)v10;

    objc_msgSend(v4, "keyPathsToAuxillaryBehaviorSettingsMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v31 = v4;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = objc_claimAutoreleasedReturnValue();
      keyPathsToAuxillaryBehaviorSettingsMap = v5->_keyPathsToAuxillaryBehaviorSettingsMap;
      v5->_keyPathsToAuxillaryBehaviorSettingsMap = (NSMutableDictionary *)v13;

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(v12, "allKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v33 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
            v21 = v5->_keyPathsToAuxillaryBehaviorSettingsMap;
            objc_msgSend(v12, "objectForKeyedSubscript:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)objc_msgSend(v22, "copy");
            -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v23, v20);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v17);
      }

      v4 = v31;
    }
    objc_msgSend(v4, "responsibleProviderDebugString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    responsibleProviderDebugString = v5->_responsibleProviderDebugString;
    v5->_responsibleProviderDebugString = (NSString *)v25;

    objc_msgSend(v4, "milestones");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    milestones = v5->_milestones;
    v5->_milestones = (NSSet *)v28;

  }
  return v5;
}

- (SBFFluidBehaviorSettings)behaviorSettings
{
  return self->_behaviorSettings;
}

- (NSSet)milestones
{
  return self->_milestones;
}

- (NSString)responsibleProviderDebugString
{
  return self->_responsibleProviderDebugString;
}

- (NSMutableDictionary)keyPathsToAuxillaryBehaviorSettingsMap
{
  return self->_keyPathsToAuxillaryBehaviorSettingsMap;
}

- (NSUUID)animatedTransitionIdentifier
{
  return self->_animatedTransitionIdentifier;
}

+ (id)instanceWithBlock:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)objc_msgSend(v4, "copyWithBlock:", v3);

  return v5;
}

+ (id)animatedTransitionDescriptionWithAnimatedTransitionIdentifier:(id)a3 behaviorSettings:(id)a4 milestones:(id)a5 responsibleProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBSAAnimatedTransitionDescription *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  SEL v27;
  id v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = objc_alloc_init(SBSAAnimatedTransitionDescription);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __147__SBSAAnimatedTransitionDescription_animatedTransitionDescriptionWithAnimatedTransitionIdentifier_behaviorSettings_milestones_responsibleProvider___block_invoke;
  v22[3] = &unk_1E8EA39D8;
  v27 = a2;
  v28 = a1;
  v23 = v11;
  v24 = v12;
  v25 = v14;
  v26 = v13;
  v16 = v13;
  v17 = v14;
  v18 = v12;
  v19 = v11;
  v20 = -[SBSAAnimatedTransitionDescription copyWithBlock:](v15, "copyWithBlock:", v22);

  return v20;
}

- (id)keyPathsWithAuxillaryBehaviorSettings
{
  return (id)-[NSMutableDictionary allKeys](self->_keyPathsToAuxillaryBehaviorSettingsMap, "allKeys");
}

- (id)copyBySettingAuxillaryBehaviorSettings:(id)a3 forKeyPath:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  SEL v17;

  v7 = a3;
  v8 = a4;
  if (v7 && objc_msgSend(v7, "isUnanimated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSAAnimatedTransitionDescription.m"), 76, CFSTR("Only animated behavior settings (or nil) are acceptable"));

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__SBSAAnimatedTransitionDescription_copyBySettingAuxillaryBehaviorSettings_forKeyPath___block_invoke;
  v14[3] = &unk_1E8EA3798;
  v14[4] = self;
  v15 = v7;
  v16 = v8;
  v17 = a2;
  v9 = v8;
  v10 = v7;
  v11 = -[SBSAAnimatedTransitionDescription copyWithBlock:](self, "copyWithBlock:", v14);

  return v11;
}

void __87__SBSAAnimatedTransitionDescription_copyBySettingAuxillaryBehaviorSettings_forKeyPath___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  Class v10;
  objc_class *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (!v13)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a1[7];
    v9 = a1[4];
    v10 = NSClassFromString(CFSTR("SBSAAnimatedTransitionDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAAnimatedTransitionDescription.m"), 78, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setAuxillaryBehaviorSettings:forKeyPath:", a1[5], a1[6]);
}

- (id)auxillaryBehaviorSettingsForKeyPath:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  -[NSMutableDictionary objectForKey:](self->_keyPathsToAuxillaryBehaviorSettingsMap, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSUUID *animatedTransitionIdentifier;
  uint64_t v7;
  id v8;
  void *v9;
  SBFFluidBehaviorSettings *behaviorSettings;
  id v11;
  void *v12;
  NSMutableDictionary *keyPathsToAuxillaryBehaviorSettingsMap;
  id v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  animatedTransitionIdentifier = self->_animatedTransitionIdentifier;
  v7 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __45__SBSAAnimatedTransitionDescription_isEqual___block_invoke;
  v25[3] = &unk_1E8EA4320;
  v8 = v4;
  v26 = v8;
  objc_msgSend(v5, "appendObject:counterpart:", animatedTransitionIdentifier, v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  behaviorSettings = self->_behaviorSettings;
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __45__SBSAAnimatedTransitionDescription_isEqual___block_invoke_2;
  v23[3] = &unk_1E8EA4320;
  v11 = v8;
  v24 = v11;
  objc_msgSend(v9, "appendObject:counterpart:", behaviorSettings, v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  keyPathsToAuxillaryBehaviorSettingsMap = self->_keyPathsToAuxillaryBehaviorSettingsMap;
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __45__SBSAAnimatedTransitionDescription_isEqual___block_invoke_3;
  v21[3] = &unk_1E8EA4320;
  v14 = v11;
  v22 = v14;
  objc_msgSend(v12, "appendObject:counterpart:", keyPathsToAuxillaryBehaviorSettingsMap, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __45__SBSAAnimatedTransitionDescription_isEqual___block_invoke_4;
  v19[3] = &unk_1E8E9EA50;
  v19[4] = self;
  v20 = v14;
  v16 = v14;
  objc_msgSend(v15, "appendEqualsBlocks:", v19, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v17, "isEqual");

  return v7;
}

uint64_t __45__SBSAAnimatedTransitionDescription_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "animatedTransitionIdentifier");
}

uint64_t __45__SBSAAnimatedTransitionDescription_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "behaviorSettings");
}

uint64_t __45__SBSAAnimatedTransitionDescription_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "keyPathsToAuxillaryBehaviorSettingsMap");
}

uint64_t __45__SBSAAnimatedTransitionDescription_isEqual___block_invoke_4(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 40), "milestones");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = BSEqualSets();

  return v2;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:", self->_animatedTransitionIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:", self->_behaviorSettings);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendObject:", self->_keyPathsToAuxillaryBehaviorSettingsMap);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendObject:", self->_milestones);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  return v8;
}

- (NSString)description
{
  SBSAAnimatedTransitionDescription *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  SBSAAnimatedTransitionDescription *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v2 = self;
  v26 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary allKeys](self->_keyPathsToAuxillaryBehaviorSettingsMap, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = v2->_keyPathsToAuxillaryBehaviorSettingsMap;
    v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1E0CB3940];
          -[NSMutableDictionary objectForKey:](v2->_keyPathsToAuxillaryBehaviorSettingsMap, "objectForKey:", v11);
          v13 = v2;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("<\"%@\" : %@>"), v11, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v15);

          v2 = v13;
        }
        v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }

    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("[%@]"), v17);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = CFSTR("<none>");
  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; animatedTransitionIdentifier: %@; responsibleProvider: %@; behaviorSettings: %@; auxillaryBehaviorSettings: %@"),
                  objc_opt_class(),
                  v2,
                  v2->_animatedTransitionIdentifier,
                  v2->_responsibleProviderDebugString,
                  v2->_behaviorSettings,
                  v18);
  if (-[NSSet count](v2->_milestones, "count"))
    objc_msgSend(v19, "appendFormat:", CFSTR(" milestones: %@"), v2->_milestones);
  objc_msgSend(v19, "appendString:", CFSTR(">"));

  return (NSString *)v19;
}

- (void)_setKeyPathsToAuxillaryBehaviorSettingsMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
