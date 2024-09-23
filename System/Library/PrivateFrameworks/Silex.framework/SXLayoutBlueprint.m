@implementation SXLayoutBlueprint

- (SXLayoutBlueprint)initWithLayoutOptions:(id)a3 componentBlueprintFactory:(id)a4 unitConverterFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXLayoutBlueprint *v12;
  SXLayoutBlueprint *v13;
  uint64_t v14;
  NSMutableDictionary *blueprint;
  uint64_t v16;
  NSMutableArray *orderedComponentIdentifiers;
  uint64_t v18;
  NSMutableSet *invalidatedComponents;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SXLayoutBlueprint;
  v12 = -[SXLayoutBlueprint init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_layoutOptions, a3);
    objc_storeStrong((id *)&v13->_componentBlueprintFactory, a4);
    objc_storeStrong((id *)&v13->_unitConverterFactory, a5);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    blueprint = v13->_blueprint;
    v13->_blueprint = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    orderedComponentIdentifiers = v13->_orderedComponentIdentifiers;
    v13->_orderedComponentIdentifiers = (NSMutableArray *)v16;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    invalidatedComponents = v13->_invalidatedComponents;
    v13->_invalidatedComponents = (NSMutableSet *)v18;

  }
  return v13;
}

- (void)registerLayout:(id)a3 sizer:(id)a4 forComponent:(id)a5 atIndex:(unint64_t)a6
{
  SXComponentBlueprintFactory *componentBlueprintFactory;
  id v11;
  NSMutableDictionary *blueprint;
  void *v13;
  unint64_t v14;
  NSMutableArray *orderedComponentIdentifiers;
  void *v16;
  id v17;

  componentBlueprintFactory = self->_componentBlueprintFactory;
  v11 = a5;
  -[SXComponentBlueprintFactory componentBlueprintForComponent:layout:sizer:](componentBlueprintFactory, "componentBlueprintForComponent:layout:sizer:", v11, a3, a4);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setParentLayoutBlueprint:", self);
  blueprint = self->_blueprint;
  objc_msgSend(v11, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](blueprint, "setObject:forKey:", v17, v13);

  v14 = -[NSMutableArray count](self->_orderedComponentIdentifiers, "count");
  orderedComponentIdentifiers = self->_orderedComponentIdentifiers;
  objc_msgSend(v11, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 <= a6)
    -[NSMutableArray addObject:](orderedComponentIdentifiers, "addObject:", v16);
  else
    -[NSMutableArray insertObject:atIndex:](orderedComponentIdentifiers, "insertObject:atIndex:", v16, a6);

}

- (void)registerLayout:(id)a3 sizer:(id)a4 forComponent:(id)a5
{
  -[SXLayoutBlueprint registerLayout:sizer:forComponent:atIndex:](self, "registerLayout:sizer:forComponent:atIndex:", a3, a4, a5, 0x7FFFFFFFFFFFFFFFLL);
}

- (void)unregisterLayout:(id)a3
{
  NSMutableDictionary *blueprint;
  id v5;
  void *v6;
  void *v7;
  NSMutableArray *orderedComponentIdentifiers;
  void *v9;
  id v10;

  blueprint = self->_blueprint;
  v5 = a3;
  objc_msgSend(v5, "component");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](blueprint, "removeObjectForKey:", v7);

  orderedComponentIdentifiers = self->_orderedComponentIdentifiers;
  objc_msgSend(v5, "component");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](orderedComponentIdentifiers, "removeObject:", v9);

}

- (void)invalidatePositionForComponentWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SXLayoutBlueprint componentBlueprintForComponentIdentifier:includeChildren:](self, "componentBlueprintForComponentIdentifier:includeChildren:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    self->_isComplete = 0;
    objc_msgSend(v4, "invalidatePosition");
    -[NSMutableSet addObject:](self->_invalidatedComponents, "addObject:", v6);
  }

}

- (void)invalidateSizeForComponentWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  -[SXLayoutBlueprint componentBlueprintForComponentIdentifier:includeChildren:](self, "componentBlueprintForComponentIdentifier:includeChildren:", v4, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;

  -[SXLayoutBlueprint invalidateSizeForComponentWithIdentifier:suggestedSize:](self, "invalidateSizeForComponentWithIdentifier:suggestedSize:", v4, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
}

- (void)invalidateState:(id)a3 forComponentWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a4;
  v6 = a3;
  -[SXLayoutBlueprint componentBlueprintForComponentIdentifier:includeChildren:](self, "componentBlueprintForComponentIdentifier:includeChildren:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setComponentState:", v6);
  objc_msgSend(v7, "componentSizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "requiresSizeChangeForStateChange:fromState:", v6, v8);

  if (v10)
    -[SXLayoutBlueprint invalidateSizeForComponentWithIdentifier:suggestedSize:](self, "invalidateSizeForComponentWithIdentifier:suggestedSize:", v11, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));

}

