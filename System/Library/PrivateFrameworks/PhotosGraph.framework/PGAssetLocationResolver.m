@implementation PGAssetLocationResolver

+ (id)closestAssetLocationForAsset:(id)a3 inAssetCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  double (**v23)(_QWORD, _QWORD);
  BOOL v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  BOOL v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  _QWORD aBlock[4];
  id v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "clsLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(v6, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "librarySpecificFetchOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setIncludeGuestAssets:", 1);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSortDescriptors:", v13);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v6, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "indexOfObject:", v5);
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = 0;
LABEL_32:

      goto LABEL_33;
    }
    v16 = v15;
    v37 = v11;
    v38 = v6;
    v39 = v5;
    objc_msgSend(v5, "creationDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    v19 = v18;

    v20 = objc_msgSend(v14, "count") - 1;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PGAssetLocationResolver_closestAssetLocationForAsset_inAssetCollection___block_invoke;
    aBlock[3] = &unk_1E842B9C0;
    v36 = v14;
    v21 = v14;
    v42 = v21;
    v43 = v19;
    v22 = _Block_copy(aBlock);
    v23 = (double (**)(_QWORD, _QWORD))v22;
    v24 = v16 < v20;
    v25 = v16 > 0;
    v26 = v16 + 1;
    v27 = v16 - 1;
    v40 = v20;
    if (v16 < 1)
    {
      if (v16 >= v20)
      {
LABEL_29:
        v9 = 0;
LABEL_31:

        v6 = v38;
        v5 = v39;
        v14 = v36;
        v11 = v37;
        goto LABEL_32;
      }
      v28 = 1.79769313e308;
    }
    else
    {
      v28 = (*((double (**)(void *, uint64_t))v22 + 2))(v22, v16 - 1);
      if (v16 >= v20)
      {
        v29 = 1.79769313e308;
LABEL_11:
        while (1)
        {
          v30 = v24 && v25 ? v28 < v29 : !v24;
          v31 = v30 ? v27 : v26;
          objc_msgSend(v21, "objectAtIndexedSubscript:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "clsLocation");
          v33 = objc_claimAutoreleasedReturnValue();
          if (v33)
            break;
          if (v30)
          {
            if (v27-- < 1)
            {
              v25 = 0;
            }
            else
            {
              v28 = v23[2](v23, v27);
              v25 = 1;
            }
          }
          else
          {
            if (v26 >= v40)
            {
              v24 = 0;
            }
            else
            {
              v29 = v23[2](v23, v26 + 1);
              v24 = 1;
            }
            ++v26;
          }

          if (!v24 && !v25)
            goto LABEL_29;
        }
        v9 = (id)v33;

        goto LABEL_31;
      }
    }
    v29 = v23[2](v23, v16 + 1);
    goto LABEL_11;
  }
  v9 = v7;
LABEL_33:

  return v9;
}

+ (id)closestAddressNodeFromMomentNodes:(id)a3 toLocation:(id)a4 withMaximumDistance:(double)a5 allowRemoteLocations:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  PGGraphMomentNodeCollection *v16;
  void *v17;
  void *v18;
  PGGraphMomentNodeCollection *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[8];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[4];

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "coordinate");
    v13 = v12;
    v15 = v14;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    *(double *)&v33[3] = a5;
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__25760;
    v31 = __Block_byref_object_dispose__25761;
    v32 = 0;
    v16 = [PGGraphMomentNodeCollection alloc];
    objc_msgSend(v9, "anyObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "graph");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MAElementCollection initWithSet:graph:](v16, "initWithSet:graph:", v9, v18);

    +[PGGraphEdgeCollection edgesFromNodes:](PGGraphAddressEdgeCollection, "edgesFromNodes:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[PGGraphRemoteAddressEdge filter](PGGraphRemoteAddressEdge, "filter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[MAEdgeCollection edgesFromNodes:matchingFilter:](PGGraphEdgeCollection, "edgesFromNodes:matchingFilter:", v19, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "collectionByFormingUnionWith:", v22);
      v23 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v23;
    }
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __113__PGAssetLocationResolver_closestAddressNodeFromMomentNodes_toLocation_withMaximumDistance_allowRemoteLocations___block_invoke;
    v26[3] = &unk_1E842B9E8;
    v26[6] = v13;
    v26[7] = v15;
    v26[4] = v33;
    v26[5] = &v27;
    objc_msgSend(v20, "enumerateEdgesUsingBlock:", v26);
    objc_msgSend((id)v28[5], "targetNode");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(v33, 8);
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

void __113__PGAssetLocationResolver_closestAddressNodeFromMomentNodes_toLocation_withMaximumDistance_allowRemoteLocations___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  double v5;
  uint64_t v6;
  CLLocationCoordinate2D v7;

  v4 = a2;
  objc_msgSend(v4, "photoCoordinate");
  if (CLLocationCoordinate2DIsValid(v7))
  {
    CLLocationCoordinate2DGetDistanceFrom();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (v5 < *(double *)(v6 + 24))
    {
      *(double *)(v6 + 24) = v5;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    }
  }

}

double __74__PGAssetLocationResolver_closestAssetLocationForAsset_inAssetCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "creationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;

  v7 = vabdd_f64(*(double *)(a1 + 40), v6);
  return v7;
}

@end
