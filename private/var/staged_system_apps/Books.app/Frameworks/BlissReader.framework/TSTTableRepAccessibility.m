@implementation TSTTableRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTTableRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDRepAccessibility, a2);
}

- (NSMutableArray)_tsaxChildrenCellsCache
{
  return (NSMutableArray *)__TSAccessibilityGetAssociatedObject(self, &unk_54387A);
}

- (void)_tsaxSetChildrenCellsCache:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_54387A, a3);
}

- (NSMutableArray)_tsaxTwoDimensionalChildrenCellsCache
{
  return (NSMutableArray *)__TSAccessibilityGetAssociatedObject(self, &unk_54387B);
}

- (void)_tsaxSetTwoDimensionalChildrenCellsCache:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_54387B, a3);
}

- (NSString)tsaxLabel
{
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  NSString *v8;
  const __CFString *v9;
  NSString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = -[TSDRepAccessibility tsaxLockedLabel](self, "tsaxLockedLabel");
  v4 = -[TSTTableRepAccessibility tsaxTableName](self, "tsaxTableName");
  v5 = -[TSTTableRepAccessibility tsaxRowsCount](self, "tsaxRowsCount");
  v6 = -[TSTTableRepAccessibility tsaxColumnsCount](self, "tsaxColumnsCount");
  if (v5 == 1)
    v7 = CFSTR("row.count.singular %@");
  else
    v7 = CFSTR("row.count.plural %@");
  v8 = TSAccessibilityLocalizedString((uint64_t)v7);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, TSAccessibilityLocalizedUnsignedInteger(v5));
  if (v6 == 1)
    v9 = CFSTR("column.count.singular %@");
  else
    v9 = CFSTR("column.count.plural %@");
  v10 = TSAccessibilityLocalizedString((uint64_t)v9);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, TSAccessibilityLocalizedUnsignedInteger(v6));
  if (!-[NSString length](v4, "length"))
    v4 = TSAccessibilityLocalizedString((uint64_t)CFSTR("table"));
  return (NSString *)__TSAccessibilityStringForVariables(1, v3, v11, v12, v13, v14, v15, v16, (uint64_t)v4);
}

- (id)tsaxKnobLabel
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("table"));
}

- (NSArray)tsaxChildrenCells
{
  unint64_t v2;
  unint64_t v4;
  unint64_t v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  uint64_t v8;
  NSMutableArray *v9;
  _UNKNOWN **v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  char *v17;
  id v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  TSTTableCellAccessibilityElement *v23;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  TSTTableRepAccessibility *v30;
  TSTTableRepAccessibility *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *i;
  id v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  unint64_t v42;
  NSArray *p_super;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];

  v4 = -[TSTTableRepAccessibility tsaxRowsCount](self, "tsaxRowsCount");
  v5 = -[TSTTableRepAccessibility tsaxColumnsCount](self, "tsaxColumnsCount");
  v6 = -[TSTTableRepAccessibility _tsaxChildrenCellsCache](self, "_tsaxChildrenCellsCache");
  v7 = -[TSTTableRepAccessibility _tsaxTwoDimensionalChildrenCellsCache](self, "_tsaxTwoDimensionalChildrenCellsCache");
  v9 = v7;
  v10 = &AEAnnotationPopoverShouldHideNotification_ptr;
  p_super = &v6->super;
  if (v6)
  {
    if (-[NSMutableArray count](v7, "count") == (id)v4 && -[NSMutableArray count](v6, "count") == (id)(v5 * v4))
      return p_super;
    -[NSMutableArray removeAllObjects](v6, "removeAllObjects");
  }
  else
  {
    v11 = (NSArray *)objc_opt_new(NSMutableArray, v8);
    -[TSTTableRepAccessibility _tsaxSetChildrenCellsCache:](self, "_tsaxSetChildrenCellsCache:", v11);
    p_super = v11;

  }
  v37 = -[NSMutableArray mutableCopy](v9, "mutableCopy");
  v41 = (char *)objc_msgSend(v37, "count");
  if (v9)
  {
    -[NSMutableArray removeAllObjects](v9, "removeAllObjects");
  }
  else
  {
    v9 = (NSMutableArray *)objc_opt_new(NSMutableArray, v12);
    -[TSTTableRepAccessibility _tsaxSetTwoDimensionalChildrenCellsCache:](self, "_tsaxSetTwoDimensionalChildrenCellsCache:", v9);

  }
  v40 = (unsigned __int16)v4;
  if ((_WORD)v4)
  {
    v14 = 0;
    v38 = v9;
    v39 = v5;
    v15 = (unint64_t)v5 << 16;
    do
    {
      v16 = (void *)objc_opt_new(v10[432], v13);
      -[NSMutableArray addObject:](v9, "addObject:", v16);
      v17 = v41;
      if (v41)
      {
        v18 = objc_msgSend(v37, "objectAtIndex:", 0);
        objc_msgSend(v37, "removeObjectAtIndex:", 0);
        v17 = v41 - 1;
      }
      else
      {
        v18 = 0;
      }
      v19 = (char *)objc_msgSend(v18, "count");
      v41 = v17;
      if (v39)
      {
        v20 = v19;
        v21 = 0;
        do
        {
          v22 = v21 | v14;
          if (v20)
          {
            v23 = (TSTTableCellAccessibilityElement *)objc_msgSend(v18, "objectAtIndex:", 0);
            objc_msgSend(v18, "removeObjectAtIndex:", 0);
            --v20;
            if (TSAccessibilityShouldPerformValidationChecks())
            {
              if (v22 != ((unint64_t)-[TSTTableCellAccessibilityElement cellID](v23, "cellID") & 0xFFFFFF))
              {
                ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
                if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Cell ID of previous cell is invalid"), v25, v26, v27, v28, v29, (uint64_t)v37))abort();
              }
            }
          }
          else
          {
            if (-[TSTTableRepAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxAlternateParentForCellID:", &OBJC_PROTOCOL___TSTTableRepAccessibilityExtras))
            {
              v42 = v42 & 0xFFFFFFFF00000000 | v22;
              v30 = (TSTTableRepAccessibility *)-[TSTTableRepAccessibility tsaxAlternateParentForCellID:](self, "tsaxAlternateParentForCellID:");
            }
            else
            {
              v30 = 0;
            }
            if (v30)
              v31 = v30;
            else
              v31 = self;
            v23 = -[TSAccessibilityElement initWithAccessibilityParent:]([TSTTableCellAccessibilityElement alloc], "initWithAccessibilityParent:", v31);
            -[TSTTableCellAccessibilityElement setTableRep:](v23, "setTableRep:", self);
            v2 = v2 & 0xFFFFFFFF00000000 | v22;
            -[TSTTableCellAccessibilityElement setCellID:](v23, "setCellID:", v2);
            v20 = 0;
          }
          objc_msgSend(v16, "addObject:", v23);
          -[NSArray addObject:](p_super, "addObject:", v23);

          v21 += 0x10000;
        }
        while (v15 != v21);
      }

      -[TSTTableRepAccessibility _tsaxCleanupTableChildrenElementsCache:](self, "_tsaxCleanupTableChildrenElementsCache:", v18);
      ++v14;
      v10 = &AEAnnotationPopoverShouldHideNotification_ptr;
      v9 = v38;
    }
    while (v14 != v40);
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v32 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v34)
          objc_enumerationMutation(v37);
        -[TSTTableRepAccessibility _tsaxCleanupTableChildrenElementsCache:](self, "_tsaxCleanupTableChildrenElementsCache:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i));
      }
      v33 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v33);
  }
  objc_msgSend(v37, "removeAllObjects");

  return p_super;
}

