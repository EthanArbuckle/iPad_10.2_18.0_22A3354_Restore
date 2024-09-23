@implementation UITrackingLayoutGuide

- (void)enableAnimations:(BOOL)a3
{
  self->_animatesChanges = a3;
}

- (void)trackConstraintsFromViewBasedGuide:(id)a3
{
  UITrackingLayoutGuide *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  UITrackingLayoutGuide *v26;
  id obj;
  id obja;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (UITrackingLayoutGuide *)a3;
  if (v4 != self && !-[UITrackingLayoutGuide constrainedToWindowGuide](self, "constrainedToWindowGuide"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITrackingLayoutGuide edgeConstraints](v4, "edgeConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("UIKBNearEdgeConstraintsByEdge"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v7;
    v26 = v4;
    if (objc_msgSend(v7, "count"))
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      objc_msgSend(v7, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v35 != v10)
              objc_enumerationMutation(obj);
            v12 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
            -[NSMutableDictionary objectForKey:](self->_nearEdgeConstraintsByEdge, "objectForKey:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (id)objc_msgSend(v13, "mutableCopy");

            if (!v14)
              v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v29, "objectForKey:", v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKey:", v15, v5);

            -[NSMutableDictionary setObject:forKey:](self->_nearEdgeConstraintsByEdge, "setObject:forKey:", v14, v12);
          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        }
        while (v9);
      }

    }
    -[UITrackingLayoutGuide edgeConstraints](v4, "edgeConstraints");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("UIKBAwayFromEdgeConstraintsByEdge"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "count"))
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      objc_msgSend(v17, "allKeys");
      obja = (id)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v31;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v31 != v20)
              objc_enumerationMutation(obja);
            v22 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
            -[NSMutableDictionary objectForKey:](self->_awayFromConstraintsByEdge, "objectForKey:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (id)objc_msgSend(v23, "mutableCopy");

            if (!v24)
              v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v17, "objectForKey:", v22);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKey:", v25, v5);

            -[NSMutableDictionary setObject:forKey:](self->_awayFromConstraintsByEdge, "setObject:forKey:", v24, v22);
          }
          v19 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        }
        while (v19);
      }

      v4 = v26;
    }

  }
}

- (NSDictionary)edgeConstraints
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("UIKBNearEdgeConstraintsByEdge");
  -[UITrackingLayoutGuide nearEdgeConstraintsByEdge](self, "nearEdgeConstraintsByEdge");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = MEMORY[0x1E0C9AA70];
  if (v3)
    v6 = v3;
  else
    v6 = MEMORY[0x1E0C9AA70];
  v12[1] = CFSTR("UIKBAwayFromEdgeConstraintsByEdge");
  v13[0] = v6;
  -[UITrackingLayoutGuide awayFromConstraintsByEdge](self, "awayFromConstraintsByEdge");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = v7;
  else
    v9 = v5;
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

- (NSMutableDictionary)nearEdgeConstraintsByEdge
{
  return self->_nearEdgeConstraintsByEdge;
}

- (NSMutableDictionary)awayFromConstraintsByEdge
{
  return self->_awayFromConstraintsByEdge;
}

- (void)setConstrainedToWindowGuide:(BOOL)a3
{
  if (self->_constrainedToWindowGuide != a3)
    self->_constrainedToWindowGuide = a3;
}

- (BOOL)changeOffsetConstants:(UIOffset)a3
{
  double horizontal;
  double vertical;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  if (a3.horizontal >= 0.0)
    horizontal = a3.horizontal;
  else
    horizontal = 0.0;
  if (a3.vertical >= 0.0)
    vertical = a3.vertical;
  else
    vertical = 0.0;
  -[UILayoutGuide _systemConstraints](self, "_systemConstraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constant");
  v9 = v8;
  -[UILayoutGuide _systemConstraints](self, "_systemConstraints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constant");
  v13 = v12;

  v14 = v13 == vertical && v9 == horizontal;
  -[UILayoutGuide _systemConstraints](self, "_systemConstraints");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setConstant:", horizontal);

  -[UILayoutGuide _systemConstraints](self, "_systemConstraints");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setConstant:", vertical);

  if (!v14)
    -[UITrackingLayoutGuide setSkipAnimationOnNextPassOnly:](self, "setSkipAnimationOnNextPassOnly:", 1);
  -[UITrackingLayoutGuide _thresholdCheck](self, "_thresholdCheck");
  return v14;
}

