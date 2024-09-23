@implementation NSDiffableDataSourceSnapshot(IC)

- (void)ic_updateWithSectionIdentifiers:()IC
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  id v21;

  v21 = a3;
  objc_msgSend(a1, "sectionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v7, "minusOrderedSet:", v6);
  objc_msgSend(v7, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "deleteSectionsWithIdentifiers:", v8);

  v9 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v9, "minusOrderedSet:", v5);
  objc_msgSend(v9, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appendSectionsWithIdentifiers:", v10);

  objc_msgSend(a1, "sectionIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = 0;
    do
    {
      objc_msgSend(a1, "sectionIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(a1, "indexOfSectionIdentifier:", v15);
      v17 = objc_msgSend(v21, "indexOfObject:", v15);
      if (v16 != v17)
      {
        if (v16 > v17)
        {
          objc_msgSend(v21, "ic_objectAfter:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(a1, "indexOfSectionIdentifier:", v18) != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(a1, "moveSectionWithIdentifier:beforeSectionWithIdentifier:", v15, v18);
        }
        else
        {
          objc_msgSend(v21, "ic_objectBefore:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(a1, "indexOfSectionIdentifier:", v18) != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(a1, "moveSectionWithIdentifier:afterSectionWithIdentifier:", v15, v18);
        }

        --v13;
      }

      ++v13;
      objc_msgSend(a1, "sectionIdentifiers");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

    }
    while (v13 < v20);
  }

}

@end
