@implementation PXPeopleWidgetUtilities

+ (id)widgetOrderedMembersFromSortedArray:(id)a3 inSocialGroupPredicate:(id)a4 maximumNumberOfMembersNotInSocialGroupForFront:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  unint64_t v21;
  _QWORD v22[4];

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __133__PXPeopleWidgetUtilities_widgetOrderedMembersFromSortedArray_inSocialGroupPredicate_maximumNumberOfMembersNotInSocialGroupForFront___block_invoke;
  v16[3] = &unk_1E512EFC8;
  v20 = v22;
  v21 = a5;
  v11 = v8;
  v17 = v11;
  v12 = v10;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v16);
  objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v22, 8);
  return v14;
}

+ (id)verifiedPersonsFromMergeCandidatesForPersons:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v27[0] = *MEMORY[0x1E0CD1D60];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFetchPropertySets:", v8);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("verifiedType > %d && type != %d"), 0, -1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPredicate:", v9);

    objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIncludedDetectionTypes:", v10);

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v21 = v3;
    v11 = v3;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (!objc_msgSend(v16, "verifiedType"))
          {
            v17 = (void *)MEMORY[0x1A85CE17C]();
            objc_msgSend(MEMORY[0x1E0CD16C0], "fetchMergeCandidatePersonsForPerson:options:", v16, v7);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v18, "count"))
            {
              objc_msgSend(v4, "removeObject:", v16);
              objc_msgSend(v18, "fetchedObjects");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObjectsFromArray:", v19);

            }
            objc_autoreleasePoolPop(v17);
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

    v3 = v21;
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  }

  return v4;
}

+ (id)localizedTitleStringForWidgetDataSource:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "containsSocialGroups");
  v8 = objc_msgSend(v6, "numberOfMembers");

  if (v8)
  {
    v9 = objc_msgSend(v5, "px_peoplePetsHomeVisibility");
    v10 = v9 & 1;
    v11 = (v9 >> 1) & 1;
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  +[PXPeopleWidgetUtilities localizedTitleStringForHasGroups:hasPeople:hasPets:](PXPeopleWidgetUtilities, "localizedTitleStringForHasGroups:hasPeople:hasPets:", v7, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)localizedTitleStringForHasGroups:(BOOL)a3 hasPeople:(BOOL)a4 hasPets:(BOOL)a5
{
  __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  v5 = &stru_1E5149688;
  v6 = CFSTR("Groups");
  if (!a3)
    v6 = &stru_1E5149688;
  v7 = CFSTR("People");
  if (!a4)
    v7 = &stru_1E5149688;
  v8 = CFSTR("Pets");
  if (!a5)
    v8 = &stru_1E5149688;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXEditorialRelatedPeopleWidgetTitle_%@%@%@"), v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PXEditorialRelatedPeopleWidgetTitle_")) & 1) == 0)
  {
    PXLocalizedStringFromTable(v9, CFSTR("PhotosUICore"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

void __133__PXPeopleWidgetUtilities_widgetOrderedMembersFromSortedArray_inSocialGroupPredicate_maximumNumberOfMembersNotInSocialGroupForFront___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >= *(_QWORD *)(a1 + 64)
    || (v4 = objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", v3), v3 = v5, v4))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  }

}

@end
