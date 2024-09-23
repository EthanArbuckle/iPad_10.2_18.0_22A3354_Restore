@implementation NSIndexPath(_PASAdditions)

- (__CFString)_pas_asVersionString
{
  uint64_t v2;
  __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = objc_msgSend(a1, "length");
  v3 = &stru_1E4431528;
  switch(v2)
  {
    case 0:
      return v3;
    case 1:
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%tu"), objc_msgSend(a1, "indexAtPosition:", 0), v9, v10, v11, v12, v13);
      goto LABEL_11;
    case 2:
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%tu.%tu"), objc_msgSend(a1, "indexAtPosition:", 0), objc_msgSend(a1, "indexAtPosition:", 1), v10, v11, v12, v13);
      goto LABEL_11;
    case 3:
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%tu.%tu.%tu"), objc_msgSend(a1, "indexAtPosition:", 0), objc_msgSend(a1, "indexAtPosition:", 1), objc_msgSend(a1, "indexAtPosition:", 2), v11, v12, v13);
      goto LABEL_11;
    case 4:
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%tu.%tu.%tu.%tu"), objc_msgSend(a1, "indexAtPosition:", 0), objc_msgSend(a1, "indexAtPosition:", 1), objc_msgSend(a1, "indexAtPosition:", 2), objc_msgSend(a1, "indexAtPosition:", 3), v12, v13);
      goto LABEL_11;
    case 5:
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%tu.%tu.%tu.%tu.%tu"), objc_msgSend(a1, "indexAtPosition:", 0), objc_msgSend(a1, "indexAtPosition:", 1), objc_msgSend(a1, "indexAtPosition:", 2), objc_msgSend(a1, "indexAtPosition:", 3), objc_msgSend(a1, "indexAtPosition:", 4), v13);
      goto LABEL_11;
    case 6:
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%tu.%tu.%tu.%tu.%tu.%tu"), objc_msgSend(a1, "indexAtPosition:", 0), objc_msgSend(a1, "indexAtPosition:", 1), objc_msgSend(a1, "indexAtPosition:", 2), objc_msgSend(a1, "indexAtPosition:", 3), objc_msgSend(a1, "indexAtPosition:", 4), objc_msgSend(a1, "indexAtPosition:", 5));
LABEL_11:
      v3 = (__CFString *)v4;
      break;
    default:
      v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 2 * v2);
      v5 = 0;
      v6 = v2 - 1;
      do
      {
        v7 = (void *)MEMORY[0x1A1AFDC98]();
        -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("%tu."), objc_msgSend(a1, "indexAtPosition:", v5));
        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v6 != v5);
      -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("%tu"), objc_msgSend(a1, "indexAtPosition:", v6));
      break;
  }
  return v3;
}

- (BOOL)_pas_isLessThanVersionString:()_PASAdditions
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0CB36B0], "_pas_fromVersionString:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "compare:", v2) == -1;

  return v3;
}

- (BOOL)_pas_isLessThanOrEqualToVersionString:()_PASAdditions
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0CB36B0], "_pas_fromVersionString:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "compare:", v2) != 1;

  return v3;
}

- (BOOL)_pas_isEqualToVersionString:()_PASAdditions
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0CB36B0], "_pas_fromVersionString:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "compare:", v2) == 0;

  return v3;
}

- (BOOL)_pas_isGreaterThanOrEqualToVersionString:()_PASAdditions
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0CB36B0], "_pas_fromVersionString:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "compare:", v2) != -1;

  return v3;
}

- (BOOL)_pas_isGreaterThanVersionString:()_PASAdditions
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x1E0CB36B0], "_pas_fromVersionString:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "compare:", v2) == 1;

  return v3;
}

+ (uint64_t)_pas_fromVersionString:()_PASAdditions
{
  return objc_msgSend(a1, "_pas_fromVersionString:withExceptions:", a3, 1);
}

