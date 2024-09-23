@implementation HKSPObjectsAreEqual

void __HKSPObjectsAreEqual_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
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
  id v16;
  id v17;
  id obj;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v6, "hksp_valueForProperty:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hksp_valueForProperty:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __HKSPObjectsAreEqual_block_invoke_2;
        v19[3] = &unk_1E4E3D288;
        v20 = v15;
        v16 = v15;
        v17 = (id)objc_msgSend(v8, "appendObject:counterpart:", v14, v19);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

}

id __HKSPObjectsAreEqual_block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
