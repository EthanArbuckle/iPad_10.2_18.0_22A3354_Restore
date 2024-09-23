@implementation _UIActivityMatchingResults

- (_UIActivityMatchingResults)initWithActivityMatchingContext:(id)a3
{
  id v5;
  _UIActivityMatchingResults *v6;
  _UIActivityMatchingResults *v7;
  uint64_t v8;
  NSArray *orderedActivities;
  uint64_t v10;
  NSMutableArray *hiddenActivitiesMutable;
  uint64_t v12;
  NSMutableSet *excludedActivityTypesSet;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIActivityMatchingResults;
  v6 = -[_UIActivityMatchingResults init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    orderedActivities = v7->_orderedActivities;
    v7->_orderedActivities = (NSArray *)v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    hiddenActivitiesMutable = v7->_hiddenActivitiesMutable;
    v7->_hiddenActivitiesMutable = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    excludedActivityTypesSet = v7->_excludedActivityTypesSet;
    v7->_excludedActivityTypesSet = (NSMutableSet *)v12;

  }
  return v7;
}

- (void)setOrderedActivities:(id)a3
{
  id v3;

  if (a3)
    v3 = a3;
  else
    v3 = (id)MEMORY[0x1E0C9AA60];
  objc_storeStrong((id *)&self->_orderedActivities, v3);
}

- (void)addHiddenActivities:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_hiddenActivitiesMutable, "addObjectsFromArray:", a3);
}

- (NSArray)hiddenActivities
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_hiddenActivitiesMutable, "copy");
}

- (void)addExcludedActivityTypes:(id)a3
{
  -[NSMutableSet addObjectsFromArray:](self->_excludedActivityTypesSet, "addObjectsFromArray:", a3);
}

- (NSArray)excludedActivityTypes
{
  return (NSArray *)-[NSMutableSet allObjects](self->_excludedActivityTypesSet, "allObjects");
}

- (_UIActivityMatchingContext)context
{
  return self->_context;
}

- (NSArray)orderedActivities
{
  return self->_orderedActivities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedActivities, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypesSet, 0);
  objc_storeStrong((id *)&self->_hiddenActivitiesMutable, 0);
}

@end
