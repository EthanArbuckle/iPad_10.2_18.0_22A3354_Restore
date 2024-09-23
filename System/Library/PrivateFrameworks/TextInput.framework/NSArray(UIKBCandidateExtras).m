@implementation NSArray(UIKBCandidateExtras)

- (id)_arrayByFilteringCandidatesForNonExtendedView
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "indexesOfObjectsPassingTest:", &__block_literal_global_3662);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsAtIndexes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
    v4 = v3;
  else
    v4 = a1;
  v5 = v4;

  return v5;
}

- (id)_arrayByFilteringEmojiCandidates:()UIKBCandidateExtras
{
  void *v4;
  void *v5;
  _QWORD v7[6];
  _QWORD v8[4];

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__NSArray_UIKBCandidateExtras___arrayByFilteringEmojiCandidates___block_invoke;
  v7[3] = &unk_1E2439A48;
  v7[4] = v8;
  v7[5] = a3;
  objc_msgSend(a1, "indexesOfObjectsPassingTest:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v8, 8);
  return v5;
}

- (uint64_t)_sortedArrayByFrequency
{
  return objc_msgSend(a1, "_sortedArrayByFrequency:extensionCandidateIndex:maxEmojisPerCandidate:ignoreTransliterateCandidate:", 2, 8, 2, 0);
}

- (id)_sortedArrayByFrequency:()UIKBCandidateExtras extensionCandidateIndex:maxEmojisPerCandidate:ignoreTransliterateCandidate:
{
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, unint64_t);
  void *v23;
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  _QWORD v33[4];
  _QWORD v34[5];

  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __131__NSArray_UIKBCandidateExtras___sortedArrayByFrequency_extensionCandidateIndex_maxEmojisPerCandidate_ignoreTransliterateCandidate___block_invoke;
  v23 = &unk_1E2439A70;
  v32 = a6;
  v14 = v13;
  v24 = v14;
  v27 = v34;
  v28 = v33;
  v29 = a3;
  v30 = a5;
  v15 = v11;
  v25 = v15;
  v31 = a4;
  v16 = v12;
  v26 = v16;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", &v20);
  if (objc_msgSend(v15, "count", v20, v21, v22, v23))
    objc_msgSend(v14, "addObjectsFromArray:", v15);
  if (objc_msgSend(v16, "count"))
    objc_msgSend(v14, "addObjectsFromArray:", v16);
  v17 = v26;
  v18 = v14;

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v34, 8);
  return v18;
}

@end
