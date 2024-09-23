@implementation NSTextRange

- (NSTextRange)initWithLocation:(id)location
{
  return -[NSTextRange initWithLocation:endLocation:](self, "initWithLocation:endLocation:", location, 0);
}

- (id)location
{
  return objc_getProperty(self, a2, 8, 1);
}

- (NSTextRange)initWithLocation:(id)location endLocation:(id)endLocation
{
  uint64_t v8;
  uint64_t v9;
  NSCountableTextRange *v10;
  NSTextRange *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;

  if (initWithLocation_endLocation__onceToken != -1)
  {
    dispatch_once(&initWithLocation_endLocation__onceToken, &__block_literal_global_15);
    if (location)
      goto LABEL_3;
LABEL_21:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSTextRange.m"), 26, CFSTR("attempt to create %@ from nil location"), objc_opt_class(), v14, v15);
    goto LABEL_22;
  }
  if (!location)
    goto LABEL_21;
LABEL_3:
  if (!endLocation || objc_msgSend(location, "compare:", endLocation) != 1)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!endLocation)
      {
        v9 = objc_msgSend(location, "characterIndex");
        v8 = v9;
        goto LABEL_12;
      }
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = objc_msgSend(location, "characterIndex");
        v9 = objc_msgSend(endLocation, "characterIndex");
LABEL_12:
        if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v10 = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", v8, v9 - v8);

          return &v10->super;
        }
      }
    }
    v16.receiver = self;
    v16.super_class = (Class)NSTextRange;
    v12 = -[NSTextRange init](&v16, sel_init);
    if (v12)
    {
      v12->_location = (NSTextLocation *)location;
      if (endLocation)
        v13 = endLocation;
      else
        v13 = location;
      v12->_endLocation = (NSTextLocation *)v13;
    }
    return v12;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSTextRange.m"), 32, CFSTR("attempt to create backwards %@ from %@ to %@"), objc_opt_class(), location, endLocation);
LABEL_22:

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSTextRange;
  -[NSTextRange dealloc](&v3, sel_dealloc);
}

- (id)endLocation
{
  return objc_getProperty(self, a2, 16, 1);
}

- (BOOL)containsRange:(NSTextRange *)textRange
{
  _BOOL4 v5;

  v5 = -[NSTextRange containsLocation:](self, "containsLocation:", -[NSTextRange location](textRange, "location"));
  if (v5)
    LOBYTE(v5) = objc_msgSend(-[NSTextRange endLocation](textRange, "endLocation"), "compare:", -[NSTextRange endLocation](self, "endLocation")) != 1;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0 && -[NSTextRange isEqualToTextRange:](self, "isEqualToTextRange:", a3);
}

- (NSTextRange)textRangeWithAdjustment:(unint64_t)a3 rangeProvider:(id)a4
{
  NSTextRange *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v7 = self;
  if ((a3 & 3) == 0)
    goto LABEL_9;
  if ((a3 & 3) == 3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSTextRange.m"), 159, CFSTR("Only one of (NSTextRangeAdjustmentHeadForward|NSTextRangeAdjustmentHeadBackward) should be specified."));
  v8 = -[NSTextRange location](v7, "location");
  v9 = (void *)(*((uint64_t (**)(id, id, BOOL))a4 + 2))(a4, v8, (a3 & 2) == 0);
  v10 = (uint64_t)v9;
  if (v9)
  {
    v11 = (void *)objc_msgSend(v9, "location");
    v12 = (uint64_t)v11;
    if ((a3 & 2) == 0)
      goto LABEL_8;
    if (objc_msgSend(v11, "compare:", v8) == -1)
    {
      v12 = objc_msgSend((id)v10, "endLocation");
LABEL_8:
      if (objc_msgSend(v8, "compare:", v12) == -1)
      {
        v10 = objc_msgSend((id)v10, "location");
        goto LABEL_10;
      }
    }
LABEL_9:
    v10 = 0;
  }
LABEL_10:
  if ((a3 & 0xC) == 0)
    goto LABEL_19;
  if ((a3 & 0xC) == 0xC)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("NSTextRange.m"), 181, CFSTR("Only one of (NSTextRangeAdjustmentTailForward|NSTextRangeAdjustmentTailBackward) should be specified."));
  v13 = -[NSTextRange endLocation](v7, "endLocation");
  v14 = (void *)(*((uint64_t (**)(id, uint64_t, unint64_t))a4 + 2))(a4, v13, (a3 >> 2) & 1);
  if (!v14)
    goto LABEL_19;
  v15 = v14;
  if ((a3 & 4) != 0)
  {
    if (objc_msgSend((id)objc_msgSend(v14, "location"), "compare:", v13) != -1)
    {
LABEL_19:
      v18 = 0;
      goto LABEL_20;
    }
    v16 = objc_msgSend(v15, "endLocation");
    v17 = (void *)v13;
  }
  else
  {
    v17 = (void *)objc_msgSend(v14, "endLocation");
    v16 = v13;
  }
  if (objc_msgSend(v17, "compare:", v16) != -1)
    goto LABEL_19;
  v18 = objc_msgSend(v15, "endLocation");
LABEL_20:
  if (!(v10 | v18))
    return v7;
  if (!v10)
  {
    v10 = -[NSTextRange location](v7, "location");
    if (v18)
      goto LABEL_23;
LABEL_26:
    v18 = -[NSTextRange endLocation](v7, "endLocation");
    goto LABEL_23;
  }
  if (!v18)
    goto LABEL_26;
LABEL_23:
  if (objc_msgSend((id)v18, "compare:", v10) != -1)
    return -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v10, v18);
  return 0;
}

