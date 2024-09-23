@implementation PGGraphLegacyLocationHelper

- (id)closestLocationNodeFromLocationNode:(id)a3 withDimension:(unint64_t)a4 remapMatchingDimensionBlock:(id)a5
{
  return -[PGGraphLegacyLocationHelper _closestLocationNodeFromLocationNode:withDimension:remapMatchingDimensionBlock:reverse:](self, "_closestLocationNodeFromLocationNode:withDimension:remapMatchingDimensionBlock:reverse:", a3, a4, a5, 0);
}

- (id)closestLocationNodeFromLocationNode:(id)a3 withDimension:(unint64_t)a4 reverse:(BOOL)a5
{
  return -[PGGraphLegacyLocationHelper _closestLocationNodeFromLocationNode:withDimension:remapMatchingDimensionBlock:reverse:](self, "_closestLocationNodeFromLocationNode:withDimension:remapMatchingDimensionBlock:reverse:", a3, a4, 0, a5);
}

- (id)locationNodeWithDimension:(unint64_t)a3 rootNode:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;

  v5 = a4;
  v6 = v5;
  if (a3 == 1)
  {
    objc_msgSend(v5, "locationNodeCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addressNodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "areaNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v13 = v9;
    objc_msgSend(v9, "anyNode");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  +[PGCommonTitleUtility locationLabelForDimension:](PGCommonTitleUtility, "locationLabelForDimension:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", v7);

    if (!v11)
    {
      objc_msgSend(v6, "locationNodeCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "nearestDeepParentLocationNodesWithLabel:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v12 = v6;
  }
  else
  {
    v12 = 0;
  }
LABEL_9:

  return v12;
}

- (id)_closestLocationNodeFromLocationNode:(id)a3 withDimension:(unint64_t)a4 remapMatchingDimensionBlock:(id)a5 reverse:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  uint64_t (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  int v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  BOOL v21;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  v12 = (uint64_t (**)(_QWORD, _QWORD))v11;
  if (v11)
    a4 = (*((uint64_t (**)(id, unint64_t))v11 + 2))(v11, a4);
  +[PGCommonTitleUtility locationLabelForDimension:](PGCommonTitleUtility, "locationLabelForDimension:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "label");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if (v15)
    v16 = v10;
  else
    v16 = 0;
  if (v6)
    v17 = 4;
  else
    v17 = 9;
  if (!v16 && a4)
  {
    if (v6)
      v18 = -1;
    else
      v18 = 1;
    while (1)
    {
      if (v6)
        v19 = a4 >= v17;
      else
        v19 = a4 <= v17;
      if (!v19)
      {
LABEL_25:
        v16 = 0;
        goto LABEL_27;
      }
      -[PGGraphLegacyLocationHelper locationNodeWithDimension:rootNode:](self, "locationNodeWithDimension:rootNode:", a4, v10);
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
        break;
      a4 += v18;
      if (v12)
      {
        v21 = a4 > v17;
        if (v6)
          v21 = a4 < v17;
        if (!v21)
          a4 = v12[2](v12, a4);
      }
      if (!a4)
        goto LABEL_25;
    }
    v16 = (id)v20;
  }
LABEL_27:

  return v16;
}

- (id)relevantLocationNodesForMomentNodes:(id)a3 applyDensestCloseLocationNode:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  PGGraphMomentNodeCollection *v9;
  void *v10;
  void *v11;
  PGIncompleteLocationResolver *v12;
  PGLocationsResolver *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v29;
  void *v30;
  PGLocationsResolver *v31;
  PGIncompleteLocationResolver *v32;
  void *v33;
  PGGraphMomentNodeCollection *v34;
  void *v35;
  id v36;
  PGLocationsFilterer *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "graph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = -[MAElementCollection initWithArray:graph:]([PGGraphMomentNodeCollection alloc], "initWithArray:graph:", v6, v8);
    -[PGGraphMomentNodeCollection addressNodes](v9, "addressNodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "temporarySet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      v12 = -[PGIncompleteLocationResolver initWithAddressNodes:locationHelper:]([PGIncompleteLocationResolver alloc], "initWithAddressNodes:locationHelper:", v11, self);
      v13 = -[PGLocationsResolver initWithSortedMomentNodes:incompleteLocationResolver:locationHelper:]([PGLocationsResolver alloc], "initWithSortedMomentNodes:incompleteLocationResolver:locationHelper:", v6, v12, self);
      -[PGLocationsResolver resolvedMomentNodes](v13, "resolvedMomentNodes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGLocationsResolver resolvedLocationNodes](v13, "resolvedLocationNodes");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[PGLocationsFilterer initWithSortedMomentNodes:locationNodes:incompleteLocationResolver:]([PGLocationsFilterer alloc], "initWithSortedMomentNodes:locationNodes:incompleteLocationResolver:", v14, v38, v12);
      -[PGLocationsFilterer filteredLocationNodes](v37, "filteredLocationNodes");
      v15 = objc_claimAutoreleasedReturnValue();
      if (a4)
      {
        v30 = v14;
        v31 = v13;
        v32 = v12;
        v33 = v11;
        v34 = v9;
        v35 = v8;
        v36 = v6;
        v16 = (void *)v15;
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v29 = v16;
        v18 = v16;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v40;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v40 != v21)
                objc_enumerationMutation(v18);
              v23 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
              -[PGGraphLegacyLocationHelper densestCloseLocationNodeFromLocationNode:withDateInterval:locationMask:](self, "densestCloseLocationNodeFromLocationNode:withDateInterval:locationMask:", v23, 0, -1, v29);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (v24)
              {
                objc_msgSend(v17, "addObject:", v24);
              }
              else
              {
                +[PGLogging sharedLogging](PGLogging, "sharedLogging");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "loggingConnection");
                v26 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v44 = v23;
                  _os_log_error_impl(&dword_1CA237000, v26, OS_LOG_TYPE_ERROR, "No densestLocationNode for locationNode %@", buf, 0xCu);
                }

              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
          }
          while (v20);
        }

        v8 = v35;
        v6 = v36;
        v11 = v33;
        v9 = v34;
        v13 = v31;
        v12 = v32;
        v27 = v29;
        v14 = v30;
      }
      else
      {
        v27 = (void *)v15;
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)relevantAddressNodesForMomentNodes:(id)a3 applyDensestCloseLocationNode:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  uint64_t j;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  __int128 v44;
  id v45;
  id obj;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  void *v71;
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v4 = a4;
  v76 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v67 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(v11, "bestAddressNode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v51, "addObject:", v12);
        objc_msgSend(v11, "collection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addressNodes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "temporarySet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "unionSet:", v15);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    }
    while (v8);
  }

  -[PGGraphLegacyLocationHelper relevantLocationNodesForMomentNodes:applyDensestCloseLocationNode:](self, "relevantLocationNodesForMomentNodes:applyDensestCloseLocationNode:", obj, v4);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
  if (v49)
  {
    v48 = *(_QWORD *)v63;
    *(_QWORD *)&v16 = 138412290;
    v44 = v16;
    do
    {
      for (j = 0; j != v49; j = v40 + 1)
      {
        if (*(_QWORD *)v63 != v48)
          objc_enumerationMutation(v45);
        v52 = j;
        v18 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v19 = v51;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v59;
          while (2)
          {
            for (k = 0; k != v21; ++k)
            {
              if (*(_QWORD *)v59 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * k);
              objc_msgSend(v24, "collection", v44);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "label");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "nearestDeepParentLocationNodesWithLabel:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "anyNode");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28 == v18)
              {
                objc_msgSend(v47, "addObject:", v24);

                goto LABEL_36;
              }

            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v73, 16);
            if (v21)
              continue;
            break;
          }
        }

        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v53 = v50;
        v29 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v54, v72, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v55;
          while (2)
          {
            for (m = 0; m != v30; ++m)
            {
              if (*(_QWORD *)v55 != v31)
                objc_enumerationMutation(v53);
              v33 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * m);
              if ((objc_msgSend(v19, "containsObject:", v33, v44) & 1) == 0)
              {
                objc_msgSend(v33, "collection");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "label");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "nearestDeepParentLocationNodesWithLabel:", v35);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "anyNode");
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                if (v37 == v18)
                {
                  objc_msgSend(v47, "addObject:", v33);

                  v40 = v52;
                  v19 = v53;
                  goto LABEL_41;
                }

              }
            }
            v30 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v54, v72, 16);
            if (v30)
              continue;
            break;
          }
        }

        objc_msgSend(v18, "locationNodeCollection");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addressNodes");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "anyNode");
        v19 = (id)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v47, "addObject:", v19);