- (void)invalidateSizeForComponentWithIdentifier:(id)a3 suggestedSize:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  height = a4.height;
  width = a4.width;
  v14 = a3;
  -[SXLayoutBlueprint componentBlueprintForComponentIdentifier:includeChildren:](self, "componentBlueprintForComponentIdentifier:includeChildren:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    self->_isComplete = 0;
    objc_msgSend(v7, "setSuggestedSizeAfterInvalidation:", width, height);
    objc_msgSend(v8, "invalidateSize");
    objc_msgSend(v8, "parentLayoutBlueprint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "parentLayoutBlueprint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v8, "component");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "containerComponentIdentifierContainingComponentWithIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "invalidateSizeForComponentWithIdentifier:", v13);
    }
    -[NSMutableSet addObject:](self->_invalidatedComponents, "addObject:", v14);

  }
}

- (void)invalidateDependentsOfInvalidatedComponents
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)-[NSMutableSet copy](self->_invalidatedComponents, "copy");
  -[NSMutableSet removeAllObjects](self->_invalidatedComponents, "removeAllObjects");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[SXLayoutBlueprint componentBlueprintForComponentIdentifier:](self, "componentBlueprintForComponentIdentifier:", v9, (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "parentLayoutBlueprint");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dependencySolver");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v10, "hasValidSize") & 1) == 0)
        {
          -[SXComponentDependencyResolver componentNodeForComponentIdentifier:andAttribute:]((uint64_t)v12, v9, 2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXLayoutBlueprint invalidateDependentsOfComponentNode:forDependencyResolver:](self, "invalidateDependentsOfComponentNode:forDependencyResolver:", v13, v12);

        }
        if ((objc_msgSend(v10, "hasValidPosition") & 1) == 0)
        {
          -[SXComponentDependencyResolver componentNodeForComponentIdentifier:andAttribute:]((uint64_t)v12, v9, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXLayoutBlueprint invalidateDependentsOfComponentNode:forDependencyResolver:](self, "invalidateDependentsOfComponentNode:forDependencyResolver:", v14, v12);

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "layoutBlueprint");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "invalidateDependentsOfInvalidatedComponents");

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (void)invalidateDependentsOfComponentNode:(id)a3 forDependencyResolver:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 512);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 512);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v25 = v5;
  -[SXComponentDependencyResolver componentNodesDependentOnComponentNode:]((uint64_t)v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), v25);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v11);
  }

  objc_msgSend(v8, "anyObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    do
    {
      -[SXFullscreenCaption text]((uint64_t)v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXLayoutBlueprint componentBlueprintForComponentIdentifier:](self, "componentBlueprintForComponentIdentifier:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[SXFullscreenCaption caption]((uint64_t)v15) == 1)
      {
        objc_msgSend(v17, "invalidatePosition");
      }
      else if (-[SXFullscreenCaption caption]((uint64_t)v15) == 2)
      {
        objc_msgSend(v17, "invalidateSize");
      }
      objc_msgSend(v7, "addObject:", v15, v25);
      objc_msgSend(v8, "removeObject:", v15);
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      -[SXComponentDependencyResolver componentNodesDependentOnComponentNode:]((uint64_t)v6, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v28;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v28 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
            if ((objc_msgSend(v7, "containsObject:", v23) & 1) == 0)
              objc_msgSend(v8, "addObject:", v23);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        }
        while (v20);
      }

      objc_msgSend(v8, "anyObject");
      v24 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v24;
    }
    while (v24);
  }

}

- (void)invalidateBlueprint
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_blueprint, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_47);
  self->_isComplete = 0;
}

void __40__SXLayoutBlueprint_invalidateBlueprint__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "invalidateLayout");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "layoutBlueprint");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateBlueprint");

  }
}

- (void)invalidateBlueprintPosition
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_blueprint, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_7_1);
  self->_isComplete = 0;
}