uint64_t __44__NSTextRange_initWithLocation_endLocation___block_invoke()
{
  uint64_t result;

  initWithLocation_endLocation__countableTextLocationClass = objc_opt_class();
  result = objc_opt_class();
  initWithLocation_endLocation__countableTextRangeClass = result;
  return result;
}

- (BOOL)isEmpty
{
  return objc_msgSend(-[NSTextRange location](self, "location"), "isEqual:", -[NSTextRange endLocation](self, "endLocation"));
}

- (BOOL)isNotEmpty
{
  return objc_msgSend(-[NSTextRange location](self, "location"), "isEqual:", -[NSTextRange endLocation](self, "endLocation")) ^ 1;
}

- (BOOL)isEqualToTextRange:(NSTextRange *)textRange
{
  int v5;

  v5 = objc_msgSend(-[NSTextRange location](self, "location"), "isEqual:", -[NSTextRange location](textRange, "location"));
  if (v5)
    LOBYTE(v5) = objc_msgSend(-[NSTextRange endLocation](self, "endLocation"), "isEqual:", -[NSTextRange endLocation](textRange, "endLocation"));
  return v5;
}

- (BOOL)containsLocation:(id)location
{
  return !-[NSTextRange isEmpty](self, "isEmpty")
      && objc_msgSend(-[NSTextRange location](self, "location"), "compare:", location) != 1
      && objc_msgSend(location, "compare:", -[NSTextRange endLocation](self, "endLocation")) == -1;
}

- (BOOL)intersectsWithTextRange:(NSTextRange *)textRange
{
  return !-[NSTextRange isEmpty](self, "isEmpty")
      && !-[NSTextRange isEmpty](textRange, "isEmpty")
      && objc_msgSend(-[NSTextRange location](textRange, "location"), "compare:", -[NSTextRange endLocation](self, "endLocation")) == -1&& objc_msgSend(-[NSTextRange location](self, "location"), "compare:", -[NSTextRange endLocation](textRange, "endLocation")) == -1;
}

- (NSTextRange)textRangeByIntersectingWithTextRange:(NSTextRange *)textRange
{
  NSTextRange *v5;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  if (!textRange)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSTextRange.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("range"));
  if (-[NSTextRange isEmpty](self, "isEmpty")
    && -[NSTextRange containsLocation:](textRange, "containsLocation:", -[NSTextRange location](self, "location")))
  {
    goto LABEL_19;
  }
  if (-[NSTextRange isEmpty](textRange, "isEmpty")
    && -[NSTextRange containsLocation:](self, "containsLocation:", -[NSTextRange location](textRange, "location")))
  {
    goto LABEL_7;
  }
  if (-[NSTextRange isEmpty](self, "isEmpty") || -[NSTextRange isEmpty](textRange, "isEmpty"))
    return 0;
  v7 = -[NSTextRange location](self, "location");
  v8 = -[NSTextRange endLocation](self, "endLocation");
  v9 = -[NSTextRange location](textRange, "location");
  v10 = -[NSTextRange endLocation](textRange, "endLocation");
  v11 = objc_msgSend(v7, "compare:", v9) == -1 ? v9 : v7;
  v12 = objc_msgSend(v10, "compare:", v8) == -1 ? v10 : v8;
  if (v7 == v11 && v8 == v12)
  {
LABEL_19:
    v5 = self;
    return v5;
  }
  if (v9 != v11 || v10 != v12)
  {
    if (objc_msgSend(v11, "compare:", v12) == -1)
    {
      v5 = (NSTextRange *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocation:endLocation:", v11, v12);
      return v5;
    }
    return 0;
  }
LABEL_7:
  v5 = textRange;
  return v5;
}

