@implementation TRAArbiterUpdateOrientationResolutionPolicySpecifier

- (TRAArbiterUpdateOrientationResolutionPolicySpecifier)initWithComponentOrder:(id)a3
{
  id v4;
  TRAArbiterUpdateOrientationResolutionPolicySpecifier *v5;
  uint64_t v6;
  NSNumber *componentOrder;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRAArbiterUpdateOrientationResolutionPolicySpecifier;
  v5 = -[TRAArbiterUpdateOrientationResolutionPolicySpecifier init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    componentOrder = v5->_componentOrder;
    v5->_componentOrder = (NSNumber *)v6;

  }
  return v5;
}

- (void)setParticipantsUniqueIdentifiers:(id)a3
{
  objc_storeWeak((id *)&self->_participantsUniqueIdentifiers, a3);
}

- (void)setForceResolution:(BOOL)a3
{
  self->_forceResolution = a3;
}

- (void)setActuationContext:(id)a3
{
  objc_storeStrong((id *)&self->_actuationContext, a3);
}

- (int64_t)preferencesType
{
  return 1;
}

- (NSNumber)componentOrder
{
  return self->_componentOrder;
}

- (void)updateStageParticipantsResolutionPolicies:(id)a3 context:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  int v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        WeakRetained = objc_loadWeakRetained((id *)&self->_participantsUniqueIdentifiers);
        objc_msgSend(v10, "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(WeakRetained, "containsObject:", v12);

        if (v13)
        {
          objc_msgSend(v10, "orientationResolutionPolicyInfo");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setForceResolution:", self->_forceResolution);
          objc_msgSend(v14, "setActuationContext:", self->_actuationContext);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actuationContext, 0);
  objc_destroyWeak((id *)&self->_participantsUniqueIdentifiers);
  objc_storeStrong((id *)&self->_componentOrder, 0);
}

- (NSArray)participantsUniqueIdentifiers
{
  return (NSArray *)objc_loadWeakRetained((id *)&self->_participantsUniqueIdentifiers);
}

- (BOOL)forceResolution
{
  return self->_forceResolution;
}

- (TRASettingsActuationContext)actuationContext
{
  return self->_actuationContext;
}

@end
