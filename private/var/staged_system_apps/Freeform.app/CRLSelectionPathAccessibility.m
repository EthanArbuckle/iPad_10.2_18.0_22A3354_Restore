@implementation CRLSelectionPathAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLSelectionPath");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLSelectionPathAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (NSArray)crlaxOrderedSelections
{
  void *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char v22;
  _BYTE v23[128];

  v22 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSelectionPathAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "orderedSelections"));

  objc_opt_class(NSArray, v4);
  v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v3, 1, &v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v22)
LABEL_11:
    abort();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        objc_opt_class(CRLSubselectionAccessibility, v10);
        v16 = (id)__CRLAccessibilityCastAsSafeCategory(v15, v14, 1, &v22);
        if (v22)
          goto LABEL_11;
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v11);
  }

  return (NSArray *)v8;
}

- (id)crlaxMostSpecificCellSelection
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = NSClassFromString(CFSTR("TSTCellSelection"));
  v4 = -[CRLSelectionPathAccessibility crlaxMostSpecificSelectionOfClass:](self, "crlaxMostSpecificSelectionOfClass:", NSClassFromString(CFSTR("TSTCellSelection")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v5, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)crlaxMostSpecificTextSelection
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = NSClassFromString(CFSTR("CRLWPSelection"));
  v4 = -[CRLSelectionPathAccessibility crlaxMostSpecificSelectionOfClass:](self, "crlaxMostSpecificSelectionOfClass:", NSClassFromString(CFSTR("CRLWPSelection")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v5, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)crlaxMostSpecificSelectionOfClass:(Class)a3
{
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1003FDBD8;
  v10 = sub_1003FDBE8;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003FDBF0;
  v5[3] = &unk_10125B320;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)crlaxSelectionPathWithAppendedSelection:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1003FDBD8;
  v19 = sub_1003FDBE8;
  v20 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1003FDD6C;
  v12[3] = &unk_101230370;
  v14 = &v15;
  v12[4] = self;
  v3 = a3;
  v13 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v12))
    abort();

  v4 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  LOBYTE(v15) = 0;
  v5 = v4;
  objc_opt_class(CRLSelectionPathAccessibility, v6);
  v8 = __CRLAccessibilityCastAsSafeCategory(v7, (uint64_t)v5, 1, &v15);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if ((_BYTE)v15)
    abort();
  v10 = (void *)v9;

  return v10;
}

- (void)crlaxEnumerateSelectionsMostToLeastSpecificInPathUsingBlock:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003FDE28;
  v4[3] = &unk_101231F00;
  v4[4] = self;
  v3 = a3;
  v5 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();

}

- (void)crlaxEnumerateSelectionsLeastToMostSpecificInPathUsingBlock:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003FDEB4;
  v4[3] = &unk_101231F00;
  v4[4] = self;
  v3 = a3;
  v5 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();

}

@end