LABEL_36:
          v40 = v52;
        }
        else
        {
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "loggingConnection");
          v42 = objc_claimAutoreleasedReturnValue();

          v40 = v52;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v44;
            v71 = v18;
            _os_log_error_impl(&dword_1CA237000, v42, OS_LOG_TYPE_ERROR, "No address node from location node: %@", buf, 0xCu);
          }

          v19 = 0;
        }
LABEL_41:

      }
      v49 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    }
    while (v49);
  }

  return v47;
}

- (BOOL)locationIsInSupersetCategoryForLocationNode:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  BOOL v14;
  _QWORD v16[5];
  id v17;
  _BYTE *v18;
  unint64_t v19;
  _BYTE buf[24];
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PGCommonTitleUtility dimensionForLabel:](PGCommonTitleUtility, "dimensionForLabel:", v5);

  objc_msgSend(v4, "graph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  switch(v6)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "loggingConnection");
      v10 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[PGGraphLegacyLocationHelper locationIsInSupersetCategoryForLocationNode:]";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v6;
        _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "%s called with unsupported dimension %lu", buf, 0x16u);
      }

      goto LABEL_5;
    case 6uLL:
      objc_msgSend(v7, "supersetCityNodes");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 7uLL:
      objc_msgSend(v7, "supersetCountyNodes");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 8uLL:
      objc_msgSend(v7, "supersetStateNodes");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 9uLL:
      objc_msgSend(v7, "supersetCountryNodes");
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v11 = (void *)v12;
      break;
    default:
LABEL_5:
      v11 = 0;
      break;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v21 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__PGGraphLegacyLocationHelper_locationIsInSupersetCategoryForLocationNode___block_invoke;
  v16[3] = &unk_1E842C630;
  v18 = buf;
  v19 = v6;
  v16[4] = self;
  v13 = v4;
  v17 = v13;
  objc_msgSend(v11, "enumerateNodesUsingBlock:", v16);
  v14 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v14;
}

- (id)densestCloseLocationNodeFromLocationNode:(id)a3 withDateInterval:(id)a4 locationMask:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  _BOOL4 v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  unint64_t v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v50;
  void *v51;
  id v52;
  id v53;
  unint64_t v54;
  void *v55;
  id v56;
  _QWORD v57[4];
  id v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t *v61;
  double v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[4];
  id v72;
  id v73;
  uint64_t *v74;
  uint64_t *v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t *v78;
  uint64_t v79;
  double *v80;
  uint64_t v81;
  double v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint64_t v89;
  double *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  double *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  _QWORD v101[5];
  id v102;
  id v103;
  id v104;
  id v105;
  _QWORD *v106;
  _QWORD *v107;
  _QWORD *v108;
  _QWORD *v109;
  _QWORD *v110;
  CLLocationDegrees v111;
  CLLocationDegrees v112;
  _QWORD v113[4];
  _QWORD v114[4];
  _QWORD v115[4];
  _QWORD v116[4];
  _QWORD v117[5];
  CLLocationCoordinate2D v118;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Address"));

  if (v11)
  {
    objc_msgSend(v8, "locationNodeCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "parentLocationNodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "anyNode");
    v14 = objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[PGGraphLegacyLocationHelper _validLocationNodeForLocationNode:withLocationMask:](self, "_validLocationNodeForLocationNode:withLocationMask:", v8, a5);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }

    v8 = (id)v14;
  }
  objc_msgSend(v8, "locationNodeCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "parentLocationNodes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "anyNode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v17, "locationNodeCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "parentLocationNodes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "anyNode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[PGGraphLegacyLocationHelper _approximateCoordinateForLocationNode:](self, "_approximateCoordinateForLocationNode:", v8);
      latitude = v118.latitude;
      longitude = v118.longitude;
      v23 = CLLocationCoordinate2DIsValid(v118);
      v24 = v8;
      if (v23)
      {
        v54 = a5;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v117[0] = 0;
        v117[1] = v117;
        v117[2] = 0x2020000000;
        v117[3] = 0;
        v116[0] = 0;
        v116[1] = v116;
        v116[2] = 0x2020000000;
        v116[3] = 0;
        v55 = v20;
        v115[0] = 0;
        v115[1] = v115;
        v115[2] = 0x2020000000;
        v115[3] = 0;
        v114[0] = 0;
        v114[1] = v114;
        v114[2] = 0x2020000000;
        v114[3] = 0;
        v113[0] = 0;
        v113[1] = v113;
        v113[2] = 0x2020000000;
        v113[3] = 0;
        v101[0] = MEMORY[0x1E0C809B0];
        v101[1] = 3221225472;
        v101[2] = __102__PGGraphLegacyLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke;
        v101[3] = &unk_1E842C680;
        v101[4] = self;
        v111 = latitude;
        v112 = longitude;
        v53 = v9;
        v102 = v9;
        v56 = v25;
        v103 = v56;
        v27 = v26;
        v104 = v27;
        v106 = v116;
        v107 = v115;
        v105 = v17;
        v108 = v117;
        v109 = v114;
        v110 = v113;
        objc_msgSend(v20, "enumerateNeighborNodesThroughInEdgesUsingBlock:", v101);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v24, "identifier"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "doubleValue");
        v31 = v30;
        objc_msgSend(v27, "objectForKeyedSubscript:", v28);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "doubleValue");
        v34 = v33;

        v97 = 0;
        v98 = &v97;
        v99 = 0x2020000000;
        v100 = 0;
        v93 = 0;
        v94 = (double *)&v93;
        v95 = 0x2020000000;
        v96 = 0;
        v89 = 0;
        v90 = (double *)&v89;
        v91 = 0x2020000000;
        v92 = 0;
        objc_msgSend(v24, "graph");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = 0;
        v84 = &v83;
        v85 = 0x3032000000;
        v86 = __Block_byref_object_copy__19376;
        v87 = __Block_byref_object_dispose__19377;
        v36 = v24;
        v88 = v36;
        v79 = 0;
        v80 = (double *)&v79;
        v81 = 0x2020000000;
        v82 = v34 * 0.4 + v31 * 0.6;
        v71[0] = MEMORY[0x1E0C809B0];
        v71[1] = 3221225472;
        v71[2] = __102__PGGraphLegacyLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_162;
        v71[3] = &unk_1E842C6A8;
        v37 = v27;
        v72 = v37;
        v74 = &v97;
        v75 = &v93;
        v76 = &v89;
        v77 = &v79;
        v38 = v35;
        v73 = v38;
        v78 = &v83;
        objc_msgSend(v56, "enumerateKeysAndObjectsUsingBlock:", v71);
        v50 = v38;
        v39 = v98[3];
        v40 = 0.0;
        if (v39 >= 2)
          v40 = v90[3] / (double)(v39 - 1);
        v90[3] = v40;
        v67 = 0;
        v68 = &v67;
        v57[0] = MEMORY[0x1E0C809B0];
        v69 = 0x2020000000;
        v70 = 0;
        v63 = 0;
        v64 = &v63;
        v65 = 0x2020000000;
        v66 = 0;
        v57[1] = 3221225472;
        v57[2] = __102__PGGraphLegacyLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_2_164;
        v57[3] = &unk_1E842C6D0;
        v41 = sqrt(v40);
        v52 = v37;
        v58 = v52;
        v59 = &v93;
        v62 = v41;
        v60 = &v63;
        v61 = &v67;
        objc_msgSend(v56, "enumerateKeysAndObjectsUsingBlock:", v57);
        if ((unint64_t)v68[3] <= 1 && (unint64_t)v64[3] < 3)
        {
          if (v80[3] - v94[3] < v41 + v41)
          {
            v45 = v36;
            goto LABEL_13;
          }
          v45 = (id)v84[5];
          v44 = v36;
        }
        else
        {
          objc_msgSend((id)v84[5], "locationNodeCollection", v38);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "parentLocationNodes");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "anyNode");
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          -[PGGraphLegacyLocationHelper _commonNodeForLocationNode:andLocationNode:](self, "_commonNodeForLocationNode:andLocationNode:", v36, v44);
          v45 = (id)objc_claimAutoreleasedReturnValue();

        }
