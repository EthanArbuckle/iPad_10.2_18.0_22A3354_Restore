@implementation TSDInteractiveCanvasController

- (void)disableAllGestures
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = objc_msgSend(objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self, "layerHost", 0), "asiOSCVC"), "view"), "gestureRecognizers");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "setEnabled:", 0);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)disableNormalGestures
{
  id v3;
  uint64_t v4;
  double v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = objc_msgSend(-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "asiOSCVC");
  objc_msgSend(v3, "view");
  objc_msgSend(objc_msgSend(v3, "knobDragGestureRecognizer"), "setEnabled:", 0);
  objc_msgSend(objc_msgSend(v3, "singleTapGestureRecognizer"), "setEnabled:", 0);
  objc_msgSend(objc_msgSend(v3, "doubleTapGestureRecognizer"), "setEnabled:", 0);
  v4 = objc_opt_class(THiOSCanvasViewController);
  *(_QWORD *)&v5 = TSUDynamicCast(v4, objc_msgSend(-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "asiOSCVC")).n128_u64[0];
  objc_msgSend(objc_msgSend(v6, "hyperlinkGestureRecognizer", v5), "setEnabled:", 0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(objc_msgSend(v3, "view", 0), "gestureRecognizers");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v11);
        v13 = objc_opt_class(TSWPSwipeGestureRecognizer);
        *(_QWORD *)&v14 = TSUDynamicCast(v13, v12).n128_u64[0];
        objc_msgSend(v15, "setEnabled:", 0, v14);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
}

- (void)enableGestureKinds:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self, "layerHost", 0), "asiOSCVC"), "view"), "gestureRecognizers");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v10 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___TSDGesture, v9);
        if (v10)
        {
          if (objc_msgSend(a3, "containsObject:", objc_msgSend(v10, "gestureKind")))
            objc_msgSend(v9, "setEnabled:", 1);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
}

- (void)disableGestureKinds:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self, "layerHost", 0), "asiOSCVC"), "view"), "gestureRecognizers");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v10 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___TSDGesture, v9);
        if (v10)
        {
          if (objc_msgSend(a3, "containsObject:", objc_msgSend(v10, "gestureKind")))
            objc_msgSend(v9, "setEnabled:", 0);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
}

- (id)gestureWithKind:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](self, "layerHost", 0), "asiOSCVC"), "view"), "gestureRecognizers");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v14;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v4);
      v10 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___TSDGesture, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i));
      if (v10)
      {
        v11 = v10;
        if (objc_msgSend(v10, "gestureKind") == a3)
          v7 = v11;
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  }
  while (v6);
  return v7;
}

- (id)gestureRecognizerWithKind:(id)a3
{
  uint64_t v5;
  id result;

  v5 = objc_opt_class(UIGestureRecognizer);
  TSUDynamicCast(v5, -[TSDInteractiveCanvasController gestureWithKind:](self, "gestureWithKind:", a3));
  return result;
}

- (id)widgetHost
{
  return (id)TSUProtocolCast(&OBJC_PROTOCOL___THWWidgetHost, -[TSDInteractiveCanvasController delegate](self, "delegate"));
}

- (id)avTransportDelegate
{
  return (id)TSUProtocolCast(&OBJC_PROTOCOL___THWAVTransportControllerDelegate, -[TSDInteractiveCanvasController delegate](self, "delegate"));
}

- (id)scrollableCanvasHost
{
  return (id)TSUProtocolCast(&OBJC_PROTOCOL___THWScrollableCanvasHosting, -[TSDInteractiveCanvasController delegate](self, "delegate"));
}

- (void)pulseStorage:(id)a3 range:(_NSRange)a4
{
  id v6;
  NSArray *v7;
  id v8;
  id v9;
  id v10;
  NSNotificationCenter *v11;

  v6 = objc_msgSend(objc_alloc((Class)TSWPSearchReference), "initWithStorage:selection:", a3, objc_msgSend(objc_alloc((Class)TSWPSelection), "initWithRange:", a4.location, a4.length));
  v7 = +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v6);

  v8 = objc_msgSend(objc_alloc((Class)TSURetainedPointerKeyDictionary), "initWithObjectsAndKeys:", v7, a3, 0);
  v9 = objc_alloc((Class)NSDictionary);
  v10 = objc_msgSend(v9, "initWithObjectsAndKeys:", v8, TSKSearchReferencesToHighlightKey, self, CFSTR("THStorageReferenceKey"), +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), CFSTR("THMessageIsForTHWPRep"), 0);
  v11 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter postNotificationName:object:userInfo:](v11, "postNotificationName:object:userInfo:", TSKFindUIStateChangedNotification, self, v10);

  -[TSDInteractiveCanvasController layoutInvalidated](self, "layoutInvalidated");
}

- (BOOL)p_accessibilityShouldCheckAncestorCanPerformAction:(SEL)a3 withSender:(id)a4
{
  return NSSelectorFromString(CFSTR("_accessibilitySpeak:")) == a3
      || NSSelectorFromString(CFSTR("_accessibilityPauseSpeaking:")) == a3;
}

@end
