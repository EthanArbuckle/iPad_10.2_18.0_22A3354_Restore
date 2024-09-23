@implementation PXPeopleNamingUtilities

+ (id)itemsForSearchString:(id)a3 person:(id)a4 face:(id)a5
{
  id v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  PXPeopleNamePickerItem *v32;
  id v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[3];
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  id v74;
  _QWORD v75[3];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (unint64_t)a4;
  v11 = (unint64_t)a5;
  if (!(v10 | v11))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleNamingUtilities.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person || face"));

  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = v13;
  v14 = objc_msgSend(v13, "length");
  if (v10)
    v15 = (void *)v10;
  else
    v15 = (void *)v11;
  objc_msgSend(v15, "photoLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "librarySpecificFetchOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("verifiedType = %d"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPredicate:", v18);

  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setIncludedDetectionTypes:", v19);

  v54 = v17;
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v57 = v9;
  v58 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v55 = (void *)v11;
  v56 = (void *)v10;
  if (v10)
  {
    v21 = objc_msgSend((id)v10, "detectionType");
    v22 = (void *)v10;
  }
  else
  {
    v21 = objc_msgSend((id)v11, "detectionType");
    v22 = (void *)v11;
  }
  v53 = objc_msgSend(v22, "px_isHuman");
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v23 = v20;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v67 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        if (objc_msgSend(v28, "detectionType") == v21)
        {
          objc_msgSend(v28, "personUri");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v28, "name");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "px_hasStringIgnoringCaseAndDiacritics:", v60);

            if (v31)
            {
              v32 = -[PXPeopleNamePickerItem initWithPerson:searchPrefix:]([PXPeopleNamePickerItem alloc], "initWithPerson:searchPrefix:", v28, v60);
              objc_msgSend(v59, "addObject:", v32);
              if (v29)
                objc_msgSend(v58, "addObject:", v29);

            }
          }

        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    }
    while (v25);
  }

  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = v53;
  if (!v14)
    v34 = 0;
  if (v34 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *MEMORY[0x1E0C966A8];
    v75[0] = v35;
    v75[1] = v36;
    v75[2] = *MEMORY[0x1E0C967C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", v37);
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingName:", v60);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setPredicate:", v39);

    objc_msgSend(v38, "setSortOrder:", 1);
    +[PXPeopleUtilities sharedContactStore](PXPeopleUtilities, "sharedContactStore");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0;
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __60__PXPeopleNamingUtilities_itemsForSearchString_person_face___block_invoke;
    v61[3] = &unk_1E51188D0;
    v62 = v58;
    v63 = v60;
    v64 = v33;
    objc_msgSend(v40, "enumerateContactsWithFetchRequest:error:usingBlock:", v38, &v65, v61);
    v41 = v65;

    if (v41)
    {
      PLUIGetLog();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v72 = "+[PXPeopleNamingUtilities itemsForSearchString:person:face:]";
        v73 = 2112;
        v74 = v41;
        _os_log_impl(&dword_1A6789000, v42, OS_LOG_TYPE_ERROR, "%s: Error while fetching contacts: %@", buf, 0x16u);
      }

    }
  }
  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("highlightRangeLocation"), 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v44;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("title.string"), 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v45;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("person.localIdentifier"), 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 3);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "sortedArrayUsingDescriptors:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "sortedArrayUsingDescriptors:", v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addObjectsFromArray:", v48);
  objc_msgSend(v43, "addObjectsFromArray:", v49);
  v50 = (void *)objc_msgSend(v43, "copy");

  return v50;
}

void __60__PXPeopleNamingUtilities_itemsForSearchString_person_face___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  PXPeopleNamePickerItem *v6;
  id v7;

  v7 = a2;
  v3 = objc_msgSend(v7, "contactType");
  v4 = v7;
  if (!v3)
  {
    objc_msgSend(v7, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5) & 1) == 0)
    {
      v6 = -[PXPeopleNamePickerItem initWithContact:searchPrefix:]([PXPeopleNamePickerItem alloc], "initWithContact:searchPrefix:", v7, *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);

    }
    v4 = v7;
  }

}

@end
