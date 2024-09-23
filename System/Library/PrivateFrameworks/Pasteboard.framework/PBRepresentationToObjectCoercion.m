@implementation PBRepresentationToObjectCoercion

- (PBRepresentationToObjectCoercion)initWithClass:(Class)a3
{
  PBRepresentationToObjectCoercion *v4;
  PBRepresentationToObjectCoercion *v5;
  uint64_t v6;
  NSMutableDictionary *blockByType;
  uint64_t v8;
  NSMutableOrderedSet *typeOrder;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PBRepresentationToObjectCoercion;
  v4 = -[PBRepresentationToObjectCoercion init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_theClass, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    blockByType = v5->_blockByType;
    v5->_blockByType = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v8 = objc_claimAutoreleasedReturnValue();
    typeOrder = v5->_typeOrder;
    v5->_typeOrder = (NSMutableOrderedSet *)v8;

  }
  return v5;
}

- (void)addCoercionFromType:(id)a3 block:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)MEMORY[0x18D782EA4](a4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_blockByType, "setObject:forKeyedSubscript:", v6, v7);

  -[NSMutableOrderedSet addObject:](self->_typeOrder, "addObject:", v7);
}

- (id)availableImportTypes
{
  return (id)-[NSMutableOrderedSet array](self->_typeOrder, "array");
}

- (BOOL)canCoerceFromType:(id)a3
{
  __CFString *v4;
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_typeOrder;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if (UTTypeConformsTo(v4, *(CFStringRef *)(*((_QWORD *)&v10 + 1) + 8 * i)))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)createObjectFromRepresentationConformingToType:(id)a3 data:(id)a4 URL:(id)a5 outError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  Class theClass;
  uint64_t v18;
  unint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  char v24;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[NSMutableOrderedSet array](self->_typeOrder, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _bestMatchType(v10, v13, &__block_literal_global_10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14
    || (-[NSMutableDictionary objectForKeyedSubscript:](self->_blockByType, "objectForKeyedSubscript:", v14),
        (v15 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    PBCannotInstantiateObjectOfClassError(self->_theClass, v10, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0;
LABEL_9:
    v18 = 0;
    goto LABEL_10;
  }
  v16 = (void *)v15;
  theClass = self->_theClass;
  v25 = 0;
  (*(void (**)(uint64_t, Class, void *, id, id, id *))(v15 + 16))(v15, theClass, v14, v11, v12, &v25);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (unint64_t)v25;
  if (!(v18 | v19))
  {
    PBCannotInstantiateObjectOfClassError(self->_theClass, v10, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v20 = (id)v19;
  if (!v19)
    goto LABEL_13;
  objc_msgSend((id)v19, "domain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v21, "isEqualToString:", CFSTR("PBErrorDomain"));

  if ((v24 & 1) == 0)
  {
    PBCannotInstantiateObjectOfClassError(self->_theClass, v10, v20);
    v22 = objc_claimAutoreleasedReturnValue();

    v20 = (id)v22;
  }
LABEL_10:
  if (a6 && v20)
  {
    v20 = objc_retainAutorelease(v20);
    *a6 = v20;
  }
LABEL_13:

  return (id)v18;
}

- (Class)theClass
{
  return self->_theClass;
}

- (void)setTheClass:(Class)a3
{
  objc_storeStrong((id *)&self->_theClass, a3);
}

- (NSMutableDictionary)blockByType
{
  return self->_blockByType;
}

- (void)setBlockByType:(id)a3
{
  objc_storeStrong((id *)&self->_blockByType, a3);
}

- (NSMutableOrderedSet)typeOrder
{
  return self->_typeOrder;
}

- (void)setTypeOrder:(id)a3
{
  objc_storeStrong((id *)&self->_typeOrder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeOrder, 0);
  objc_storeStrong((id *)&self->_blockByType, 0);
  objc_storeStrong((id *)&self->_theClass, 0);
}

@end
