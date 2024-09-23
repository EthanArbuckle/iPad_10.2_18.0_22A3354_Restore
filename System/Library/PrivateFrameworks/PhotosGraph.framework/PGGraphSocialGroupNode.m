@implementation PGGraphSocialGroupNode

- (PGGraphSocialGroupNode)initWithSocialGroupIdentifier:(int64_t)a3 importance:(double)a4
{
  return -[PGGraphSocialGroupNode initWithSocialGroupIdentifier:importance:isUserVerified:](self, "initWithSocialGroupIdentifier:importance:isUserVerified:", a3, 0, a4);
}

- (PGGraphSocialGroupNode)initWithSocialGroupIdentifier:(int64_t)a3 importance:(double)a4 isUserVerified:(BOOL)a5
{
  PGGraphSocialGroupNode *v8;
  uint64_t v9;
  NSNumber *uuid;
  NSString *persistedUUID;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PGGraphSocialGroupNode;
  v8 = -[PGGraphNode init](&v13, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = objc_claimAutoreleasedReturnValue();
    uuid = v8->_uuid;
    v8->_uuid = (NSNumber *)v9;

    v8->_importance = a4;
    v8->_isUserVerified = a5;
    persistedUUID = v8->_persistedUUID;
    v8->_persistedUUID = (NSString *)&stru_1E8436F28;

  }
  return v8;
}

- (PGGraphSocialGroupNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  PGGraphSocialGroupNode *v15;
  NSString *persistedUUID;

  v6 = a5;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("importance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isUserVerified"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("persistedUUID"));
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = -[PGGraphSocialGroupNode initWithSocialGroupIdentifier:importance:isUserVerified:](self, "initWithSocialGroupIdentifier:importance:isUserVerified:", v8, v13, v11);
  persistedUUID = v15->_persistedUUID;
  v15->_persistedUUID = (NSString *)v14;

  return v15;
}

- (PGGraphSocialGroupNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  PGGraphSocialGroupNode *v16;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("importance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v11);
    *(float *)&v14 = a5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("importance"));

    v11 = v13;
  }
  v16 = -[PGGraphSocialGroupNode initWithLabel:domain:properties:](self, "initWithLabel:domain:properties:", v10, v8, v11);

  return v16;
}

- (BOOL)hasProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  BOOL v15;
  char v16;

  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "count"))
    goto LABEL_11;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "intValue");
    if (v8 != -[NSNumber intValue](self->_uuid, "intValue"))
      goto LABEL_12;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("importance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  if (v9)
  {
    objc_msgSend(v9, "doubleValue");
    if (v10 != self->_importance)
      goto LABEL_12;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isUserVerified"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v11)
  {
    if (self->_isUserVerified != objc_msgSend(v11, "BOOLValue"))
    {
LABEL_12:

      v16 = 0;
      goto LABEL_13;
    }
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("persistedUUID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, "stringValue");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    v15 = v14 != self->_persistedUUID;

    v16 = !v15;
  }
  else
  {
LABEL_11:
    v16 = 1;
  }
LABEL_13:

  return v16 & 1;
}

- (id)propertyDictionary
{
  NSNumber *uuid;
  NSString *persistedUUID;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  uuid = self->_uuid;
  v9[0] = CFSTR("id");
  v9[1] = CFSTR("persistedUUID");
  persistedUUID = self->_persistedUUID;
  if (!persistedUUID)
    persistedUUID = (NSString *)&stru_1E8436F28;
  v10[0] = uuid;
  v10[1] = persistedUUID;
  v9[2] = CFSTR("importance");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_importance);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("isUserVerified");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isUserVerified);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)description
{
  const __CFString *v2;

  if (self->_isUserVerified)
    v2 = CFSTR("user-verified");
  else
    v2 = CFSTR("graph-verified");
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PGGraphSocialGroupNode (%@, %f, %@) persistedUUID: \"%@\"), self->_uuid, *(_QWORD *)&self->_importance, v2, self->_persistedUUID);
}

- (PGGraphSocialGroupNodeCollection)collection
{
  return -[MANodeCollection initWithNode:]([PGGraphSocialGroupNodeCollection alloc], "initWithNode:", self);
}

- (id)label
{
  __CFString *v2;

  v2 = CFSTR("SocialGroup");
  return CFSTR("SocialGroup");
}

- (unsigned)domain
{
  return 302;
}

- (int64_t)socialGroupID
{
  return -[NSNumber integerValue](self->_uuid, "integerValue");
}

- (id)persistedUUID
{
  NSString *persistedUUID;

  persistedUUID = -[NSString length](self->_persistedUUID, "length");
  if (persistedUUID)
    persistedUUID = self->_persistedUUID;
  return persistedUUID;
}

- (void)updatePropertiesWithPersistedSocialGroup:(id)a3 graph:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "uuid");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistModelProperty:forKey:forNodeWithIdentifier:", v7, CFSTR("persistedUUID"), -[MANode identifier](self, "identifier"));

}

- (id)UUID
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_uuid);
}

- (unint64_t)rankInGraph:(id)a3
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "socialGroupNodesSortedByImportance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", self);

  return v5;
}

- (unint64_t)numberOfMomentNodes
{
  return -[MANode countOfEdgesWithLabel:domain:](self, "countOfEdgesWithLabel:domain:", CFSTR("SOCIALGROUP"), 302);
}

- (unint64_t)numberOfMemberNodes
{
  return -[MANode countOfEdgesWithLabel:domain:](self, "countOfEdgesWithLabel:domain:", CFSTR("BELONGSTO"), 302);
}

