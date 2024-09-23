@implementation TUIBoxBuilder

- (void)addModel:(id)a3
{
  id v4;
  NSMutableArray *contents;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  contents = self->_contents;
  v8 = v4;
  if (!contents)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_contents;
    self->_contents = v6;

    v4 = v8;
    contents = self->_contents;
  }
  -[NSMutableArray addObject:](contents, "addObject:", v4);

}

- (unint64_t)checkContents:(id)a3
{
  return 0;
}

- (BOOL)containsSingleComponent
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;

  if (-[NSMutableArray count](self->_contents, "count") == (char *)&dword_0 + 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_contents, "firstObject"));
    v5 = objc_opt_class(TUIComponent, v4);
    isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (id)finalizeModelsWithParent:(id)a3 box:(id)a4 context:(id)a5
{
  id v8;
  NSMutableArray *contents;
  id v10;
  id v11;
  unint64_t v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  void *v15;

  v8 = a5;
  contents = self->_contents;
  v10 = a4;
  v11 = a3;
  v12 = -[TUIBoxBuilder checkContents:](self, "checkContents:", contents);
  if (v12)
    objc_msgSend(v8, "reportError:", v12);
  v13 = self->_contents;
  v14 = self->_contents;
  self->_contents = 0;

  objc_msgSend(v11, "updateModelChildren:", v13);
  objc_msgSend(v10, "setAxCustomActions:", self->_axActions);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIBoxBuilder finalizeAnimationGroups](self, "finalizeAnimationGroups"));
  objc_msgSend(v10, "setAnimationGroups:", v15);

  return v13;
}

- (void)finalizeModelsWithParent:(id)a3 context:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v8 = objc_opt_class(TUIBox, v7);
  v9 = TUIDynamicCast(v8, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = -[TUIBoxBuilder finalizeModelsWithParent:box:context:](self, "finalizeModelsWithParent:box:context:", v12, v10, v6);

}

- (void)finalizeModelsWithParent:(id)a3
{
  NSMutableArray *contents;
  NSMutableArray *v5;
  id v6;

  contents = self->_contents;
  self->_contents = 0;
  v5 = contents;
  v6 = a3;

  objc_msgSend(v6, "updateModelChildren:", v5);
}

- (void)addAnimationGroup:(id)a3 withName:(id)a4
{
  id v6;
  NSMutableDictionary *animations;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  animations = self->_animations;
  if (!animations)
  {
    v8 = objc_opt_new(NSMutableDictionary);
    v9 = self->_animations;
    self->_animations = v8;

    animations = self->_animations;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](animations, "setObject:forKeyedSubscript:", v10, v6);

}

- (id)finalizeAnimationGroups
{
  TUIAnimationGroupCollection *v3;

  if (-[NSMutableDictionary count](self->_animations, "count"))
  {
    v3 = objc_alloc_init(TUIAnimationGroupCollection);
    -[TUIAnimationGroupCollection setGroups:](v3, "setGroups:", self->_animations);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (NSArray)axActions
{
  return self->_axActions;
}

- (void)setAXActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axActions, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_contents, 0);
}

@end
