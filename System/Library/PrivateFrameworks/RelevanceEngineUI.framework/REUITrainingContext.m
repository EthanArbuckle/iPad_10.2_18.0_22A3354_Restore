@implementation REUITrainingContext

- (REUITrainingContext)init
{
  REUITrainingContext *v2;
  uint64_t v3;
  NSMutableDictionary *becameVisibleDates;
  uint64_t v5;
  NSMutableDictionary *visibilityDurations;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)REUITrainingContext;
  v2 = -[RETrainingContext init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    becameVisibleDates = v2->_becameVisibleDates;
    v2->_becameVisibleDates = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    visibilityDurations = v2->_visibilityDurations;
    v2->_visibilityDurations = (NSMutableDictionary *)v5;

    v2->_resetsWhenResignsCurrent = 1;
  }
  return v2;
}

- (void)selectElementWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUITrainingContext _visibleElements](self, "_visibleElements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    objc_msgSend(v5, "removeObject:", v4);
    -[REUITrainingContext _higherElementsThanElement:](self, "_higherElementsThanElement:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

    if (soft_RETrainingSimulationIsCurrentlyActive())
    {
      -[REUITrainingContext _lowerElementsThanElement:](self, "_lowerElementsThanElement:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        objc_msgSend(v8, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v9);

      }
    }
    -[REUITrainingContext _interactionForElement:](self, "_interactionForElement:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE7D0C8]) & 1) != 0
      || objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE7D0D0]))
    {
      -[RETrainingContext trainWithElement:isPositiveEvent:interaction:](self, "trainWithElement:isPositiveEvent:interaction:", v4, 1, CFSTR("tap"));
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v11);
          -[RETrainingContext trainWithElement:isPositiveEvent:interaction:](self, "trainWithElement:isPositiveEvent:interaction:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v15++), 0, CFSTR("tap"), (_QWORD)v16);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v13);
    }

  }
}

- (void)elementWithIdentifierDidDisplay:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_becameVisibleDates, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_becameVisibleDates, "setObject:forKeyedSubscript:", v5, v6);

  }
}

- (void)_trainDwellForElement:(id)a3 withInterval:(double)a4
{
  double v6;
  double v7;
  void *v8;
  id v9;

  v9 = a3;
  -[REUITrainingContext maximumNegativeDwellTime](self, "maximumNegativeDwellTime");
  if (v6 > a4)
    -[RETrainingContext trainWithElement:isPositiveEvent:interaction:](self, "trainWithElement:isPositiveEvent:interaction:", v9, 0, CFSTR("tap"));
  -[REUITrainingContext minimumPositiveDwellTime](self, "minimumPositiveDwellTime");
  if (v7 < a4)
  {
    -[REUITrainingContext _interactionForElement:](self, "_interactionForElement:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE7D0C8]) & 1) != 0
      || objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE7D0D8]))
    {
      -[RETrainingContext trainWithElement:isPositiveEvent:interaction:](self, "trainWithElement:isPositiveEvent:interaction:", v9, 1, CFSTR("tap"));
    }

  }
}

- (void)elementWithIdentifierDidEndDisplay:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  id v14;

  v14 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_becameVisibleDates, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_becameVisibleDates, "objectForKeyedSubscript:", v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](self->_becameVisibleDates, "removeObjectForKey:", v14);
    if ((soft_RETrainingSimulationIsCurrentlyActive() & 1) == 0)
    {
      objc_msgSend(v5, "timeIntervalSinceDate:", v6);
      v8 = v7;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_visibilityDurations, "objectForKeyedSubscript:", v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BDD16E0];
      if (v9)
      {
        v11 = v9;
        objc_msgSend(v9, "doubleValue");
        if (v12 < v8)
          v12 = v8;
        objc_msgSend(v10, "numberWithDouble:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_visibilityDurations, "setObject:forKeyedSubscript:", v13, v14);

    }
  }

}

- (BOOL)isDisplayingElementWithIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_becameVisibleDates, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)resetContext
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableDictionary *visibilityDurations;
  _QWORD v9[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allKeys](self->_becameVisibleDates, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        -[REUITrainingContext elementWithIdentifierDidEndDisplay:](self, "elementWithIdentifierDidEndDisplay:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  visibilityDurations = self->_visibilityDurations;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __35__REUITrainingContext_resetContext__block_invoke;
  v9[3] = &unk_24CF7A130;
  v9[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](visibilityDurations, "enumerateKeysAndObjectsUsingBlock:", v9);
  -[NSMutableDictionary removeAllObjects](self->_visibilityDurations, "removeAllObjects");
}

void __35__REUITrainingContext_resetContext__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "doubleValue");
  objc_msgSend(v4, "_trainDwellForElement:withInterval:", v5);

}