uint64_t __48__SXLayoutBlueprint_invalidateBlueprintPosition__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidatePosition");
}

- (void)updateSize:(CGSize)a3 forComponentWithIdentifier:(id)a4
{
  double height;
  double width;
  id v6;

  height = a3.height;
  width = a3.width;
  -[SXLayoutBlueprint componentBlueprintForComponentIdentifier:](self, "componentBlueprintForComponentIdentifier:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateSize:", round(width), round(height));

}

- (void)updatePosition:(CGPoint)a3 forComponentWithIdentifier:(id)a4
{
  double y;
  double x;
  id v6;

  y = a3.y;
  x = a3.x;
  -[SXLayoutBlueprint componentBlueprintForComponentIdentifier:](self, "componentBlueprintForComponentIdentifier:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updatePosition:", round(x), round(y));

}

- (id)componentBlueprintForComponentIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_blueprint, "objectForKey:", a3);
}

- (id)componentBlueprintForComponentIdentifier:(id)a3 includeChildren:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[NSMutableDictionary count](self->_flattenedBlueprint, "count"))
  {
    -[NSMutableDictionary objectForKey:](self->_flattenedBlueprint, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->_blueprint, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7 && v4)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v9 = self->_orderedComponentIdentifiers;
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v9);
            -[SXLayoutBlueprint componentBlueprintForComponentIdentifier:includeChildren:](self, "componentBlueprintForComponentIdentifier:includeChildren:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), 0, (_QWORD)v16);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v14, "layoutBlueprint");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "componentBlueprintForComponentIdentifier:includeChildren:", v6, 1);
              v7 = (void *)objc_claimAutoreleasedReturnValue();

              if (v7)
              {

                goto LABEL_19;
              }
            }

          }
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v11)
            continue;
          break;
        }
      }
      v7 = 0;
LABEL_19:

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)containerComponentIdentifierContainingComponentWithIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v16;
  NSMutableArray *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_orderedComponentIdentifiers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        -[SXLayoutBlueprint componentBlueprintForComponentIdentifier:](self, "componentBlueprintForComponentIdentifier:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v7), v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          objc_msgSend(v9, "layoutBlueprint");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "componentIdentifiers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "containsObject:", v16);

          if ((v12 & 1) != 0)
          {
            objc_msgSend(v9, "component");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v5)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (id)componentIdentifiers
{
  return self->_orderedComponentIdentifiers;
}

- (id)componentsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _UNKNOWN **v20;
  uint64_t v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  id v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double MinX;
  double MinY;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  _UNKNOWN **v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  uint64_t v55;
  void *v57;
  void *v58;
  double v59;
  double v60;
  CGFloat v61;
  CGRect rect;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v72 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v9 = self->_orderedComponentIdentifiers;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v67 != v12)
          objc_enumerationMutation(v9);
        -[SXLayoutBlueprint componentBlueprintForComponentIdentifier:](self, "componentBlueprintForComponentIdentifier:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    }
    while (v11);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  rect.size = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v16 = (void *)objc_msgSend(v8, "copy");
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &rect.size, v70, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v63;
    v20 = &off_24D684000;
    v59 = x;
    v60 = y;
    v57 = v15;
    v58 = v8;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v63 != v19)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*(_QWORD *)&rect.size.height + 8 * v21);
        objc_msgSend(v22, "frame");
        v24 = v23;
        v26 = v25;
        v28 = v27;
        v30 = v29;
        v73.origin.x = x;
        v73.origin.y = y;
        v73.size.width = width;
        v73.size.height = height;
        if (CGRectGetWidth(v73) <= 0.0)
          goto LABEL_20;
        v74.origin.x = v24;
        v74.origin.y = v26;
        v74.size.width = v28;
        v74.size.height = v30;
        v81.origin.x = x;
        v81.origin.y = y;
        v81.size.width = width;
        v81.size.height = height;
        if (!CGRectIntersectsRect(v74, v81))
        {
LABEL_20:
          objc_msgSend(v15, "addObject:", v22);
          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_21;
        v31 = v22;
        objc_msgSend(v31, "frame");
        v33 = v32;
        v61 = v34;
        rect.origin.x = v32;
        v36 = v35;
        v38 = v37;
        v75.origin.x = x;
        v75.origin.y = y;
        v75.size.width = width;
        v75.size.height = height;
        MinX = CGRectGetMinX(v75);
        v76.origin.x = v33;
        v76.origin.y = v36;
        v76.size.width = v38;
        v76.size.height = v61;
        rect.origin.y = MinX - CGRectGetMinX(v76);
        v77.origin.x = x;
        v77.origin.y = y;
        v77.size.width = width;
        v77.size.height = height;
        MinY = CGRectGetMinY(v77);
        v78.origin.x = rect.origin.x;
        v78.origin.y = v36;
        v78.size.width = v38;
        v78.size.height = v61;
        v41 = MinY - CGRectGetMinY(v78);
        v79.origin.x = x;
        v79.origin.y = y;
        v79.size.width = width;
        v79.size.height = height;
        v42 = CGRectGetWidth(v79);
        v80.origin.x = x;
        v80.origin.y = y;
        v80.size.width = width;
        v80.size.height = height;
        v43 = CGRectGetHeight(v80);
        objc_msgSend(v31, "layoutBlueprint");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "componentsInRect:", rect.origin.y, v41, v42, v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "unionSet:", v45);

        objc_msgSend(v31, "component");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_opt_class();
        if (v47 == objc_opt_class())
        {

        }
        else
        {
          objc_msgSend(v31, "component");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v16;
          v50 = objc_opt_class();
          v51 = v20;
          v52 = v19;
          v53 = objc_opt_class();

          v54 = v50 == v53;
          v19 = v52;
          v20 = v51;
          v16 = v49;
          v15 = v57;
          v8 = v58;
          if (!v54)
            goto LABEL_25;
        }
        objc_msgSend(v15, "addObject:", v31);
