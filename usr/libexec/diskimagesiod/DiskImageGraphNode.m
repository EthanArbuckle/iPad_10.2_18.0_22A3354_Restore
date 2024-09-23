@implementation DiskImageGraphNode

- (id)toDIShadowNode
{
  DIShadowNode *v3;
  void *v4;
  DIShadowNode *v5;

  v3 = [DIShadowNode alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode URL](self, "URL"));
  v5 = -[DIShadowNode initWithURL:isCache:](v3, "initWithURL:isCache:", v4, -[DiskImageGraphNode isCache](self, "isCache"));

  return v5;
}

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a3;
  v8 = 0;
  if (objc_msgSend(v5, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("Tag"), objc_opt_class(NSString, v6), 0, a4))
  {
    v8 = 0;
    if (objc_msgSend(v5, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("UUID"), objc_opt_class(NSString, v7), 0, a4))
    {
      if (objc_msgSend(v5, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("ParentUUID"), objc_opt_class(NSString, v9), 1, a4)&& objc_msgSend(v5, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("Metadata"), objc_opt_class(NSDictionary, v10), 1, a4))
      {
        v8 = objc_msgSend(v5, "validateAndPopObjectForKey:className:isOptional:error:", CFSTR("IsCache"), objc_opt_class(NSNumber, v11), 0, a4);
      }
      else
      {
        v8 = 0;
      }
    }
  }

  return v8;
}

- (DiskImageGraphNode)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6
{
  _BOOL4 v6;
  id v8;
  DiskImageGraphNode *v9;
  uint64_t v10;
  NSString *tag;
  id v12;
  void *v13;
  NSUUID *v14;
  NSUUID *UUID;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSUUID *v21;
  NSUUID *parentUUID;
  void *v23;
  uint64_t v24;
  NSDictionary *metadata;
  NSMutableArray *v26;
  NSMutableArray *children;
  objc_super v29;

  v6 = a4;
  v8 = a3;
  v29.receiver = self;
  v29.super_class = (Class)DiskImageGraphNode;
  v9 = -[DiskImageGraphNode init](&v29, "init");
  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Tag")));
    tag = v9->_tag;
    v9->_tag = (NSString *)v10;

    v12 = objc_alloc((Class)NSUUID);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("UUID")));
    v14 = (NSUUID *)objc_msgSend(v12, "initWithUUIDString:", v13);
    UUID = v9->_UUID;
    v9->_UUID = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("IsCache")));
    v9->_isCache = objc_msgSend(v16, "BOOLValue");

    if (v6)
      v17 = v8;
    else
      v17 = 0;
    objc_storeStrong((id *)&v9->_pstackDict, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("ParentUUID")));

    if (v18)
    {
      v19 = objc_alloc((Class)NSUUID);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("ParentUUID")));
      v21 = (NSUUID *)objc_msgSend(v19, "initWithUUIDString:", v20);
      parentUUID = v9->_parentUUID;
      v9->_parentUUID = v21;

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Metadata")));

    if (v23)
    {
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("Metadata")));
      metadata = v9->_metadata;
      v9->_metadata = (NSDictionary *)v24;

    }
    v26 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    children = v9->_children;
    v9->_children = v26;

  }
  return v9;
}

+ (id)GraphNodeWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;
  __objc2_class **v12;
  id v13;

  v7 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PluginName")));

  v12 = off_10016C5E0;
  if (v11)
    v12 = off_10016C738;
  v13 = objc_msgSend(objc_alloc(*v12), "initWithDictionary:updateChangesToDict:workDir:error:", v10, v7, v9, a6);

  return v13;
}

- (DiskImageGraphNode)initWithTag:(id)a3 UUID:(id)a4 parentNode:(id)a5 metadata:(id)a6 isCache:(BOOL)a7
{
  __CFString *v12;
  id v13;
  id v14;
  id v15;
  DiskImageGraphNode *v16;
  DiskImageGraphNode *v17;
  __CFString *v18;
  uint64_t v19;
  NSUUID *parentUUID;
  NSMutableArray *v21;
  NSMutableArray *children;
  objc_super v24;

  v12 = (__CFString *)a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)DiskImageGraphNode;
  v16 = -[DiskImageGraphNode init](&v24, "init");
  v17 = v16;
  if (v16)
  {
    if (v12)
      v18 = v12;
    else
      v18 = &stru_1001933A0;
    objc_storeStrong((id *)&v16->_tag, v18);
    objc_storeStrong((id *)&v17->_UUID, a4);
    objc_storeStrong((id *)&v17->_parent, a5);
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUID"));
    parentUUID = v17->_parentUUID;
    v17->_parentUUID = (NSUUID *)v19;

    objc_storeStrong((id *)&v17->_metadata, a6);
    v17->_isCache = a7;
    v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    children = v17->_children;
    v17->_children = v21;

  }
  return v17;
}

- (void)setTag:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_tag, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("Tag"));

  }
}

- (void)setUUID:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_UUID, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("UUID"));

  }
}

- (void)setParent:(id)a3
{
  NSUUID *v5;
  NSUUID *parentUUID;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_storeStrong((id *)&self->_parent, a3);
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUID"));
  parentUUID = self->_parentUUID;
  self->_parentUUID = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("ParentUUID"));

  }
}

- (void)setMetadata:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_metadata, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("Metadata"));

  }
}

- (void)setIsCache:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  self->_isCache = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));

  if (v5)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode pstackDict](self, "pstackDict"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("IsCache"));

  }
}

- (id)getDescendants
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode children](self, "children"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));

  -[DiskImageGraphNode addDecendantsToArray:](self, "addDecendantsToArray:", v4);
  return v4;
}

- (void)addDecendantsToArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode children](self, "children", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v4, "addObject:", v10);
        objc_msgSend(v10, "addDecendantsToArray:", v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (id)toDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode tag](self, "tag"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode UUID](self, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[DiskImageGraphNode isCache](self, "isCache")));
  v8 = objc_msgSend(v3, "initWithObjectsAndKeys:", v4, CFSTR("Tag"), v6, CFSTR("UUID"), v7, CFSTR("IsCache"), 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode parentUUID](self, "parentUUID"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode parentUUID](self, "parentUUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
    objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("ParentUUID"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode metadata](self, "metadata"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode metadata](self, "metadata"));
    objc_msgSend(v8, "setObject:forKey:", v13, CFSTR("Metadata"));

  }
  return v8;
}

- (BOOL)deleteImage
{
  return 0;
}

- (id)URL
{
  return 0;
}

- (id)getChildren
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraphNode children](self, "children"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (NSString)tag
{
  return self->_tag;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSUUID)parentUUID
{
  return self->_parentUUID;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (BOOL)isCache
{
  return self->_isCache;
}

- (NSMutableDictionary)pstackDict
{
  return self->_pstackDict;
}

- (void)setPstackDict:(id)a3
{
  objc_storeStrong((id *)&self->_pstackDict, a3);
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (DiskImageGraphNode)parent
{
  return self->_parent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_pstackDict, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_parentUUID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_tag, 0);
}

@end
