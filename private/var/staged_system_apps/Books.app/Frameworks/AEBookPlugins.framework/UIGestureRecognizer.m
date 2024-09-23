@implementation UIGestureRecognizer

- (BOOL)matchesTarget:(Class)a3 andAction:(SEL)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[UIGestureRecognizer valueForKey:](self, "valueForKey:", CFSTR("_targets")));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKey:", CFSTR("_target"), (_QWORD)v15));
        if ((objc_opt_isKindOfClass(v12, a3) & 1) != 0 && objc_msgSend(v11, "action") == a4)
        {

          v13 = 1;
          goto LABEL_12;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (void)captureSelectionRectValueForTap:(id)a3
{
  if (a3)
    objc_setAssociatedObject(self, &off_1C06E8, a3, (char *)&dword_0 + 1);
}

- (id)retrieveAndClearSelectionRectValue
{
  id AssociatedObject;
  void *v4;

  AssociatedObject = objc_getAssociatedObject(self, &off_1C06E8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (v4)
    objc_setAssociatedObject(self, &off_1C06E8, 0, (char *)&dword_0 + 1);
  return v4;
}

- (BOOL)bk_isWKSyntheticTapGestureRecognizer
{
  if (qword_20F548 != -1)
    dispatch_once(&qword_20F548, &stru_1C06F0);
  return objc_opt_isKindOfClass(self, qword_20F540) & 1;
}

@end
