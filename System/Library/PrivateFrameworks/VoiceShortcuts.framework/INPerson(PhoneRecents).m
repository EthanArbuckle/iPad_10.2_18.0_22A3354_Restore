@implementation INPerson(PhoneRecents)

- (uint64_t)initWithContact:()PhoneRecents handle:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v50;
  id v51;
  void *v52;
  void *v54;
  _QWORD v55[4];
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  id v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v51 = a4;
  objc_msgSend(MEMORY[0x1E0CB3850], "componentsForContact:", v5);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C967C0]))
  {
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v50 = v5;
    objc_msgSend(v5, "phoneNumbers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v62 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          v13 = objc_alloc(MEMORY[0x1E0CBDA60]);
          objc_msgSend(v12, "value");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          INPersonHandleLabelForCNLabeledValue();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v13, "initWithValue:type:label:", v15, 2, v16);

          objc_msgSend(v6, "addObject:", v17);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
      }
      while (v9);
    }

    v5 = v50;
  }
  if (objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C966A8]))
  {
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v18 = v5;
    objc_msgSend(v5, "emailAddresses");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v58 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
          v25 = objc_alloc(MEMORY[0x1E0CBDA60]);
          objc_msgSend(v24, "value");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          INPersonHandleLabelForCNLabeledValue();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(v25, "initWithValue:type:label:", v26, 1, v27);

          objc_msgSend(v6, "addObject:", v28);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      }
      while (v21);
    }

    v5 = v18;
  }
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __49__INPerson_PhoneRecents__initWithContact_handle___block_invoke;
  v55[3] = &unk_1E7AA69F8;
  v29 = v51;
  v56 = v29;
  objc_msgSend(v6, "if_firstObjectPassingTest:", v55);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    v32 = v30;
  }
  else
  {
    objc_msgSend(v6, "firstObject");
    v32 = (id)objc_claimAutoreleasedReturnValue();
  }
  v33 = v32;

  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {

    v6 = 0;
  }
  else
  {
    objc_msgSend(v6, "removeObject:", v33);
  }
  if (objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C966E8]))
  {
    objc_msgSend(v5, "identifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = 0;
  }
  if (!objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C96700])
    || !objc_msgSend(v5, "isKeyAvailable:", *MEMORY[0x1E0C96890])
    || !objc_msgSend(v5, "imageDataAvailable")
    || (v35 = (void *)MEMORY[0x1E0CBD958],
        objc_msgSend(v5, "thumbnailImageData"),
        v36 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v35, "imageWithImageData:", v36),
        v37 = (void *)objc_claimAutoreleasedReturnValue(),
        v36,
        !v37))
  {
    v52 = v33;
    v38 = v29;
    v39 = objc_alloc_init(MEMORY[0x1E0C97450]);
    v40 = (void *)MEMORY[0x1E0C97460];
    objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "screenScale");
    objc_msgSend(v40, "scopeWithPointSize:scale:rightToLeft:style:", 0, 0, 60.0, 60.0, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "avatarImageForContacts:scope:", v44, v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7B70]), "initWithPlatformImage:", v45);
    objc_msgSend(v46, "PNGRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(MEMORY[0x1E0CBD958], "imageWithImageData:", v47);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = 0;
    }

    v29 = v38;
    v33 = v52;
  }
  v48 = objc_msgSend(a1, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:aliases:suggestionType:", v33, v54, 0, v37, v34, 0, v6, 0);

  return v48;
}

@end
