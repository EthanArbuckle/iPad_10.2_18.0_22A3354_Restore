@implementation GKCDContactInfo

- (void)_gkUpdateEntryWithHandle:(id)a3 fromContact:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  -[GKCDContactInfo setHandle:](self, "setHandle:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  -[GKCDContactInfo setContactID:](self, "setContactID:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "givenName"));
  -[GKCDContactInfo setGivenName:](self, "setGivenName:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "familyName"));
  -[GKCDContactInfo setFamilyName:](self, "setFamilyName:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nickname"));
  -[GKCDContactInfo setNickname:](self, "setNickname:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nameSuffix"));
  -[GKCDContactInfo setNameSuffix:](self, "setNameSuffix:", v11);

  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "namePrefix"));
  -[GKCDContactInfo setNamePrefix:](self, "setNamePrefix:", v12);

}

+ (id)_gkUpdateWithContact:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  GKCDContactInfo *v14;
  void *v15;
  GKCDContactInfo *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  objc_msgSend(a1, "_gkDeleteObjectsWithContactIdentifier:withContext:", v8, v7);

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_gkAllHandles"));
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v12);
        v14 = [GKCDContactInfo alloc];
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "entity"));
        v16 = -[GKCDContactInfo initWithEntity:insertIntoManagedObjectContext:](v14, "initWithEntity:insertIntoManagedObjectContext:", v15, v7);

        -[GKCDContactInfo _gkUpdateEntryWithHandle:fromContact:](v16, "_gkUpdateEntryWithHandle:fromContact:", v13, v6);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  return obj;
}

+ (void)_gkDeleteObjectsWithContactIdentifier:(id)a3 withContext:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("contactID == %@"), a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKCDContactInfo _gkObjectsMatchingPredicate:withContext:](GKCDContactInfo, "_gkObjectsMatchingPredicate:withContext:", v7, v5));
  objc_msgSend(v5, "_gkDeleteObjects:", v6);

}

+ (id)_gkObjectsMatchingHandles:(id)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("handle IN %@"), a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_gkObjectsMatchingPredicate:withContext:", v7, v6));

  return v8;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("ContactInfo"));
}

@end