+ (id)_pas_fromVersionStringIfPossible:()_PASAdditions
{
  if (!a3)
    return 0;
  objc_msgSend(a1, "_pas_fromVersionString:withExceptions:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_pas_fromVersionString:()_PASAdditions withExceptions:
{
  __CFString *v7;
  uint64_t v8;
  const char *CStringPtr;
  __CFString *v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  char *v17;
  int v18;
  void *v19;
  void *v20;
  void *v22;
  int v23;
  void *v24;
  id v25;
  uint64_t v26;
  char *__endptr;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = -[__CFString length](v7, "length");
  if (!-[__CFString length](v7, "length"))
  {
    v19 = (void *)objc_opt_new();
    goto LABEL_25;
  }
  CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
  if (!CStringPtr)
  {
    v10 = objc_retainAutorelease(v7);
    CStringPtr = (const char *)-[__CFString UTF8String](v10, "UTF8String");
    if (!CStringPtr)
    {
      if (!a4)
        goto LABEL_28;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSIndexPath+_PASAdditions.m"), 38, CFSTR("Unable to get ASCII or UTF-8 bytes of input to _pas_fromVersionString: %@"), v10);

      CStringPtr = 0;
    }
  }
  v11 = (unint64_t)(v8 + 1) >> 1;
  v12 = (8 * v11) | 7;
  __endptr = 0;
  v28 = 0;
  if (v12 > 0x1F4)
  {
    v23 = malloc_type_posix_memalign((void **)&__endptr, 8uLL, 8 * v11, 0x100004000313F17uLL);
    LOBYTE(v28) = 0;
    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v25);
    }
    v13 = __endptr;
  }
  else
  {
    v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v13, (8 * v11) | 7);
  }
  __endptr = 0;
  if ((*CStringPtr - 58) < 0xFFFFFFF6)
  {
LABEL_16:
    if (v12 >= 0x1F5)
    {
      free(v13);
      if (!a4)
        goto LABEL_28;
    }
    else if (!a4)
    {
      goto LABEL_28;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSIndexPath+_PASAdditions.m"), 52, CFSTR("Invalid input to _pas_fromVersionString (got an unexpected non-digit character): %@"), v7);
    goto LABEL_41;
  }
  v14 = 0;
  while (1)
  {
    *__error() = 0;
    v15 = strtoul(CStringPtr, &__endptr, 10);
    if (*__error())
      v16 = v15 + 1 > 1;
    else
      v16 = 1;
    if (!v16)
    {
      if (v12 >= 0x1F5)
      {
        free(v13);
        if (a4)
        {
LABEL_45:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSIndexPath+_PASAdditions.m"), 64, CFSTR("Invalid input to _pas_fromVersionString (unable to parse a decimal integer into an NSUInteger): %@"), v7);
          goto LABEL_41;
        }
      }
      else if (a4)
      {
        goto LABEL_45;
      }
LABEL_28:
      v19 = 0;
      goto LABEL_25;
    }
    v17 = __endptr;
    if (__endptr == CStringPtr)
    {
      if (v12 >= 0x1F5)
      {
        free(v13);
        if (!a4)
          goto LABEL_28;
      }
      else if (!a4)
      {
        goto LABEL_28;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSIndexPath+_PASAdditions.m"), 74, CFSTR("Invalid input to _pas_fromVersionString (expected a decimal integer, got something, or nothing, else): %@"), v7);
      goto LABEL_41;
    }
    *(_QWORD *)&v13[8 * v14] = v15;
    if (*v17 != 46)
      break;
    v18 = v17[1];
    __endptr = 0;
    ++v14;
    CStringPtr = v17 + 1;
    if ((v18 - 58) < 0xFFFFFFF6)
      goto LABEL_16;
  }
  if (*v17)
  {
    if (v12 >= 0x1F5)
    {
      free(v13);
      if (!a4)
        goto LABEL_28;
    }
    else if (!a4)
    {
      goto LABEL_28;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSIndexPath+_PASAdditions.m"), 91, CFSTR("Invalid input to _pas_fromVersionString (expected '.' or null terminator, got something else): %@"), v7);
LABEL_41:

    __break(1u);
  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B0]), "initWithIndexes:length:", v13, v14 + 1);
  if (v12 >= 0x1F5)
    free(v13);
  if (v14 + 1 > v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSIndexPath+_PASAdditions.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("length <= maxPossibleIndexPathLength"));

  }
LABEL_25:

  return v19;
}

@end
