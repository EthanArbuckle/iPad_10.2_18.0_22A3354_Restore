@implementation STRPPropertyListTypeDecoder

- (STRPPropertyListTypeDecoder)initWithDictionary:(id)a3
{
  id v4;
  STRPPropertyListTypeDecoder *v5;
  uint64_t v6;
  NSDictionary *storage;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STRPPropertyListTypeDecoder;
  v5 = -[STRPPropertyListTypeDecoder init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    storage = v5->_storage;
    v5->_storage = (NSDictionary *)v6;

  }
  return v5;
}

+ (id)_supportedCoreTypesForEncoding
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (id)decodeRootObjectOfClass:(Class)a3 fromEncoded:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v13;
  id v14;
  void *v15;

  v9 = a4;
  if ((Class)objc_opt_class() == a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
LABEL_18:
      v10 = v9;
      goto LABEL_19;
    }
  }
  if ((Class)objc_opt_class() != a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if ((Class)objc_opt_class() == a3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_18;
    }
    if ((Class)objc_opt_class() == a3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_18;
    }
    if ((Class)objc_opt_class() == a3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (Class)objc_opt_class() == a3)
    {
      v15 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v9, "doubleValue");
      objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    if ((Class)objc_opt_class() == a3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_18;
    }
    if ((Class)objc_opt_class() == a3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_18;
    }
    if ((Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3)
    {
      if (!a5)
        goto LABEL_35;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Top level array representations are unsupported, a boxing type must be provided."));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[STRPPropertyListTypeDecoder _errorWithCode:message:](self, "_errorWithCode:message:", 1, v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((Class)objc_opt_class() != a3 && (Class)objc_opt_class() != a3)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_storeStrong((id *)&self->_storage, a4);
          v10 = (id)objc_msgSend([a3 alloc], "initWithCoder:", self);
          goto LABEL_19;
        }
        if (a5)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Type must be a dictionary representation of a non-primitive type."));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[STRPPropertyListTypeDecoder _errorWithCode:message:](self, "_errorWithCode:message:", 1, v13);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        }
LABEL_35:
        v11 = 0;
        goto LABEL_20;
      }
      if (!a5)
        goto LABEL_35;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Top level dictionary representations are unsupported, a boxing type must be provided."));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[STRPPropertyListTypeDecoder _errorWithCode:message:](self, "_errorWithCode:message:", 1, v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_34:
    *a5 = v14;

    goto LABEL_35;
  }
  v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v9);
LABEL_19:
  v11 = v10;
LABEL_20:

  return v11;
}

- (BOOL)containsValueForKey:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSDictionary objectForKey:](self->_storage, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_decodeObjectOfClasses:(id)a3 fromObject:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  objc_class *v36;
  id v37;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  char v47;
  id v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  _QWORD v57[5];
  id v58;
  id v59;
  uint64_t *v60;
  _QWORD v61[5];
  id v62;
  id v63;
  uint64_t *v64;
  id v65;
  char v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  char v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[4];
  id v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v78 = 0;
  v79 = &v78;
  v80 = 0x2050000000;
  v81 = 0;
  v8 = MEMORY[0x24BDAC760];
  v75[0] = MEMORY[0x24BDAC760];
  v75[1] = 3221225472;
  v75[2] = __65__STRPPropertyListTypeDecoder__decodeObjectOfClasses_fromObject___block_invoke;
  v75[3] = &unk_251643830;
  v9 = v7;
  v76 = v9;
  v77 = &v78;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v75);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v6, "containsObject:", objc_opt_class())
    && objc_msgSend(v6, "count") == 1)
  {
    v10 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
    v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
    v27 = v11;
    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v6, "containsObject:", objc_opt_class())
    && objc_msgSend(v6, "count") == 1)
  {
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v9);
    goto LABEL_22;
  }
  v12 = v79[3];
  if (!v12)
  {
    v28 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend((id)objc_opt_class(), "_supportedCoreTypesForEncoding");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "minusSet:", v29);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v28, "count"))
    {
      v30 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDictionary:", v9);
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v31 = v28;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v72;
LABEL_27:
        v34 = 0;
        while (1)
        {
          if (*(_QWORD *)v72 != v33)
            objc_enumerationMutation(v31);
          v27 = (void *)objc_msgSend(objc_alloc(*(Class *)(*((_QWORD *)&v71 + 1) + 8 * v34)), "initWithCoder:", v30);
          if (v27)
            goto LABEL_35;
          if (v32 == ++v34)
          {
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
            if (v32)
              goto LABEL_27;
            break;
          }
        }
      }

    }
    v35 = (void *)MEMORY[0x24BDD17C8];
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR("No matching class found from candidates: %@, but found: %@"), v6, v30);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v37 = -[STRPPropertyListTypeDecoder _failWithCode:message:](self, "_failWithCode:message:", 1, v31);
    v27 = 0;
