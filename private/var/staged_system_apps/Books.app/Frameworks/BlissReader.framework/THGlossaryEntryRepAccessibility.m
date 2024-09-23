@implementation THGlossaryEntryRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THGlossaryEntryRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)p_newTitleLayer
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THGlossaryEntryRepAccessibility;
  v2 = -[THGlossaryEntryRepAccessibility p_newTitleLayer](&v4, "p_newTitleLayer");
  objc_msgSend(v2, "setIsAccessibilityElement:", 1);
  return v2;
}

- (id)childRepsForHitTesting
{
  Class v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  objc_super v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  if (UIAccessibilityIsVoiceOverRunning())
  {
    v3 = NSClassFromString(CFSTR("THGlossaryEntryFloatingRep"));
    v5 = (void *)objc_opt_new(NSMutableArray, v4);
    v6 = -[THGlossaryEntryRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("childReps"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_isKindOfClass(v12, v3) & 1) != 0)
          {
            v14 = v9;
            if (!v9)
            {
              v14 = (void *)objc_opt_new(NSMutableArray, v13);
              v9 = v14;
            }
          }
          else
          {
            v14 = v5;
          }
          objc_msgSend(v14, "addObject:", v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v16 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v9);
          objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j), "tsaxValueForKey:", CFSTR("childReps")));
        }
        v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v17);
    }

    v15 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5);
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)THGlossaryEntryRepAccessibility;
    return -[THGlossaryEntryRepAccessibility childRepsForHitTesting](&v21, "childRepsForHitTesting");
  }
  return v15;
}

@end
