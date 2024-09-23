@implementation CRCTLDDelegateTablesCoarse

- (CRCTLDDelegateTablesCoarse)initWithTableGroups:(id)a3 textRegions:(id)a4
{
  id v7;
  id v8;
  CRCTLDDelegateTablesCoarse *v9;
  CRCTLDDelegateTablesCoarse *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRCTLDDelegateTablesCoarse;
  v9 = -[CRCTLDDelegateTablesCoarse init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tableGroups, a3);
    objc_storeStrong((id *)&v10->_textRegions, a4);
  }

  return v10;
}

+ (id)delegateWithTableGroups:(id)a3 textRegions:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTableGroups:textRegions:", v6, v7);

  return v8;
}

- (id)tableForRegion:(id)a3 outCell:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  NSArray *obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = self->_tableGroups;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v19 = *(_QWORD *)v27;
    do
    {
      v18 = v6;
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v8, "cells", v18);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v23 != v11)
                objc_enumerationMutation(v9);
              v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              objc_msgSend(v13, "subregions");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "containsObject:", v5);

              if (v15)
              {
                if (a4)
                  *a4 = objc_retainAutorelease(v13);
                v16 = v8;

                goto LABEL_21;
              }
            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v10)
              continue;
            break;
          }
        }

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      v16 = 0;
    }
    while (v6);
  }
  else
  {
    v16 = 0;
  }
LABEL_21:

  return v16;
}

- (int64_t)groupingConstraintForRegion1:(id)a3 region2:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;

  v6 = a4;
  -[CRCTLDDelegateTablesCoarse tableForRegion:outCell:](self, "tableForRegion:outCell:", a3, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  -[CRCTLDDelegateTablesCoarse tableForRegion:outCell:](self, "tableForRegion:outCell:", v6, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = 1;
  if (v7 == v8)
    v9 = 2;
  if (v7 | v8)
    v10 = v9;
  else
    v10 = 0;

  return v10;
}

- (id)groupWithQuad:(id)a3 layoutDirection:(unint64_t)a4 subregions:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  CRGroupRegion *v12;
  CRGroupRegion *v13;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCTLDDelegateTablesCoarse tableForRegion:outCell:](self, "tableForRegion:outCell:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v12 = v11;
    else
      v12 = -[CRGroupRegion initWithBoundingQuad:layoutDirection:subregions:]([CRGroupRegion alloc], "initWithBoundingQuad:layoutDirection:subregions:", v8, a4, v9);
    v13 = v12;

  }
  else
  {
    v13 = -[CRGroupRegion initWithBoundingQuad:layoutDirection:subregions:]([CRGroupRegion alloc], "initWithBoundingQuad:layoutDirection:subregions:", v8, a4, v9);
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textRegions, 0);
  objc_storeStrong((id *)&self->_tableGroups, 0);
}

@end