LABEL_25:

        x = v59;
        y = v60;
LABEL_21:
        ++v21;
      }
      while (v18 != v21);
      v55 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &rect.size, v70, 16);
      v18 = v55;
    }
    while (v55);
  }

  objc_msgSend(v8, "minusSet:", v15);
  return v8;
}

- (void)startUpdatesForWidth:(double)a3
{
  NSMutableDictionary *v5;
  NSMutableDictionary *flattenedBlueprint;

  self->_updating = 1;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  flattenedBlueprint = self->_flattenedBlueprint;
  self->_flattenedBlueprint = v5;

  self->_blueprintSize.width = a3;
}

- (void)endUpdates
{
  NSMutableDictionary *blueprint;
  _QWORD v4[7];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  blueprint = self->_blueprint;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__SXLayoutBlueprint_endUpdates__block_invoke;
  v4[3] = &unk_24D68ABF0;
  v4[4] = self;
  v4[5] = &v5;
  v4[6] = &v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](blueprint, "enumerateKeysAndObjectsUsingBlock:", v4);
  self->_isComplete = *((_BYTE *)v6 + 24);
  *(_QWORD *)&self->_blueprintSize.height = v10[3];
  -[SXLayoutBlueprint storeComponentsFromBlueprint:inDictionary:](self, "storeComponentsFromBlueprint:inDictionary:", self, self->_flattenedBlueprint);
  self->_updating = 0;
  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(&v9, 8);
}

void __31__SXLayoutBlueprint_endUpdates__block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  double MaxY;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  double v17;
  void *v18;
  char v19;
  id v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v20 = a3;
  if ((objc_msgSend(v20, "hasValidLayout") & 1) != 0)
  {
    objc_msgSend(v20, "frame");
    MaxY = CGRectGetMaxY(v21);
    objc_msgSend(v20, "component");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anchor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "originAnchorPosition"))
      v7 = objc_msgSend(v6, "originAnchorPosition");
    else
      v7 = objc_msgSend(v6, "targetAnchorPosition");
    v8 = v7;
    objc_msgSend(v20, "frame");
    if (CGRectGetHeight(v22) > 0.0 && (v8 != 2 || !v6))
    {
      v9 = *(void **)(a1[4] + 40);
      objc_msgSend(v20, "frame");
      objc_msgSend(v9, "createUnitConverterWithComponentWidth:parentWidth:layoutOptions:", *(_QWORD *)(a1[4] + 24), CGRectGetWidth(v23), *(double *)(a1[4] + 96));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentLayout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "margin");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "bottom");
      objc_msgSend(v10, "convertValueToPoints:", v13, v14);
      MaxY = MaxY + v15;

    }
    v16 = *(_QWORD *)(a1[6] + 8);
    v17 = *(double *)(v16 + 24);
    if (v17 < MaxY)
      v17 = MaxY;
    *(double *)(v16 + 24) = v17;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v20, "layoutBlueprint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isComplete");

    if ((v19 & 1) == 0)
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  }

}

