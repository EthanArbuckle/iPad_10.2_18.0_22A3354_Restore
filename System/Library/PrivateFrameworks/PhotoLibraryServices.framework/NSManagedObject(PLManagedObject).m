@implementation NSManagedObject(PLManagedObject)

- (id)pl_shortDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pl_shortURI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%p> %@"), a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pointerDescription
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@: %p>"), v4, a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)truncatedDescriptionWithPropertyKeys:()PLManagedObject
{
  id v4;
  PLDescriptionBuilder *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  double v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PLDescriptionBuilder initWithObject:style:indent:]([PLDescriptionBuilder alloc], "initWithObject:style:indent:", a1, 3, 0);
  objc_msgSend(a1, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertiesByName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    v24 = a1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_36;
          v18 = objc_msgSend(v13, "isToMany");
          objc_msgSend(a1, "valueForKey:", v12);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v19;
          if (v18)
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu objects"), objc_msgSend(v19, "count"));
          else
            objc_msgSend(v19, "pl_shortDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:
          -[PLDescriptionBuilder appendName:object:](v5, "appendName:object:", v12, v15);
          goto LABEL_35;
        }
        v14 = v13;
        objc_msgSend(a1, "valueForKey:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "attributeType");
        if (v16 > 699)
        {
          if (v16 > 899)
          {
            if (v16 != 900 && v16 != 1000)
            {
              if (v16 != 1800)
                goto LABEL_34;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu objects"), objc_msgSend(v15, "count"));
                v20 = objc_claimAutoreleasedReturnValue();

                v15 = (void *)v20;
                a1 = v24;
              }
            }
            goto LABEL_25;
          }
          if (v16 == 700)
            goto LABEL_25;
          if (v16 != 800)
            goto LABEL_34;
          -[PLDescriptionBuilder appendName:BOOLValue:](v5, "appendName:BOOLValue:", v12, objc_msgSend(v15, "BOOLValue"));
        }
        else
        {
          if (v16 <= 299)
          {
            if (v16 != 100 && v16 != 200)
            {
LABEL_34:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unsupported attribute type %ld"), objc_msgSend(v14, "attributeType"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLDescriptionBuilder appendName:object:](v5, "appendName:object:", v12, v21);

              a1 = v24;
              goto LABEL_35;
            }
LABEL_28:
            -[PLDescriptionBuilder appendName:integerValue:](v5, "appendName:integerValue:", v12, objc_msgSend(v15, "integerValue"));
            goto LABEL_35;
          }
          switch(v16)
          {
            case 300:
              goto LABEL_28;
            case 500:
              objc_msgSend(v15, "doubleValue");
              *(float *)&v17 = v17;
              break;
            case 600:
              objc_msgSend(v15, "floatValue");
              break;
            default:
              goto LABEL_34;
          }
          -[PLDescriptionBuilder appendName:floatValue:](v5, "appendName:floatValue:", v12, v17);
        }
LABEL_35:

LABEL_36:
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

  -[PLDescriptionBuilder build](v5, "build");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

@end
