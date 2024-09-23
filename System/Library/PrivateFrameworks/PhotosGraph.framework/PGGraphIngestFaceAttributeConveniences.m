@implementation PGGraphIngestFaceAttributeConveniences

+ (id)sampledAssetsWithSingleFaceForPersonLocalIdentifier:(id)a3 photoLibrary:(id)a4 numberOfYearsBack:(unint64_t)a5 sampleSize:(unint64_t)a6 fetchPropertySets:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v50;
  void *v51;
  id v52;
  unint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _QWORD v67[2];
  _QWORD v68[2];
  id v69;
  uint8_t buf[4];
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (v12)
  {
    objc_msgSend(v13, "librarySpecificFetchOptions");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject setFetchLimit:](v15, "setFetchLimit:", 1);
    v16 = (void *)MEMORY[0x1E0CD16C0];
    v69 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fetchPersonsWithLocalIdentifiers:options:", v17, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = v18;
    objc_msgSend(v18, "firstObject");
    v61 = objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      v53 = a6;
      v59 = v12;
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)a5 * -31557600.0);
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.@count == 1"), CFSTR("detectedFaces"));
      v20 = objc_claimAutoreleasedReturnValue();
      v57 = v19;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("dateCreated"), v19);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)v20;
      v68[0] = v20;
      v68[1] = v55;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "librarySpecificFetchOptions");
      v22 = v14;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setFetchLimit:", 3000);
      objc_msgSend(v23, "setIncludeGuestAssets:", 1);
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v24;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v67[1] = v25;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setSortDescriptors:", v26);

      v54 = (void *)v21;
      objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setInternalPredicate:", v27);

      if (v22)
        objc_msgSend(v23, "setFetchPropertySets:", v22);
      v58 = v22;
      v28 = (void *)v61;
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsForPerson:options:", v61, v23);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "count") <= v53)
      {
        v45 = v60;
      }
      else
      {
        v52 = v13;
        v30 = objc_alloc_init(MEMORY[0x1E0D71AA8]);
        objc_msgSend(v30, "setNumberOfClusters:", v53);
        objc_msgSend(v29, "fetchedObjects");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v30;
        objc_msgSend(v30, "performWithDataset:progressBlock:", v31, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v53);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v34 = v32;
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v63;
          do
          {
            for (i = 0; i != v36; ++i)
            {
              if (*(_QWORD *)v63 != v37)
                objc_enumerationMutation(v34);
              objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "objects");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "firstObject");
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              if (v40)
                objc_msgSend(v33, "addObject:", v40);

            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
          }
          while (v36);
        }

        v41 = objc_alloc(MEMORY[0x1E0CD1620]);
        objc_msgSend(v29, "fetchType");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "fetchPropertySets");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v52;
        v44 = objc_msgSend(v41, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v33, v52, v42, v43, 0, 0);

        v29 = (void *)v44;
        v45 = v60;
        v28 = (void *)v61;
      }

      v14 = v58;
      v12 = v59;
      v48 = v57;
    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "loggingConnection");
      v48 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v71 = v12;
        _os_log_error_impl(&dword_1CA237000, v48, OS_LOG_TYPE_ERROR, "No person found for local identifier %@", buf, 0xCu);
      }
      v29 = 0;
      v45 = v60;
      v28 = 0;
    }

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "loggingConnection");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v71 = v50;
      _os_log_error_impl(&dword_1CA237000, v15, OS_LOG_TYPE_ERROR, "Nil person identifier incorrectly passed into '%@'. Exiting early.", buf, 0xCu);

    }
    v29 = 0;
  }

  return v29;
}

@end
