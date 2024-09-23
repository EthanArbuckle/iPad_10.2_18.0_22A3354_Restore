@implementation TSDTextInputResponder

- (BOOL)p_accessibilityShouldCheckAncestorCanPerformAction:(SEL)a3 withSender:(id)a4
{
  return NSSelectorFromString(CFSTR("_accessibilitySpeak:")) == a3
      || NSSelectorFromString(CFSTR("_accessibilityPauseSpeaking:")) == a3;
}

- (id)_tsaxEditingTextRep
{
  id v2;
  Class v3;
  id v4;
  objc_class *v5;
  void *v6;
  id v7;
  Class v8;
  char v10;

  v2 = -[TSDTextInputResponder tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("editor"));
  v3 = NSClassFromString(CFSTR("TSWPEditingController"));
  if ((objc_opt_isKindOfClass(v2, v3) & 1) == 0)
    return 0;
  v4 = objc_msgSend(v2, "tsaxValueForKey:", CFSTR("editingReps"));
  v10 = 0;
  v5 = (objc_class *)objc_opt_class(NSSet);
  v6 = (void *)__TSAccessibilityCastAsClass(v5, (uint64_t)v4, 1, &v10);
  if (v10)
    abort();
  v7 = objc_msgSend(v6, "anyObject");
  v8 = NSClassFromString(CFSTR("TSWPRep"));
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    return v7;
  else
    return 0;
}

- (id)_accessibilitySpeakTextSelectionViews
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v2 = -[TSDTextInputResponder _tsaxEditingTextRep](self, "_tsaxEditingTextRep");
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "tsaxValueForKey:", CFSTR("_selectionHighlightLayer"));
    v5 = objc_msgSend(v3, "tsaxValueForKey:", CFSTR("overlayLayers"));
    v6 = objc_msgSend(v3, "tsaxValueForKey:", CFSTR("knobs"));
    v8 = (void *)objc_opt_new(NSMutableArray, v7);
    v3 = v8;
    if (v4)
      objc_msgSend(v8, "addObject:", v4);
    if (v5)
      objc_msgSend(v3, "addObjectsFromArray:", v5);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v6);
          v13 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), "tsaxValueForKey:", CFSTR("layer"));
          if (v13)
            objc_msgSend(v3, "addObject:", v13);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }
  }
  return v3;
}

- (CGRect)_accessibilitySpeakRectForRange:(id)a3
{
  CGSize size;
  Class v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[8];
  uint64_t v17;
  double *v18;
  uint64_t v19;
  const char *v20;
  CGPoint origin;
  CGSize v22;
  CGRect result;

  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x4010000000;
  v20 = "";
  size = CGRectZero.size;
  origin = CGRectZero.origin;
  v22 = size;
  v6 = NSClassFromString(CFSTR("TSDTextRange"));
  if ((objc_opt_isKindOfClass(a3, v6) & 1) != 0)
  {
    v7 = -[TSDTextInputResponder _tsaxEditingTextRep](self, "_tsaxEditingTextRep");
    if (v7)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_246664;
      v16[3] = &unk_43C110;
      v16[4] = a3;
      v16[5] = v7;
      v16[6] = objc_msgSend(objc_msgSend(v7, "tsaxValueForKey:", CFSTR("canvas")), "tsaxValueForKey:", CFSTR("canvasController"));
      v16[7] = &v17;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v16))
        abort();
    }
  }
  v8 = v18[4];
  v9 = v18[5];
  v10 = v18[6];
  v11 = v18[7];
  _Block_object_dispose(&v17, 8);
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

@end