LABEL_35:

    goto LABEL_36;
  }
  if (v12 == objc_opt_class()
    || (v13 = v79[3], v13 == objc_opt_class())
    || (v14 = v79[3], v14 == objc_opt_class())
    || (v15 = v79[3], v15 == objc_opt_class()))
  {
    v11 = v9;
    goto LABEL_22;
  }
  v16 = v79[3];
  if (v16 == objc_opt_class() || (v17 = v79[3], v17 == objc_opt_class()))
  {
    v39 = v9;
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v39, "count"));
    v41 = (void *)objc_msgSend(v6, "mutableCopy");
    v42 = (void *)MEMORY[0x24BDBCF20];
    v43 = objc_opt_class();
    objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "minusSet:", v44);

    if (objc_msgSend(v41, "count") == 1)
    {
      v45 = (id)objc_msgSend(v41, "anyObject");
      objc_msgSend((id)objc_opt_class(), "_supportedCoreTypesForEncoding");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "containsObject:", v45);

      v67 = 0;
      v68 = &v67;
      v69 = 0x2020000000;
      v70 = 0;
      v61[0] = v8;
      v61[1] = 3221225472;
      v61[2] = __65__STRPPropertyListTypeDecoder__decodeObjectOfClasses_fromObject___block_invoke_2;
      v61[3] = &unk_251643858;
      v66 = v47 ^ 1;
      v61[4] = self;
      v62 = v41;
      v64 = &v67;
      v65 = v45;
      v48 = v40;
      v63 = v48;
      objc_msgSend(v39, "enumerateObjectsUsingBlock:", v61);
      if (*((_BYTE *)v68 + 24))
        v27 = 0;
      else
        v27 = (void *)objc_msgSend(v48, "copy");

      _Block_object_dispose(&v67, 8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Ambiguous types for NSArray: %@; we only support single value types in the array, but found more than 1 type."),
        v41);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[STRPPropertyListTypeDecoder _failWithCode:message:](self, "_failWithCode:message:", 0, v49);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v55 = v9;
      v18 = objc_msgSend(v55, "count");
      v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v18);
      v56 = (void *)objc_msgSend(v6, "mutableCopy");
      v53 = (void *)MEMORY[0x24BDBCF20];
      v19 = objc_opt_class();
      v20 = objc_opt_class();
      v21 = objc_opt_class();
      objc_msgSend(v53, "setWithObjects:", v19, v20, v21, objc_opt_class(), 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "minusSet:", v22);

      v23 = (void *)MEMORY[0x24BDBCF20];
      v24 = objc_opt_class();
      objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v56, "count") && (unint64_t)objc_msgSend(v56, "count") < 3)
      {
        if ((objc_msgSend(v56, "intersectsSet:", v25) & 1) != 0)
        {
          v67 = 0;
          v68 = &v67;
          v69 = 0x2020000000;
          v70 = 0;
          v57[0] = v8;
          v57[1] = 3221225472;
          v57[2] = __65__STRPPropertyListTypeDecoder__decodeObjectOfClasses_fromObject___block_invoke_30;
          v57[3] = &unk_251643880;
          v60 = &v67;
          v57[4] = self;
          v58 = v56;
          v50 = v54;
          v59 = v50;
          objc_msgSend(v55, "enumerateKeysAndObjectsUsingBlock:", v57);
          if (*((_BYTE *)v68 + 24))
            v27 = 0;
          else
            v27 = (void *)objc_msgSend(v50, "copy");

          _Block_object_dispose(&v67, 8);
        }
        else
        {
          STRPLogCoding();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
            -[STRPPropertyListTypeDecoder _decodeObjectOfClasses:fromObject:].cold.1((uint64_t)v56, v51);

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Ambiguous key types for NSDictionary: %@; we only support NSString and NSNumber keys."),
            v56);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[STRPPropertyListTypeDecoder _failWithCode:message:](self, "_failWithCode:message:", 0, v52);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Ambiguous value types for NSDictionary: %@; we only support NSString and NSNumber keys and single object or array of object value types."),
          v56);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[STRPPropertyListTypeDecoder _failWithCode:message:](self, "_failWithCode:message:", 0, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v27 = 0;
    }
  }