- (BOOL)changeSizingConstants:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  height = a3.height;
  width = a3.width;
  -[UILayoutGuide _systemConstraints](self, "_systemConstraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constant");
  v9 = v8;
  -[UILayoutGuide _systemConstraints](self, "_systemConstraints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constant");
  v13 = v12;

  v14 = v13 != height || v9 != width;
  -[UILayoutGuide _systemConstraints](self, "_systemConstraints");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setConstant:", width);

  -[UILayoutGuide _systemConstraints](self, "_systemConstraints");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setConstant:", height);

  if (!v14)
    -[UITrackingLayoutGuide setSkipAnimationOnNextPassOnly:](self, "setSkipAnimationOnNextPassOnly:", 1);
  -[UITrackingLayoutGuide _thresholdCheck](self, "_thresholdCheck");
  return v14;
}

- (void)startUpdatingConstraintsForEdges:(unint64_t)a3
{
  if (a3 == 15)
    self->_pausedEdges = 0;
  else
    self->_pausedEdges &= ~a3;
  self->_overlappingEdges = 0;
  -[UITrackingLayoutGuide setSkipAnimationOnNextPassOnly:](self, "setSkipAnimationOnNextPassOnly:", 1);
  -[UITrackingLayoutGuide _thresholdCheck](self, "_thresholdCheck");
}

- (void)pauseUpdatingConstraintsForEdges:(unint64_t)a3
{
  self->_pausedEdges = a3;
  self->_overlappingEdges = 0;
  -[UITrackingLayoutGuide setSkipAnimationOnNextPassOnly:](self, "setSkipAnimationOnNextPassOnly:", 1);
  -[UITrackingLayoutGuide _thresholdCheck](self, "_thresholdCheck");
}

- (void)_thresholdCheck
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  -[UILayoutGuide layoutFrame](self, "layoutFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UILayoutGuide owningView](self, "owningView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  -[UITrackingLayoutGuide _thresholdCheckForGuide:inContext:](self, "_thresholdCheckForGuide:inContext:", v4, v6, v8, v10, v11, v12, v13, v14);

}

- (void)_updateForOverlappingEdges:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (self->_overlappingEdges == a3)
  {
    -[UITrackingLayoutGuide setSkipAnimationOnNextPassOnly:](self, "setSkipAnimationOnNextPassOnly:", 0);
    return;
  }
  v5 = -[UITrackingLayoutGuide validatedOverlappingEdges:](self, "validatedOverlappingEdges:");
  self->_overlappingEdges = v5;
  if (a3)
    v6 = self->_pausedEdges | v5 ^ 0xF;
  else
    v6 = 15;
  -[UITrackingLayoutGuide _keysInvolvingEdges:](self, "_keysInvolvingEdges:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITrackingLayoutGuide _keysFromEdges:](self, "_keysFromEdges:", self->_overlappingEdges);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITrackingLayoutGuide _keysInvolvingEdges:](self, "_keysInvolvingEdges:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITrackingLayoutGuide _keysFromEdges:](self, "_keysFromEdges:", v6);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v51 != v15)
          objc_enumerationMutation(v12);
        -[UITrackingLayoutGuide _awayFromCombinedTrackedConstraintsForEdgeKey:](self, "_awayFromCombinedTrackedConstraintsForEdgeKey:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i), v36);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v10, "addObjectsFromArray:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    }
    while (v14);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v18 = v8;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v47 != v21)
          objc_enumerationMutation(v18);
        -[UITrackingLayoutGuide _nearEdgeCombinedTrackedConstraintsForEdgeKey:](self, "_nearEdgeCombinedTrackedConstraintsForEdgeKey:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j), v36);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend(v11, "addObjectsFromArray:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v20);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v24 = v9;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v43;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v43 != v27)
          objc_enumerationMutation(v24);
        -[UITrackingLayoutGuide _nearEdgeCombinedTrackedConstraintsForEdgeKey:](self, "_nearEdgeCombinedTrackedConstraintsForEdgeKey:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * k), v36);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
          objc_msgSend(v10, "addObjectsFromArray:", v29);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    }
    while (v26);
  }
  v37 = v12;

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v30 = v36;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v39;
    do
    {
      for (m = 0; m != v32; ++m)
      {
        if (*(_QWORD *)v39 != v33)
          objc_enumerationMutation(v30);
        -[UITrackingLayoutGuide _awayFromCombinedTrackedConstraintsForEdgeKey:](self, "_awayFromCombinedTrackedConstraintsForEdgeKey:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * m), v36, v37, (_QWORD)v38);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
          objc_msgSend(v11, "addObjectsFromArray:", v35);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
    }
    while (v32);
  }

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", v10);
    if (!objc_msgSend(v11, "count"))
      goto LABEL_47;
    goto LABEL_46;
  }
  if (objc_msgSend(v11, "count"))
  {
LABEL_46:
    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v11, v36);