- (NSTextRange)textRangeByFormingUnionWithTextRange:(NSTextRange *)textRange
{
  NSTextRange *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  if (!-[NSTextRange isEmpty](self, "isEmpty"))
  {
    if (-[NSTextRange isEmpty](textRange, "isEmpty"))
      goto LABEL_13;
    v6 = -[NSTextRange location](self, "location");
    v7 = -[NSTextRange endLocation](self, "endLocation");
    v8 = -[NSTextRange location](textRange, "location");
    v9 = -[NSTextRange endLocation](textRange, "endLocation");
    v10 = objc_msgSend(v8, "compare:", v6) == -1 ? v8 : v6;
    v11 = objc_msgSend(v7, "compare:", v9) == -1 ? v9 : v7;
    if (objc_msgSend(v10, "compare:", v11) != -1)
      -[NSTextRange textRangeByFormingUnionWithTextRange:].cold.1();
    if (v6 == v10 && v7 == v11)
    {
LABEL_13:
      v5 = self;
      return v5;
    }
    if (v8 != v10 || v9 != v11)
    {
      v5 = (NSTextRange *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocation:endLocation:", v10, v11);
      return v5;
    }
  }
  v5 = textRange;
  return v5;
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p %@>"), objc_opt_class(), self, -[NSTextRange description](self, "description"));
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@...%@"), objc_msgSend(-[NSTextRange location](self, "location"), "description"), objc_msgSend(-[NSTextRange endLocation](self, "endLocation"), "description"));
}

+ (id)combineTextRanges:(id)a3 withTextRanges:(id)a4 usingOperator:(int)a5
{
  void *v8;
  uint64_t v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  size_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void *v24;
  void *v25;
  char v26;
  _BOOL4 v27;
  _BOOL4 v28;
  id v29;
  uint64_t v30;
  char *v31;
  int v32;
  int v33;
  void *v34;
  NSTextRange *v35;
  NSTextRange *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  int v42;
  uint64_t v43;
  char *__base;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  char v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "count")
    || objc_msgSend(a3, "count") == 1 && objc_msgSend((id)objc_msgSend(a3, "firstObject"), "isEmpty"))
  {
    if ((a5 & 2) != 0)
      return a4;
    else
      return 0;
  }
  if (!objc_msgSend(a4, "count")
    || objc_msgSend(a4, "count") == 1 && objc_msgSend((id)objc_msgSend(a4, "firstObject"), "isEmpty"))
  {
    if ((a5 & 1) != 0)
      return a3;
    else
      return 0;
  }
  v9 = objc_msgSend(a3, "count");
  v38 = objc_msgSend(a4, "count");
  v43 = v38 + v9;
  v10 = 48 * (v38 + v9);
  v41 = v10;
  if (v10 < 0x181)
    __base = &v55;
  else
    __base = (char *)malloc_type_malloc(v10, 0x10800402F72B0F7uLL);
  v42 = a5;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v49, v54, 16, v38, v9);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v50;
    do
    {
      v15 = 0;
      v16 = &__base[24 * v13];
      v13 += 2 * v12;
      do
      {
        if (*(_QWORD *)v50 != v14)
          objc_enumerationMutation(a3);
        v17 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v15);
        *(_QWORD *)v16 = objc_msgSend(v17, "location");
        *((_DWORD *)v16 + 2) = 0;
        v16[12] = 1;
        *((_QWORD *)v16 + 2) = 0;
        *((_QWORD *)v16 + 3) = objc_msgSend(v17, "endLocation");
        *((_DWORD *)v16 + 8) = 0;
        v16[36] = 0;
        *((_QWORD *)v16 + 5) = v17;
        ++v15;
        v16 += 48;
      }
      while (v12 != v15);
      v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }
  v18 = 2 * v43;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v19 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v46;
    do
    {
      v22 = 0;
      v23 = &__base[24 * v13];
      v13 += 2 * v20;
      do
      {
        if (*(_QWORD *)v46 != v21)
          objc_enumerationMutation(a4);
        v24 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v22);
        *(_QWORD *)v23 = objc_msgSend(v24, "location");
        *((_DWORD *)v23 + 2) = 1;
        v23[12] = 1;
        *((_QWORD *)v23 + 2) = 0;
        *((_QWORD *)v23 + 3) = objc_msgSend(v24, "endLocation");
        *((_DWORD *)v23 + 8) = 1;
        v23[36] = 0;
        *((_QWORD *)v23 + 5) = v24;
        ++v22;
        v23 += 48;
      }
      while (v20 != v22);
      v20 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v20);
  }
  if (v13 != v18)
    +[NSTextRange combineTextRanges:withTextRanges:usingOperator:].cold.5();
  qsort_b(__base, v18, 0x18uLL, &__block_literal_global_29);
  v25 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (v18)
  {
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v31 = __base;
    while (1)
    {
      if (*((_DWORD *)v31 + 2))
        v27 = v31[12] != 0;
      else
        v28 = v31[12] != 0;
      if (++v30 < v18 && !objc_msgSend(*(id *)v31, "compare:", *((_QWORD *)v31 + 3)))
        goto LABEL_60;
      if (v28 || v27)
        break;
      if ((v26 & 1) != 0)
        goto LABEL_51;
LABEL_59:
      v26 = 0;
LABEL_60:
      v31 += 24;
      if (2 * v39 + 2 * v40 == v30)
      {
        if (v29)
          +[NSTextRange combineTextRanges:withTextRanges:usingOperator:].cold.2();
        if ((v26 & 1) != 0)
          +[NSTextRange combineTextRanges:withTextRanges:usingOperator:].cold.1();
        goto LABEL_63;
      }
    }
    if (v27)
      v32 = 4;
    else
      v32 = 1;
    if (!v28)
      v32 = 2;
    v33 = v32 & v42;
    if ((v26 & 1) == (v33 != 0))
      goto LABEL_60;
    if (v33)
    {
      if (v29)
        +[NSTextRange combineTextRanges:withTextRanges:usingOperator:].cold.3();
      v29 = *(id *)v31;
      v26 = 1;
      goto LABEL_60;
    }
LABEL_51:
    if (!v29)
      +[NSTextRange combineTextRanges:withTextRanges:usingOperator:].cold.4();
    if (objc_msgSend(v29, "compare:", *(_QWORD *)v31) == -1)
    {
      v34 = (void *)*((_QWORD *)v31 + 2);
      if (v34 && !objc_msgSend(v29, "compare:", objc_msgSend(v34, "location")))
        v35 = (NSTextRange *)*((id *)v31 + 2);
      else
        v35 = -[NSTextRange initWithLocation:endLocation:]([NSTextRange alloc], "initWithLocation:endLocation:", v29, *(_QWORD *)v31);
      v36 = v35;
      objc_msgSend(v25, "addObject:", v35);

    }
    v29 = 0;
    goto LABEL_59;
  }