- (id)tsaxChildCellForCellID:(id)a3
{
  NSMutableArray *v5;
  id v6;
  unint64_t var1;

  -[TSTTableRepAccessibility _tsaxEnsureChildrenCellsAreLoaded](self, "_tsaxEnsureChildrenCellsAreLoaded");
  v5 = -[TSTTableRepAccessibility _tsaxTwoDimensionalChildrenCellsCache](self, "_tsaxTwoDimensionalChildrenCellsCache");
  if (a3.var0 >= (unint64_t)-[NSMutableArray count](v5, "count"))
    return 0;
  v6 = -[NSMutableArray objectAtIndex:](v5, "objectAtIndex:", a3.var0);
  var1 = a3.var1;
  if (var1 >= (unint64_t)objc_msgSend(v6, "count"))
    return 0;
  else
    return objc_msgSend(v6, "objectAtIndex:", var1);
}

- (id)tsaxChildrenCellsInRange:(id)a3
{
  unint64_t v3;
  int var1;
  id v6;
  unsigned __int16 v7;
  unsigned int v8;
  void *v9;
  int v10;
  unsigned int v11;
  id v12;
  unsigned __int8 v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  BOOL v20;
  BOOL v21;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  NSMutableArray *v26;

  v3 = (unint64_t)a3;
  var1 = a3.var1.var1;
  -[TSTTableRepAccessibility _tsaxEnsureChildrenCellsAreLoaded](self, "_tsaxEnsureChildrenCellsAreLoaded");
  v6 = -[TSTTableRepAccessibility tsaxTableModel](self, "tsaxTableModel");
  v26 = -[TSTTableRepAccessibility _tsaxTwoDimensionalChildrenCellsCache](self, "_tsaxTwoDimensionalChildrenCellsCache");
  v7 = (unsigned __int16)-[NSMutableArray count](v26, "count");
  v8 = var1 + (unsigned __int16)v3;
  if (v8 >= v7)
    v8 = v7;
  v25 = v8;
  if (v8 <= (unsigned __int16)v3)
  {
    v9 = 0;
  }
  else
  {
    v9 = 0;
    v24 = BYTE2(v3);
    v10 = (unsigned __int16)v3 | (BYTE2(v3) << 16);
    v23 = BYTE2(v3);
    v11 = BYTE2(v3) + WORD2(v3);
    do
    {
      v12 = -[NSMutableArray objectAtIndex:](v26, "objectAtIndex:", (unsigned __int16)v10);
      v13 = objc_msgSend(v12, "count");
      if (v11 >= v13)
        v14 = v13;
      else
        v14 = v11;
      v15 = v10;
      v16 = v24;
      if (v14 > v23)
      {
        do
        {
          v17 = v15;
          v3 = v3 & 0xFFFFFFFF00000000 | v15;
          v18 = TSTTableMergeRangeAtCellID(v6, v3);
          if ((_WORD)v18 == 0xFFFF
            || ((v18 & 0xFF0000) != 0xFF0000 ? (v20 = HIWORD(v18) == 0) : (v20 = 1),
                !v20 ? (v21 = (v18 & 0xFFFF00000000) == 0) : (v21 = 1),
                v21 || (v18 & 0xFFFFFF) == v17 && (v18 & 0xFFFFFFFF00000000) == 0x1000100000000))
          {
            if (!v9)
              v9 = (void *)objc_opt_new(NSMutableArray, v19);
            objc_msgSend(v9, "addObject:", objc_msgSend(v12, "objectAtIndex:", v16));
          }
          ++v16;
          v15 = v17 + 0x10000;
        }
        while (v14 > v16);
      }
      ++v10;
    }
    while (v25 > (unsigned __int16)v10);
  }
  return v9;
}

- (id)tsaxStringForCellID:(id)a3
{
  id result;

  result = -[TSTTableRepAccessibility tsaxTableModel](self, "tsaxTableModel");
  if (result)
    return (id)TSTTableStringForCellAtCellID(result, 0, *(unsigned int *)&a3);
  return result;
}

- (int)tsaxControlKindForCellID:(id)a3
{
  int v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_232F48;
  v5[3] = &unk_43BB08;
  v5[4] = &v6;
  -[TSTTableRepAccessibility tsaxAccessModelForCellID:usingBlock:](self, "tsaxAccessModelForCellID:usingBlock:", *(unsigned int *)&a3, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)tsaxAccessModelForCellID:(id)a3 usingBlock:(id)a4
{
  +[TSTCellAccessibility tsaxAccessModelForCellAtColumnIndex:rowIndex:tableModel:accessController:usingBlock:](TSTCellAccessibility, "tsaxAccessModelForCellAtColumnIndex:rowIndex:tableModel:accessController:usingBlock:", a3.var1, a3.var0, -[TSTTableRepAccessibility tsaxTableModel](self, "tsaxTableModel"), -[TSDCanvasAccessibility tsaxValueForKey:](-[TSDRepAccessibility tsaxCanvas](self, "tsaxCanvas"), "tsaxValueForKey:", CFSTR("accessController")), a4);
}

- (void)tsaxToggleValueOfCheckboxInCellWithModel:(id)a3
{
  _QWORD v4[6];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_233034;
  v4[3] = &unk_426E28;
  v4[4] = -[TSTTableRepAccessibility tsaxControlCellEditor](self, "tsaxControlCellEditor");
  v4[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();
}

- (void)tsaxShowPopupMenuForMultipleChoiceCellWithModel:(id)a3
{
  unsigned int v5;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = -[TSTTableRepAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxHandleShowPopupMenuForCellWithModel:", &OBJC_PROTOCOL___TSTTableRepAccessibilityExtras);
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if ((v5 & 1) == 0)
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Attempting to show popup menu for multiple choice cell on a platform that can't handle that yet."), v7, v8, v9, v10, v11, v12))abort();
    }
  }
  if (v5)
    -[TSTTableRepAccessibility tsaxHandleShowPopupMenuForCellWithModel:](self, "tsaxHandleShowPopupMenuForCellWithModel:", a3);
}

- (void)_tsaxCleanupChildren
{
  -[TSTTableRepAccessibility _tsaxCleanupTableChildrenElementsCache:](self, "_tsaxCleanupTableChildrenElementsCache:", -[TSTTableRepAccessibility _tsaxChildrenCellsCache](self, "_tsaxChildrenCellsCache"));
  -[TSTTableRepAccessibility _tsaxCleanupTableChildrenElementsCache:](self, "_tsaxCleanupTableChildrenElementsCache:", -[TSTTableRepAccessibility _tsaxColumnIndexElementsCache](self, "_tsaxColumnIndexElementsCache"));
  -[TSTTableRepAccessibility _tsaxCleanupTableChildrenElementsCache:](self, "_tsaxCleanupTableChildrenElementsCache:", -[TSTTableRepAccessibility _tsaxRowIndexElementsCache](self, "_tsaxRowIndexElementsCache"));
  -[TSTTableRepAccessibility _tsaxCleanupTableChildrenElementsCache:](self, "_tsaxCleanupTableChildrenElementsCache:", -[TSTTableRepAccessibility _tsaxColumnElementsCache](self, "_tsaxColumnElementsCache"));
  -[TSTTableRepAccessibility _tsaxCleanupTableChildrenElementsCache:](self, "_tsaxCleanupTableChildrenElementsCache:", -[TSTTableRepAccessibility _tsaxRowElementsCache](self, "_tsaxRowElementsCache"));
  -[NSMutableArray makeObjectsPerformSelector:](-[TSTTableRepAccessibility _tsaxTwoDimensionalChildrenCellsCache](self, "_tsaxTwoDimensionalChildrenCellsCache"), "makeObjectsPerformSelector:", "removeAllObjects");
  if (-[TSTTableRepAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxDidCleanupChildren", &OBJC_PROTOCOL___TSTTableRepAccessibilityExtras))-[TSTTableRepAccessibility tsaxDidCleanupChildren](self, "tsaxDidCleanupChildren");
}

- (unint64_t)tsaxColumnsCount
{
  return objc_msgSend(-[TSTTableRepAccessibility tsaxTableModel](self, "tsaxTableModel"), "tsaxUnsignedIntValueForKey:", CFSTR("numberOfColumns"));
}

- (unint64_t)tsaxRowsCount
{
  return objc_msgSend(-[TSTTableRepAccessibility tsaxTableModel](self, "tsaxTableModel"), "tsaxUnsignedIntValueForKey:", CFSTR("numberOfRows"));
}

- (NSArray)tsaxColumnElements
{
  return (NSArray *)-[TSTTableRepAccessibility _tsaxPrePopulatedColumnOrRowElementsCacheWithKind:inDirection:cacheWasRebuilt:](self, "_tsaxPrePopulatedColumnOrRowElementsCacheWithKind:inDirection:cacheWasRebuilt:", 1, 1, 0);
}

- (NSArray)tsaxRowElements
{
  return (NSArray *)-[TSTTableRepAccessibility _tsaxPrePopulatedColumnOrRowElementsCacheWithKind:inDirection:cacheWasRebuilt:](self, "_tsaxPrePopulatedColumnOrRowElementsCacheWithKind:inDirection:cacheWasRebuilt:", 1, 0, 0);
}

- (NSArray)tsaxColumnIndexElements
{
  return (NSArray *)-[TSTTableRepAccessibility _tsaxPrePopulatedColumnOrRowElementsCacheWithKind:inDirection:cacheWasRebuilt:](self, "_tsaxPrePopulatedColumnOrRowElementsCacheWithKind:inDirection:cacheWasRebuilt:", 0, 1, 0);
}

- (NSArray)tsaxRowIndexElements
{
  return (NSArray *)-[TSTTableRepAccessibility _tsaxPrePopulatedColumnOrRowElementsCacheWithKind:inDirection:cacheWasRebuilt:](self, "_tsaxPrePopulatedColumnOrRowElementsCacheWithKind:inDirection:cacheWasRebuilt:", 0, 0, 0);
}

- (NSMutableArray)_tsaxColumnIndexElementsCache
{
  return (NSMutableArray *)__TSAccessibilityGetAssociatedObject(self, &unk_54387C);
}

- (void)_tsaxSetColumnIndexElementsCache:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_54387C, a3);
}

- (NSMutableArray)_tsaxRowIndexElementsCache
{
  return (NSMutableArray *)__TSAccessibilityGetAssociatedObject(self, &unk_54387D);
}

- (void)_tsaxSetRowIndexElementsCache:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_54387D, a3);
}

