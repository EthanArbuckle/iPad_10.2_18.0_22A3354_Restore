@implementation MTLibraryEntityChanges

- (void)add:(id)a3 changeType:(int)a4
{
  id v6;
  id v7;

  v6 = a3;
  if (a4 <= 2)
  {
    v7 = v6;
    -[NSMutableSet addObject:]((&self->_insertedObjectIDs)[a4], "addObject:", v6);
    v6 = v7;
  }

}

- (MTLibraryEntityChanges)initWithEntityName:(id)a3
{
  id v5;
  MTLibraryEntityChanges *v6;
  MTLibraryEntityChanges *v7;
  uint64_t v8;
  NSMutableSet *insertedObjectIDs;
  uint64_t v10;
  NSMutableSet *deletedObjectIDs;
  uint64_t v12;
  NSMutableSet *updatedObjectIDs;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MTLibraryEntityChanges;
  v6 = -[MTLibraryEntityChanges init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_entityName, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    insertedObjectIDs = v7->_insertedObjectIDs;
    v7->_insertedObjectIDs = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    deletedObjectIDs = v7->_deletedObjectIDs;
    v7->_deletedObjectIDs = (NSMutableSet *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    updatedObjectIDs = v7->_updatedObjectIDs;
    v7->_updatedObjectIDs = (NSMutableSet *)v12;

  }
  return v7;
}

- (BOOL)hasUpdates
{
  void *v2;
  BOOL v3;

  -[MTLibraryEntityChanges updatedObjectIDs](self, "updatedObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSMutableSet)updatedObjectIDs
{
  return self->_updatedObjectIDs;
}

- (BOOL)hasChanges
{
  return -[MTLibraryEntityChanges hasInserts](self, "hasInserts")
      || -[MTLibraryEntityChanges hasDeletes](self, "hasDeletes")
      || -[MTLibraryEntityChanges hasUpdates](self, "hasUpdates");
}

- (BOOL)hasInserts
{
  void *v2;
  BOOL v3;

  -[MTLibraryEntityChanges insertedObjectIDs](self, "insertedObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSMutableSet)insertedObjectIDs
{
  return self->_insertedObjectIDs;
}

- (BOOL)hasDeletes
{
  void *v2;
  BOOL v3;

  -[MTLibraryEntityChanges deletedObjectIDs](self, "deletedObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSMutableSet)deletedObjectIDs
{
  return self->_deletedObjectIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedObjectIDs, 0);
  objc_storeStrong((id *)&self->_deletedObjectIDs, 0);
  objc_storeStrong((id *)&self->_insertedObjectIDs, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MTLibraryEntityChanges entityName](self, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEntityName:", v6);

  -[MTLibraryEntityChanges insertedObjectIDs](self, "insertedObjectIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopyWithZone:", a3);
  objc_msgSend(v7, "setInsertedObjectIDs:", v9);

  -[MTLibraryEntityChanges deletedObjectIDs](self, "deletedObjectIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopyWithZone:", a3);
  objc_msgSend(v7, "setDeletedObjectIDs:", v11);

  -[MTLibraryEntityChanges updatedObjectIDs](self, "updatedObjectIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopyWithZone:", a3);
  objc_msgSend(v7, "setUpdatedObjectIDs:", v13);

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: inserted(%li), deleted(%li), updated(%li)"), self->_entityName, -[NSMutableSet count](self->_insertedObjectIDs, "count"), -[NSMutableSet count](self->_deletedObjectIDs, "count"), -[NSMutableSet count](self->_updatedObjectIDs, "count"));
}

- (id)insertedAndUpdatedObjectIDs
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[MTLibraryEntityChanges insertedObjectIDs](self, "insertedObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  -[MTLibraryEntityChanges updatedObjectIDs](self, "updatedObjectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  return v3;
}

- (void)combineChanges:(id)a3
{
  NSMutableSet *insertedObjectIDs;
  id v5;
  void *v6;
  NSMutableSet *deletedObjectIDs;
  void *v8;
  NSMutableSet *updatedObjectIDs;
  id v10;

  insertedObjectIDs = self->_insertedObjectIDs;
  v5 = a3;
  objc_msgSend(v5, "insertedObjectIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet unionSet:](insertedObjectIDs, "unionSet:", v6);

  deletedObjectIDs = self->_deletedObjectIDs;
  objc_msgSend(v5, "deletedObjectIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet unionSet:](deletedObjectIDs, "unionSet:", v8);

  updatedObjectIDs = self->_updatedObjectIDs;
  objc_msgSend(v5, "updatedObjectIDs");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet unionSet:](updatedObjectIDs, "unionSet:", v10);
}

- (NSString)entityName
{
  return self->_entityName;
}

- (void)setInsertedObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_insertedObjectIDs, a3);
}

- (void)setDeletedObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_deletedObjectIDs, a3);
}

- (void)setUpdatedObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_updatedObjectIDs, a3);
}

@end
