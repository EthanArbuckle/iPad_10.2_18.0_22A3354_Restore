@implementation THPageRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THPageRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTSDRepAccessibility, a2);
}

- (unint64_t)thaxAbsolutePageIndex
{
  return (unint64_t)objc_msgSend(-[THPageRepAccessibility thaxInfo](self, "thaxInfo"), "tsaxUnsignedIntegerValueForKey:", CFSTR("absolutePageIndex"));
}

- (id)thaxInfo
{
  return -[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("info"));
}

- (THPageRepAccessibility)initWithLayout:(id)a3 canvas:(id)a4
{
  THPageRepAccessibility *v4;
  THPageRepAccessibility *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THPageRepAccessibility;
  v4 = -[THTSDRepAccessibility initWithLayout:canvas:](&v7, "initWithLayout:canvas:", a3, a4);
  v5 = v4;
  if (v4)
    objc_msgSend(-[TSDRepAccessibility tsaxValueForKey:](v4, "tsaxValueForKey:", CFSTR("marginNotesController")), "imaxSetAccessibilityDelegate:", v4);
  return v5;
}

- (id)childRepsForHitTesting
{
  objc_super v4;

  if (!+[THTSDRepAccessibility thaxRepShouldAllowHitTestingOfChildren:](THTSDRepAccessibility, "thaxRepShouldAllowHitTestingOfChildren:", self))return 0;
  v4.receiver = self;
  v4.super_class = (Class)THPageRepAccessibility;
  return -[THPageRepAccessibility childRepsForHitTesting](&v4, "childRepsForHitTesting");
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("marginNotesController")), "imaxSetAccessibilityDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THPageRepAccessibility;
  -[TSDRepAccessibility dealloc](&v3, "dealloc");
}

- (id)accessibilityContainerForMarginNoteLayersInMarginNotesController:(id)a3
{
  return -[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("accessibilityContainer"));
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v5 = (void *)objc_opt_new(NSMutableArray, a2);
  v7.receiver = self;
  v7.super_class = (Class)THPageRepAccessibility;
  -[THTSDRepAccessibility tsaxLoadChildrenIntoCollection:](&v7, "tsaxLoadChildrenIntoCollection:", v5);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2703DC;
  v6[3] = &unk_43C978;
  v6[4] = &stru_43C950;
  objc_msgSend(v5, "sortUsingComparator:", v6);
  objc_msgSend(a3, "addObjectsFromArray:", v5);

}

- (BOOL)tsaxShouldSortChildrenUsingStandardAlgorithm
{
  return 0;
}

- (BOOL)thaxRepIsLastTextElementOnPage:(id)a3
{
  return -[NSArray lastObject](-[THPageRepAccessibility thaxPageContentReps](self, "thaxPageContentReps"), "lastObject") == a3;
}

- (NSArray)thaxPageContentReps
{
  id v3;
  void *v4;
  Class v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  Class v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v19 = 0;
  v4 = (void *)objc_opt_class(THTSDContainerRepAccessibility);
  v5 = __TSAccessibilityCastAsSafeCategory(v4, (uint64_t)self, 1, &v19);
  if (v19)
    abort();
  v6 = -[objc_class tsaxChildReps](v5, "tsaxChildReps");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_opt_class(THTSWPRepAccessibility);
        v13 = __TSAccessibilityCastAsSafeCategory(v12, v11, 0, 0);
        if (-[objc_class _accessibilityIncludeDuringContentReading](v13, "_accessibilityIncludeDuringContentReading"))objc_msgSend(v3, "addObject:", v13);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v8);
  }
  return (NSArray *)objc_msgSend(v3, "copy");
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end