- (NSMutableArray)_tsaxColumnElementsCache
{
  return (NSMutableArray *)__TSAccessibilityGetAssociatedObject(self, &unk_54387E);
}

- (void)_tsaxSetColumnElementsCache:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_54387E, a3);
}

- (NSMutableArray)_tsaxRowElementsCache
{
  return (NSMutableArray *)__TSAccessibilityGetAssociatedObject(self, &unk_54387F);
}

- (void)_tsaxSetRowElementsCache:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_54387F, a3);
}

- (id)tsaxColumnOrRowElementForCellID:(id)a3 inDirection:(int)a4
{
  return -[TSTTableRepAccessibility _tsaxColumnOrRowElementWithKind:forCellID:inDirection:](self, "_tsaxColumnOrRowElementWithKind:forCellID:inDirection:", 1, *(unsigned int *)&a3, *(_QWORD *)&a4);
}

- (id)tsaxColumnOrRowIndexElementForCellID:(id)a3 inDirection:(int)a4
{
  return -[TSTTableRepAccessibility _tsaxColumnOrRowElementWithKind:forCellID:inDirection:](self, "_tsaxColumnOrRowElementWithKind:forCellID:inDirection:", 0, *(unsigned int *)&a3, *(_QWORD *)&a4);
}

- (id)tsaxChildrenCellsInColumnOrRowForCellID:(id)a3 inDirection:(int)a4
{
  NSMutableArray *v7;
  uint64_t v8;
  NSMutableArray *v9;
  void *v10;
  id v11;
  id v12;
  unint64_t var1;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t var0;
  id v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  -[TSTTableRepAccessibility _tsaxEnsureChildrenCellsAreLoaded](self, "_tsaxEnsureChildrenCellsAreLoaded");
  v7 = -[TSTTableRepAccessibility _tsaxTwoDimensionalChildrenCellsCache](self, "_tsaxTwoDimensionalChildrenCellsCache");
  v9 = v7;
  if (a4 == 1)
  {
    v10 = (void *)objc_opt_new(NSMutableArray, v8);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v11)
    {
      v12 = v11;
      var1 = a3.var1;
      v14 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v17 = objc_msgSend(v16, "count");
          if (TSAccessibilityShouldPerformValidationChecks())
          {
            if (var1 >= (unint64_t)v17)
            {
              ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
              objc_msgSend(v16, "count");
              if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Out of bounds column index: %lu; should be less than: %lu."),
                                   v19,
                                   v20,
                                   v21,
                                   v22,
                                   v23,
                                   var1))
                goto LABEL_22;
            }
          }
          if (var1 < (unint64_t)v17)
            objc_msgSend(v10, "addObject:", objc_msgSend(v16, "objectAtIndex:", var1));
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v12);
    }
    return v10;
  }
  else
  {
    var0 = a3.var0;
    v26 = -[NSMutableArray count](v7, "count");
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      if (var0 >= (unint64_t)v26)
      {
        v27 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        -[NSMutableArray count](v9, "count");
        if (__TSAccessibilityHandleValidationErrorWithDescription(v27, 0, (uint64_t)CFSTR("Out of bounds row index: %lu; should be less than: %lu."),
                             v28,
                             v29,
                             v30,
                             v31,
                             v32,
                             var0))
LABEL_22:
          abort();
      }
    }
    if (var0 < (unint64_t)v26)
      return -[NSMutableArray objectAtIndex:](v9, "objectAtIndex:", var0);
    else
      return 0;
  }
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxCoordinatesOfFirstNonMergedCellInColumnOrRowForCellID:(id)a3 inDirection:(int)a4
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  int v9;
  unint64_t v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  BOOL v14;
  BOOL v17;
  __int16 v18;
  unsigned int v19;
  int v20;
  unint64_t v21;
  unint64_t v22;
  BOOL v23;
  BOOL v26;
  char v27;

  v5 = *(_QWORD *)&a3.var0;
  v6 = (unint64_t)self;
  v7 = *(_QWORD *)&a3.var0 >> 24;
  v8 = -[TSTTableRepAccessibility tsaxTableModel](self, "tsaxTableModel");
  v9 = (_DWORD)v7 << 24;
  if (a4 == 1)
  {
    v10 = v5 >> 16;
    v11 = (unsigned __int16)objc_msgSend((id)v6, "tsaxRowsCount");
    if (v11)
    {
      LODWORD(v5) = 1;
      while (1)
      {
        v6 = v6 & 0xFFFFFFFF00000000 | ((_DWORD)v5 - 1) | v9 & 0xFF00FFFF | (v10 << 16);
        v12 = TSTTableMergeRangeAtCellID(v8, v6);
        if ((_WORD)v12 == 0xFFFF)
          break;
        v13 = v12 & 0xFFFF00000000;
        v14 = (v12 & 0xFF0000) == 0xFF0000 || HIWORD(v12) == 0;
        if (v14 || v13 == 0)
          break;
        v17 = v13 == 0x100000000 && v10 == BYTE2(v12);
        v18 = v5 + 1;
        if (v11 > v5)
        {
          LODWORD(v5) = v5 + 1;
          if (!v17)
            continue;
        }
        if (!v17)
          goto LABEL_42;
        LOWORD(v5) = v18 - 1;
        return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)(v9 & 0xFF000000 | (v10 << 16) | (unsigned __int16)v5);
      }
    }
    else
    {
LABEL_42:
      LOWORD(v5) = 0;
    }
  }
  else
  {
    v19 = objc_msgSend((id)v6, "tsaxColumnsCount");
    if (v19)
    {
      v20 = 0;
      LODWORD(v10) = 1;
      while (1)
      {
        v6 = v6 & 0xFFFFFFFF00000000 | v20 | v9 | (unsigned __int16)v5;
        v21 = TSTTableMergeRangeAtCellID(v8, v6);
        if ((_WORD)v21 == 0xFFFF)
          break;
        v22 = HIWORD(v21);
        v23 = (v21 & 0xFF0000) == 0xFF0000 || v22 == 0;
        if (v23 || (v21 & 0xFFFF00000000) == 0)
          break;
        v26 = v22 == 1 && (unsigned __int16)v5 == (unsigned __int16)v21;
        v27 = v10 + 1;
        if (v19 > v10)
        {
          v20 += 0x10000;
          LODWORD(v10) = v10 + 1;
          if (!v26)
            continue;
        }
        if (!v26)
          goto LABEL_43;
        LOBYTE(v10) = v27 - 1;
        return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)(v9 & 0xFF000000 | (v10 << 16) | (unsigned __int16)v5);
      }
    }
    else
    {
LABEL_43:
      LOBYTE(v10) = 0;
    }
  }
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)(v9 & 0xFF000000 | (v10 << 16) | (unsigned __int16)v5);
}

