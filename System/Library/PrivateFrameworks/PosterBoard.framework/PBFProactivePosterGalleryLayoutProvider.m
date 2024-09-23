@implementation PBFProactivePosterGalleryLayoutProvider

- (void)fetchGalleryLayoutWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CF8E20], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__PBFProactivePosterGalleryLayoutProvider_fetchGalleryLayoutWithCompletion___block_invoke;
  v6[3] = &unk_1E86F4DA0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "fetchFaceGalleryConfigurationWithCompletion:", v6);

}

void __76__PBFProactivePosterGalleryLayoutProvider_fetchGalleryLayoutWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "posterBoardRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)handlePosterDescriptorsDidChange:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "bs_map:", &__block_literal_global_11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0CF8E20], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __91__PBFProactivePosterGalleryLayoutProvider_handlePosterDescriptorsDidChange_withCompletion___block_invoke_2;
  v18[3] = &unk_1E86F4E08;
  v19 = v6;
  v17 = v6;
  objc_msgSend(v16, "posterBoardDidUpdateDescriptors:completion:", v7, v18);

}

uint64_t __91__PBFProactivePosterGalleryLayoutProvider_handlePosterDescriptorsDidChange_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proactiveRepresentation");
}

uint64_t __91__PBFProactivePosterGalleryLayoutProvider_handlePosterDescriptorsDidChange_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