- (NSSet)memberNodes
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphSocialGroupNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "memberNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "temporarySet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSArray)sortedMemberNodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[PGGraphSocialGroupNode memberNodes](self, "memberNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraph socialGroupMemberSortDescriptorForSocialGroupNode:](PGGraph, "socialGroupMemberSortDescriptorForSocialGroupNode:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (NSSet)personNodes
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphSocialGroupNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "temporarySet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)petNodes
{
  void *v2;
  void *v3;
  void *v4;

  -[PGGraphSocialGroupNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "petNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "temporarySet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (void)enumerateMemberEdgesAndNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("BELONGSTO"), 302, a3);
}

- (void)enumerateMemberNodesUsingBlock:(id)a3
{
  -[MANode enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:](self, "enumerateNeighborNodesThroughEdgesWithLabel:domain:usingBlock:", CFSTR("BELONGSTO"), 302, a3);
}

- (id)socialGroupNameWithServiceManager:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[16];
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __60__PGGraphSocialGroupNode_socialGroupNameWithServiceManager___block_invoke;
  v28[3] = &unk_1E8436520;
  v9 = v7;
  v29 = v9;
  -[PGGraphSocialGroupNode enumerateMemberNodesUsingBlock:](self, "enumerateMemberNodesUsingBlock:", v28);
  v26[0] = v8;
  v26[1] = 3221225472;
  v26[2] = __60__PGGraphSocialGroupNode_socialGroupNameWithServiceManager___block_invoke_2;
  v26[3] = &unk_1E842EE00;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27 = v10;
  objc_msgSend(v5, "enumeratePersonsForIdentifiers:usingBlock:", v9, v26);

  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __60__PGGraphSocialGroupNode_socialGroupNameWithServiceManager___block_invoke_3;
  v23[3] = &unk_1E842EE28;
  v11 = v10;
  v24 = v11;
  v12 = v6;
  v25 = v12;
  -[PGGraphSocialGroupNode enumerateMemberEdgesAndNodesUsingBlock:](self, "enumerateMemberEdgesAndNodesUsingBlock:", v23);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("importance"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortUsingDescriptors:", v14);

  v15 = objc_msgSend(v12, "count");
  if (v15 < 2)
  {
    if (v15 == 1)
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v12, "firstObject");
      v16 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKey:](v16, "objectForKey:", CFSTR("name"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ and Me"), v19);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "loggingConnection");
      v16 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, v16, OS_LOG_TYPE_ERROR, "Social Group has no named people in it", buf, 2u);
      }
      v17 = CFSTR("Unnamed Persons");
    }
  }
  else
  {
    objc_msgSend(v12, "valueForKey:", CFSTR("name"));
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject componentsJoinedByString:](v16, "componentsJoinedByString:", CFSTR(", "));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (BOOL)isFrequentSocialGroup
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;

  -[PGGraphSocialGroupNode collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentNodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "temporarySet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[PGGraphMomentNode firstAndLastMomentNodesInMomentNodes:](PGGraphMomentNode, "firstAndLastMomentNodesInMomentNodes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "count");
  objc_msgSend(v7, "universalEndDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "universalStartDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v10);
  v12 = v11;

  v13 = 1.0;
  if (v12 >= 31536000.0)
    v13 = v12 / 31536000.0;
  v14 = (double)v8 / v13 >= 10.0;

  return v14;
}

- (unint64_t)featureType
{
  return 2;
}

- (NSString)featureIdentifier
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphSocialGroupNode UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (double)importance
{
  return self->_importance;
}

- (BOOL)isUserVerified
{
  return self->_isUserVerified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_persistedUUID, 0);
}

void __60__PGGraphSocialGroupNode_socialGroupNameWithServiceManager___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "contactIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_msgSend(v3, "length");
    v4 = v6;
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
      v4 = v6;
    }
  }

}

void __60__PGGraphSocialGroupNode_socialGroupNameWithServiceManager___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "firstName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v8, "CNIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, v5);
  }
  else
  {
    objc_msgSend(v8, "fullName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(v8, "CNIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

    }
  }

}

void __60__PGGraphSocialGroupNode_socialGroupNameWithServiceManager___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "contactIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
      if (objc_msgSend(v9, "length"))
      {
LABEL_10:
        v13 = *(void **)(a1 + 40);
        v17[0] = CFSTR("name");
        v17[1] = CFSTR("importance");
        v18[0] = v11;
        v14 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "importance");
        objc_msgSend(v14, "numberWithDouble:");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18[1] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v16);

        goto LABEL_11;
      }
    }
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v6, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && objc_msgSend(v11, "length"))
    goto LABEL_10;
  objc_msgSend(v6, "localIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();

  v11 = (void *)v12;
  if (v12)
    goto LABEL_10;
LABEL_11:

}

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", CFSTR("SocialGroup"), 302);
}

+ (id)filterWithSocialGroupIdentifier:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("id");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterBySettingProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)filterWithIsUserVerified:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v3 = a3;
  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("isUserVerified");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterBySettingProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (NSArray)importanceSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("isUserVerified"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("importance"), 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

+ (id)memberSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("contactIdentifier"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("localIdentifier"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)identifierForMemberNodes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PGGraphSocialGroupNode memberSortDescriptors](PGGraphSocialGroupNode, "memberSortDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v3;
  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "localIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
        {
          v9 ^= objc_msgSend(v13, "hash");
        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "loggingConnection");
          v15 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v12;
            _os_log_error_impl(&dword_1CA237000, v15, OS_LOG_TYPE_ERROR, "Error: Member node with no UUID: %@", buf, 0xCu);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)momentOfSocialGroup
{
  void *v2;
  void *v3;

  +[PGGraphSocialGroupEdge filter](PGGraphSocialGroupEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (MARelation)memberOfSocialGroup
{
  void *v2;
  void *v3;

  +[PGGraphBelongsToEdge filter](PGGraphBelongsToEdge, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inRelation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v3;
}

@end
