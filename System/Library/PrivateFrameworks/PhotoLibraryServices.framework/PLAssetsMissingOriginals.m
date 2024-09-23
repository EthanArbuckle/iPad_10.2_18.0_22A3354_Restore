@implementation PLAssetsMissingOriginals

void __PLAssetsMissingOriginals_block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  _QWORD v27[2];
  _QWORD v28[4];
  _QWORD v29[2];
  _QWORD v30[4];

  v30[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Asset"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kindSubtype != %d && cameraProcessingAdjustmentState == %d && (master == nil OR (SUBQUERY(master.resources, $r, $r.type == %ul AND $r.isLocallyAvailable == YES AND $r.assetUuid == uuid).@count != 0))"), 2, 0, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kindSubtype == %d && cameraProcessingAdjustmentState == %d && (master == nil OR ((SUBQUERY(master.resources, $r, $r.type == %ul AND $r.isLocallyAvailable == YES AND $r.assetUuid == uuid).@count != 0) && (SUBQUERY(master.resources, $r, $r.type == %ul AND $r.isLocallyAvailable == YES AND $r.assetUuid == uuid).@count != 0)))"), 2, 0, 1, 18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset predicateForSpatialOverCaptureAssets](PLManagedAsset, "predicateForSpatialOverCaptureAssets");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kindSubtype == %d && (master == nil OR ((SUBQUERY(master.resources, $r, $r.type == %ul AND $r.isLocallyAvailable == YES AND $r.assetUuid == uuid).@count != 0) && (SUBQUERY(master.resources, $r, $r.type == %ul AND $r.isLocallyAvailable == YES AND $r.assetUuid == uuid).@count != 0)))"), 2, 1, 23);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3528];
  v30[0] = v2;
  v30[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kindSubtype == %d && (master == nil OR ((SUBQUERY(master.resources, $r, $r.type == %ul AND $r.isLocallyAvailable == YES AND $r.assetUuid == uuid).@count != 0) && (SUBQUERY(master.resources, $r, $r.type == %ul AND $r.isLocallyAvailable == YES AND $r.assetUuid == uuid).@count != 0) && (SUBQUERY(master.resources, $r, $r.type == %ul AND $r.isLocallyAvailable == YES AND $r.assetUuid == uuid).@count != 0)))"), 2, 1, 18, 24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3528];
  v29[0] = v5;
  v29[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3528];
  v28[0] = v21;
  v28[1] = v23;
  v28[2] = v22;
  v28[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForAssetsEligibleForCloudKitTransport"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3528];
  v27[0] = v12;
  v27[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPredicate:", v15);

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v16, "executeFetchRequest:error:", v24, &v26);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v26;
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v17;

}

@end
