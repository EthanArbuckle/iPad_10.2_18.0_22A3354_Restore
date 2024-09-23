@implementation PLHighlightHierarchy

- (PLHighlightHierarchy)init
{
  PLHighlightHierarchy *v2;
  NSMutableSet *v3;
  NSMutableSet *moments;
  NSMutableSet *v5;
  NSMutableSet *dayHighlights;
  NSMutableSet *v7;
  NSMutableSet *dayGroupHighlights;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLHighlightHierarchy;
  v2 = -[PLHighlightHierarchy init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    moments = v2->_moments;
    v2->_moments = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    dayHighlights = v2->_dayHighlights;
    v2->_dayHighlights = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    dayGroupHighlights = v2->_dayGroupHighlights;
    v2->_dayGroupHighlights = v7;

  }
  return v2;
}

- (void)addMoment:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "highlight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[PLHighlightHierarchy addDayHighlight:](self, "addDayHighlight:", v4);
  else
    -[PLHighlightHierarchy _addMoment:](self, "_addMoment:", v5);

}

- (void)_addMoment:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "isDeleted") & 1) == 0
    && (-[NSMutableSet containsObject:](self->_moments, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_moments, "addObject:", v4);
  }

}

- (void)addDayHighlight:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "parentDayGroupPhotosHighlight");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[PLHighlightHierarchy addDayGroupHighlight:](self, "addDayGroupHighlight:", v4);
  else
    -[PLHighlightHierarchy _addDayHighlight:](self, "_addDayHighlight:", v5);

}

- (void)_addDayHighlight:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_dayHighlights, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_dayHighlights, "addObject:", v4);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(v4, "moments", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[PLHighlightHierarchy _addMoment:](self, "_addMoment:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)addDayGroupHighlight:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_dayGroupHighlights, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_dayGroupHighlights, "addObject:", v4);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(v4, "childDayGroupPhotosHighlights", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          -[PLHighlightHierarchy _addDayHighlight:](self, "_addDayHighlight:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (NSMutableSet)moments
{
  return self->_moments;
}

- (NSMutableSet)dayHighlights
{
  return self->_dayHighlights;
}

- (NSMutableSet)dayGroupHighlights
{
  return self->_dayGroupHighlights;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayGroupHighlights, 0);
  objc_storeStrong((id *)&self->_dayHighlights, 0);
  objc_storeStrong((id *)&self->_moments, 0);
}

@end
