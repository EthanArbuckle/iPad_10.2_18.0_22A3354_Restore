@implementation PXAppleMusicCuration

+ (id)curationFromDictionary:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PXAppleMusicCuration *v20;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bestMusicSuggestions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parseAppleMusicAssetsFromJSONArray:photoLibrary:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("musicForYou"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parseAppleMusicAssetsFromJSONArray:photoLibrary:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("musicForLocation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parseAppleMusicAssetsFromJSONArray:photoLibrary:", v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("musicForTime"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parseAppleMusicAssetsFromJSONArray:photoLibrary:", v14, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("musicForPerformer"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parseAppleMusicAssetsFromJSONArray:photoLibrary:", v16, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("musicCurationInfo"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_parseAppleMusicCurationInfoFromJSONDictionary:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[PXAppleMusicCuration initWithBestMusicSuggestions:musicForYou:musicForLocation:musicForTime:musicForPerformer:musicCurationInfo:]([PXAppleMusicCuration alloc], "initWithBestMusicSuggestions:musicForYou:musicForLocation:musicForTime:musicForPerformer:musicCurationInfo:", v9, v11, v13, v15, v17, v19);
  return v20;
}

+ (id)parseAppleMusicAssetsFromJSONArray:(id)a3 photoLibrary:(id)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v11;

  v11 = a4;
  v4 = v11;
  PXMap();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E0C9AA60];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  PXAudioAssetFetchResultWithArray(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_parseAppleMusicCurationInfoFromJSONDictionary:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  PXAppleMusicCurationInfo *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("performerNames"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  v7 = -[PXAppleMusicCurationInfo initWithPerformerNames:]([PXAppleMusicCurationInfo alloc], "initWithPerformerNames:", v6);
  return v7;
}

PXAppleMusicAsset *__82__PXAppleMusicCuration_Creation__parseAppleMusicAssetsFromJSONArray_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PXAppleMusicAsset *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  Float64 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  uint64_t i;
  float v25;
  void *v26;
  void *v27;
  double v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v38;
  PXAppleMusicAsset *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  char v58;
  id v59;
  void *v60;
  uint64_t v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  CMTime v90;
  char v91;
  char v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  CMTime buf;
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("adamID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v61 = a1;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isExplicit"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v5, "BOOLValue");

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("title"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("artist"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("album"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("artworkURLFormat"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("songURLPath"));
    v7 = objc_claimAutoreleasedReturnValue();
    v66 = (void *)v7;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v68 = 0;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("introPreviewPath"));
    v9 = objc_claimAutoreleasedReturnValue();
    v65 = (void *)v9;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v55 = 0;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("contentProvider"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v53)
    {
      PLStoryGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurator) Song JSON is missing contentProvider.", (uint8_t *)&buf, 2u);
      }

    }
    buf = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("duration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "doubleValue");
      CMTimeMakeWithSeconds(&buf, v13, 300);
    }
    v64 = v12;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("arousal"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("valence"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("clearedForPhotosMemoriesExport"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("loudnessMainPeak"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("loudnessMainValue"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("flexMLAnalysis"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("entryPoints"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v60, "count"))
    {
      PXMap();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v42 = 0;
    }
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("videoEvents"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("score"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v16;
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("timeInSeconds"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v15;
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("visualTempo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("value"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v67 = v4;
    v52 = v18;
    v44 = v3;
    if (objc_msgSend(v18, "count"))
    {
      v96 = 0u;
      v95 = 0u;
      v94 = 0u;
      v93 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v94;
        v23 = 0.0;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v94 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * i), "floatValue");
            v23 = v23 + v25;
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
        }
        while (v21);
      }
      else
      {
        v23 = 0.0;
      }

      v27 = (void *)MEMORY[0x1E0CB37E8];
      *(float *)&v28 = v23 / (float)(unint64_t)objc_msgSend(v19, "count");
      objc_msgSend(v27, "numberWithFloat:", v28);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v67;
    }
    else
    {
      v26 = 0;
    }
    v38 = v6;
    v39 = [PXAppleMusicAsset alloc];
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __82__PXAppleMusicCuration_Creation__parseAppleMusicAssetsFromJSONArray_photoLibrary___block_invoke_2;
    v72[3] = &unk_1E51172D8;
    v73 = v4;
    v74 = v71;
    v75 = v70;
    v76 = v6;
    v77 = v69;
    v78 = v68;
    v79 = v55;
    v80 = v53;
    v90 = buf;
    v81 = v50;
    v82 = v49;
    v83 = v26;
    v84 = v47;
    v91 = v58;
    v92 = v43;
    v85 = v45;
    v86 = v40;
    v87 = v41;
    v88 = v42;
    v89 = *(id *)(v61 + 32);
    v29 = v42;
    v62 = v41;
    v59 = v40;
    v30 = v45;
    v48 = v47;
    v46 = v26;
    v31 = v49;
    v51 = v50;
    v54 = v53;
    v56 = v55;
    v32 = v68;
    v33 = v69;
    v34 = v38;
    v35 = v70;
    v36 = v71;
    v8 = -[PXAppleMusicAsset initWithConfiguration:](v39, "initWithConfiguration:", v72);

    v4 = v67;
    v3 = v44;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __82__PXAppleMusicCuration_Creation__parseAppleMusicAssetsFromJSONArray_photoLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "setStoreID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTitle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setArtistName:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "setAlbumTitle:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v3, "setArtworkURLFormat:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v3, "setSongURL:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v3, "setIntroPreviewURL:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v3, "setContentProvider:", *(_QWORD *)(a1 + 88));
  v5 = *(_OWORD *)(a1 + 168);
  v6 = *(_QWORD *)(a1 + 184);
  objc_msgSend(v3, "setDuration:", &v5);
  objc_msgSend(v3, "setEnergy:", *(_QWORD *)(a1 + 96));
  objc_msgSend(v3, "setValence:", *(_QWORD *)(a1 + 104));
  objc_msgSend(v3, "setVisualTempo:", *(_QWORD *)(a1 + 112));
  objc_msgSend(v3, "setLoudnessMainPeak:", *(_QWORD *)(a1 + 120));
  objc_msgSend(v3, "setLoudnessMainValue:", *(_QWORD *)(a1 + 128));
  v4 = *(unsigned __int8 *)(a1 + 192);
  if (*(_BYTE *)(a1 + 193) && *(_QWORD *)(a1 + 80))
    v4 |= 2uLL;
  objc_msgSend(v3, "setFlags:", v4);
  objc_msgSend(v3, "configureCuesWithVideoEventTimestampsInSeconds:videoEventScores:", *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144));
  objc_msgSend(v3, "setEntryPoints:", *(_QWORD *)(a1 + 152));
  objc_msgSend(v3, "setPhotoLibrary:", *(_QWORD *)(a1 + 160));

}

id __82__PXAppleMusicCuration_Creation__parseAppleMusicAssetsFromJSONArray_photoLibrary___block_invoke_46(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("timeInSeconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("gainTimeInSeconds"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("gainValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PXAudioAssetEntryPointMake(v6, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PXAppleMusicCuration)initWithBestMusicSuggestions:(id)a3 musicForYou:(id)a4 musicForLocation:(id)a5 musicForTime:(id)a6 musicForPerformer:(id)a7 musicCurationInfo:(id)a8
{
  id v15;
  id v16;
  id v17;
  PXAppleMusicCuration *v18;
  PXAppleMusicCuration *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PXAppleMusicCuration;
  v18 = -[PXAppleMusicCuration init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_bestMusicSuggestions, a3);
    objc_storeStrong((id *)&v19->_musicForYou, a4);
    objc_storeStrong((id *)&v19->_musicForLocation, a5);
    objc_storeStrong((id *)&v19->_musicForTime, a6);
    objc_storeStrong((id *)&v19->_musicForPerformer, a7);
    objc_storeStrong((id *)&v19->_musicCurationInfo, a8);
  }

  return v19;
}

- (PXAppleMusicCuration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAppleMusicCuration.m"), 59, CFSTR("%s is not available as initializer"), "-[PXAppleMusicCuration init]");

  abort();
}

- (PXAudioAssetFetchResult)bestMusicSuggestions
{
  return self->_bestMusicSuggestions;
}

- (PXAudioAssetFetchResult)musicForYou
{
  return self->_musicForYou;
}

- (PXAudioAssetFetchResult)musicForLocation
{
  return self->_musicForLocation;
}

- (PXAudioAssetFetchResult)musicForTime
{
  return self->_musicForTime;
}

- (PXAudioAssetFetchResult)musicForPerformer
{
  return self->_musicForPerformer;
}

- (PXAppleMusicCurationInfo)musicCurationInfo
{
  return self->_musicCurationInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_musicCurationInfo, 0);
  objc_storeStrong((id *)&self->_musicForPerformer, 0);
  objc_storeStrong((id *)&self->_musicForTime, 0);
  objc_storeStrong((id *)&self->_musicForLocation, 0);
  objc_storeStrong((id *)&self->_musicForYou, 0);
  objc_storeStrong((id *)&self->_bestMusicSuggestions, 0);
}

@end
