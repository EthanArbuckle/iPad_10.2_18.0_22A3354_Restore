@implementation OADGroup

- (OADGroup)init
{
  uint64_t v3;
  OADGroup *v4;
  NSMutableArray *v5;
  NSMutableArray *mChildren;
  objc_super v8;

  v3 = objc_opt_class();
  v8.receiver = self;
  v8.super_class = (Class)OADGroup;
  v4 = -[OADDrawable initWithPropertiesClass:](&v8, sel_initWithPropertiesClass_, v3);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mChildren = v4->mChildren;
    v4->mChildren = v5;

  }
  return v4;
}

- (void)setLogicalBounds:(CGRect)a3
{
  self->mLogicalBounds = a3;
}

- (void)addChildren:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "count");
  if (v4)
  {
    v5 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setParent:", self);

      ++v5;
    }
    while (v4 != v5);
  }
  -[NSMutableArray addObjectsFromArray:](self->mChildren, "addObjectsFromArray:", v7);

}

- (void)setParentTextListStyle:(id)a3
{
  -[NSMutableArray makeObjectsPerformSelector:withObject:](self->mChildren, "makeObjectsPerformSelector:withObject:", sel_setParentTextListStyle_, a3);
}

- (void)removeUnnecessaryOverrides
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADGroup;
  -[OADDrawable removeUnnecessaryOverrides](&v3, sel_removeUnnecessaryOverrides);
  -[NSMutableArray makeObjectsPerformSelector:](self->mChildren, "makeObjectsPerformSelector:", sel_removeUnnecessaryOverrides);
}

- (id)children
{
  return self->mChildren;
}

- (unint64_t)childCount
{
  return -[NSMutableArray count](self->mChildren, "count");
}

- (CGRect)logicalBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mLogicalBounds.origin.x;
  y = self->mLogicalBounds.origin.y;
  width = self->mLogicalBounds.size.width;
  height = self->mLogicalBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)childAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mChildren, "objectAtIndex:", a3);
}

- (void)addChild:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    -[NSMutableArray addObject:](self->mChildren, "addObject:", v4);
    objc_msgSend(v4, "setParent:", self);
  }

}

- (id)groupProperties
{
  return self->super.mDrawableProperties;
}

- (void)replaceChild:(id)a3 with:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = -[NSMutableArray indexOfObjectIdenticalTo:](self->mChildren, "indexOfObjectIdenticalTo:", v8);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v8, "setParent:", 0);
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->mChildren, "replaceObjectAtIndex:withObject:", v7, v6);
    objc_msgSend(v6, "setParent:", self);
  }

}

- (void)removeChild:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = -[NSMutableArray indexOfObjectIdenticalTo:](self->mChildren, "indexOfObjectIdenticalTo:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "setParent:", 0);
    -[NSMutableArray removeObjectAtIndex:](self->mChildren, "removeObjectAtIndex:", v4);
  }

}

- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->mChildren;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "changeParentTextListStylePreservingEffectiveValues:", v4, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADGroup;
  -[OADDrawable description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mChildren, 0);
}

@end
