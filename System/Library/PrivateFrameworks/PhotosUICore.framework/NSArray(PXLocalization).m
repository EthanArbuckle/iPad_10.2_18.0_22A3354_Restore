@implementation NSArray(PXLocalization)

- (__CFString)px_localizedComposedStringWithCount:()PXLocalization useUndefinedMoreCount:
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  __CFString *v19;
  uint64_t v20;
  id v21;
  void *v22;
  unint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  int v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a1, "count");
  if (!v7)
    return &stru_1E5149688;
  v8 = v7;
  if (v7 == 1)
  {
    objc_msgSend(a1, "objectAtIndex:", 0);
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = a4;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = a1;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = 0;
      v14 = *(_QWORD *)v33;
LABEL_7:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v15);
        v17 = v13 + v15;
        v18 = v13 + v15 + 1;
        if (v13 + v15)
        {
          if (v17 == 1 && v18 >= v8)
            v19 = CFSTR("LIST_END_SEPARATOR_FORMAT_1");
          else
            v19 = v17 < 2 || v18 < v8 ? CFSTR("LIST_MID_SEPARATOR_FORMAT") : CFSTR("LIST_END_SEPARATOR_FORMAT_N");
          PXLocalizedStringFromTable(v19, CFSTR("PhotosUICore"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v16;
          PXStringWithValidatedFormat();
          v21 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 20 * v8);
          v20 = objc_claimAutoreleasedReturnValue();

          v21 = v16;
          v12 = (void *)v20;
        }
        objc_msgSend(v12, "appendString:", v21, v28);

        if (v18 >= a3)
          break;
        if (v11 == ++v15)
        {
          v13 += v15;
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
          if (v11)
            goto LABEL_7;
          break;
        }
      }
    }
    else
    {
      v12 = 0;
    }

    v23 = v8 - a3;
    if ((uint64_t)(v8 - a3) >= 1)
    {
      if (v30)
      {
        PXLocalizedStringFromTable(CFSTR("LIST_END_AND_MORE_FORMAT"), CFSTR("PhotosUICore"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appendString:", v24);
      }
      else
      {
        v25 = CFSTR("LIST_END_N_AND_MORE_FORMAT");
        if (a3 == 1)
          v25 = CFSTR("LIST_END_1_AND_MORE_FORMAT");
        v26 = v25;
        PXLocalizedStringFromTable(v26, CFSTR("PhotosUICore"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v23;
        PXStringWithValidatedFormat();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appendString:", v27, v29);

      }
    }
    return (__CFString *)v12;
  }
}

- (uint64_t)px_localizedComposedStringThatFitsWidth:()PXLocalization withMeasuringBlock:
{
  return objc_msgSend(a1, "px_localizedComposedStringThatFitsWidth:maxCount:useUndefinedMoreCount:withMeasuringBlock:", -1, 0, a3);
}

- (__CFString)px_localizedComposedStringThatFitsWidth:()PXLocalization maxCount:useUndefinedMoreCount:withMeasuringBlock:
{
  double (**v10)(id, __CFString *);
  unint64_t v11;
  __CFString *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;

  v10 = a6;
  v11 = objc_msgSend(a1, "count");
  if (v11)
  {
    if (v11 == 1)
    {
      objc_msgSend(a1, "objectAtIndex:", 0);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v11 >= a4)
        v13 = a4;
      else
        v13 = v11;
      if (v13 <= 1)
        v14 = 1;
      else
        v14 = v13;
      if (v14 < 1)
      {
        v12 = 0;
      }
      else
      {
        v12 = 0;
        v15 = 1;
        v16 = 1;
        do
        {
          while (1)
          {
            v17 = v12;
            v18 = v16 + v14;
            if (v16 + v14 < 0 != __OFADD__(v16, v14))
              ++v18;
            v19 = v18 >> 1;
            objc_msgSend(a1, "px_localizedComposedStringWithCount:useUndefinedMoreCount:", v18 >> 1, a5);
            v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v20 = v10[2](v10, v12);
            if (v20 >= a2 + -60.0)
              break;
            v16 = v19 + 1;
            v15 = v19;
            if (v14 <= v19)
              goto LABEL_22;
          }
          if (v20 <= a2)
            goto LABEL_22;
          v14 = v19 - 1;
        }
        while (v19 > v16);
        objc_msgSend(a1, "px_localizedComposedStringWithCount:useUndefinedMoreCount:", v15, a5);
        v21 = objc_claimAutoreleasedReturnValue();

        v12 = (__CFString *)v21;
      }
    }
  }
  else
  {
    v12 = &stru_1E5149688;
  }
LABEL_22:

  return v12;
}

@end