LABEL_47:
    -[UITrackingLayoutGuide _layoutOwningViewAnimated:](self, "_layoutOwningViewAnimated:", -[UITrackingLayoutGuide skipAnimationOnNextPassOnly](self, "skipAnimationOnNextPassOnly", v36) ^ 1);
  }
  -[UITrackingLayoutGuide setSkipAnimationOnNextPassOnly:](self, "setSkipAnimationOnNextPassOnly:", 0, v36);

}

- (id)_awayFromCombinedTrackedConstraintsForEdgeKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UILayoutGuide owningView](self, "owningView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = -[UITrackingLayoutGuide constrainedToWindowGuide](self, "constrainedToWindowGuide");

    if (v7)
      goto LABEL_4;
    -[NSMutableDictionary objectForKey:](self->_awayFromConstraintsByEdge, "objectForKey:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v10, "allKeys", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "count"))
              objc_msgSend(v8, "addObjectsFromArray:", v16);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v13);
      }

      if (objc_msgSend(v8, "count"))
        goto LABEL_19;

    }
    v8 = 0;
LABEL_19:

    goto LABEL_5;
  }

LABEL_4:
  v8 = 0;
LABEL_5:

  return v8;
}

- (id)_nearEdgeCombinedTrackedConstraintsForEdgeKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UILayoutGuide owningView](self, "owningView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = -[UITrackingLayoutGuide constrainedToWindowGuide](self, "constrainedToWindowGuide");

    if (v7)
      goto LABEL_4;
    -[NSMutableDictionary objectForKey:](self->_nearEdgeConstraintsByEdge, "objectForKey:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(v10, "allKeys", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "count"))
              objc_msgSend(v8, "addObjectsFromArray:", v16);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v13);
      }

      if (objc_msgSend(v8, "count"))
        goto LABEL_19;

    }
    v8 = 0;
LABEL_19:

    goto LABEL_5;
  }

LABEL_4:
  v8 = 0;
LABEL_5:

  return v8;
}

- (BOOL)constrainedToWindowGuide
{
  return self->_constrainedToWindowGuide;
}

- (id)_keysInvolvingEdges:(unint64_t)a3
{
  char v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "addObject:", &unk_1E1A96E88);
    objc_msgSend(v5, "addObject:", &unk_1E1A96EA0);
    objc_msgSend(v5, "addObject:", &unk_1E1A96F30);
    objc_msgSend(v5, "addObject:", &unk_1E1A96F00);
    objc_msgSend(v5, "addObject:", &unk_1E1A96EB8);
    objc_msgSend(v5, "addObject:", &unk_1E1A96EE8);
    objc_msgSend(v5, "addObject:", &unk_1E1A96F18);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "addObject:", &unk_1E1A96F48);
  objc_msgSend(v5, "addObject:", &unk_1E1A96F90);
  objc_msgSend(v5, "addObject:", &unk_1E1A96F60);
  objc_msgSend(v5, "addObject:", &unk_1E1A96F78);
  objc_msgSend(v5, "addObject:", &unk_1E1A96EA0);
  objc_msgSend(v5, "addObject:", &unk_1E1A96EE8);
  objc_msgSend(v5, "addObject:", &unk_1E1A96EB8);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  objc_msgSend(v5, "addObject:", &unk_1E1A96FA8);
  objc_msgSend(v5, "addObject:", &unk_1E1A96F30);
  objc_msgSend(v5, "addObject:", &unk_1E1A96F90);
  objc_msgSend(v5, "addObject:", &unk_1E1A96FC0);
  objc_msgSend(v5, "addObject:", &unk_1E1A96EE8);
  objc_msgSend(v5, "addObject:", &unk_1E1A96F18);
  objc_msgSend(v5, "addObject:", &unk_1E1A96F78);
  if ((v3 & 8) != 0)
  {
LABEL_5:
    objc_msgSend(v5, "addObject:", &unk_1E1A96FD8);
    objc_msgSend(v5, "addObject:", &unk_1E1A96F00);
    objc_msgSend(v5, "addObject:", &unk_1E1A96F60);
    objc_msgSend(v5, "addObject:", &unk_1E1A96FC0);
    objc_msgSend(v5, "addObject:", &unk_1E1A96EB8);
    objc_msgSend(v5, "addObject:", &unk_1E1A96F18);
    objc_msgSend(v5, "addObject:", &unk_1E1A96F78);
  }