- (void)storeComponentsFromBlueprint:(id)a3 inDictionary:(id)a4
{
  id v6;
  NSMutableDictionary *blueprint;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  SXLayoutBlueprint *v13;

  v6 = a4;
  blueprint = self->_blueprint;
  v8 = a3;
  objc_msgSend(v6, "addEntriesFromDictionary:", blueprint);
  objc_msgSend(v8, "blueprint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __63__SXLayoutBlueprint_storeComponentsFromBlueprint_inDictionary___block_invoke;
  v11[3] = &unk_24D68AC18;
  v12 = v6;
  v13 = self;
  v10 = v6;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

}

void __63__SXLayoutBlueprint_storeComponentsFromBlueprint_inDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v7, "layoutBlueprint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "storeComponentsFromBlueprint:inDictionary:", v6, *(_QWORD *)(a1 + 32));

  }
}

- (id)snapLinesIncludingChildren:(BOOL)a3
{
  _BOOL8 v3;
  SXLayoutBlueprint *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _UNKNOWN **v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  NSMutableArray *v13;
  _UNKNOWN **v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  SXLayoutBlueprint *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v3 = a3;
  v4 = self;
  v28 = *MEMORY[0x24BDAC8D0];
  v21 = (id)-[NSOrderedSet mutableCopy](self->_snapLines, "mutableCopy");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v4->_orderedComponentIdentifiers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    v9 = &off_24D684000;
    v22 = v4;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        -[SXLayoutBlueprint componentBlueprintForComponentIdentifier:](v4, "componentBlueprintForComponentIdentifier:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10), v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = v3;
            v13 = v5;
            v14 = v9;
            v15 = v11;
            objc_msgSend(v15, "layoutBlueprint");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "snapLines");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              objc_msgSend(v15, "layoutBlueprint");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "snapLinesIncludingChildren:", 1);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "unionOrderedSet:", v19);

            }
            v9 = v14;
            v5 = v13;
            v3 = v12;
            v4 = v22;
          }
        }

        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSMutableDictionary *blueprint;
  _QWORD *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD *v17;
  _QWORD v19[4];
  id v20;
  id v21;

  v4 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *(_BYTE *)(v4 + 8) = self->_isComplete;
  objc_storeStrong((id *)(v4 + 24), self->_layoutOptions);
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentLayoutBlueprint);
  objc_storeWeak((id *)(v4 + 16), WeakRetained);

  v6 = -[NSMutableArray mutableCopy](self->_orderedComponentIdentifiers, "mutableCopy");
  v7 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v6;

  *(_BYTE *)(v4 + 9) = self->_updating;
  *(CGSize *)(v4 + 96) = self->_blueprintSize;
  v8 = -[NSMutableSet mutableCopy](self->_invalidatedComponents, "mutableCopy");
  v9 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v8;

  objc_storeStrong((id *)(v4 + 80), self->_dependencySolver);
  objc_storeStrong((id *)(v4 + 88), self->_snapLines);
  objc_storeStrong((id *)(v4 + 32), self->_componentBlueprintFactory);
  objc_storeStrong((id *)(v4 + 40), self->_unitConverterFactory);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[NSMutableDictionary count](self->_blueprint, "count"));
  blueprint = self->_blueprint;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __34__SXLayoutBlueprint_copyWithZone___block_invoke;
  v19[3] = &unk_24D68AC40;
  v12 = (id)v4;
  v20 = v12;
  v13 = v10;
  v21 = v13;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](blueprint, "enumerateKeysAndObjectsUsingBlock:", v19);
  v14 = (void *)v12[6];
  v12[6] = v13;
  v15 = v13;

  v16 = v21;
  v17 = v12;

  return v17;
}

void __34__SXLayoutBlueprint_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(v6, "setParentLayoutBlueprint:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v5);

}

- (SXLayoutBlueprint)rootLayoutBlueprint
{
  SXLayoutBlueprint **p_parentLayoutBlueprint;
  id WeakRetained;
  id v5;
  SXLayoutBlueprint *v6;

  p_parentLayoutBlueprint = &self->_parentLayoutBlueprint;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentLayoutBlueprint);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_parentLayoutBlueprint);
    objc_msgSend(v5, "rootLayoutBlueprint");
    v6 = (SXLayoutBlueprint *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = self;
  }
  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; isComplete: %d"), -[SXLayoutBlueprint isComplete](self, "isComplete"));
  -[SXLayoutBlueprint componentIdentifiers](self, "componentIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; number of components: %lu"), objc_msgSend(v4, "count"));

  -[SXLayoutBlueprint layoutOptions](self, "layoutOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; options: %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  -[SXLayoutBlueprint description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXLayoutBlueprint layoutDescriptionForBlueprint:depth:](self, "layoutDescriptionForBlueprint:depth:", self, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n%@"), v4, v5);

  return v6;
}