LABEL_63:
  if (objc_msgSend(v25, "count"))
    v8 = v25;
  else
    v8 = 0;
  if (v41 >= 0x181)
    free(__base);
  return v8;
}

uint64_t __62__NSTextRange_combineTextRanges_withTextRanges_usingOperator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  unsigned int v6;

  result = objc_msgSend(*(id *)a2, "compare:", *(_QWORD *)a3);
  if (!result)
  {
    if (*(_BYTE *)(a2 + 12))
      v6 = -1;
    else
      v6 = 1;
    if (*(unsigned __int8 *)(a2 + 12) == *(unsigned __int8 *)(a3 + 12))
      return 0;
    else
      return v6;
  }
  return result;
}

- (void)textRangeByFormingUnionWithTextRange:.cold.1()
{
  __assert_rtn("-[NSTextRange textRangeByFormingUnionWithTextRange:]", "NSTextRange.m", 140, "[newStart compare:newEnd] == NSOrderedAscending && \"union of non-empty ranges is non-empty\");
}

+ (void)combineTextRanges:withTextRanges:usingOperator:.cold.1()
{
  __assert_rtn("+[NSTextRange combineTextRanges:withTextRanges:usingOperator:]", "NSTextRange.m", 331, "!resultState");
}

+ (void)combineTextRanges:withTextRanges:usingOperator:.cold.2()
{
  __assert_rtn("+[NSTextRange combineTextRanges:withTextRanges:usingOperator:]", "NSTextRange.m", 330, "!start");
}

+ (void)combineTextRanges:withTextRanges:usingOperator:.cold.3()
{
  __assert_rtn("+[NSTextRange combineTextRanges:withTextRanges:usingOperator:]", "NSTextRange.m", 311, "!start");
}

+ (void)combineTextRanges:withTextRanges:usingOperator:.cold.4()
{
  __assert_rtn("+[NSTextRange combineTextRanges:withTextRanges:usingOperator:]", "NSTextRange.m", 314, "start");
}

+ (void)combineTextRanges:withTextRanges:usingOperator:.cold.5()
{
  __assert_rtn("+[NSTextRange combineTextRanges:withTextRanges:usingOperator:]", "NSTextRange.m", 273, "i == eventCount");
}

@end
