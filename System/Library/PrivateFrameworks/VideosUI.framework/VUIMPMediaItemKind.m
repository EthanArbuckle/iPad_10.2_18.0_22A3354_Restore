@implementation VUIMPMediaItemKind

void __VUIMPMediaItemKind_block_invoke()
{
  VUIMediaEntityKind *v0;
  objc_class *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v0 = [VUIMediaEntityKind alloc];
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[VUIMediaEntityKind initWithMediaEntityClassName:](v0, "initWithMediaEntityClassName:", v2);
  v4 = (void *)VUIMPMediaItemKind_entityKind;
  VUIMPMediaItemKind_entityKind = v3;

  VUIMediaItemPropertyDescriptors();
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  VUIUpdateMPMediaEntityPropertyDescriptors(v41);
  objc_msgSend(v41, "objectForKey:", CFSTR("isPlayable"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CC1FA0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CC1E80], *MEMORY[0x1E0CC1EB0], *MEMORY[0x1E0CC1FA0], *MEMORY[0x1E0CC1E58], *MEMORY[0x1E0CC1EA8], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setSourcePropertyNames:", v6);

  objc_msgSend(v40, "setSourceFilterBlock:", &__block_literal_global_5_4);
  objc_msgSend(v41, "objectForKey:", CFSTR("duration"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CC1EE0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setSourcePropertyNames:", v7);

  objc_msgSend(v41, "objectForKey:", CFSTR("previewFrameImageIdentifier"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CC1ED0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setSourcePropertyNames:", v8);

  objc_msgSend(v41, "objectForKey:", CFSTR("storeID"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setSourcePropertyNames:", v9);

  objc_msgSend(v37, "setSourceSupportsFiltering:", 1);
  objc_msgSend(v41, "objectForKey:", CFSTR("purchaseHistoryID"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CC1EF0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setSourcePropertyNames:", v10);

  objc_msgSend(v41, "objectForKey:", CFSTR("extrasURL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CC1F90]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSourcePropertyNames:", v12);

  objc_msgSend(v11, "setSourceSupportsFiltering:", 1);
  objc_msgSend(v41, "objectForKey:", CFSTR("seasonTitle"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CC1F38]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setSourcePropertyNames:", v13);

  objc_msgSend(v41, "objectForKey:", CFSTR("seasonIdentifier"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  VUIUpdateMPSeasonMediaCollectionIdentifierPropertyDescriptor(v34);
  objc_msgSend(v41, "objectForKey:", CFSTR("episodeNumber"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CC1DF8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setSourcePropertyNames:", v14);

  objc_msgSend(v41, "objectForKey:", CFSTR("studio"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0CC1EC8];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CC1EC8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSourcePropertyNames:", v17);

  objc_msgSend(v41, "objectForKey:", CFSTR("credits"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSourcePropertyNames:", v19);

  objc_msgSend(v41, "objectForKey:", CFSTR("rentalExpirationDate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x1E0CC1F18];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CC1F28], *MEMORY[0x1E0CC1F08], *MEMORY[0x1E0CC1F20], *MEMORY[0x1E0CC1F18], 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSourcePropertyNames:", v22);

  objc_msgSend(v41, "objectForKey:", CFSTR("rentalPlaybackDuration"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setSourcePropertyNames:", v24);

  objc_msgSend(v23, "setSourceSupportsFiltering:", 1);
  objc_msgSend(v41, "objectForKey:", CFSTR("hasBeenPlayed"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CC1E40]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSourcePropertyNames:", v26);

  objc_msgSend(v25, "setSourceSupportsFiltering:", 1);
  objc_msgSend(v41, "objectForKey:", CFSTR("playCount"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CC1ED8]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setSourcePropertyNames:", v28);

  objc_msgSend(v27, "setSourceSupportsFiltering:", 1);
  objc_msgSend(v41, "objectForKey:", CFSTR("bookmark"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CC1DB8]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSourcePropertyNames:", v30);

  v31 = (void *)VUIMPMediaItemKind_entityKind;
  objc_msgSend(v41, "allValues");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setPropertyDescriptors:", v32);

}

uint64_t __VUIMPMediaItemKind_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  uint64_t v6;

  v5 = (void *)MEMORY[0x1E0CC2428];
  v6 = objc_msgSend(a4, "BOOLValue");
  return objc_msgSend(v5, "vui_isPlayablePredicate:comparison:", v6, objc_msgSend(MEMORY[0x1E0CC2430], "vui_mediaPropertyPredicateComparisonWithPredicateOperatorType:", a3));
}

@end