LABEL_36:

  _Block_object_dispose(&v78, 8);
  return v27;
}

uint64_t __65__STRPPropertyListTypeDecoder__decodeObjectOfClasses_fromObject___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

void __65__STRPPropertyListTypeDecoder__decodeObjectOfClasses_fromObject___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v17 = a2;
  if (*(_BYTE *)(a1 + 72))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      v10 = *(void **)(a1 + 32);
      v11 = (void *)MEMORY[0x24BDD17C8];
      NSStringFromClass(*(Class *)(a1 + 64));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Type mismatch - expected NSDictionary representation of %@, but found: %@ instead."), v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v10, "_failWithCode:message:", 1, v15);

      *a4 = 1;
      goto LABEL_8;
    }
    v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDictionary:", v17);
    objc_msgSend(*(id *)(a1 + 40), "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend((id)objc_msgSend(v7, "alloc"), "initWithCoder:", v6);

  }
  else
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend((id)objc_opt_class(), "_supportedCoreTypesForEncoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_decodeObjectOfClasses:fromObject:", v6, v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);

  }
LABEL_8:

}

void __65__STRPPropertyListTypeDecoder__decodeObjectOfClasses_fromObject___block_invoke_30(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  char v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;

  v34 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      v18 = *(void **)(a1 + 32);
      v19 = (void *)MEMORY[0x24BDD17C8];
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("Type mismatch - expected NSDictionary with String or Number keys; found keys with representation %@ instead."),
        v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (id)objc_msgSend(v18, "_failWithCode:message:", 1, v22);

      *a4 = 1;
      goto LABEL_19;
    }
  }
  v8 = objc_opt_class();
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= 2)
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v8);
  if (!objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v15 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Type mismatch - expected NSDictionary with homogenous key types."));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v15, "_failWithCode:message:", 1, v16);

    *a4 = 1;
    goto LABEL_19;
  }
  v9 = (objc_class *)(id)objc_msgSend(*(id *)(a1 + 40), "anyObject");
  objc_msgSend((id)objc_opt_class(), "_supportedCoreTypesForEncoding");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v9);

  if ((v11 & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDictionary:", v7);
      objc_msgSend(*(id *)(a1 + 40), "anyObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend((id)objc_msgSend(v25, "alloc"), "initWithCoder:", v24);

      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      v27 = *(void **)(a1 + 32);
      v28 = (void *)MEMORY[0x24BDD17C8];
      NSStringFromClass(v9);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", CFSTR("Type mismatch - expected NSDictionary representation of %@, but found: %@ instead."), v29, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (id)objc_msgSend(v27, "_failWithCode:message:", 1, v32);

      *a4 = 1;
      goto LABEL_19;
    }
    v13 = *(void **)(a1 + 32);
    goto LABEL_15;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v13 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
LABEL_15:
    objc_msgSend(*(id *)(a1 + 40), "setByAddingObject:", objc_opt_class());
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_msgSend((id)objc_opt_class(), "_supportedCoreTypesForEncoding");
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_16:
  v24 = (void *)v14;
  objc_msgSend(v13, "_decodeObjectOfClasses:fromObject:", v14, v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  if (v26)
  {
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v26, v34);

  }
LABEL_19:

}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = a4;
  objc_msgSend(v6, "setWithObject:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRPPropertyListTypeDecoder decodeObjectOfClasses:forKey:](self, "decodeObjectOfClasses:forKey:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[NSDictionary objectForKey:](self->_storage, "objectForKey:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[STRPPropertyListTypeDecoder _decodeObjectOfClasses:fromObject:](self, "_decodeObjectOfClasses:fromObject:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)decodeObjectForKey:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Not supported. Must be secure coding compliant. key='%@'"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[STRPPropertyListTypeDecoder _failWithCode:message:](self, "_failWithCode:message:", 3, v4);

  return 0;
}

- (id)decodeTopLevelObjectForKey:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Not supported. key='%@'"), a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STRPPropertyListTypeDecoder _failWithCode:message:](self, "_failWithCode:message:", 3, v5);

  return 0;
}