LABEL_6:
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v5, "addObject:", &unk_1E1A96ED0);
  return v5;
}

- (id)_keysFromEdges:(unint64_t)a3
{
  char v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = v4;
  if ((v3 & 1) == 0)
  {
    v6 = v3 & 2;
    goto LABEL_17;
  }
  objc_msgSend(v4, "addObject:", &unk_1E1A96E88);
  if ((v3 & 2) != 0)
  {
    objc_msgSend(v5, "addObject:", &unk_1E1A96EA0);
    if ((v3 & 8) != 0)
    {
      objc_msgSend(v5, "addObject:", &unk_1E1A96EB8);
      if ((v3 & 4) == 0)
      {
        objc_msgSend(v5, "addObject:", &unk_1E1A96F00);
        goto LABEL_18;
      }
      objc_msgSend(v5, "addObject:", &unk_1E1A96ED0);
    }
    else if ((v3 & 4) == 0)
    {
      goto LABEL_18;
    }
    v7 = v3 & 8;
    objc_msgSend(v5, "addObject:", &unk_1E1A96EE8);
  }
  else
  {
    v7 = v3 & 8;
  }
  v6 = v3 & 2;
  if (v7)
  {
    objc_msgSend(v5, "addObject:", &unk_1E1A96F00);
    if ((v3 & 4) == 0)
      goto LABEL_17;
    objc_msgSend(v5, "addObject:", &unk_1E1A96F18);
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_17;
  }
  objc_msgSend(v5, "addObject:", &unk_1E1A96F30);
LABEL_17:
  if (!v6)
  {
    v8 = v3 & 8;
    if ((v3 & 4) == 0)
    {
      if ((v3 & 8) == 0)
        return v5;
      goto LABEL_29;
    }
    goto LABEL_27;
  }
LABEL_18:
  objc_msgSend(v5, "addObject:", &unk_1E1A96F48);
  if ((v3 & 8) != 0)
  {
    objc_msgSend(v5, "addObject:", &unk_1E1A96F60);
    if ((v3 & 4) == 0)
    {
LABEL_29:
      objc_msgSend(v5, "addObject:", &unk_1E1A96FD8);
      return v5;
    }
    objc_msgSend(v5, "addObject:", &unk_1E1A96F78);
  }
  else if ((v3 & 4) == 0)
  {
    return v5;
  }
  v8 = v3 & 8;
  objc_msgSend(v5, "addObject:", &unk_1E1A96F90);
LABEL_27:
  objc_msgSend(v5, "addObject:", &unk_1E1A96FA8);
  if (v8)
  {
    objc_msgSend(v5, "addObject:", &unk_1E1A96FC0);
    goto LABEL_29;
  }
  return v5;
}

- (void)setSkipAnimationOnNextPassOnly:(BOOL)a3
{
  self->_skipAnimationOnNextPassOnly = a3;
}