LABEL_13:
        -[PGGraphLegacyLocationHelper _validLocationNodeForLocationNode:withLocationMask:](self, "_validLocationNodeForLocationNode:withLocationMask:", v45, v54, v50);
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = (void *)v46;
        if (v46)
          v48 = (void *)v46;
        else
          v48 = v36;
        v24 = v48;

        _Block_object_dispose(&v63, 8);
        _Block_object_dispose(&v67, 8);

        _Block_object_dispose(&v79, 8);
        _Block_object_dispose(&v83, 8);

        _Block_object_dispose(&v89, 8);
        _Block_object_dispose(&v93, 8);
        _Block_object_dispose(&v97, 8);

        _Block_object_dispose(v113, 8);
        _Block_object_dispose(v114, 8);
        _Block_object_dispose(v115, 8);
        _Block_object_dispose(v116, 8);
        _Block_object_dispose(v117, 8);

        v9 = v53;
        v20 = v55;
      }
    }
    else
    {
      v24 = v8;
    }

    goto LABEL_20;
  }
  v24 = v8;
LABEL_20:

LABEL_21:
  return v24;
}

- (id)commonLocationNodeForRelevantLocationNodes:(id)a3 locationMask:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "count") > 1)
  {
    if (-[PGGraphLegacyLocationHelper _locationNodesRepresentSameCity:](self, "_locationNodesRepresentSameCity:", v6))
    {
      -[PGGraphLegacyLocationHelper _mostVisitedLocationNodeForLocationNodes:](self, "_mostVisitedLocationNodeForLocationNodes:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGGraphLegacyLocationHelper _validLocationNodeForLocationNode:withLocationMask:](self, "_validLocationNodeForLocationNode:withLocationMask:", v8, a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:

      goto LABEL_32;
    }
    objc_msgSend(v6, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "graph");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v6, "count") >= 3)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v10 = v6;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v11)
      {
        v12 = v11;
        v13 = 0;
        v14 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v32 != v14)
              objc_enumerationMutation(v10);
            v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            if (v13)
            {
              -[PGGraphLegacyLocationHelper _commonNodeForLocationNode:andLocationNode:](self, "_commonNodeForLocationNode:andLocationNode:", v13, v16, (_QWORD)v31);
              v17 = objc_claimAutoreleasedReturnValue();

              v13 = (id)v17;
              if (!v17)
                goto LABEL_25;
            }
            else
            {
              v13 = v16;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v12);

        if (v13)
        {
          objc_msgSend(v13, "label");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "isEqualToString:", CFSTR("Country")) & 1) == 0)
          {

LABEL_36:
            -[PGGraphLegacyLocationHelper _validLocationNodeForLocationNode:withLocationMask:](self, "_validLocationNodeForLocationNode:withLocationMask:", v13, a4, (_QWORD)v31);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_34;
          }
          objc_msgSend(v8, "supersetCountryNodes");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "containsNode:", v13);

          if (!v20)
            goto LABEL_36;
        }
      }
      else
      {
LABEL_25:

        v13 = 0;
      }
      goto LABEL_29;
    }
    if (objc_msgSend(v6, "count") != 2)
    {
LABEL_30:
      v7 = 0;
      goto LABEL_31;
    }
    objc_msgSend(v6, "allObjects");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphLegacyLocationHelper _commonNodeForLocationNode:andLocationNode:](self, "_commonNodeForLocationNode:andLocationNode:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "label");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = objc_msgSend(v24, "isEqualToString:", CFSTR("State"));

    if ((_DWORD)v22)
    {
      v25 = v23;
      if (!v25)
        goto LABEL_28;
    }
    else
    {
      objc_msgSend(v23, "locationNodeCollection");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "nearestDeepParentLocationNodesWithLabel:", CFSTR("State"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "anyNode");
      v25 = (id)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
    }
    objc_msgSend(v8, "supersetStateNodes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "containsNode:", v25);

    if (!v29)
    {
      -[PGGraphLegacyLocationHelper _validLocationNodeForLocationNode:withLocationMask:](self, "_validLocationNodeForLocationNode:withLocationMask:", v23, a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_34:
      goto LABEL_31;
    }
    goto LABEL_28;
  }
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

  return v7;
}

- (BOOL)_locationNodesRepresentSameCity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  double v27;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CLLocationCoordinate2D v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;
  CLLocationCoordinate2D v48;
  CLLocationCoordinate2D v49;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v12, "name");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqualToString:", v6))
        {
          LOBYTE(v15) = 0;
          v22 = v7;
          goto LABEL_33;
        }
        objc_msgSend(v12, "label");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("City"));

        if (!v15)
        {
          v22 = v7;
          goto LABEL_34;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (v9)
        continue;
      break;
    }
  }

  v16 = (void *)objc_msgSend(v7, "mutableCopy");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v13 = v7;
  v17 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v37;
    while (2)
    {
      v20 = 0;
      v30 = v18;
      do
      {
        if (*(_QWORD *)v37 != v19)
          objc_enumerationMutation(v13);
        v21 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v20);
        v35.latitude = 0.0;
        v35.longitude = 0.0;
        -[PGGraphLegacyLocationHelper _approximateCoordinateForLocationNode:](self, "_approximateCoordinateForLocationNode:", v21);
        v35 = v48;
        if (!CLLocationCoordinate2DIsValid(v48))
        {
          LOBYTE(v15) = 0;
          goto LABEL_32;
        }
        objc_msgSend(v16, "removeObject:", v21);
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v22 = v16;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v32;
          v29 = v19;
          while (2)
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v32 != v25)
                objc_enumerationMutation(v22);
              -[PGGraphLegacyLocationHelper _approximateCoordinateForLocationNode:](self, "_approximateCoordinateForLocationNode:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j), v29);
              if (CLLocationCoordinate2DIsValid(v49))
              {
                CLLocationCoordinate2DGetDistanceFrom();
                if (v27 <= 50000.0)
                  continue;
              }

              LOBYTE(v15) = 0;
              goto LABEL_33;
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
            v19 = v29;
            if (v24)
              continue;
            break;
          }
        }

        ++v20;
      }
      while (v20 != v30);
      v18 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      LOBYTE(v15) = 1;
      if (v18)
        continue;
      break;
    }
  }
  else
  {
    LOBYTE(v15) = 1;
LABEL_32:
    v22 = v16;
  }
