@implementation CHRecognitionResult(TIAdditions)

- (id)mecabraHandwritingCandidate
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v26[2];
  id v27;
  _QWORD *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "wordIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
    return 0;
  objc_msgSend(a1, "wordRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 != v5)
    return 0;
  v26[1] = v26;
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(a1, "wordIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v8);
        *(_DWORD *)&v7[4 * v11 + 4 * i] = objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "unsignedIntValue");
      }
      v11 += i;
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v10);
  }

  MEMORY[0x24BDAC7A8]();
  v27 = a1;
  v28 = &v26[-2 * v3];
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(a1, "wordRanges");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v30;
    v19 = v28 + 1;
    do
    {
      v20 = 0;
      v21 = &v19[2 * v17];
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v14);
        *(v21 - 1) = objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v20), "rangeValue");
        *v21 = v22;
        ++v20;
        v21 += 2;
      }
      while (v16 != v20);
      v17 += v20;
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v16);
  }

  objc_msgSend(v27, "string");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  MecabraCreateHandwritingCandidate();
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

@end
