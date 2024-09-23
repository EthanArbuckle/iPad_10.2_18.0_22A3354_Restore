@implementation NSManagedObject(MTAdditions)

- (uint64_t)dictionaryRepresentation
{
  return objc_msgSend(a1, "dictionaryRepresentationWithNullAttributeValueProvider:", &__block_literal_global_14);
}

- (id)dictionaryRepresentationWithNullAttributeValueProvider:()MTAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(a1, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributesByName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__NSManagedObject_MTAdditions__dictionaryRepresentationWithNullAttributeValueProvider___block_invoke;
  v13[3] = &unk_1E54D3198;
  v13[4] = a1;
  v15 = v4;
  v8 = v5;
  v14 = v8;
  v9 = v4;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v13);

  v10 = v14;
  v11 = v8;

  return v11;
}

- (id)dictionaryRepresentationWithObjectId
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("objectID"));

  return v2;
}

+ (id)aggregateOperation:()MTAdditions attribute:predicate:managedObjectContext:
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v9 = a5;
  v10 = (void *)MEMORY[0x1E0CB35D0];
  v11 = (void *)MEMORY[0x1E0C99D20];
  v12 = a6;
  v13 = a3;
  objc_msgSend(v10, "expressionForKeyPath:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "expressionForFunction:arguments:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v17, "setName:", CFSTR("result"));
  objc_msgSend(v17, "setExpression:", v16);
  objc_msgSend(v17, "setExpressionResultType:", 300);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(v19, "setPropertiesToFetch:", v18);
  objc_msgSend(v19, "setResultType:", 2);
  if (v9)
    objc_msgSend(v19, "setPredicate:", v9);
  v20 = (void *)MEMORY[0x1E0C97B20];
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "entityForName:inManagedObjectContext:", v22, v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setEntity:", v23);
  objc_msgSend(v12, "executeFetchRequest:error:", v19, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "lastObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKey:", CFSTR("result"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

@end
