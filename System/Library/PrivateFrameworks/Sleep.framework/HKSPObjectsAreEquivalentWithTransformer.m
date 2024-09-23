@implementation HKSPObjectsAreEquivalentWithTransformer

void __HKSPObjectsAreEquivalentWithTransformer_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id *v22;
  id v23;
  id v24;
  id obj;
  id v26;
  _QWORD v27[4];
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v26 = a2;
  v7 = a3;
  v8 = a4;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend((id)objc_opt_class(), "propertiesForEquivalence");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v14 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v26, "hksp_valueForProperty:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *))(v14 + 16))(v14, v13, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v7, "hksp_valueForProperty:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void *))(v17 + 16))(v17, v13, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "isRelationshipProperty"))
        {
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __HKSPObjectsAreEquivalentWithTransformer_block_invoke_2;
          v29[3] = &unk_1E4E3D318;
          v30 = v16;
          v31 = v19;
          v20 = v19;
          v21 = (id)objc_msgSend(v8, "appendEqualsBlocks:", v29, 0);

          v22 = &v30;
        }
        else
        {
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __HKSPObjectsAreEquivalentWithTransformer_block_invoke_3;
          v27[3] = &unk_1E4E3D288;
          v28 = v19;
          v23 = v19;
          v24 = (id)objc_msgSend(v8, "appendObject:counterpart:", v16, v27);
          v22 = &v28;
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v10);
  }

}

uint64_t __HKSPObjectsAreEquivalentWithTransformer_block_invoke_2(uint64_t a1)
{
  return HKSPObjectsAreEquivalentWithTransformer(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), &__block_literal_global_286);
}

id __HKSPObjectsAreEquivalentWithTransformer_block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