- (id)_tsaxColumnOrRowElementWithKind:(int)a3 forCellID:(id)a4 inDirection:(int)a5
{
  unint64_t var1;
  NSArray *v7;
  NSArray *v8;
  NSUInteger v9;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;

  if (a5 == 1)
    var1 = a4.var1;
  else
    var1 = a4.var0;
  if (a3 == 1)
  {
    if (a5 == 1)
      v7 = -[TSTTableRepAccessibility tsaxColumnElements](self, "tsaxColumnElements");
    else
      v7 = -[TSTTableRepAccessibility tsaxRowElements](self, "tsaxRowElements");
    goto LABEL_13;
  }
  if (!a3)
  {
    if (a5 == 1)
      v7 = -[TSTTableRepAccessibility tsaxColumnIndexElements](self, "tsaxColumnIndexElements");
    else
      v7 = -[TSTTableRepAccessibility tsaxRowIndexElements](self, "tsaxRowIndexElements");
LABEL_13:
    v8 = v7;
    goto LABEL_14;
  }
  v8 = 0;
LABEL_14:
  v9 = -[NSArray count](v8, "count");
  if (TSAccessibilityShouldPerformValidationChecks() && var1 >= v9)
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    v16 = &stru_43D7D8;
    if (!a3)
      v16 = CFSTR("index ");
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Table column or row %@element at index %lu is out of bounds; number of elements: %lu"),
                         v11,
                         v12,
                         v13,
                         v14,
                         v15,
                         (uint64_t)v16))
      abort();
  }
  if (var1 < v9)
    return -[NSArray objectAtIndex:](v8, "objectAtIndex:", var1);
  else
    return 0;
}

- (id)tsaxColumnOrRowNameForCellID:(id)a3 inDirection:(int)a4 withComponents:(int)a5
{
  uint64_t v6;
  id v9;
  NSMutableString *v10;
  id v11;
  id v12;
  BOOL v13;
  int v14;
  NSMutableString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[7];
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v24;
  _QWORD v25[7];
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  uint64_t v32;
  _QWORD v33[5];

  v6 = *(_QWORD *)&a4;
  v9 = -[TSTTableRepAccessibility tsaxTableModel](self, "tsaxTableModel");
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2810000000;
  v33[3] = "";
  v33[4] = 0;
  if ((_DWORD)v6 == 1)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3052000000;
    v30 = sub_233974;
    v31 = sub_233984;
    v32 = 0;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_233990;
    v25[3] = &unk_43BB30;
    v25[4] = v9;
    v25[5] = &v27;
    v26 = a3;
    v25[6] = v33;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v25))
      abort();
  }
  else
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3052000000;
    v30 = sub_233974;
    v31 = sub_233984;
    v32 = 0;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_2339D4;
    v23[3] = &unk_43BB30;
    v23[4] = v9;
    v23[5] = &v27;
    v24 = a3;
    v23[6] = v33;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v23))
      abort();
  }
  v10 = (NSMutableString *)v28[5];
  _Block_object_dispose(&v27, 8);
  v11 = -[NSMutableString length](v10, "length");
  v12 = v11;
  if (a5)
    v13 = 0;
  else
    v13 = v11 == 0;
  v14 = v13;
  if (a5 == 1 || v14)
  {
    v15 = -[TSTTableRepAccessibility tsaxColumnOrRowFullIndexDescriptionForCellID:inDirection:](self, "tsaxColumnOrRowFullIndexDescriptionForCellID:inDirection:", *(unsigned int *)&a3, v6);
    if (v12)
      v15 = __TSAccessibilityStringForVariables(1, v10, v16, v17, v18, v19, v20, v21, (uint64_t)v15);
    v10 = v15;
  }
  _Block_object_dispose(v33, 8);
  return v10;
}

- (id)tsaxColumnOrRowIndexDescriptionForCellID:(id)a3 inDirection:(int)a4
{
  uint64_t v5;

  if (a4 != 1)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a3.var0 + 1, v5);
  if (a3.var1 > 0x19u)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%c%c"), (a3.var1 / 0x1Au) | 0x40, (a3.var1 % 0x1Au + 65));
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%c"), (a3.var1 + 65), v5);
}

- (id)tsaxColumnOrRowFullIndexDescriptionForCellID:(id)a3 inDirection:(int)a4
{
  id v5;
  const __CFString *v6;

  v5 = -[TSTTableRepAccessibility tsaxColumnOrRowIndexDescriptionForCellID:inDirection:](self, "tsaxColumnOrRowIndexDescriptionForCellID:inDirection:", *(unsigned int *)&a3);
  if (a4 == 1)
    v6 = CFSTR("column.index %@");
  else
    v6 = CFSTR("row.index %@");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)v6), v5);
}

