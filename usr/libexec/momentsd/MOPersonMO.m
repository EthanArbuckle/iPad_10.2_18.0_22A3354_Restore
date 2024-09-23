@implementation MOPersonMO

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  MOPersonMO *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = a3;
  v6 = a4;
  v7 = -[MOPersonMO initWithContext:]([MOPersonMO alloc], "initWithContext:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localIdentifier"));
  -[MOPersonMO setIdentifier:](v7, "setIdentifier:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  -[MOPersonMO setName:](v7, "setName:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactIdentifier"));
  -[MOPersonMO setContactIdentifier:](v7, "setContactIdentifier:", v10);

  -[MOPersonMO setIsPHPersonTypeImportant:](v7, "setIsPHPersonTypeImportant:", objc_msgSend(v5, "isPHPersonTypeImportant"));
  -[MOPersonMO setIsMePerson:](v7, "setIsMePerson:", objc_msgSend(v5, "isMePerson"));
  -[MOPersonMO setMePersonIdentified:](v7, "setMePersonIdentified:", objc_msgSend(v5, "mePersonIdentified"));
  -[MOPersonMO setPersonRelationships:](v7, "setPersonRelationships:", 0);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "personRelationships", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[MOPersonRelationshipMO managedObjectWithObject:inManagedObjectContext:](MOPersonRelationshipMO, "managedObjectWithObject:inManagedObjectContext:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v15), v6));
        -[MOPersonMO addPersonRelationshipsObject:](v7, "addPersonRelationshipsObject:", v16);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  objc_msgSend(v5, "significanceScore");
  -[MOPersonMO setSignificanceScore:](v7, "setSignificanceScore:");
  objc_msgSend(v5, "priorityScore");
  -[MOPersonMO setPriorityScore:](v7, "setPriorityScore:");
  -[MOPersonMO setSourceEventAccessType:](v7, "setSourceEventAccessType:", objc_msgSend(v5, "sourceEventAccessType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceEventIdentifier"));
  -[MOPersonMO setSourceEventIdentifier:](v7, "setSourceEventIdentifier:", v17);

  return v7;
}

- (id)clonedObjectWithContext:(id)a3
{
  id v4;
  MOPerson *v5;
  void *v6;

  v4 = a3;
  v5 = -[MOPerson initWithPersonMO:]([MOPerson alloc], "initWithPersonMO:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MOPersonMO managedObjectWithObject:inManagedObjectContext:](MOPersonMO, "managedObjectWithObject:inManagedObjectContext:", v5, v4));

  return v6;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("MOPersonMO"));
}

@end