LABEL_33:

LABEL_34:
  return v15;
}

- (id)_mostVisitedLocationNodeForLocationNodes:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = v3;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v10, "locationNodeCollection", v21);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addressNodes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "momentNodes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");

          if (v14 <= v7)
          {
            if (v14 != v7)
              continue;
            objc_msgSend(v10, "UUID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "UUID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "compare:", v17);

            if (v18 != -1)
              continue;
          }
          v15 = v10;

          v4 = v15;
          v7 = v14;
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v6);
    }

    v3 = v21;
  }
  v19 = v4;

  return v19;
}

- (id)_commonNodeForLocationNode:(id)a3 andLocationNode:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v5 = a3;
  v6 = a4;
  if (v5 == v6)
  {
    v23 = v5;
  }
  else
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__19376;
    v37 = __Block_byref_object_dispose__19377;
    v7 = v5;
    v38 = v7;
    objc_msgSend(v7, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Address"));

    if (v9)
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __74__PGGraphLegacyLocationHelper__commonNodeForLocationNode_andLocationNode___block_invoke;
      v32[3] = &unk_1E842FAB8;
      v32[4] = &v33;
      objc_msgSend(v7, "enumerateNeighborNodesThroughOutEdgesUsingBlock:", v32);
    }
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__19376;
    v30 = __Block_byref_object_dispose__19377;
    v10 = v6;
    v31 = v10;
    objc_msgSend(v10, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("Address"));

    if (v12)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __74__PGGraphLegacyLocationHelper__commonNodeForLocationNode_andLocationNode___block_invoke_2;
      v25[3] = &unk_1E842FAB8;
      v25[4] = &v26;
      objc_msgSend(v10, "enumerateNeighborNodesThroughOutEdgesUsingBlock:", v25);
    }
    v13 = (void *)v34[5];
    v14 = (void *)v27[5];
    v15 = v13 == v14;
    if (v13 != v14 && v13 && v14)
    {
      do
      {
        v16 = objc_msgSend(v13, "locationMask");
        if (v16 <= objc_msgSend((id)v27[5], "locationMask"))
        {
          objc_msgSend((id)v34[5], "locationNodeCollection");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "parentLocationNodes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "anyNode");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = v34;
        }
        else
        {
          objc_msgSend((id)v27[5], "locationNodeCollection");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "parentLocationNodes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "anyNode");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = v27;
        }
        v21 = (void *)v20[5];
        v20[5] = v19;

        v13 = (void *)v34[5];
        v22 = (void *)v27[5];
        v15 = v13 == v22;
      }
      while (v13 != v22 && v13 && v22);
    }
    if (v15)
      v23 = v13;
    else
      v23 = 0;
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v33, 8);
  }

  return v23;
}

