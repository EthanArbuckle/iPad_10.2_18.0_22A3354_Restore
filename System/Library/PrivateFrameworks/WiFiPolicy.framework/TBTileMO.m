@implementation TBTileMO

+ (id)entityName
{
  return CFSTR("Tile");
}

+ (id)generateNewTileObjectFromMOC:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v4 = (void *)MEMORY[0x1D17AC818]();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__TBTileMO_generateNewTileObjectFromMOC___block_invoke;
  v8[3] = &unk_1E881D6A8;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v5, "performBlockAndWait:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  objc_autoreleasePoolPop(v4);

  return v6;
}

void __41__TBTileMO_generateNewTileObjectFromMOC___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0C97B20];
  +[TBTileMO entityName](TBTileMO, "entityName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertNewObjectForEntityForName:inManagedObjectContext:", v6, *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (void)removeTilesUsingPredicate:(id)a3 moc:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17AC818]();
  objc_msgSend(a1, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v6);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v9);
  objc_msgSend(v10, "setResultType:", 2);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __42__TBTileMO_removeTilesUsingPredicate_moc___block_invoke;
  v14[3] = &unk_1E881CF98;
  v11 = v7;
  v15 = v11;
  v16 = v10;
  v13 = v6;
  v17 = v13;
  v12 = v10;
  objc_msgSend(v11, "performBlockAndWait:", v14);

  objc_autoreleasePoolPop(v8);
}

void __42__TBTileMO_removeTilesUsingPredicate_moc___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v2 = (void *)MEMORY[0x1D17AC818]();
  v3 = (void *)a1[4];
  v4 = a1[5];
  v9 = 0;
  objc_msgSend(v3, "executeRequest:error:", v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  objc_msgSend(v5, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  NSLog(CFSTR("%s: Removed %lu tiles that match supplied predicate <%@>"), "+[TBTileMO removeTilesUsingPredicate:moc:]_block_invoke", v8, a1[6]);
  objc_autoreleasePoolPop(v2);
}

+ (void)removeAllTilesInMOC:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a3;
  v4 = (void *)MEMORY[0x1D17AC818]();
  v5 = objc_alloc(MEMORY[0x1E0C97A90]);
  +[TBTileMO fetchRequest](TBTileMO, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFetchRequest:", v6);

  objc_msgSend(v7, "setResultType:", 2);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __32__TBTileMO_removeAllTilesInMOC___block_invoke;
  v10[3] = &unk_1E881C8C0;
  v9 = v3;
  v11 = v9;
  v12 = v7;
  v8 = v7;
  objc_msgSend(v9, "performBlockAndWait:", v10);

  objc_autoreleasePoolPop(v4);
}

void __32__TBTileMO_removeAllTilesInMOC___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v2 = (void *)MEMORY[0x1D17AC818]();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v10 = 0;
  objc_msgSend(v3, "executeRequest:error:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = v6;
  if (v6)
  {
    NSLog(CFSTR("%s: error %@"), "+[TBTileMO removeAllTilesInMOC:]_block_invoke", v6);
  }
  else
  {
    objc_msgSend(v5, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    NSLog(CFSTR("%s: Removed %lu tiles"), "+[TBTileMO removeAllTilesInMOC:]_block_invoke", v9);
  }

  objc_autoreleasePoolPop(v2);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Tile"));
}

@end