- (id)_tsaxPrePopulatedColumnOrRowElementsCacheWithKind:(int)a3 inDirection:(int)a4 cacheWasRebuilt:(BOOL *)a5
{
  uint64_t v6;
  char **v9;
  BOOL v10;
  char *v11;
  char **v12;
  char **v13;
  char **v14;
  char *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  char *v21;
  __objc2_class **v22;
  __objc2_class **v23;
  objc_class *v24;
  NSString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int ShouldPerformValidationChecks;
  NSString *v32;
  __objc2_prot *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  TSTTableRepAccessibility *v41;
  TSTTableRepAccessibility *v42;
  BOOL *v44;
  int ShouldCrashOnValidationErrorAfterLaunch;
  int v46;

  v6 = *(_QWORD *)&a4;
  if (a3 == 1)
  {
    v14 = &selRef__tsaxColumnElementsCache;
    v10 = a4 == 1;
    if (a4 != 1)
      v14 = &selRef__tsaxRowElementsCache;
    v11 = *v14;
    v12 = &selRef__tsaxSetColumnElementsCache_;
    v13 = &selRef__tsaxSetRowElementsCache_;
  }
  else
  {
    if (a3)
    {
      v15 = 0;
      v11 = 0;
      goto LABEL_13;
    }
    v9 = &selRef__tsaxColumnIndexElementsCache;
    v10 = a4 == 1;
    if (a4 != 1)
      v9 = &selRef__tsaxRowIndexElementsCache;
    v11 = *v9;
    v12 = &selRef__tsaxSetColumnIndexElementsCache_;
    v13 = &selRef__tsaxSetRowIndexElementsCache_;
  }
  if (!v10)
    v12 = v13;
  v15 = *v12;
LABEL_13:
  v16 = -[TSTTableRepAccessibility performSelector:](self, "performSelector:", v11);
  if ((_DWORD)v6 == 1)
    v17 = -[TSTTableRepAccessibility tsaxColumnsCount](self, "tsaxColumnsCount");
  else
    v17 = -[TSTTableRepAccessibility tsaxRowsCount](self, "tsaxRowsCount");
  v18 = v17;
  if (v16 && objc_msgSend(v16, "count") == v17)
    return v16;
  v19 = objc_msgSend(v16, "mutableCopy");
  v21 = (char *)objc_msgSend(v19, "count");
  if (v16)
  {
    objc_msgSend(v16, "removeAllObjects");
  }
  else
  {
    v16 = (id)objc_opt_new(NSMutableArray, v20);
    -[TSTTableRepAccessibility performSelector:withObject:](self, "performSelector:withObject:", v15, v16);

  }
  v44 = a5;
  if (a3 == 1)
  {
    v22 = off_425240;
    v23 = off_425230;
    goto LABEL_25;
  }
  if (!a3)
  {
    v22 = &off_425248;
    v23 = off_425238;
LABEL_25:
    if ((_DWORD)v6 == 1)
      v22 = v23;
    v24 = (objc_class *)objc_opt_class(*v22);
    goto LABEL_29;
  }
  v24 = 0;
LABEL_29:
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if ((-[objc_class conformsToProtocol:](v24, "conformsToProtocol:", &OBJC_PROTOCOL___TSTTableChildAccessibilityElement) & 1) == 0)
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      v25 = NSStringFromClass(v24);
      NSStringFromProtocol((Protocol *)&OBJC_PROTOCOL___TSTTableChildAccessibilityElement);
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("%@ does not conform to protocol %@."), v26, v27, v28, v29, v30, (uint64_t)v25))goto LABEL_62;
    }
  }
  ShouldPerformValidationChecks = TSAccessibilityShouldPerformValidationChecks();
  if ((_DWORD)v6 == 1)
  {
    if (!ShouldPerformValidationChecks
      || (-[objc_class conformsToProtocol:](v24, "conformsToProtocol:", &OBJC_PROTOCOL___TSTTableColumnAccessibilityElement) & 1) != 0)
    {
      goto LABEL_40;
    }
    v46 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    v32 = NSStringFromClass(v24);
    v33 = &OBJC_PROTOCOL___TSTTableColumnAccessibilityElement;
  }
  else
  {
    if (!ShouldPerformValidationChecks
      || (-[objc_class conformsToProtocol:](v24, "conformsToProtocol:", &OBJC_PROTOCOL___TSTTableRowAccessibilityElement) & 1) != 0)
    {
      goto LABEL_40;
    }
    v46 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    v32 = NSStringFromClass(v24);
    v33 = &OBJC_PROTOCOL___TSTTableRowAccessibilityElement;
  }
  NSStringFromProtocol((Protocol *)v33);
  if (__TSAccessibilityHandleValidationErrorWithDescription(v46, 0, (uint64_t)CFSTR("%@ does not conform to protocol %@."), v34, v35, v36, v37, v38, (uint64_t)v32))LABEL_62:abort();
