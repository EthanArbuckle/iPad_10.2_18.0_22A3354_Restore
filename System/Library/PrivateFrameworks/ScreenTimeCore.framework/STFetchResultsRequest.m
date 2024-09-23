@implementation STFetchResultsRequest

+ (id)requestWithFetchRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFetchRequest:", v4);

  return v5;
}

- (STFetchResultsRequest)initWithFetchRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  STFetchResultsRequest *v8;

  v4 = a3;
  objc_msgSend(v4, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[STFetchResultsRequest initWithEntity:predicate:sortDescriptors:](self, "initWithEntity:predicate:sortDescriptors:", v5, v6, v7);
  return v8;
}

- (STFetchResultsRequest)initWithEntity:(id)a3
{
  return -[STFetchResultsRequest initWithEntity:predicate:sortDescriptors:](self, "initWithEntity:predicate:sortDescriptors:", a3, 0, 0);
}

- (STFetchResultsRequest)initWithEntity:(id)a3 predicate:(id)a4
{
  return -[STFetchResultsRequest initWithEntity:predicate:sortDescriptors:](self, "initWithEntity:predicate:sortDescriptors:", a3, a4, 0);
}

- (STFetchResultsRequest)initWithEntity:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  id v8;
  id v9;
  id v10;
  STFetchResultsRequest *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSFetchRequest *fetchRequest;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  objc_super v31;
  void *v32;
  uint8_t buf[24];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)STFetchResultsRequest;
  v11 = -[STFetchResultsRequest init](&v31, sel_init);
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(v8, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchRequestWithEntityName:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    fetchRequest = v11->_fetchRequest;
    v11->_fetchRequest = (NSFetchRequest *)v14;

    -[NSFetchRequest setPredicate:](v11->_fetchRequest, "setPredicate:", v9);
    if (v10)
    {
      -[NSFetchRequest setSortDescriptors:](v11->_fetchRequest, "setSortDescriptors:", v10);
    }
    else
    {
      v25 = 0;
      v26 = &v25;
      v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__9;
      v29 = __Block_byref_object_dispose__9;
      v30 = 0;
      objc_msgSend(v8, "attributesByName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __66__STFetchResultsRequest_initWithEntity_predicate_sortDescriptors___block_invoke;
      v24[3] = &unk_1E9371618;
      v24[4] = &v25;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v24);

      v17 = v26[5];
      if (!v17)
      {
        v18 = MEMORY[0x1E0C81028];
        v19 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v8, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[STFetchResultsRequest initWithEntity:predicate:sortDescriptors:].cold.1(v20, buf);
        }

        v17 = v26[5];
      }
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v17, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSFetchRequest setSortDescriptors:](v11->_fetchRequest, "setSortDescriptors:", v22);

      _Block_object_dispose(&v25, 8);
    }
  }

  return v11;
}

void __66__STFetchResultsRequest_initWithEntity_predicate_sortDescriptors___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v8;
  id v9;

  v9 = a2;
  v8 = objc_msgSend(a3, "attributeType");
  if (v8 > 599)
  {
    if (v8 <= 799)
    {
      if (v8 == 600 || v8 == 700)
        goto LABEL_17;
    }
    else if (v8 == 800 || v8 == 1000 || v8 == 900)
    {
      goto LABEL_17;
    }
  }
  else
  {
    if (v8 > 299)
    {
      if (v8 != 300 && v8 != 400 && v8 != 500)
        goto LABEL_18;
LABEL_17:
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      *a4 = 1;
      goto LABEL_18;
    }
    if (v8 == 100 || v8 == 200)
      goto LABEL_17;
  }
LABEL_18:

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[STFetchResultsRequest fetchRequest](self, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)STFetchResultsRequest;
  -[STFetchResultsRequest description](&v10, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ fetch %@: %@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchRequest, 0);
}

- (void)initWithEntity:(void *)a1 predicate:(uint8_t *)buf sortDescriptors:.cold.1(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1D22E7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "no sort key found for %{pubic}@", buf, 0xCu);

}

@end