- (void)_thresholdCheckForGuide:(CGRect)a3 inContext:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat x;
  CGFloat v7;
  uint64_t v9;
  double *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double MinY;
  double MinX;
  double MaxY;
  double MaxX;
  double v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t pausedEdges;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat y;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v30 = a4.origin.x;
  v7 = a3.origin.x;
  v9 = 3;
  if (a4.size.width > a4.size.height)
    v9 = 4;
  v10 = (double *)((char *)self + OBJC_IVAR___UITrackingLayoutGuide__nearEdgeConstraintsByEdge[v9]);
  v40 = *v10;
  v38 = v10[1];
  v39 = v10[3];
  v41 = v10[2];
  v31 = a3.origin.x;
  v32 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.size.width;
  v13 = a3.size.height;
  v33 = a3.size.height;
  MinY = CGRectGetMinY(a3);
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  v37 = MinY - CGRectGetMinY(v42);
  v43.origin.x = v7;
  v43.origin.y = v11;
  v43.size.width = v12;
  v43.size.height = v13;
  MinX = CGRectGetMinX(v43);
  v44.origin.x = v30;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  v36 = MinX - CGRectGetMinX(v44);
  v45.origin.x = v30;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  MaxY = CGRectGetMaxY(v45);
  v46.origin.x = v31;
  v46.origin.y = v11;
  v46.size.width = v32;
  v46.size.height = v33;
  v35 = MaxY - CGRectGetMaxY(v46);
  v47.origin.x = v30;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  MaxX = CGRectGetMaxX(v47);
  v48.origin.x = v31;
  v48.origin.y = v11;
  v48.size.width = v32;
  v48.size.height = v33;
  v18 = MaxX - CGRectGetMaxX(v48);
  v19 = -[UITrackingLayoutGuide _isRTL](self, "_isRTL");
  v20 = 2;
  if (v19)
    v21 = 8;
  else
    v21 = 2;
  if (!v19)
    v20 = 8;
  pausedEdges = self->_pausedEdges;
  if (v36 >= v38 || (pausedEdges & v21) != 0)
    v21 = 0;
  if (v18 >= v39 || (pausedEdges & v20) != 0)
    v20 = 0;
  v25 = v21 | v20;
  v26 = v37 <= v40 && (self->_pausedEdges & 1) == 0;
  v27 = v25 | v26;
  v28 = (pausedEdges >> 2) & 1;
  if (v35 > v41)
    LODWORD(v28) = 1;
  if ((_DWORD)v28)
    v29 = v27;
  else
    v29 = v27 | 4;
  -[UITrackingLayoutGuide _updateForOverlappingEdges:](self, "_updateForOverlappingEdges:", v29, v41, v35);
}

- (BOOL)_isRTL
{
  return self->_owningViewInterfaceLayoutDirection == 1;
}

- (UITrackingLayoutGuide)init
{
  UITrackingLayoutGuide *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *nearEdgeConstraintsByEdge;
  NSMutableDictionary *v5;
  NSMutableDictionary *awayFromConstraintsByEdge;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UITrackingLayoutGuide;
  v2 = -[UILayoutGuide init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    nearEdgeConstraintsByEdge = v2->_nearEdgeConstraintsByEdge;
    v2->_nearEdgeConstraintsByEdge = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    awayFromConstraintsByEdge = v2->_awayFromConstraintsByEdge;
    v2->_awayFromConstraintsByEdge = v5;

    -[UITrackingLayoutGuide resetAnimationOptions](v2, "resetAnimationOptions");
  }
  return v2;
}

- (void)resetAnimationOptions
{
  self->_animationDuration = 0.3;
  self->_animationOptions = 0;
  self->_animatesChanges = 1;
}

- (void)setProportionalEdgeThresholds:(UIEdgeInsets)a3
{
  self->_triggerProportions = a3;
}

- (void)_setOwningView:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UITrackingLayoutGuide;
  -[UILayoutGuide _setOwningView:](&v6, sel__setOwningView_, v4);
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[UITrackingLayoutGuide setConstrainedToWindowGuide:](self, "setConstrainedToWindowGuide:", 1);
  self->_owningViewInterfaceLayoutDirection = objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection");
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_triggerProportions.top), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_triggerProportions.bottom))))) & 1) != 0)-[UITrackingLayoutGuide _createThresholdsFromProportions](self, "_createThresholdsFromProportions");

}

- (void)_createThresholdsFromProportions
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double left;
  double top;
  double v11;
  double right;
  double bottom;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  -[UILayoutGuide owningView](self, "owningView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UILayoutGuide owningView](self, "owningView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;

    top = self->_triggerProportions.top;
    left = self->_triggerProportions.left;
    v11 = v6 * left;
    bottom = self->_triggerProportions.bottom;
    right = self->_triggerProportions.right;
    v14 = v6 * right;
    v15 = v8 * top;
    v16 = v8 * bottom;
    v17 = v8 * left;
    v18 = v8 * right;
    v19 = v6 * top;
    v20 = v6 * bottom;
    if (v6 <= v8)
      v21 = v19;
    else
      v21 = v15;
    if (v6 <= v8)
      v22 = v17;
    else
      v22 = v11;
    if (v6 <= v8)
      v23 = v20;
    else
      v23 = v16;
    if (v6 > v8)
    {
      v24 = v20;
    }
    else
    {
      v19 = v15;
      v17 = v11;
      v24 = v16;
    }
    if (v6 <= v8)
      v25 = v14;
    else
      v25 = v18;
    self->_triggerInsetsForPortrait.top = v19;
    self->_triggerInsetsForPortrait.left = v17;
    self->_triggerInsetsForPortrait.bottom = v24;
    self->_triggerInsetsForPortrait.right = v25;
    if (v6 <= v8)
      v26 = v18;
    else
      v26 = v14;
    self->_triggerInsetsForLandscape.top = v21;
    self->_triggerInsetsForLandscape.left = v22;
    self->_triggerInsetsForLandscape.bottom = v23;
    self->_triggerInsetsForLandscape.right = v26;
  }
}

