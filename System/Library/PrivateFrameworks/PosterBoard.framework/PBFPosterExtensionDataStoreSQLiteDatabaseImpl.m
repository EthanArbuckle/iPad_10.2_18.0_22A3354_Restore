@implementation PBFPosterExtensionDataStoreSQLiteDatabaseImpl

void __76___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_validateDatabaseWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "stringForKey:", CFSTR("tbl_name"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __76___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_validateDatabaseWithError___block_invoke_210(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "stringForKey:", CFSTR("value"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __77___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_dataStoreMetadataWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v10 = v3;
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = v10;
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v3, "stringForKey:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringForKey:", CFSTR("key"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, v9);

}

void __75___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_roleIdentifiersWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v9 = v3;
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = v9;
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("roleIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

}

void __84___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_extensionIdentifiersForRole_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v9 = v3;
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = v9;
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("providerId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

}

void __93___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_attributeIdentifiersForPoster_roleId_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v9 = v3;
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = v9;
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("attributeIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

}

void __95___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_posterUUIDsForExtensionIdentifier_role_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v3)
  {
    v4 = objc_opt_new();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v10, "objectForKey:", CFSTR("UUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);
  objc_msgSend(v3, "addObject:", v9);

}

void __89___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_extensionIdentifierForPosterUUID_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "stringForKey:", CFSTR("providerId"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __81___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_sortedPosterUUIDsForRole_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v3)
  {
    v4 = objc_opt_new();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v10, "objectForKey:", CFSTR("posterUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);
  objc_msgSend(v3, "addObject:", v9);

}

void __87___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_roleDisplayNamesForIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v10 = v3;
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = v10;
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v3, "stringForKey:", CFSTR("displayName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringForKey:", CFSTR("roleIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, v9);

}

void __88___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_checkIfPosterUUIDs_belongToRole_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "UUIDString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __88___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_checkIfPosterUUIDs_belongToRole_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "stringForKey:", CFSTR("posterUUID"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __82___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_selectedPosterUUIDForRole_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "stringForKey:", CFSTR("posterUUID"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __94___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_attributeForPoster_roleId_attributeId_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "dataForKey:", CFSTR("attributePayload"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __104___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_attributesForPoster_roleId_attributeIdentifiers_error___block_invoke(int a1, id a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%s'"), sqlite3_mprintf("%q", objc_msgSend(objc_retainAutorelease(a2), "UTF8String")));
}

void __104___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_attributesForPoster_roleId_attributeIdentifiers_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "dataForKey:", CFSTR("attributePayload"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("attributeIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v9)
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v5)
    {
      v6 = objc_opt_new();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, v4);
  }

}

uint64_t __79___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_mutateSortOrder_roleId_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __79___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_mutateSortOrder_roleId_error___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  char v14;
  id obj;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v7 = *(void **)(a1[4] + 16);
  v8 = a2;
  objc_msgSend(v7, "prepareStatement:", CFSTR("UPDATE posterRoleMembership SET roleSortKey = :roleSortKey WHERE posterUUID = :posterUUID AND roleId = :roleId;"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = a1[5];
  v16[0] = CFSTR(":roleId");
  v16[1] = CFSTR(":posterUUID");
  objc_msgSend(v8, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17[1] = v10;
  v16[2] = CFSTR(":roleSortKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3 + 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
  obj = 0;
  v14 = objc_msgSend(v9, "executeWithBindings:resultRowHandler:error:", v12, 0, &obj);
  objc_storeStrong(v13, obj);

  if ((v14 & 1) == 0)
    *a4 = 1;

}

@end
