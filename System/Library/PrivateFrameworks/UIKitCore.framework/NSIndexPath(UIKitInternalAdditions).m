@implementation NSIndexPath(UIKitInternalAdditions)

- (uint64_t)ui_getSectionIndex:()UIKitInternalAdditions itemIndex:
{
  uint64_t result;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSIndexPath+UIKitAdditions.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outSectionIndex != NULL"));

    if (a4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSIndexPath+UIKitAdditions.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outItemIndex != NULL"));

    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v12 = xmmword_186678190;
  result = objc_msgSend(a1, "getIndexes:range:", &v12, 0, 2);
  v9 = *((_QWORD *)&v12 + 1);
  *a3 = v12;
  *a4 = v9;
  return result;
}

- (__CFString)_ui_shortDescription
{
  uint64_t v2;
  uint64_t v3;
  __CFString *v4;
  uint64_t i;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v10;

  v2 = objc_msgSend(a1, "length");
  if (v2)
  {
    v3 = v2;
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("("));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != v3; ++i)
    {
      if (v3 - 1 == i)
        v6 = CFSTR(")");
      else
        v6 = CFSTR("-");
      v7 = v6;
      v8 = objc_msgSend(a1, "indexAtPosition:", i);
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("NSNotFound%@"), v7, v10);
      else
        -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("%lu%@"), v8, v7);

    }
  }
  else
  {
    v4 = CFSTR("(empty)");
  }
  return v4;
}

@end
