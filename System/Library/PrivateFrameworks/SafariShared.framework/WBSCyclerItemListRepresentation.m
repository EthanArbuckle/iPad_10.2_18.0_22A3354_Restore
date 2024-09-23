@implementation WBSCyclerItemListRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSCyclerItemListRepresentation)initWithTitle:(id)a3 uniqueIdentifier:(id)a4
{
  WBSCyclerItemListRepresentation *v4;
  uint64_t v5;
  NSMutableArray *children;
  WBSCyclerItemListRepresentation *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBSCyclerItemListRepresentation;
  v4 = -[WBSCyclerItemRepresentation initWithTitle:uniqueIdentifier:](&v9, sel_initWithTitle_uniqueIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    children = v4->_children;
    v4->_children = (NSMutableArray *)v5;

    v7 = v4;
  }

  return v4;
}

- (WBSCyclerItemListRepresentation)initWithCoder:(id)a3
{
  id v4;
  WBSCyclerItemListRepresentation *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableArray *children;
  WBSCyclerItemListRepresentation *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WBSCyclerItemListRepresentation;
  v5 = -[WBSCyclerItemRepresentation initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("Children"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "mutableCopy");
    children = v5->_children;
    v5->_children = (NSMutableArray *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WBSCyclerItemListRepresentation;
  v4 = a3;
  -[WBSCyclerItemRepresentation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_children, CFSTR("Children"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  WBSCyclerItemListRepresentation *v4;
  void *v5;
  void *v6;
  WBSCyclerItemListRepresentation *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = [WBSCyclerItemListRepresentation alloc];
  -[WBSCyclerItemRepresentation title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCyclerItemRepresentation uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WBSCyclerItemListRepresentation initWithTitle:uniqueIdentifier:](v4, "initWithTitle:uniqueIdentifier:", v5, v6);

  -[WBSCyclerItemRepresentation extraAttributes](self, "extraAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCyclerItemRepresentation setExtraAttributes:](v7, "setExtraAttributes:", v8);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_children;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "copy", (_QWORD)v16);
        -[WBSCyclerItemListRepresentation addChild:](v7, "addChild:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v7;
}

- (BOOL)isEquivalent:(id)a3
{
  id *v4;
  id v5;
  unint64_t v6;
  BOOL v7;
  unint64_t i;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = (id *)a3;
  v13.receiver = self;
  v13.super_class = (Class)WBSCyclerItemListRepresentation;
  if (-[WBSCyclerItemRepresentation isEquivalent:](&v13, sel_isEquivalent_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4[5];
    v6 = objc_msgSend(v5, "count");
    if (v6 == -[NSMutableArray count](self->_children, "count"))
    {
      if (v6)
      {
        v7 = 0;
        for (i = 0; i != v6; v7 = i >= v6)
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", i);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray objectAtIndexedSubscript:](self->_children, "objectAtIndexedSubscript:", i);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEquivalent:", v10);

          if ((v11 & 1) == 0)
            break;
          ++i;
        }
      }
      else
      {
        v7 = 1;
      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)pairsOfItemsWithDifferingExtraAttributesComparedTo:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = (id *)a3;
  v5 = v4[5];
  v6 = objc_msgSend(v5, "count");
  v14.receiver = self;
  v14.super_class = (Class)WBSCyclerItemListRepresentation;
  -[WBSCyclerItemRepresentation pairsOfItemsWithDifferingExtraAttributesComparedTo:](&v14, sel_pairsOfItemsWithDifferingExtraAttributesComparedTo_, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (v6)
  {
    for (i = 0; i != v6; ++i)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_children, "objectAtIndexedSubscript:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pairsOfItemsWithDifferingExtraAttributesComparedTo:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v12);

    }
  }

  return v8;
}

- (unint64_t)numberOfChildren
{
  return -[NSMutableArray count](self->_children, "count");
}

- (void)addChild:(id)a3
{
  -[NSMutableArray addObject:](self->_children, "addObject:", a3);
}

- (void)insertChild:(id)a3 atIndex:(unint64_t)a4
{
  -[NSMutableArray insertObject:atIndex:](self->_children, "insertObject:atIndex:", a3, a4);
}

- (void)deleteChild:(id)a3
{
  -[NSMutableArray removeObject:](self->_children, "removeObject:", a3);
}

- (void)deleteAllChildren
{
  -[NSMutableArray removeAllObjects](self->_children, "removeAllObjects");
}

- (BOOL)containsChild:(id)a3
{
  return -[NSMutableArray containsObject:](self->_children, "containsObject:", a3);
}

- (BOOL)containsChildPassingTest:(id)a3
{
  uint64_t (**v4)(id, _QWORD);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_children;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)containsDescendant:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[WBSCyclerItemListRepresentation containsChild:](self, "containsChild:", v4))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_children;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v6);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend(v9, "containsDescendant:", v4, (_QWORD)v11) & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_14;
          }
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return v5;
}

- (id)childAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[WBSCyclerItemListRepresentation numberOfChildren](self, "numberOfChildren") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_children, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)descendantWithUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  WBSCyclerItemListRepresentation *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  WBSCyclerItemListRepresentation *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WBSCyclerItemRepresentation uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if (v6)
  {
    v7 = self;
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = self->_children;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v13, "uniqueIdentifier", (_QWORD)v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v4);

          if (v15)
          {
            v16 = v13;
LABEL_15:
            v7 = v16;

            goto LABEL_16;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v13, "descendantWithUniqueIdentifier:", v4);
            v16 = (WBSCyclerItemListRepresentation *)objc_claimAutoreleasedReturnValue();
            if (v16)
              goto LABEL_15;
          }
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          continue;
        break;
      }
    }

    v7 = 0;
  }