- (void)setConstraints:(NSArray *)trackingConstraints activeWhenNearEdge:(NSDirectionalRectEdge)edge
{
  NSMutableDictionary *nearEdgeConstraintsByEdge;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;

  v18 = trackingConstraints;
  nearEdgeConstraintsByEdge = self->_nearEdgeConstraintsByEdge;
  if (!nearEdgeConstraintsByEdge)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = self->_nearEdgeConstraintsByEdge;
    self->_nearEdgeConstraintsByEdge = v7;

    nearEdgeConstraintsByEdge = self->_nearEdgeConstraintsByEdge;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", edge);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](nearEdgeConstraintsByEdge, "setObject:forKey:", v18, v9);

  -[UILayoutGuide owningView](self, "owningView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[UITrackingLayoutGuide setConstrainedToWindowGuide:](self, "setConstrainedToWindowGuide:", 1);
  -[UILayoutGuide owningView](self, "owningView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_primaryKeyboardTrackingGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trackConstraintsFromViewBasedGuide:", self);

  if ((self->_overlappingEdges & edge) != 0)
  {
    -[UILayoutGuide owningView](self, "owningView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_primaryKeyboardTrackingGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateConstraintsForActiveEdges");

  }
}

- (NSArray)constraintsActiveWhenNearEdge:(NSDirectionalRectEdge)edge
{
  NSMutableDictionary *nearEdgeConstraintsByEdge;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;

  if (-[UITrackingLayoutGuide constrainedToWindowGuide](self, "constrainedToWindowGuide"))
  {
    nearEdgeConstraintsByEdge = self->_nearEdgeConstraintsByEdge;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", edge);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](nearEdgeConstraintsByEdge, "objectForKey:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", edge);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITrackingLayoutGuide _nearEdgeCombinedTrackedConstraintsForEdgeKey:](self, "_nearEdgeCombinedTrackedConstraintsForEdgeKey:", v6);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v7;
  else
    v8 = (void *)MEMORY[0x1E0C9AA60];
  v9 = v8;

  return v9;
}

- (void)setConstraints:(NSArray *)trackingConstraints activeWhenAwayFromEdge:(NSDirectionalRectEdge)edge
{
  NSMutableDictionary *awayFromConstraintsByEdge;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;

  v18 = trackingConstraints;
  awayFromConstraintsByEdge = self->_awayFromConstraintsByEdge;
  if (!awayFromConstraintsByEdge)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = self->_awayFromConstraintsByEdge;
    self->_awayFromConstraintsByEdge = v7;

    awayFromConstraintsByEdge = self->_awayFromConstraintsByEdge;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", edge);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](awayFromConstraintsByEdge, "setObject:forKey:", v18, v9);

  -[UILayoutGuide owningView](self, "owningView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[UITrackingLayoutGuide setConstrainedToWindowGuide:](self, "setConstrainedToWindowGuide:", 1);
  -[UILayoutGuide owningView](self, "owningView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_primaryKeyboardTrackingGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trackConstraintsFromViewBasedGuide:", self);

  if ((self->_overlappingEdges & edge) == 0)
  {
    -[UILayoutGuide owningView](self, "owningView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_primaryKeyboardTrackingGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateConstraintsForActiveEdges");

  }
}

- (NSArray)constraintsActiveWhenAwayFromEdge:(NSDirectionalRectEdge)edge
{
  NSMutableDictionary *awayFromConstraintsByEdge;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;

  if (-[UITrackingLayoutGuide constrainedToWindowGuide](self, "constrainedToWindowGuide"))
  {
    awayFromConstraintsByEdge = self->_awayFromConstraintsByEdge;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", edge);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](awayFromConstraintsByEdge, "objectForKey:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", edge);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITrackingLayoutGuide _awayFromCombinedTrackedConstraintsForEdgeKey:](self, "_awayFromCombinedTrackedConstraintsForEdgeKey:", v6);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v7;
  else
    v8 = (void *)MEMORY[0x1E0C9AA60];
  v9 = v8;

  return v9;
}

- (void)stopTrackingConstraintsForEdge:(unint64_t)a3
{
  NSMutableDictionary *nearEdgeConstraintsByEdge;
  void *v6;
  void *v7;
  int v8;
  NSMutableDictionary *awayFromConstraintsByEdge;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSMutableDictionary *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  id v18;

  nearEdgeConstraintsByEdge = self->_nearEdgeConstraintsByEdge;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](nearEdgeConstraintsByEdge, "objectForKey:", v6);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isActive");

    if (v8)
      objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", v18);
  }
  awayFromConstraintsByEdge = self->_awayFromConstraintsByEdge;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](awayFromConstraintsByEdge, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isActive");

    if (v13)
      objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", v11);
  }
  v14 = self->_nearEdgeConstraintsByEdge;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v14, "removeObjectForKey:", v15);

  v16 = self->_awayFromConstraintsByEdge;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v16, "removeObjectForKey:", v17);

}

