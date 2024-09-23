@implementation ACTUserActionStream

void __41___ACTUserActionStream_tryContinuousPath__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v5 = 0;
    while (1)
    {
      objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v5, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v17, "isEqualToString:", v6);

      if ((v7 & 1) != 0)
        break;
      if (++v5 >= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length"))
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "keyplane");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "anyKeyForString:keyplane:wantSecondaryString:substituteUpperCaseForLowerCase:", v17, v9, objc_msgSend(*(id *)(a1 + 40), "lastActionUseSecondaryString"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      || (objc_msgSend(*(id *)(a1 + 40), "delegate"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v11, "mapShiftedKeyToUnShiftedKeyExcludeCapitalization:", v17),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v10))
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        objc_msgSend(v10, "representedString");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;

      }
      objc_msgSend(v10, "representedString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "caseInsensitiveCompare:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

      if (v16)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      *a3 = 1;
    }

  }
}

uint64_t __56___ACTUserActionStream_candidateToSelectFromCandidates___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cursor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfInputSegmentsForCandidate:", v3);

  objc_msgSend(v3, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "document");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "input");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "hasSuffix:", v9);

  }
  else
  {
    v10 = 1;
  }

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    v11 = 0;
  else
    v11 = v10;

  return v11;
}

uint64_t __56___ACTUserActionStream_candidateToSelectFromCandidates___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "candidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  objc_msgSend(v4, "candidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "length");
  if (v6 > v8)
    return -1;
  else
    return v6 < v8;
}

@end