- (BOOL)decodeBoolForKey:(id)a3
{
  void *v3;
  char v4;

  -[STRPPropertyListTypeDecoder _numberForKey:](self, "_numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (int)decodeIntForKey:(id)a3
{
  void *v3;
  int v4;

  -[STRPPropertyListTypeDecoder _numberForKey:](self, "_numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (int)decodeInt32ForKey:(id)a3
{
  void *v3;
  int v4;

  -[STRPPropertyListTypeDecoder _numberForKey:](self, "_numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  void *v3;
  int64_t v4;

  -[STRPPropertyListTypeDecoder _numberForKey:](self, "_numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longLongValue");

  return v4;
}

- (float)decodeFloatForKey:(id)a3
{
  void *v3;
  float v4;
  float v5;

  -[STRPPropertyListTypeDecoder _numberForKey:](self, "_numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (double)decodeDoubleForKey:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[STRPPropertyListTypeDecoder _numberForKey:](self, "_numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4
{
  id v6;
  void *v7;
  const char *v8;
  NSObject *v9;

  v6 = a3;
  -[NSDictionary objectForKey:](self->_storage, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a4)
      *a4 = objc_msgSend(v7, "length");
    v8 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "bytes");
  }
  else
  {
    STRPLogCoding();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[STRPPropertyListTypeDecoder decodeBytesForKey:returnedLength:].cold.1((uint64_t)v7, (uint64_t)v6, v9);

    v8 = 0;
  }

  return v8;
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  void *v3;
  int64_t v4;

  -[STRPPropertyListTypeDecoder _numberForKey:](self, "_numberForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)decodeArrayOfObjectsOfClass:(Class)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = a4;
  objc_msgSend(v6, "setWithObject:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRPPropertyListTypeDecoder decodeArrayOfObjectsOfClasses:forKey:](self, "decodeArrayOfObjectsOfClasses:forKey:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)decodeArrayOfObjectsOfClasses:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setByAddingObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[STRPPropertyListTypeDecoder decodeObjectOfClasses:forKey:](self, "decodeObjectOfClasses:forKey:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)decodeDictionaryWithKeysOfClass:(Class)a3 objectsOfClass:(Class)a4 forKey:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = a5;
  objc_msgSend(v8, "setWithObject:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRPPropertyListTypeDecoder decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:](self, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v10, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)decodeDictionaryWithKeysOfClasses:(id)a3 objectsOfClasses:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(a4, "mutableCopy");
  objc_msgSend(v10, "unionSet:", v9);

  objc_msgSend(v10, "addObject:", objc_opt_class());
  -[STRPPropertyListTypeDecoder decodeObjectOfClasses:forKey:](self, "decodeObjectOfClasses:forKey:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_numberForKey:(id)a3
{
  NSDictionary *storage;
  id v4;
  void *v5;

  storage = self->_storage;
  v4 = a3;
  -[NSDictionary bs_safeObjectForKey:ofType:](storage, "bs_safeObjectForKey:ofType:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_errorWithCode:(int64_t)a3 message:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1540];
  v11 = *MEMORY[0x24BDBD3A0];
  v12[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("STRPCodingErrorDomain"), a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_failWithCode:(int64_t)a3 message:(id)a4
{
  void *v5;

  -[STRPPropertyListTypeDecoder _errorWithCode:message:](self, "_errorWithCode:message:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STRPPropertyListTypeDecoder failWithError:](self, "failWithError:", v5);

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

- (void)_decodeObjectOfClasses:(uint64_t)a1 fromObject:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
}

- (void)decodeBytesForKey:(NSObject *)a3 returnedLength:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_fault_impl(&dword_245256000, a3, OS_LOG_TYPE_FAULT, "-decodeBytesForKey:returnedLength: called with class %@ for key '%@'.", (uint8_t *)&v7, 0x16u);

}

@end