- (void)removeAllTrackedConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[UILayoutGuide owningView](self, "owningView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[UILayoutGuide owningView](self, "owningView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_primaryKeyboardTrackingGuide");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeTrackedConstraintsFromViewBasedGuide:", self);

  }
  -[NSMutableDictionary removeAllObjects](self->_nearEdgeConstraintsByEdge, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_awayFromConstraintsByEdge, "removeAllObjects");
}

- (void)setNearEdgeConstraintsByEdge:(id)a3
{
  objc_storeStrong((id *)&self->_nearEdgeConstraintsByEdge, a3);
}

- (void)setAwayFromConstraintsByEdge:(id)a3
{
  objc_storeStrong((id *)&self->_awayFromConstraintsByEdge, a3);
}

- (UIEdgeInsets)triggerInsetsForPortrait
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_triggerInsetsForPortrait.top;
  left = self->_triggerInsetsForPortrait.left;
  bottom = self->_triggerInsetsForPortrait.bottom;
  right = self->_triggerInsetsForPortrait.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTriggerInsetsForPortrait:(UIEdgeInsets)a3
{
  self->_triggerInsetsForPortrait = a3;
}

- (UIEdgeInsets)triggerInsetsForLandscape
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_triggerInsetsForLandscape.top;
  left = self->_triggerInsetsForLandscape.left;
  bottom = self->_triggerInsetsForLandscape.bottom;
  right = self->_triggerInsetsForLandscape.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTriggerInsetsForLandscape:(UIEdgeInsets)a3
{
  self->_triggerInsetsForLandscape = a3;
}

- (UIEdgeInsets)triggerProportions
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_triggerProportions.top;
  left = self->_triggerProportions.left;
  bottom = self->_triggerProportions.bottom;
  right = self->_triggerProportions.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTriggerProportions:(UIEdgeInsets)a3
{
  self->_triggerProportions = a3;
}

- (unint64_t)overlappingEdges
{
  return self->_overlappingEdges;
}

- (void)setOverlappingEdges:(unint64_t)a3
{
  self->_overlappingEdges = a3;
}

- (unint64_t)pausedEdges
{
  return self->_pausedEdges;
}

- (void)setPausedEdges:(unint64_t)a3
{
  self->_pausedEdges = a3;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (unint64_t)animationOptions
{
  return self->_animationOptions;
}

- (void)setAnimationOptions:(unint64_t)a3
{
  self->_animationOptions = a3;
}

- (BOOL)animatingConstraintsChange
{
  return self->_animatingConstraintsChange;
}

- (void)setAnimatingConstraintsChange:(BOOL)a3
{
  self->_animatingConstraintsChange = a3;
}

- (BOOL)animatesChanges
{
  return self->_animatesChanges;
}

- (void)setAnimatesChanges:(BOOL)a3
{
  self->_animatesChanges = a3;
}

- (BOOL)skipAnimationOnNextPassOnly
{
  return self->_skipAnimationOnNextPassOnly;
}

- (int64_t)owningViewInterfaceLayoutDirection
{
  return self->_owningViewInterfaceLayoutDirection;
}

- (void)setOwningViewInterfaceLayoutDirection:(int64_t)a3
{
  self->_owningViewInterfaceLayoutDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awayFromConstraintsByEdge, 0);
  objc_storeStrong((id *)&self->_nearEdgeConstraintsByEdge, 0);
}

