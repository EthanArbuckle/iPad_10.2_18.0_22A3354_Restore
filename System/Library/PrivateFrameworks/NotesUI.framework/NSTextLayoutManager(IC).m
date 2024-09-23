@implementation NSTextLayoutManager(IC)

- (id)ic_textRangeForRange:()IC
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a1, "documentRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "documentRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "locationFromLocation:withOffset:", v10, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(a1, "locationFromLocation:withOffset:", v11, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1318]), "initWithLocation:endLocation:", v11, v12);
      else
        v13 = 0;

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (uint64_t)ic_rangeForTextRange:()IC
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(a1, "documentRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_6;
  }
  v7 = (void *)v6;
  objc_msgSend(v4, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_8;
  }
  objc_msgSend(a1, "documentRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(a1, "offsetFromLocation:toLocation:", v10, v11);

  objc_msgSend(v4, "endLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "offsetFromLocation:toLocation:", v5, v14);

LABEL_6:
  }
LABEL_8:

  return v12;
}

- (double)ic_rectForRange:()IC
{
  void *v2;
  __int128 v3;
  double *p_x;
  double v5;
  _QWORD v7[5];
  uint64_t v8;
  CGRect *v9;
  uint64_t v10;
  const char *v11;
  __int128 v12;
  __int128 v13;

  objc_msgSend(a1, "ic_textRangeForRange:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8 = 0;
    v9 = (CGRect *)&v8;
    v10 = 0x4010000000;
    v11 = "";
    v3 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v12 = *MEMORY[0x1E0C9D628];
    v13 = v3;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__NSTextLayoutManager_IC__ic_rectForRange___block_invoke;
    v7[3] = &unk_1E5C21CF0;
    v7[4] = &v8;
    objc_msgSend(a1, "enumerateTextSegmentsInRange:type:options:usingBlock:", v2, 0, 0, v7);
    if (CGRectIsNull(v9[1]))
      p_x = (double *)MEMORY[0x1E0C9D648];
    else
      p_x = &v9[1].origin.x;
    v5 = *p_x;
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D648];
  }

  return v5;
}

@end