LABEL_40:
  if (v18)
  {
    v39 = 0;
    while (v21)
    {
      v40 = objc_msgSend(v19, "objectAtIndex:", 0);
      objc_msgSend(v19, "removeObjectAtIndex:", 0);
      --v21;
LABEL_58:
      objc_msgSend(v16, "addObject:", v40);

      if (v18 == (id)++v39)
        goto LABEL_59;
    }
    if (a3 == 1)
    {
      if (-[TSTTableRepAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxAlternateParentForColumnOrRowElementAtIndex:inDirection:", &OBJC_PROTOCOL___TSTTableRepAccessibilityExtras))
      {
        v41 = (TSTTableRepAccessibility *)-[TSTTableRepAccessibility tsaxAlternateParentForColumnOrRowElementAtIndex:inDirection:](self, "tsaxAlternateParentForColumnOrRowElementAtIndex:inDirection:", v39, v6);
        goto LABEL_51;
      }
    }
    else if (!a3
           && -[TSTTableRepAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxAlternateParentForColumnOrRowIndexElementAtIndex:inDirection:", &OBJC_PROTOCOL___TSTTableRepAccessibilityExtras))
    {
      v41 = (TSTTableRepAccessibility *)-[TSTTableRepAccessibility tsaxAlternateParentForColumnOrRowIndexElementAtIndex:inDirection:](self, "tsaxAlternateParentForColumnOrRowIndexElementAtIndex:inDirection:", v39, v6);
LABEL_51:
      if (v41)
        v42 = v41;
      else
        v42 = self;
      v40 = objc_msgSend([v24 alloc], "initWithAccessibilityParent:", v42);
      objc_msgSend(v40, "setTableRep:", self);
      if ((_DWORD)v6 == 1)
        objc_msgSend(v40, "setColumnIndex:", v39);
      else
        objc_msgSend(v40, "setRowIndex:", (unsigned __int16)v39);
      v21 = 0;
      goto LABEL_58;
    }
    v41 = 0;
    goto LABEL_51;
  }
LABEL_59:
  -[TSTTableRepAccessibility _tsaxCleanupTableChildrenElementsCache:](self, "_tsaxCleanupTableChildrenElementsCache:", v19);

  if (v44)
    *v44 = 1;
  return v16;
}

- (void)_tsaxCleanupTableChildrenElementsCache:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(a3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "setParent:", 0);
        objc_msgSend(v8, "setTableRep:", 0);
      }
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  objc_msgSend(a3, "removeAllObjects");
}

- (TSTCellRegionAccessibility)tsaxSelectionRegion
{
  void *v3;
  TSTCellRegionAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSTCellRegionAccessibility);
  result = (TSTCellRegionAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("selectionRegion")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSTTableSelectionAccessibility)tsaxTableSelection
{
  TSTTableEditorAccessibility *v2;
  TSTTableSelectionAccessibility *result;
  void *v4;
  char v5;

  v2 = -[TSTTableRepAccessibility tsaxTableEditor](self, "tsaxTableEditor");
  if (-[TSTTableEditorAccessibility tsaxHasMultipleTableInfos](v2, "tsaxHasMultipleTableInfos"))
    return 0;
  v5 = 0;
  v4 = (void *)objc_opt_class(TSTTableSelectionAccessibility);
  result = (TSTTableSelectionAccessibility *)__TSAccessibilityCastAsSafeCategory(v4, (uint64_t)objc_msgSend(-[TSTTableEditorAccessibility tsaxValueForKey:](v2, "tsaxValueForKey:", CFSTR("editingState")), "tsaxValueForKey:", CFSTR("selection")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSTTableCellAccessibilityElement)tsaxSelectionAnchorCellElement
{
  unsigned int v3;

  v3 = -[TSTTableSelectionAccessibility tsaxAnchorCellID](-[TSTTableRepAccessibility tsaxTableSelection](self, "tsaxTableSelection"), "tsaxAnchorCellID");
  if ((_WORD)v3 == 0xFFFF || (v3 & 0xFF0000) == 0xFF0000)
    return 0;
  else
    return (TSTTableCellAccessibilityElement *)-[TSTTableRepAccessibility tsaxChildCellForCellID:](self, "tsaxChildCellForCellID:");
}

- (NSArray)tsaxSelectedCells
{
  NSArray *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = sub_233974;
  v9 = sub_233984;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2341FC;
  v4[3] = &unk_43BB58;
  v4[4] = self;
  v4[5] = &v5;
  -[TSTTableRepAccessibility tsaxEnumerateSelectedCellsIncludingEmptyCells:includeHiddenCells:usingBlock:](self, "tsaxEnumerateSelectedCellsIncludingEmptyCells:includeHiddenCells:usingBlock:", 1, 0, v4);
  v2 = (NSArray *)(id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)tsaxChildCellIsSelectedAtCellID:(id)a3
{
  char v3;
  _QWORD v5[5];
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_23431C;
  v5[3] = &unk_43BB80;
  v6 = a3;
  v5[4] = &v7;
  -[TSTTableRepAccessibility tsaxEnumerateSelectedCellsIncludingEmptyCells:includeHiddenCells:usingBlock:](self, "tsaxEnumerateSelectedCellsIncludingEmptyCells:includeHiddenCells:usingBlock:", 1, 0, v5);
  v3 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)tsaxEnumerateSelectedCellsIncludingEmptyCells:(BOOL)a3 includeHiddenCells:(BOOL)a4 usingBlock:(id)a5
{
  -[TSTTableSelectionAccessibility tsaxEnumerateSelectedCellsInTableModel:includeEmptyCells:includeHiddenCells:usingBlock:](-[TSTTableRepAccessibility tsaxTableSelection](self, "tsaxTableSelection"), "tsaxEnumerateSelectedCellsInTableModel:includeEmptyCells:includeHiddenCells:usingBlock:", -[TSTTableRepAccessibility tsaxTableModel](self, "tsaxTableModel"), a3, a4, a5);
}

- ($0E7DCC040F5CEAF2787150A9C1D66156)tsaxRangeOfSelectedColumnsOrRows
{
  TSTTableSelectionAccessibility *v2;
  unsigned int v3;
  unsigned int v4;
  $0E7DCC040F5CEAF2787150A9C1D66156 v5;
  unint64_t v6;
  uint64_t var0;
  uint64_t v8;

  v2 = -[TSTTableRepAccessibility tsaxTableSelection](self, "tsaxTableSelection");
  v3 = -[TSTTableSelectionAccessibility tsaxSelectionType](v2, "tsaxSelectionType");
  if (v3 - 1 > 1)
  {
    v6 = 0;
    v8 = 16711680;
    var0 = 0xFFFFLL;
  }
  else
  {
    v4 = v3;
    v5 = -[TSTCellRegionAccessibility tsaxBoundingCellRange](-[TSTTableSelectionAccessibility tsaxCellRegion](v2, "tsaxCellRegion"), "tsaxBoundingCellRange");
    v6 = *(_QWORD *)&v5 & 0xFFFF000000000000;
    var0 = 0xFFFFLL;
    if (v4 == 2)
    {
      v8 = *(_QWORD *)&v5 & 0xFF0000;
    }
    else
    {
      var0 = v5.var0.var0;
      v8 = 16711680;
    }
    if (v4 == 2)
      v6 = *(_QWORD *)&v5 & 0xFFFF00000000;
  }
  return ($0E7DCC040F5CEAF2787150A9C1D66156)(v8 | var0 | v6);
}

- (BOOL)tsaxColumnOrRowIsSelectedAtCellID:(id)a3 inDirection:(int)a4
{
  TSTTableSelectionAccessibility *v6;
  unsigned int v7;
  unsigned int v8;
  BOOL result;
  $0E7DCC040F5CEAF2787150A9C1D66156 v10;
  BOOL v11;

  v6 = -[TSTTableRepAccessibility tsaxTableSelection](self, "tsaxTableSelection");
  v7 = -[TSTTableSelectionAccessibility tsaxSelectionType](v6, "tsaxSelectionType");
  v8 = v7;
  if (a4 == 1 && v7 == 2 || (result = 0, !a4) && v8 == 1)
  {
    v10 = -[TSTCellRegionAccessibility tsaxBoundingCellRange](-[TSTTableSelectionAccessibility tsaxCellRegion](v6, "tsaxCellRegion"), "tsaxBoundingCellRange");
    if (a4 == 1)
      v11 = v10.var0.var1 > a3.var1 || a3.var1 >= v10.var0.var1 + v10.var1.var0;
    else
      v11 = v10.var0.var0 > a3.var0 || a3.var0 >= *(_DWORD *)&v10.var1.var1 + v10.var0.var0;
    return !v11;
  }
  return result;
}

- (TSWPRepAccessibility)tsaxContainedTextEditingRep
{
  void *v3;
  TSWPRepAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSWPRepAccessibility);
  result = (TSWPRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("containedTextEditingRep")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSTTableCellTextEditingControllerAccessibility)tsaxContainedTextEditor
{
  void *v3;
  TSTTableCellTextEditingControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSTTableCellTextEditingControllerAccessibility);
  result = (TSTTableCellTextEditingControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)objc_msgSend(-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("masterLayout")), "tsaxValueForKey:", CFSTR("containedTextEditor")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)tsaxTableModel
{
  return -[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("tableModel"));
}

- (id)tsaxTableLayout
{
  return -[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("tableLayout"));
}

- (id)tsaxTableChrome
{
  return -[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("tableChrome"));
}

- (BOOL)tsaxIsChromeVisible
{
  return TSTLayoutGetTabsVisible(-[TSTTableRepAccessibility tsaxTableLayout](self, "tsaxTableLayout"));
}

- (TSTTableEditorAccessibility)tsaxTableEditor
{
  void *v3;
  TSTTableEditorAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSTTableEditorAccessibility);
  result = (TSTTableEditorAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("tableEditor")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (NSString)tsaxTableName
{
  return (NSString *)objc_msgSend(-[TSTTableRepAccessibility tsaxTableModel](self, "tsaxTableModel"), "tsaxValueForKey:", CFSTR("tableName"));
}

- (int)tsaxEditingMode
{
  return -[TSTTableEditorAccessibility tsaxEditingMode](-[TSTTableRepAccessibility tsaxTableEditor](self, "tsaxTableEditor"), "tsaxEditingMode");
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)tsaxEditingCellID
{
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  const char *v8;
  int v9;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2810000000;
  v8 = "";
  v9 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_234730;
  v4[3] = &unk_42BF18;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();
  v2 = ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)*((_DWORD *)v6 + 8);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (unsigned)tsaxNumberOfHeaderColumns
{
  unsigned __int8 v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  __int16 v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_234818;
  v4[3] = &unk_42BF18;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (unsigned)tsaxNumberOfHeaderRows
{
  unsigned __int16 v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  __int16 v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2348F8;
  v4[3] = &unk_42BF18;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();
  v2 = *((_WORD *)v6 + 12);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (TSTTableControlCellEditorAccessibility)tsaxControlCellEditor
{
  uint64_t v2;
  void *v3;
  TSTTableControlCellEditorAccessibility *result;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_233974;
  v10 = sub_233984;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_234A18;
  v5[3] = &unk_42BF18;
  v5[4] = -[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController");
  v5[5] = &v6;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v2 = v7[5];
  _Block_object_dispose(&v6, 8);
  LOBYTE(v6) = 0;
  v3 = (void *)objc_opt_class(TSTTableControlCellEditorAccessibility);
  result = (TSTTableControlCellEditorAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, v2, 1, &v6);
  if ((_BYTE)v6)
    abort();
  return result;
}

- (CGRect)tsaxUnscaledCanvasFrameForCellRange:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  ((void (*)(_QWORD, _QWORD))TSTLayoutGetCanvasFrameForRange)(-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("tableLayout")), a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)tsaxDeviceBoundsForCellRange:(id)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGAffineTransform v14;
  _QWORD v15[7];
  CGAffineTransform v16;
  __int128 v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  v16.a = 0.0;
  *(_QWORD *)&v16.b = &v16;
  *(_QWORD *)&v16.c = 0x4010000000;
  *(_QWORD *)&v16.d = "";
  *(_OWORD *)&v16.tx = 0u;
  v17 = 0u;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_234BEC;
  v15[3] = &unk_428E60;
  v15[4] = self;
  v15[5] = &v16;
  v15[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v15))
    abort();
  x = *(double *)(*(_QWORD *)&v16.b + 32);
  y = *(double *)(*(_QWORD *)&v16.b + 40);
  width = *(double *)(*(_QWORD *)&v16.b + 48);
  height = *(double *)(*(_QWORD *)&v16.b + 56);
  _Block_object_dispose(&v16, 8);
  objc_msgSend(-[TSDCanvasAccessibility tsaxCanvasContainerView](-[TSDRepAccessibility tsaxCanvas](self, "tsaxCanvas"), "tsaxCanvasContainerView"), "tsaxScreenScale");
  if (v8 > 0.0)
  {
    v9 = v8;
    if (-[TSDRepAccessibility tsaxIsInInteractiveCanvas](self, "tsaxIsInInteractiveCanvas"))
    {
      memset(&v16, 0, sizeof(v16));
      CGAffineTransformMakeScale(&v16, 1.0 / v9, 1.0 / v9);
      v14 = v16;
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      v19 = CGRectApplyAffineTransform(v18, &v14);
      x = v19.origin.x;
      y = v19.origin.y;
      width = v19.size.width;
      height = v19.size.height;
    }
  }
  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)tsaxConvertBoundsToTableLayoutUnscaledRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double ViewScale;
  CGAffineTransform v8;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ViewScale = TSTLayoutGetViewScale(-[TSTTableRepAccessibility tsaxTableLayout](self, "tsaxTableLayout"));
  CGAffineTransformMakeScale(&v8, 1.0 / ViewScale, 1.0 / ViewScale);
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  return CGRectApplyAffineTransform(v9, &v8);
}

- (void)_tsaxPerformGestureOnCellForID:(id)a3 withSafeBlock:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[9];

  v6 = -[TSTTableRepAccessibility tsaxTableLayout](self, "tsaxTableLayout");
  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_234D18;
    v10[3] = &unk_43BBA8;
    v10[4] = a4;
    v10[5] = TSTLayoutGetCanvasFrameForRange(v6, *(unsigned int *)&a3 | 0x1000100000000);
    v10[6] = v7;
    v10[7] = v8;
    v10[8] = v9;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v10))
      abort();
  }
}