- (void)removeTrackedConstraintsFromViewBasedGuide:(id)a3
{
  UITrackingLayoutGuide *v4;
  UITrackingLayoutGuide *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  UITrackingLayoutGuide *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = (UITrackingLayoutGuide *)a3;
  v5 = v4;
  if (v4 == self)
  {
    -[UITrackingLayoutGuide removeAllTrackedConstraints](v4, "removeAllTrackedConstraints");
  }
  else if (!-[UITrackingLayoutGuide constrainedToWindowGuide](self, "constrainedToWindowGuide"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v5);
    v28 = v5;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITrackingLayoutGuide edgeConstraints](v5, "edgeConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("UIKBNearEdgeConstraintsByEdge"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v27 = v7;
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](self->_nearEdgeConstraintsByEdge, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v14, "mutableCopy");

          if (v15)
          {
            objc_msgSend(v15, "removeObjectForKey:", v29);
            -[NSMutableDictionary setObject:forKey:](self->_nearEdgeConstraintsByEdge, "setObject:forKey:", v15, v13);
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v10);
    }

    -[UITrackingLayoutGuide edgeConstraints](v28, "edgeConstraints");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("UIKBAwayFromEdgeConstraintsByEdge"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v26 = v17;
    objc_msgSend(v17, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v31 != v21)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
          -[NSMutableDictionary objectForKey:](self->_awayFromConstraintsByEdge, "objectForKey:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v24, "mutableCopy");

          if (v25)
          {
            objc_msgSend(v25, "removeObjectForKey:", v29);
            -[NSMutableDictionary setObject:forKey:](self->_awayFromConstraintsByEdge, "setObject:forKey:", v25, v23);
          }

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v20);
    }

    v5 = v28;
  }

}

- (void)updateConstraintsForActiveEdges
{
  self->_overlappingEdges = 0;
  -[UITrackingLayoutGuide setSkipAnimationOnNextPassOnly:](self, "setSkipAnimationOnNextPassOnly:", 1);
  -[UITrackingLayoutGuide _thresholdCheck](self, "_thresholdCheck");
}

- (void)_layoutOwningViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  double animationDuration;
  unint64_t animationOptions;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  _QWORD aBlock[5];

  v3 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__UITrackingLayoutGuide_Internal___layoutOwningViewAnimated___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v7 = v6;
  if (v3)
  {
    if (!self->_animatingConstraintsChange
      && self->_animatesChanges
      && -[UITrackingLayoutGuide constrainedToWindowGuide](self, "constrainedToWindowGuide"))
    {
      self->_animatingConstraintsChange = 1;
      animationDuration = self->_animationDuration;
      animationOptions = self->_animationOptions;
      v11[0] = v5;
      v11[1] = 3221225472;
      v11[2] = __61__UITrackingLayoutGuide_Internal___layoutOwningViewAnimated___block_invoke_2;
      v11[3] = &unk_1E16B1BF8;
      v12 = v7;
      v10[0] = v5;
      v10[1] = 3221225472;
      v10[2] = __61__UITrackingLayoutGuide_Internal___layoutOwningViewAnimated___block_invoke_3;
      v10[3] = &unk_1E16B3FD8;
      v10[4] = self;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", animationOptions, v11, v10, animationDuration, 0.0);

    }
  }
  else
  {
    (*((void (**)(void *))v6 + 2))(v6);
  }

}

void __61__UITrackingLayoutGuide_Internal___layoutOwningViewAnimated___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "constrainedToWindowGuide");
  objc_msgSend(*(id *)(a1 + 32), "owningView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v2)
  {
    objc_msgSend(v3, "layoutIfNeeded");
  }
  else
  {
    objc_msgSend(v3, "_window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutViewsForTrackedGuides");

  }
}

uint64_t __61__UITrackingLayoutGuide_Internal___layoutOwningViewAnimated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __61__UITrackingLayoutGuide_Internal___layoutOwningViewAnimated___block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 225) = 0;
  return result;
}

- (void)updateAnimationDuration:(double)a3 options:(unint64_t)a4
{
  self->_animationDuration = a3;
  self->_animationOptions = a4;
}

- (void)setEdgeThresholds:(UIEdgeInsets)a3 forOrientation:(int64_t)a4
{
  int *v4;

  if ((unint64_t)(a4 - 1) >= 2)
  {
    if ((unint64_t)(a4 - 3) > 1)
      return;
    v4 = &OBJC_IVAR___UITrackingLayoutGuide__triggerInsetsForLandscape;
  }
  else
  {
    v4 = &OBJC_IVAR___UITrackingLayoutGuide__triggerInsetsForPortrait;
  }
  *(UIEdgeInsets *)((char *)&self->super.super.isa + *v4) = a3;
}

- (unint64_t)validatedOverlappingEdges:(unint64_t)a3
{
  return a3;
}

@end
