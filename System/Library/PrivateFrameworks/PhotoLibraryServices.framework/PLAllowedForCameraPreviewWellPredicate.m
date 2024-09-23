@implementation PLAllowedForCameraPreviewWellPredicate

void ___PLAllowedForCameraPreviewWellPredicate_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid != nil AND addedDate != nil"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLFetchingAlbum predicateForAlbumKind:](PLFetchingAlbum, "predicateForAlbumKind:", 1613);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(trashedState) == %d"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(noindex:(avalanchePickType) = %d) OR (noindex:(avalanchePickType) >= %d AND (((noindex:(avalanchePickType) & %i) == %i) OR ((noindex:(avalanchePickType) & %i) == %i)))"), 0, 8, 8, 8, 16, 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(hidden) == NO"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3528];
  v9[0] = v0;
  v9[1] = v1;
  v9[2] = v2;
  v9[3] = v3;
  v9[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_PLAllowedForCameraPreviewWellPredicate_s_allowedPredicate;
  _PLAllowedForCameraPreviewWellPredicate_s_allowedPredicate = v7;

}

@end