- (id)_interactionForElement:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[REUITrainingContext interactionTypeForElement:](self, "interactionTypeForElement:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)*MEMORY[0x24BE7D0C8];
  v5 = v3;

  return v5;
}

- (id)_visibleElements
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (id)MEMORY[0x24BDBD1A8];
  if ((soft_RETrainingSimulationIsCurrentlyActive() & 1) == 0)
  {
    -[REUITrainingContext visibleElementIdentifiers](self, "visibleElementIdentifiers");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = (void *)v4;
    else
      v6 = v3;
    v3 = v6;

  }
  return v3;
}

- (id)_higherElementsThanElement:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[REUITrainingContext elementsOrdered:relativeToElement:](self, "elementsOrdered:relativeToElement:", 1, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x24BDBD1A8];
  v5 = v3;

  return v5;
}

- (id)_lowerElementsThanElement:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[REUITrainingContext elementsOrdered:relativeToElement:](self, "elementsOrdered:relativeToElement:", 0, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x24BDBD1A8];
  v5 = v3;

  return v5;
}

- (void)_willResignCurrent
{
  if (self->_resetsWhenResignsCurrent)
    -[REUITrainingContext resetContext](self, "resetContext");
}

- (BOOL)performSimulationCommand:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  double v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  double v31;
  void *v32;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("tap")))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("id"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;
    if (v8)
      -[REUITrainingContext selectElementWithIdentifier:](self, "selectElementWithIdentifier:", v8);
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("dwell")))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("id"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[REUITrainingContext selectElementWithIdentifier:](self, "selectElementWithIdentifier:", v8);
    v9 = v8 != 0;
    if (v8)
    {
      -[REUITrainingContext _higherElementsThanElement:](self, "_higherElementsThanElement:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (-[REUITrainingContext onScreenElementCount](self, "onScreenElementCount") - 1) >> 1;
      v12 = objc_msgSend(v10, "count");
      v13 = (v12 - v11) & ~((uint64_t)(v12 - v11) >> 63);
      if (v13 + v11 <= objc_msgSend(v10, "count"))
        v14 = v11;
      else
        v14 = 0;
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "subarrayWithRange:", v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObjectsFromArray:", v16);

      v34 = v10;
      objc_msgSend(v10, "subarrayWithRange:", 0, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v18 = v15;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v41 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
            -[REUITrainingContext minimumPositiveDwellTime](self, "minimumPositiveDwellTime");
            -[REUITrainingContext _trainDwellForElement:withInterval:](self, "_trainDwellForElement:withInterval:", v23, v24 * 1.1);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        }
        while (v20);
      }

      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v25 = v17;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v37;
        do
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v37 != v28)
              objc_enumerationMutation(v25);
            v30 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
            -[REUITrainingContext maximumNegativeDwellTime](self, "maximumNegativeDwellTime");
            -[REUITrainingContext _trainDwellForElement:withInterval:](self, "_trainDwellForElement:withInterval:", v30, v31 * 0.9);
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        }
        while (v27);
      }

      v9 = 1;
    }
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("action")))
    {
      v9 = 0;
      goto LABEL_28;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("id"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v8;
      REEnumerateTrainingStateForDate();

      -[RETrainingContext setAttribute:forKey:](self, "setAttribute:forKey:", 0, *MEMORY[0x24BE7D128]);
    }
  }

LABEL_28:
  return v9;
}

uint64_t __60__REUITrainingContext_performSimulationCommand_withOptions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "setAttribute:forKey:", a3, *MEMORY[0x24BE7D128]);
  return objc_msgSend(*(id *)(a1 + 32), "trainWithElement:isPositiveEvent:interaction:", *(_QWORD *)(a1 + 40), a2, CFSTR("action"));
}

- (BOOL)resetsWhenResignsCurrent
{
  return self->_resetsWhenResignsCurrent;
}

- (void)setResetsWhenResignsCurrent:(BOOL)a3
{
  self->_resetsWhenResignsCurrent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityDurations, 0);
  objc_storeStrong((id *)&self->_becameVisibleDates, 0);
}

- (double)maximumNegativeDwellTime
{
  return 0.5;
}

- (double)minimumPositiveDwellTime
{
  return 1.5;
}

- (unint64_t)onScreenElementCount
{
  return 1;
}

- (NSArray)visibleElementIdentifiers
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_becameVisibleDates, "allKeys");
}

- (id)elementsOrdered:(unint64_t)a3 relativeToElement:(id)a4
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (BOOL)elementIsAvailable:(id)a3
{
  return 1;
}

- (id)interactionTypeForElement:(id)a3
{
  return (id)*MEMORY[0x24BE7D0C8];
}

@end