- (void)tsaxSelectColumnOrRowForCellID:(id)a3 inDirection:(int)a4
{
  uint64_t v4;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  _QWORD v17[7];
  CGRect v18;
  CGRect v19;

  v4 = *(_QWORD *)&a4;
  if (-[TSTTableRepAccessibility tsaxIsChromeVisible](self, "tsaxIsChromeVisible"))
  {
    v7 = -[TSTTableRepAccessibility tsaxColumnOrRowIndexElementForCellID:inDirection:](self, "tsaxColumnOrRowIndexElementForCellID:inDirection:", *(unsigned int *)&a3, v4);
    if (v7)
    {
      objc_msgSend(v7, "frameInUnscaledCanvas");
      -[TSDInteractiveCanvasControllerAccessibility tsaxConvertBoundsToUnscaledRect:](-[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxConvertBoundsToUnscaledRect:", v8, v9, v10, v11);
      x = v18.origin.x;
      y = v18.origin.y;
      width = v18.size.width;
      height = v18.size.height;
      MidX = CGRectGetMidX(v18);
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_234E74;
      v17[3] = &unk_43BBD0;
      v17[4] = self;
      *(CGFloat *)&v17[5] = MidX;
      v17[6] = CGRectGetMidY(v19);
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v17))
        abort();
    }
  }
}

- (void)tsaxSelectCellForID:(id)a3
{
  TSTTableEditorAccessibility *v5;
  _QWORD v6[6];
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v7;

  v5 = -[TSTTableRepAccessibility tsaxTableEditor](self, "tsaxTableEditor");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_234EFC;
  v6[3] = &unk_43BBF8;
  v7 = a3;
  v6[4] = self;
  v6[5] = v5;
  if (v5)
    -[TSTTableEditorAccessibility tsaxPerformBlockAffectingTableSelection:](v5, "tsaxPerformBlockAffectingTableSelection:", v6);
  else
    sub_234EFC((uint64_t)v6);
}

- (void)tsaxBeginEditingCellForID:(id)a3 editingSelection:(int)a4
{
  id v7;
  _QWORD v8[6];
  int v9;
  $2F2D2FE54C0B9D2AA4EBD8788136C7D0 v10;
  _QWORD v11[5];

  -[TSTTableRepAccessibility tsaxEndEditingCurrentEditingCell](self, "tsaxEndEditingCurrentEditingCell");
  v7 = -[TSTTableRepAccessibility tsaxTableModel](self, "tsaxTableModel");
  if ((objc_msgSend(+[TSTConfigurationAccessibility tsaxSharedTableConfiguration](TSTConfigurationAccessibility, "tsaxSharedTableConfiguration"), "tsaxSupportsContainedTextEditing") & 1) != 0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_235108;
    v8[3] = &unk_42BEF0;
    v9 = a4;
    v10 = a3;
    v8[4] = self;
    v8[5] = v7;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v8))
      abort();
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_235100;
    v11[3] = &unk_43BC20;
    v11[4] = self;
    -[TSTTableRepAccessibility _tsaxPerformGestureOnCellForID:withSafeBlock:](self, "_tsaxPerformGestureOnCellForID:withSafeBlock:", *(unsigned int *)&a3, v11);
  }
}

- (void)tsaxEndEditingCurrentEditingCell
{
  TSTTableCellTextEditingControllerAccessibility *v3;
  _QWORD v4[5];

  if ((~-[TSTTableRepAccessibility tsaxEditingCellID](self, "tsaxEditingCellID") & 0xFFFFFF) != 0)
  {
    v3 = -[TSTTableRepAccessibility tsaxContainedTextEditor](self, "tsaxContainedTextEditor");
    if (v3)
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_23526C;
      v4[3] = &unk_426DD0;
      v4[4] = v3;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v4))
        abort();
    }
  }
}

- (void)tsaxPerformCleanupTasksPriorToRemovalFromCanvas
{
  objc_super v3;
  void (*v4[5])(_QWORD);

  v4[0] = (void (*)(_QWORD))_NSConcreteStackBlock;
  v4[1] = (void (*)(_QWORD))3221225472;
  v4[2] = (void (*)(_QWORD))sub_2352EC;
  v4[3] = (void (*)(_QWORD))&unk_426DD0;
  v4[4] = (void (*)(_QWORD))self;
  TSAccessibilityPerformBlockOnMainThread(v4);
  v3.receiver = self;
  v3.super_class = (Class)TSTTableRepAccessibility;
  -[TSDRepAccessibility tsaxPerformCleanupTasksPriorToRemovalFromCanvas](&v3, "tsaxPerformCleanupTasksPriorToRemovalFromCanvas");
}

- (void)updateChildrenFromLayout
{
  unsigned int v3;
  TSWPRepAccessibility *v4;
  TSWPRepAccessibility *v5;
  objc_super v6;

  v3 = -[TSTTableRepAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxDidBeginEditingTextInCellWithContainedTextEditingRep:", &OBJC_PROTOCOL___TSTTableRepAccessibilityExtras);
  if (v3)
    v4 = -[TSTTableRepAccessibility tsaxContainedTextEditingRep](self, "tsaxContainedTextEditingRep");
  else
    v4 = 0;
  v6.receiver = self;
  v6.super_class = (Class)TSTTableRepAccessibility;
  -[TSTTableRepAccessibility updateChildrenFromLayout](&v6, "updateChildrenFromLayout");
  if (v3)
  {
    v5 = -[TSTTableRepAccessibility tsaxContainedTextEditingRep](self, "tsaxContainedTextEditingRep");
    if (v4 != v5)
    {
      if (v5)
        -[TSTTableRepAccessibility tsaxDidBeginEditingTextInCellWithContainedTextEditingRep:](self, "tsaxDidBeginEditingTextInCellWithContainedTextEditingRep:", v5);
    }
  }

}

- (NSMutableArray)_tsaxCellsRowsAndColumnsCache
{
  return (NSMutableArray *)__TSAccessibilityGetAssociatedObject(self, &unk_5439F1);
}

- (void)_tsaxSetCellsRowsAndColumnsCache:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_5439F1, a3);
}

- (BOOL)_tsaxNeedsColumnAndRowIndexElements
{
  _BOOL4 v3;

  v3 = -[TSTTableRepAccessibility tsaxIsChromeVisible](self, "tsaxIsChromeVisible");
  if (v3)
    LOBYTE(v3) = -[TSDRepAccessibility tsaxIsSelected](self, "tsaxIsSelected");
  return v3;
}