LABEL_16:

  return v7;
}

- (id)randomDescendantPassingTest:(id)a3
{
  void *v3;
  void *v4;

  -[WBSCyclerItemListRepresentation allDescendantsPassingTest:](self, "allDescendantsPassingTest:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    +[WBSCyclerRandomnessUtilities randomElementOfArray:](WBSCyclerRandomnessUtilities, "randomElementOfArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)randomChildPassingTest:(id)a3
{
  uint64_t (**v4)(id, void *);
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(id, void *))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_children;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((v4[2](v4, v9) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)allDescendantsPassingTest:(id)a3
{
  unsigned int (**v4)(id, WBSCyclerItemListRepresentation *);
  void *v5;
  WBSCyclerItemListRepresentation *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  WBSCyclerItemListRepresentation *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(id, WBSCyclerItemListRepresentation *))a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4[2](v4, self))
    objc_msgSend(v5, "addObject:", self);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self;
  v7 = -[WBSCyclerItemListRepresentation countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(WBSCyclerItemListRepresentation **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v4[2](v4, v11))
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[WBSCyclerItemListRepresentation allDescendantsPassingTest:](v11, "allDescendantsPassingTest:", v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v12);

        }
      }
      v8 = -[WBSCyclerItemListRepresentation countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)randomDescendant
{
  return -[WBSCyclerItemListRepresentation randomDescendantPassingTest:](self, "randomDescendantPassingTest:", &__block_literal_global_37);
}

uint64_t __51__WBSCyclerItemListRepresentation_randomDescendant__block_invoke()
{
  return 1;
}

- (id)randomListDescendant
{
  return -[WBSCyclerItemListRepresentation randomDescendantPassingTest:](self, "randomDescendantPassingTest:", &__block_literal_global_17);
}

uint64_t __55__WBSCyclerItemListRepresentation_randomListDescendant__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)randomProfileDescendant
{
  return -[WBSCyclerItemListRepresentation randomChildPassingTest:](self, "randomChildPassingTest:", &__block_literal_global_18);
}

uint64_t __58__WBSCyclerItemListRepresentation_randomProfileDescendant__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableArray countByEnumeratingWithState:objects:count:](self->_children, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (BOOL)_tryToDeleteDescendant:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[WBSCyclerItemListRepresentation containsChild:](self, "containsChild:", v4))
  {
    -[WBSCyclerItemListRepresentation deleteChild:](self, "deleteChild:", v4);
LABEL_14:
    v11 = 1;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = self->_children;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend(v10, "_tryToDeleteDescendant:", v4, (_QWORD)v13) & 1) != 0)
          {

            goto LABEL_14;
          }
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }

    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
}

@end
