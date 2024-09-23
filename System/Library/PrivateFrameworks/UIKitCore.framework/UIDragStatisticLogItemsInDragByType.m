@implementation UIDragStatisticLogItemsInDragByType

void ___UIDragStatisticLogItemsInDragByType_block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  unint64_t v4;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  char *v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 40);
  v2 = *(id *)(a1 + 32);
  v3 = v1;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v2;
  v40 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
  if (v40)
  {
    v34 = v3;
    v49 = 0;
    v50 = 0;
    v51 = 0;
    v4 = 0;
    v47 = 0;
    v48 = 0;
    v5 = 0;
    v6 = 0;
    v39 = *(_QWORD *)v64;
    v7 = *MEMORY[0x1E0CEC590];
    v8 = *MEMORY[0x1E0CEC520];
    v9 = *MEMORY[0x1E0CEC618];
    v58 = *MEMORY[0x1E0CEC570];
    v55 = *MEMORY[0x1E0CEC4F0];
    v54 = *MEMORY[0x1E0CEC588];
    v53 = *MEMORY[0x1E0CEC470];
    v52 = *MEMORY[0x1E0CEC5C0];
    v41 = *MEMORY[0x1E0CEC5C8];
    v38 = *MEMORY[0x1E0CEC518];
    v36 = *MEMORY[0x1E0CEC4E8];
    v35 = *MEMORY[0x1E0CEC658];
    v56 = *MEMORY[0x1E0CEC618];
    v57 = *MEMORY[0x1E0CEC520];
    do
    {
      v10 = 0;
      do
      {
        v44 = v6;
        if (*(_QWORD *)v64 != v39)
          objc_enumerationMutation(obj);
        v45 = v5;
        v46 = v4;
        v43 = v10;
        objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * v10), "itemProvider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        objc_msgSend(v11, "registeredTypeIdentifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
        v42 = v11;
        if (v13)
        {
          v14 = v13;
          v15 = 0;
          v16 = *(_QWORD *)v60;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v60 != v16)
                objc_enumerationMutation(v12);
              objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v17), 1);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v18, "conformsToType:", v7) & 1) != 0)
              {
                v19 = 1;
              }
              else if ((objc_msgSend(v18, "conformsToType:", v8) & 1) != 0)
              {
                v19 = 16;
              }
              else if ((objc_msgSend(v18, "conformsToType:", v9) & 1) != 0)
              {
                v19 = 8;
              }
              else if ((objc_msgSend(v18, "conformsToType:", v58) & 1) != 0)
              {
                v19 = 4;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", CFSTR("com.apple.uikit.useractivity"), 1);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = objc_msgSend(v18, "conformsToType:", v20);

                if ((v21 & 1) != 0)
                {
                  v19 = 64;
                  v9 = v56;
                  v8 = v57;
                }
                else
                {
                  v9 = v56;
                  if ((objc_msgSend(v18, "conformsToType:", v55) & 1) != 0)
                  {
                    v19 = 32;
                    v8 = v57;
                  }
                  else
                  {
                    v8 = v57;
                    if ((objc_msgSend(v18, "conformsToType:", v54) & 1) != 0
                      || (objc_msgSend(v18, "conformsToType:", v53) & 1) != 0)
                    {
                      v19 = 32;
                    }
                    else if ((objc_msgSend(v18, "conformsToType:", v52) & 1) != 0
                           || (objc_msgSend(v18, "conformsToType:", v41) & 1) != 0
                           || (objc_msgSend(v18, "conformsToType:", v38) & 1) != 0
                           || (objc_msgSend(v18, "conformsToType:", v36) & 1) != 0
                           || (objc_msgSend(v18, "conformsToType:", v35) & 1) != 0)
                    {
                      v19 = 2;
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithIdentifier:allowUndeclared:", CFSTR("com.apple.uikit.attributedstring"), 1);
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      v23 = objc_msgSend(v18, "conformsToType:", v22);

                      v24 = v23 == 0;
                      v9 = v56;
                      v8 = v57;
                      v19 = 2;
                      if (v24)
                        v19 = 128;
                    }
                  }
                }
              }
              v15 |= v19;

              ++v17;
            }
            while (v14 != v17);
            v25 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
            v14 = v25;
          }
          while (v25);
        }
        else
        {
          v15 = 0;
        }

        v6 = &v44[v15 & 1];
        v47 += (v15 >> 1) & 1;
        v5 = ((v15 >> 2) & 1) + v45;
        v48 += (v15 >> 3) & 1;
        v49 += (v15 >> 4) & 1;
        v50 += (v15 >> 5) & 1;
        v51 += (v15 >> 6) & 1;
        v4 = ((v15 >> 7) & 1) + v46;

        v10 = v43 + 1;
      }
      while (v43 + 1 != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    }
    while (v40);
    v3 = v34;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v34, CFSTR("plainTextType"));
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:forKey:](_UIKitDragAndDropStatistics, "recordUIKitDragAndDropDistributionValue:forKey:", v6, (double)(unint64_t)&v44[v15 & 1]);
    }
    if (v47)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v34, CFSTR("richTextType"));
      v26 = objc_claimAutoreleasedReturnValue();

      +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:forKey:](_UIKitDragAndDropStatistics, "recordUIKitDragAndDropDistributionValue:forKey:", v26, (double)v47);
      v6 = (char *)v26;
      v5 = ((v15 >> 2) & 1) + v45;
    }
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v34, CFSTR("PDFType"));
      v27 = v5;
      v28 = objc_claimAutoreleasedReturnValue();

      +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:forKey:](_UIKitDragAndDropStatistics, "recordUIKitDragAndDropDistributionValue:forKey:", v28, (double)v27);
      v6 = (char *)v28;
    }
    if (v48)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v34, CFSTR("URLType"));
      v29 = objc_claimAutoreleasedReturnValue();

      +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:forKey:](_UIKitDragAndDropStatistics, "recordUIKitDragAndDropDistributionValue:forKey:", v29, (double)v48);
      v6 = (char *)v29;
    }
    if (v49)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v34, CFSTR("imageType"));
      v30 = objc_claimAutoreleasedReturnValue();

      +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:forKey:](_UIKitDragAndDropStatistics, "recordUIKitDragAndDropDistributionValue:forKey:", v30, (double)v49);
      v6 = (char *)v30;
    }
    if (v50)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v34, CFSTR("folderType"));
      v31 = objc_claimAutoreleasedReturnValue();

      +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:forKey:](_UIKitDragAndDropStatistics, "recordUIKitDragAndDropDistributionValue:forKey:", v31, (double)v50);
      v6 = (char *)v31;
    }
    if (v51)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v34, CFSTR("userActivityType"));
      v32 = objc_claimAutoreleasedReturnValue();

      +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:forKey:](_UIKitDragAndDropStatistics, "recordUIKitDragAndDropDistributionValue:forKey:", v32, (double)v51);
      v6 = (char *)v32;
    }
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v34, CFSTR("customType"));
      v33 = objc_claimAutoreleasedReturnValue();

      +[_UIKitDragAndDropStatistics recordUIKitDragAndDropDistributionValue:forKey:](_UIKitDragAndDropStatistics, "recordUIKitDragAndDropDistributionValue:forKey:", v33, (double)v4);
      v6 = (char *)v33;
    }
  }
  else
  {
    v6 = 0;
  }

}

@end
