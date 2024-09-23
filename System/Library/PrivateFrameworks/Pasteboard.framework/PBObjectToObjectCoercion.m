@implementation PBObjectToObjectCoercion

- (PBObjectToObjectCoercion)initWithClass:(Class)a3
{
  PBObjectToObjectCoercion *v4;
  PBObjectToObjectCoercion *v5;
  uint64_t v6;
  NSMutableDictionary *blockByClass;
  uint64_t v8;
  NSMutableOrderedSet *orderedClassNames;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PBObjectToObjectCoercion;
  v4 = -[PBObjectToObjectCoercion init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_theClass, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    blockByClass = v5->_blockByClass;
    v5->_blockByClass = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v8 = objc_claimAutoreleasedReturnValue();
    orderedClassNames = v5->_orderedClassNames;
    v5->_orderedClassNames = (NSMutableOrderedSet *)v8;

  }
  return v5;
}

- (void)addCoercionToClass:(Class)a3 block:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  NSStringFromClass(a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x18D782EA4](v6);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_blockByClass, "setObject:forKeyedSubscript:", v7, v8);
  -[NSMutableOrderedSet addObject:](self->_orderedClassNames, "addObject:", v8);

}

- (id)availableClasses
{
  return (id)-[NSMutableOrderedSet array](self->_orderedClassNames, "array");
}

- (BOOL)canCoerceToObjectOfClass:(Class)a3
{
  NSMutableOrderedSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  Class v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_orderedClassNames;
  v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = NSClassFromString(*(NSString **)(*((_QWORD *)&v12 + 1) + 8 * i));
        if ((-[objc_class isSubclassOfClass:](v9, "isSubclassOfClass:", a3, (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)coerceObject:(id)a3 toObjectOfClass:(Class)a4 outError:(id *)a5
{
  id v8;
  NSMutableOrderedSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSString *v14;
  Class v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  char v23;
  objc_class *v24;
  uint64_t v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = self->_orderedClassNames;
  v10 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = *(NSString **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v15 = NSClassFromString(v14);
        if (-[objc_class isSubclassOfClass:](v15, "isSubclassOfClass:", a4))
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_blockByClass, "objectForKeyedSubscript:", v14);
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v19 = (void *)v16;
            v27 = 0;
            (*(void (**)(uint64_t, Class, id, id *))(v16 + 16))(v16, v15, v8, &v27);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v27;
            v21 = v20;
            if (a5)
            {
              if (v20)
              {
                objc_msgSend(v20, "domain");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("PBErrorDomain"));

                if ((v23 & 1) == 0)
                {
                  v24 = (objc_class *)objc_opt_class();
                  PBCannotCoerceObjectOfClassToObjectOfClassError(v24, a4, v21);
                  v25 = objc_claimAutoreleasedReturnValue();

                  v21 = (id)v25;
                }
              }
              v21 = objc_retainAutorelease(v21);
              *a5 = v21;
            }

            goto LABEL_19;
          }
        }
      }
      v11 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v11)
        continue;
      break;
    }
  }

  if (a5)
  {
    v17 = (objc_class *)objc_opt_class();
    PBCannotCoerceObjectOfClassToObjectOfClassError(v17, a4, 0);
    v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

- (Class)theClass
{
  return self->_theClass;
}

- (void)setTheClass:(Class)a3
{
  objc_storeStrong((id *)&self->_theClass, a3);
}

- (NSMutableDictionary)blockByClass
{
  return self->_blockByClass;
}

- (void)setBlockByClass:(id)a3
{
  objc_storeStrong((id *)&self->_blockByClass, a3);
}

- (NSMutableOrderedSet)orderedClassNames
{
  return self->_orderedClassNames;
}

- (void)setOrderedClassNames:(id)a3
{
  objc_storeStrong((id *)&self->_orderedClassNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedClassNames, 0);
  objc_storeStrong((id *)&self->_blockByClass, 0);
  objc_storeStrong((id *)&self->_theClass, 0);
}

@end
