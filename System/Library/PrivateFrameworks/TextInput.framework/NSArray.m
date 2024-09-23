@implementation NSArray

void __131__NSArray_UIKBCandidateExtras___sortedArrayByFrequency_extensionCandidateIndex_maxEmojisPerCandidate_ignoreTransliterateCandidate___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  int v7;
  id *v8;
  char v9;
  BOOL v10;
  id v11;

  v5 = a2;
  v6 = v5;
  v11 = v5;
  if (*(_BYTE *)(a1 + 96) && (v7 = objc_msgSend(v5, "isTransliterationCandidate"), v6 = v11, v7))
  {
    v8 = (id *)(a1 + 32);
  }
  else
  {
    v9 = objc_msgSend(v6, "isExtensionCandidate");
    if (objc_msgSend(v11, "isStickerCandidate"))
      v10 = a3 > 1;
    else
      v10 = v9;
    if ((v10
       || ((objc_msgSend(v11, "isEmojiCandidate") & 1) != 0 || objc_msgSend(v11, "isStickerCandidate"))
       && (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >= *(_QWORD *)(a1 + 72)
        || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) >= *(_QWORD *)(a1 + 80)))
      && (unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") < *(_QWORD *)(a1 + 88))
    {
      v8 = (id *)(a1 + 48);
    }
    else
    {
      v8 = (id *)(a1 + 40);
      if (objc_msgSend(*(id *)(a1 + 40), "count") == *(_QWORD *)(a1 + 88))
      {
        objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
        objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");
      }
      if (objc_msgSend(v11, "isEmojiCandidate"))
      {
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      }
      else
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      }
    }
    v6 = v11;
  }
  objc_msgSend(*v8, "addObject:", v6);

}

BOOL __65__NSArray_UIKBCandidateExtras___arrayByFilteringEmojiCandidates___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  _BOOL8 v6;

  v3 = a2;
  if ((objc_msgSend(v3, "isEmojiCandidate") & 1) != 0 || objc_msgSend(v3, "isStickerCandidate"))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(_QWORD *)(v4 + 24) + 1;
    *(_QWORD *)(v4 + 24) = v5;
    v6 = v5 <= *(_QWORD *)(a1 + 40);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    v6 = 1;
  }

  return v6;
}

uint64_t __77__NSArray_UIKBCandidateExtras___arrayByFilteringCandidatesForNonExtendedView__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isExtensionCandidate") ^ 1;
}

@end