- (CLLocationCoordinate2D)_approximateCoordinateForLocationNode:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[5];
  CLLocationCoordinate2D result;

  v3 = a3;
  if (objc_msgSend(v3, "domain") != 200)
  {
    v14 = *MEMORY[0x1E0C9E500];
    v15 = *(double *)(MEMORY[0x1E0C9E500] + 8);
LABEL_12:

    goto LABEL_13;
  }
  v4 = objc_msgSend(v3, "locationMask");
  if (v3)
  {
    v5 = v4;
    while (1)
    {
      objc_msgSend(v3, "label");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Address"));

      if ((v7 & 1) != 0)
        break;
      if (v5 < 0x10)
      {
        objc_msgSend(v3, "locationNodeCollection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "parentLocationNodes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "anyNode");
        v13 = objc_claimAutoreleasedReturnValue();

        v3 = (id)v13;
        if (!v13)
          goto LABEL_9;
      }
      else
      {
        v27[0] = 0;
        v27[1] = v27;
        v27[2] = 0x2020000000;
        v27[3] = 0;
        v21 = 0;
        v22 = &v21;
        v23 = 0x3032000000;
        v24 = __Block_byref_object_copy__19376;
        v25 = __Block_byref_object_dispose__19377;
        v26 = 0;
        objc_msgSend(v3, "locationNodeCollection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "childLocationNodes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __69__PGGraphLegacyLocationHelper__approximateCoordinateForLocationNode___block_invoke;
        v20[3] = &unk_1E842A840;
        v20[4] = v27;
        v20[5] = &v21;
        objc_msgSend(v9, "enumerateIdentifiersAsCollectionsWithBlock:", v20);

        v10 = (id)v22[5];
        v5 >>= 1;
        _Block_object_dispose(&v21, 8);

        _Block_object_dispose(v27, 8);
        v3 = v10;
        if (!v10)
          goto LABEL_9;
      }
    }
    objc_msgSend(v3, "coordinate");
    v14 = v16;
    v15 = v17;
    goto LABEL_12;
  }
LABEL_9:
  v14 = *MEMORY[0x1E0C9E500];
  v15 = *(double *)(MEMORY[0x1E0C9E500] + 8);
LABEL_13:
  v18 = v14;
  v19 = v15;
  result.longitude = v19;
  result.latitude = v18;
  return result;
}