- (NSMutableArray)tsaxHeaderElementsCache
{
  return (NSMutableArray *)__TSAccessibilityGetAssociatedObject(self, &unk_5439F2);
}

- (void)tsaxSetHeaderElementsCache:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_5439F2, a3);
}

- (void)tsaxMoveToColumnOrRowForCellID:(id)a3 inDirection:(int)a4
{
  id v4;

  v4 = -[TSTTableRepAccessibility tsaxColumnOrRowIndexElementForCellID:inDirection:](self, "tsaxColumnOrRowIndexElementForCellID:inDirection:", *(unsigned int *)&a3, *(_QWORD *)&a4);
  if (v4)
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, v4);
}

- (void)tsaxWillSelectCellForID:(id)a3
{
  -[TSDInteractiveCanvasControllerAccessibility endEditing](-[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController", *(_QWORD *)&a3.var0), "endEditing");
}

- (void)tsaxDidCleanupChildren
{
  -[NSMutableArray removeAllObjects](-[TSTTableRepAccessibility _tsaxCellsRowsAndColumnsCache](self, "_tsaxCellsRowsAndColumnsCache"), "removeAllObjects");
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityElements
{
  unsigned int v3;
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  NSMutableArray *v10;
  unint64_t v11;
  NSArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  int v16;
  void *i;
  uint64_t v18;
  unsigned __int16 v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  char v25;
  _BYTE v26[128];

  v25 = 0;
  v3 = -[TSTTableRepAccessibility _tsaxNeedsColumnAndRowIndexElements](self, "_tsaxNeedsColumnAndRowIndexElements");
  if (v3)
  {
    v4 = -[TSTTableRepAccessibility _tsaxPrePopulatedColumnOrRowElementsCacheWithKind:inDirection:cacheWasRebuilt:](self, "_tsaxPrePopulatedColumnOrRowElementsCacheWithKind:inDirection:cacheWasRebuilt:", 0, 1, &v25);
    v5 = -[TSTTableRepAccessibility _tsaxPrePopulatedColumnOrRowElementsCacheWithKind:inDirection:cacheWasRebuilt:](self, "_tsaxPrePopulatedColumnOrRowElementsCacheWithKind:inDirection:cacheWasRebuilt:", 0, 0, &v25);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = -[TSTTableRepAccessibility tsaxRowsCount](self, "tsaxRowsCount");
  v7 = -[TSTTableRepAccessibility tsaxColumnsCount](self, "tsaxColumnsCount");
  v8 = -[TSTTableRepAccessibility _tsaxCellsRowsAndColumnsCache](self, "_tsaxCellsRowsAndColumnsCache");
  v10 = v8;
  if (v25 || !v8)
  {
    if (!v8)
    {
      v10 = (NSMutableArray *)objc_opt_new(NSMutableArray, v9);
      -[TSTTableRepAccessibility _tsaxSetCellsRowsAndColumnsCache:](self, "_tsaxSetCellsRowsAndColumnsCache:", v10);

      if (!v3)
      {
LABEL_13:
        v12 = -[TSTTableRepAccessibility tsaxChildrenCells](self, "tsaxChildrenCells");
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v22;
          v16 = 0xFFFF;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(_QWORD *)v22 != v15)
                objc_enumerationMutation(v12);
              v18 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
              if (v3)
              {
                v19 = (unsigned __int16)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "cellID");
                if (v16 != v19)
                {
                  v16 = v19;
                  if (v6 > v19)
                    -[NSMutableArray addObject:](v10, "addObject:", objc_msgSend(v5, "objectAtIndex:", v19));
                }
              }
              -[NSMutableArray addObject:](v10, "addObject:", v18);
            }
            v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
          }
          while (v14);
        }
        return v10;
      }
LABEL_12:
      -[NSMutableArray addObjectsFromArray:](v10, "addObjectsFromArray:", v4);
      goto LABEL_13;
    }
LABEL_11:
    -[NSMutableArray removeAllObjects](v10, "removeAllObjects");
    if (!v3)
      goto LABEL_13;
    goto LABEL_12;
  }
  v11 = v7 + v6;
  if (!v3)
    v11 = 0;
  if (-[NSMutableArray count](v8, "count") != (id)(v11 + v7 * v6))
    goto LABEL_11;
  return v10;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  unsigned int v9;
  id result;
  unsigned int v11;

  -[TSDInteractiveCanvasControllerAccessibility tsaxConvertBoundsToUnscaledPoint:](-[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController", a4), "tsaxConvertBoundsToUnscaledPoint:", a3.x, a3.y);
  v6 = v5;
  v8 = v7;
  v9 = -[TSTTableRepAccessibility tsaxCellIDForCanvasPoint:](self, "tsaxCellIDForCanvasPoint:");
  if (!-[TSTTableRepAccessibility _tsaxNeedsColumnAndRowIndexElements](self, "_tsaxNeedsColumnAndRowIndexElements")
    || ((unsigned __int16)v9 != 0xFFFF || BYTE2(v9) == 255) && ((unsigned __int16)v9 == 0xFFFF || BYTE2(v9) != 255)
    || (result = -[TSTTableRepAccessibility tsaxColumnOrRowIndexElementForCellID:inDirection:](self, "tsaxColumnOrRowIndexElementForCellID:inDirection:", v9 & 0xFF000000 | (BYTE2(v9) << 16) | (unsigned __int16)v9, BYTE2(v9) != 255)) == 0)
  {
    v11 = -[TSTTableRepAccessibility tsaxClosestCellIDForCanvasPoint:](self, "tsaxClosestCellIDForCanvasPoint:", v6, v8);
    if (((-[TSTTableRepAccessibility tsaxEditingCellID](self, "tsaxEditingCellID") ^ v11) & 0xFFFFFF) != 0)
      return -[TSTTableRepAccessibility tsaxChildCellForCellID:](self, "tsaxChildCellForCellID:", v11);
    result = -[TSTTableRepAccessibility tsaxContainedTextEditingRep](self, "tsaxContainedTextEditingRep");
    if (!result)
      return -[TSTTableRepAccessibility tsaxChildCellForCellID:](self, "tsaxChildCellForCellID:", v11);
  }
  return result;
}

- (id)tsaxFocusedElement
{
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  id result;
  objc_super v7;

  v3 = -[TSTTableRepAccessibility tsaxRangeOfSelectedColumnsOrRows](self, "tsaxRangeOfSelectedColumnsOrRows");
  if (BYTE2(v3) != 255)
  {
    v5 = v3 & 0xFF000000 | (BYTE2(v3) << 16) | (unsigned __int16)v3;
    v4 = 1;
LABEL_5:
    result = -[TSTTableRepAccessibility tsaxColumnOrRowIndexElementForCellID:inDirection:](self, "tsaxColumnOrRowIndexElementForCellID:inDirection:", v5, v4);
    if (result)
      return result;
    goto LABEL_6;
  }
  if ((unsigned __int16)v3 != 0xFFFF)
  {
    v4 = 0;
    v5 = v3 & 0xFF00FFFF | 0xFF0000;
    goto LABEL_5;
  }
LABEL_6:
  result = -[TSTTableRepAccessibility tsaxSelectionAnchorCellElement](self, "tsaxSelectionAnchorCellElement");
  if (!result)
  {
    result = -[NSArray firstObject](-[TSTTableRepAccessibility tsaxSelectedCells](self, "tsaxSelectedCells"), "firstObject");
    if (!result)
    {
      v7.receiver = self;
      v7.super_class = (Class)TSTTableRepAccessibility;
      return -[TSDRepAccessibility tsaxFocusedElement](&v7, "tsaxFocusedElement");
    }
  }
  return result;
}

- (void)updateFromLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSTTableRepAccessibility;
  -[TSTTableRepAccessibility updateFromLayout](&v3, "updateFromLayout");
  -[TSTTableRepAccessibility tsaxEnsureChildrenAreLoaded](self, "tsaxEnsureChildrenAreLoaded");
}

@end
