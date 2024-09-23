@implementation CRCoder

+ (void)registerClass:(Class)a3 forType:(id)a4
{
  id v6;

  v6 = a4;
  objc_msgSend(a1, "registerCRClasses");
  objc_msgSend(a1, "_registerClass:forType:cluster:", a3, v6, 0);

}

+ (void)registerCRClasses
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  if (!sTypeSet)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    v4 = (void *)sTypeSet;
    sTypeSet = (uint64_t)v3;

    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = (void *)sClusterTypes;
    sClusterTypes = (uint64_t)v5;

    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = (void *)sTypeToClassDict;
    sTypeToClassDict = (uint64_t)v7;

    objc_msgSend(a1, "_registerClass:forType:cluster:", objc_opt_class(), CFSTR("com.apple.CRDT.NSNumber"), 1);
    objc_msgSend(a1, "_registerClass:forType:cluster:", objc_opt_class(), CFSTR("com.apple.CRDT.NSString"), 1);
    objc_msgSend(a1, "_registerClass:forType:cluster:", objc_opt_class(), CFSTR("com.apple.CRDT.NSUUID"), 1);
    objc_msgSend(a1, "_registerClass:forType:cluster:", objc_opt_class(), CFSTR("com.apple.CRDT.CRRegisterMultiValueLeast"), 0);
    objc_msgSend(a1, "_registerClass:forType:cluster:", objc_opt_class(), CFSTR("com.apple.CRDT.CRRegisterMultiValue"), 0);
  }
}

+ (void)_registerClass:(Class)a3 forType:(id)a4 cluster:(BOOL)a5
{
  _BOOL4 v5;
  id v7;

  v5 = a5;
  v7 = a4;
  objc_msgSend((id)sTypeToClassDict, "setObject:forKeyedSubscript:", a3);
  if (v5)
    objc_msgSend((id)sClusterTypes, "addObject:", v7);
  else
    objc_msgSend((id)sClusterTypes, "removeObject:", v7);
  objc_msgSend((id)sTypeSet, "addObject:", v7);

}

- (NSOrderedSet)typeSet
{
  return (NSOrderedSet *)(id)sTypeSet;
}

- (NSDictionary)typeToClassDict
{
  return (NSDictionary *)(id)sTypeToClassDict;
}

- (unint64_t)typeIndexForClass:(Class)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CRCoder typeSet](self, "typeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = 0;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      v9 = 0;
      v16 = v7 + v6;
      v17 = v7;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9);
        -[CRCoder typeToClassDict](self, "typeToClassDict", v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "objectForKeyedSubscript:", v10);

        if (objc_msgSend((id)sClusterTypes, "containsObject:", v10))
          v13 = -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", v12);
        else
          v13 = -[objc_class isEqual:](a3, "isEqual:", v12);
        if ((v13 & 1) != 0)
        {
          v14 = v17 + v9;
          goto LABEL_14;
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v7 = v16;
      if (v6)
        continue;
      break;
    }
  }
  v14 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

  return v14;
}

- (NSMutableOrderedSet)encodedObjects
{
  return self->_encodedObjects;
}

- (void)setEncodedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_encodedObjects, a3);
}

- (void)currentDocument
{
  return self->_currentDocument;
}

- (void)setCurrentDocument:(void *)a3
{
  self->_currentDocument = a3;
}

- (NSOrderedSet)clusterTypeSet
{
  return self->_clusterTypeSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterTypeSet, 0);
  objc_storeStrong((id *)&self->_encodedObjects, 0);
}

@end