- (id)_validLocationNodeForLocationNode:(id)a3 withLocationMask:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  if ((objc_msgSend(v5, "locationMask") & a4) == 0)
  {
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = objc_msgSend(v5, "outEdgesCount");
      if (v7 == 1)
      {
        objc_msgSend(v5, "locationNodeCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "parentLocationNodes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "anyNode");
        v11 = objc_claimAutoreleasedReturnValue();

        v5 = (id)v11;
      }
      else
      {
        if (!v7)
        {
          v12 = 0;
          goto LABEL_9;
        }
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = __Block_byref_object_copy__19376;
        v19 = __Block_byref_object_dispose__19377;
        v20 = 0;
        v14[0] = v6;
        v14[1] = 3221225472;
        v14[2] = __82__PGGraphLegacyLocationHelper__validLocationNodeForLocationNode_withLocationMask___block_invoke;
        v14[3] = &unk_1E842C720;
        v14[4] = &v15;
        objc_msgSend(v5, "enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:", v14);
        v8 = (id)v16[5];

        _Block_object_dispose(&v15, 8);
        v5 = v8;
      }
    }
    while ((objc_msgSend(v5, "locationMask") & a4) == 0);
  }
  v5 = v5;
  v12 = v5;
LABEL_9:

  return v12;
}

- (id)districtNodeFromAddressNode:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "districtNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)cityNodeFromAddressNode:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cityNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)countryNodeFromAddressNode:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "countryNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)countyNodeFromCityNode:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "countyNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __82__PGGraphLegacyLocationHelper__validLocationNodeForLocationNode_withLocationMask___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (objc_msgSend(a2, "domain") == 200)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }

}

void __69__PGGraphLegacyLocationHelper__approximateCoordinateForLocationNode___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "addressNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v6 > *(_QWORD *)(v7 + 24))
  {
    *(_QWORD *)(v7 + 24) = v6;
    objc_msgSend(v11, "anyNode");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

void __74__PGGraphLegacyLocationHelper__commonNodeForLocationNode_andLocationNode___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "domain") == 200)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __74__PGGraphLegacyLocationHelper__commonNodeForLocationNode_andLocationNode___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "domain") == 200)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __102__PGGraphLegacyLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  uint64_t *v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  v14 = 0x2020000000;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __102__PGGraphLegacyLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_2;
  v5[3] = &unk_1E842C658;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v12 = 0;
  v13 = &v12;
  v15 = 0;
  v5[1] = 3221225472;
  v11 = *(_OWORD *)(a1 + 112);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = &v12;
  v10 = *(_OWORD *)(a1 + 72);
  objc_msgSend(v3, "enumerateNeighborNodesThroughInEdgesUsingBlock:", v5);
  if (*(id *)(a1 + 64) == v3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) += v13[3];
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                             + 24);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                              + 24);
  }

  _Block_object_dispose(&v12, 8);
}