- (id)layoutDescriptionForBlueprint:(id)a3 depth:(unint64_t)a4
{
  id v5;
  void *v6;
  unint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  _UNKNOWN **v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  const __CFString *v18;
  _UNKNOWN **v19;
  void *v20;
  unint64_t v22;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 2 * a4; i; --i)
    objc_msgSend(v6, "appendString:", CFSTR(" "));
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v5, "blueprint");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    v22 = a4 + 1;
    v11 = CFSTR("%@%@\n");
    v12 = &off_24D684000;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(v5, "componentBlueprintForComponentIdentifier:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "appendFormat:", v11, v6, v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "layoutBlueprint");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXLayoutBlueprint layoutDescriptionForBlueprint:depth:](self, "layoutDescriptionForBlueprint:depth:", v15, v22);
          v16 = v6;
          v17 = v5;
          v18 = v11;
          v19 = v12;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "appendString:", v20);

          v12 = v19;
          v11 = v18;
          v5 = v17;
          v6 = v16;

        }
        ++v13;
      }
      while (v9 != v13);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

  return v25;
}

- (SXLayoutBlueprint)parentLayoutBlueprint
{
  return (SXLayoutBlueprint *)objc_loadWeakRetained((id *)&self->_parentLayoutBlueprint);
}

- (void)setParentLayoutBlueprint:(id)a3
{
  objc_storeWeak((id *)&self->_parentLayoutBlueprint, a3);
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (CGSize)blueprintSize
{
  double width;
  double height;
  CGSize result;

  width = self->_blueprintSize.width;
  height = self->_blueprintSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setBlueprintSize:(CGSize)a3
{
  self->_blueprintSize = a3;
}

- (SXLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (SXComponentBlueprintFactory)componentBlueprintFactory
{
  return self->_componentBlueprintFactory;
}

- (SXUnitConverterFactory)unitConverterFactory
{
  return self->_unitConverterFactory;
}

- (NSMutableDictionary)blueprint
{
  return self->_blueprint;
}

- (void)setBlueprint:(id)a3
{
  objc_storeStrong((id *)&self->_blueprint, a3);
}

- (NSMutableDictionary)flattenedBlueprint
{
  return self->_flattenedBlueprint;
}

- (void)setFlattenedBlueprint:(id)a3
{
  objc_storeStrong((id *)&self->_flattenedBlueprint, a3);
}

- (NSMutableArray)orderedComponentIdentifiers
{
  return self->_orderedComponentIdentifiers;
}

- (void)setOrderedComponentIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_orderedComponentIdentifiers, a3);
}

- (BOOL)isUpdating
{
  return self->_updating;
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

- (NSMutableSet)invalidatedComponents
{
  return self->_invalidatedComponents;
}

- (void)setInvalidatedComponents:(id)a3
{
  objc_storeStrong((id *)&self->_invalidatedComponents, a3);
}

- (SXComponentDependencyResolver)dependencySolver
{
  return self->_dependencySolver;
}

- (void)setDependencySolver:(id)a3
{
  objc_storeStrong((id *)&self->_dependencySolver, a3);
}

- (NSOrderedSet)snapLines
{
  return self->_snapLines;
}

- (void)setSnapLines:(id)a3
{
  objc_storeStrong((id *)&self->_snapLines, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapLines, 0);
  objc_storeStrong((id *)&self->_dependencySolver, 0);
  objc_storeStrong((id *)&self->_invalidatedComponents, 0);
  objc_storeStrong((id *)&self->_orderedComponentIdentifiers, 0);
  objc_storeStrong((id *)&self->_flattenedBlueprint, 0);
  objc_storeStrong((id *)&self->_blueprint, 0);
  objc_storeStrong((id *)&self->_unitConverterFactory, 0);
  objc_storeStrong((id *)&self->_componentBlueprintFactory, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_destroyWeak((id *)&self->_parentLayoutBlueprint);
}

@end
