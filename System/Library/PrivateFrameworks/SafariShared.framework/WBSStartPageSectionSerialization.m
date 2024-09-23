@implementation WBSStartPageSectionSerialization

id __92__WBSStartPageSectionSerialization_encodeSectionsAsSyncableData_existingSyncableData_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__WBSStartPageSectionSerialization_encodeSectionsAsSyncableData_existingSyncableData_error___block_invoke_2;
  v12[3] = &unk_1E4B3FF00;
  v13 = v4;
  v7 = v4;
  objc_msgSend(v6, "safari_firstObjectPassingTest:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v5, "safari_dictionaryByMergingWithDictionary:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v5;
  }
  v10 = v9;

  return v10;
}

+ (id)decodeSectionsFromData:(id)a3 expectedFormat:(int64_t)a4 allowingFallbackFormats:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  void *v11;
  id v12;
  id v14;

  v7 = a5;
  v10 = a3;
  if (v10)
  {
    v14 = 0;
    objc_msgSend(a1, "decodeSectionsWithData:format:error:", v10, a4, &v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;
    if (!v11 && v7)
    {
      objc_msgSend(a1, "decodeSectionsWithData:format:error:", v10, a4 == 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (a6 && !v11)
      *a6 = objc_retainAutorelease(v12);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)decodeSectionsWithData:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  void *v5;
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Sections"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_96);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3840, 0);
      v5 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedArrayOfObjectsOfClass:fromData:error:", objc_opt_class(), v8, a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)encodeSectionsAsSyncableData:(id)a3 existingSyncableData:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  id (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v7 = a4;
  v8 = a3;
  if (!objc_msgSend(v7, "length"))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 1, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!v9)
    goto LABEL_6;
LABEL_7:
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Sections"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", CFSTR("identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __92__WBSStartPageSectionSerialization_encodeSectionsAsSyncableData_existingSyncableData_error___block_invoke;
  v25[3] = &unk_1E4B3FF28;
  v26 = v10;
  v13 = v10;
  objc_msgSend(v8, "safari_mapObjectsUsingBlock:", v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v12;
  v21 = 3221225472;
  v22 = __92__WBSStartPageSectionSerialization_encodeSectionsAsSyncableData_existingSyncableData_error___block_invoke_3;
  v23 = &unk_1E4B3FF50;
  v24 = v11;
  v15 = v11;
  objc_msgSend(v13, "safari_mapAndFilterObjectsUsingBlock:", &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v16, v20, v21, v22, v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("Sections"));

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v9, 0, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

WBSStartPageSectionDescriptor *__72__WBSStartPageSectionSerialization_decodeSectionsWithData_format_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WBSStartPageSectionDescriptor *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = -[WBSStartPageSectionDescriptor initWithDictionaryRepresentation:]([WBSStartPageSectionDescriptor alloc], "initWithDictionaryRepresentation:", v2);
  else
    v3 = 0;

  return v3;
}

+ (id)encodeSectionsAsLocalData:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, a4);
}

uint64_t __92__WBSStartPageSectionSerialization_encodeSectionsAsSyncableData_existingSyncableData_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "safari_stringForKey:", CFSTR("Identifier"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = WBSIsEqual();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __92__WBSStartPageSectionSerialization_encodeSectionsAsSyncableData_existingSyncableData_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "safari_stringForKey:", CFSTR("Identifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4))
      v5 = 0;
    else
      v5 = v3;
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
