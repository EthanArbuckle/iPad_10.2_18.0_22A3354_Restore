@implementation PXDefaultAudioCueProvider

void __53___PXDefaultAudioCueProvider__cueProviderForCatalog___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  __objc2_class *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v2 = *(void **)(a1[4] + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v7 = a1[6];
    if (v7 < 2)
    {
      v8 = _PXEmptyAudioCueProvider;
    }
    else if (v7 - 2 >= 2)
    {
      if (v7 != 4)
      {
        v12 = 0;
        goto LABEL_9;
      }
      v8 = PXFlexMusicCueProvider;
    }
    else
    {
      v8 = PXAppleMusicCueProvider;
    }
    v9 = objc_alloc_init(v8);
    v10 = *(_QWORD *)(a1[5] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v7 = a1[6];
    v12 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
LABEL_9:
    v13 = *(void **)(a1[4] + 8);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

  }
}

void __69___PXDefaultAudioCueProvider_requestCuesForAudioAsset_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v8, OS_SIGNPOST_INTERVAL_END, v9, "requestAudioCues", ", v10, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