void __102__PGGraphLegacyLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_162(uint64_t a1, void *a2, void *a3)
{
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  uint64_t v12;
  double v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a2;
  objc_msgSend(a3, "doubleValue");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  v10 = v19;
  v11 = v9 * 0.4 + v6 * 0.6;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(double *)(v12 + 24);
  *(double *)(v12 + 24) = v13
                        + (v11 - v13) / (double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                          + 24)
                                                              + (v11 - v13)
                                                              * (v11
                                                               - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                           + 24));
  if (v11 >= *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "nodeForIdentifier:", objc_msgSend(v19, "unsignedIntValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    if (v11 == *(double *)(v15 + 24))
    {
      v16 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "locationMask");
      if (objc_msgSend(v14, "locationMask") >= v16)
      {
LABEL_6:

        v10 = v19;
        goto LABEL_7;
      }
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    }
    *(double *)(v15 + 24) = v11;
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v14;
    v14 = v18;
    goto LABEL_6;
  }
LABEL_7:

}

void __102__PGGraphLegacyLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_2_164(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v7 = a2;
  objc_msgSend(a3, "doubleValue");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  v13 = v12 * 0.4 + v9 * 0.6;
  v14 = *(double *)(a1 + 64);
  if (v13 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + v14)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v13 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + v14 * 2.0)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) > 1uLL
      || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= 3uLL)
    {
      *a4 = 1;
    }
  }
}

void __102__PGGraphLegacyLocationHelper_densestCloseLocationNodeFromLocationNode_withDateInterval_locationMask___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  id obj;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CLLocationCoordinate2D v42;
  _BYTE v43[128];
  uint64_t v44;
  CLLocationCoordinate2D v45;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_approximateCoordinateForLocationNode:", v3);
  v42 = v45;
  if (CLLocationCoordinate2DIsValid(v45))
  {
    CLLocationCoordinate2DGetDistanceFrom();
    if (v4 <= 20000.0)
    {
      v5 = 0x1E0CB3000uLL;
      v35 = a1;
      v6 = (void *)MEMORY[0x1E0CB37E8];
      v7 = objc_msgSend(v3, "identifier");
      v8 = v6;
      v9 = a1;
      objc_msgSend(v8, "numberWithUnsignedInteger:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v3, "inEdgesCount");
      v12 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "locationNodeCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addressNodes");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "momentNodes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v12)
      {
        objc_msgSend(v15, "temporarySet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v14 = v17;
        v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        if (v18)
        {
          v19 = v18;
          v32 = v11;
          v33 = v10;
          v34 = v3;
          v20 = 0;
          obj = v14;
          v37 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v39 != v37)
                objc_enumerationMutation(obj);
              v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
              v23 = *(id *)(v9 + 40);
              v24 = v22;
              objc_msgSend(v23, "startDate");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "universalEndDate");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v25, "compare:", v26) == 1)
              {
                v27 = 0;
              }
              else
              {
                objc_msgSend(v23, "endDate");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "universalStartDate");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v28, "compare:", v29) != -1;

                v9 = v35;
              }

              v20 += v27;
            }
            v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
          }
          while (v19);
          v14 = obj;
          v13 = obj;
          v10 = v33;
          v3 = v34;
          v11 = v32;
          v5 = 0x1E0CB3000;
        }
        else
        {
          v20 = 0;
          v13 = v14;
        }
      }
      else
      {
        v20 = objc_msgSend(v15, "count");

      }
      objc_msgSend(*(id *)(v5 + 2024), "numberWithUnsignedInteger:", v11);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v9 + 48), "setObject:forKeyedSubscript:", v30, v10);

      objc_msgSend(*(id *)(v5 + 2024), "numberWithUnsignedInteger:", v20);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v9 + 56), "setObject:forKeyedSubscript:", v31, v10);

      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v9 + 64) + 8) + 24);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v9 + 72) + 8) + 24) += v11;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v9 + 80) + 8) + 24) += v20;

    }
  }

}

void __75__PGGraphLegacyLocationHelper_locationIsInSupersetCategoryForLocationNode___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "closestLocationNodeFromLocationNode:withDimension:reverse:", a2, *(_QWORD *)(a1 + 56), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "isSameNodeAsNode:", *(_QWORD *)(a1 + 40));
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

@end
