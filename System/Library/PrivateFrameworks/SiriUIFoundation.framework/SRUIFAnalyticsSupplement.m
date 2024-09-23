@implementation SRUIFAnalyticsSupplement

- (void)didComputeMode:(int)a3 forAceCommand:(id)a4 generatedAceCommands:(id)a5
{
  NSArray *v8;
  NSString *v9;
  NSString *lastComputedRefId;
  NSArray *generatedAceCommands;

  v8 = (NSArray *)a5;
  self->_lastComputedMode = a3;
  objc_msgSend(a4, "refId");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  lastComputedRefId = self->_lastComputedRefId;
  self->_lastComputedRefId = v9;

  generatedAceCommands = self->_generatedAceCommands;
  self->_generatedAceCommands = v8;

}

- (int)computedModeForRefId:(id)a3
{
  int result;

  result = objc_msgSend(a3, "isEqualToString:", self->_lastComputedRefId);
  if (result)
    return self->_lastComputedMode;
  return result;
}

- (int)computedModeForAceCommand:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int lastComputedMode;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_generatedAceCommands;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v4, "aceId", (_QWORD)v18);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(v10, "aceId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "aceId");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqualToString:", v14);

          if (v15)
          {
            lastComputedMode = self->_lastComputedMode;
            goto LABEL_12;
          }
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
  lastComputedMode = 0;
LABEL_12:

  return lastComputedMode;
}

- (void)storeDialogPhasesForItemsAtIndexPaths:(id)a3 forConversation:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *aceObjectDialogPhaseDictionary;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  SRUIFAnalyticsSupplement *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v21 = self;
  if (!self->_aceObjectDialogPhaseDictionary)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    aceObjectDialogPhaseDictionary = self->_aceObjectDialogPhaseDictionary;
    self->_aceObjectDialogPhaseDictionary = v8;

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v7, "itemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "aceObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dialogPhase");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(v16, "aceId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            v19 = v21->_aceObjectDialogPhaseDictionary;
            objc_msgSend(v16, "aceId");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v17, v20);

          }
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

}

- (id)dialogPhaseForAceObject:(id)a3
{
  NSMutableDictionary *aceObjectDialogPhaseDictionary;
  void *v4;
  void *v5;

  aceObjectDialogPhaseDictionary = self->_aceObjectDialogPhaseDictionary;
  objc_msgSend(a3, "aceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](aceObjectDialogPhaseDictionary, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceObjectDialogPhaseDictionary, 0);
  objc_storeStrong((id *)&self->_generatedAceCommands, 0);
  objc_storeStrong((id *)&self->_lastComputedRefId, 0);
}

@end
