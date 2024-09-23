@implementation CRLTextInteractiveCanvasControllerAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLInteractiveCanvasController");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLCanvasInteractiveCanvasControllerAccessibility, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLTextInteractiveCanvasControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (NSMutableDictionary)_crlaxRegisteredLinkedTextContainerElements
{
  return (NSMutableDictionary *)__CRLAccessibilityGetAssociatedObject(self, &unk_10141501C);
}

- (void)_crlaxSetRegisteredLinkedTextContainerElements:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_10141501C, a3);
}

- (BOOL)crlaxCurrentSelectionContainsVisibleTrackedChanges
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(CRLTextEditorAccessibility, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCanvasEditor](self, "crlaxCanvasEditor", v3));
  v7 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v6, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  LOBYTE(v6) = objc_msgSend(v8, "crlaxCurrentSelectionContainsVisibleTrackedChanges");
  return (char)v6;
}

- (CRLWPTextGestureDelegate)crlaxGestureDelegate
{
  return 0;
}

- (id)crlaxTextRepsForStorage:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1001C26F4;
  v17 = sub_1001C2704;
  v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001C270C;
  v10[3] = &unk_101230370;
  v12 = &v13;
  v10[4] = self;
  v3 = a3;
  v11 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v10))
    abort();

  v4 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  LOBYTE(v13) = 0;
  v5 = v4;
  v6 = __CRLAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___NSFastEnumeration, v5, 1, &v13);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if ((_BYTE)v13)
    abort();
  v8 = (void *)v7;

  return v8;
}

- (void)crlaxRegisterLinkedTextElement:(id)a3
{
  id v4;
  CRLAccessibilityBoxedWeakReference *v5;
  void *v6;
  NSMutableDictionary *v7;

  v4 = a3;
  v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility _crlaxRegisteredLinkedTextContainerElements](self, "_crlaxRegisteredLinkedTextContainerElements"));
  if (!v7)
  {
    v7 = objc_opt_new(NSMutableDictionary);
    -[CRLTextInteractiveCanvasControllerAccessibility _crlaxSetRegisteredLinkedTextContainerElements:](self, "_crlaxSetRegisteredLinkedTextContainerElements:");
  }
  v5 = -[CRLAccessibilityBoxedWeakReference initWithObject:]([CRLAccessibilityBoxedWeakReference alloc], "initWithObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), v4));

  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v5, v6);
}

- (void)crlaxUnregisterLinkedTextElement:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility _crlaxRegisteredLinkedTextContainerElements](self, "_crlaxRegisteredLinkedTextContainerElements"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), v4));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v5);
}

- (BOOL)crlaxOpenHyperlinkIfPossible:(id)a3 withRep:(id)a4
{
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v7 = objc_msgSend(v6, "openURL:", v5);

  return v7;
}

- (BOOL)crlaxEditHyperlinkIfPossible:(id)a3 withRep:(id)a4
{
  return 0;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility _crlaxRegisteredLinkedTextContainerElements](self, "_crlaxRegisteredLinkedTextContainerElements"));
  -[CRLTextInteractiveCanvasControllerAccessibility _crlaxSetRegisteredLinkedTextContainerElements:](self, "_crlaxSetRegisteredLinkedTextContainerElements:", 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allValues"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "reference"));
        if (objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___CRLWPRepAccessibilityContainedElement))objc_msgSend(v9, "crlaxSetParentInteractiveCanvasController:", 0);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  v10.receiver = self;
  v10.super_class = (Class)CRLTextInteractiveCanvasControllerAccessibility;
  -[CRLTextInteractiveCanvasControllerAccessibility dealloc](&v10, "dealloc");
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLTextInteractiveCanvasControllerAccessibility;
  -[CRLTextInteractiveCanvasControllerAccessibility scrollViewDidScroll:](&v3, "scrollViewDidScroll:", a3);
}

- (id)_crlaxStoredHeadingsRotor
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_101415290);
}

- (void)_crlaxSetStoredHeadingsRotor:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_101415290, a3);
}

- (id)_crlaxStoredHeadingsRotorSearchController
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_101415291);
}

- (void)_crlaxSetStoredHeadingsRotorSearchController:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_101415291, a3);
}

- (id)_crlaxStoredMisspelledWordsRotor
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_101415292);
}

- (void)_crlaxSetStoredMisspelledWordsRotor:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_101415292, a3);
}

- (id)_crlaxStoredMisspelledWordsRotorSearchController
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_101415293);
}

- (void)_crlaxSetStoredMisspelledWordsRotorSearchController:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_101415293, a3);
}

- (id)_crlaxStoredHyperlinksRotor
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_101415294);
}

- (void)_crlaxSetStoredHyperlinksRotor:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_101415294, a3);
}

- (id)_crlaxStoredHyperlinksRotorSearchController
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_101415295);
}

- (void)_crlaxSetStoredHyperlinksRotorSearchController:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_101415295, a3);
}

- (id)crlaxCustomRotors
{
  NSArray *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_super v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRLTextInteractiveCanvasControllerAccessibility;
  if (-[CRLTextInteractiveCanvasControllerAccessibility respondsToSelector:](&v13, "respondsToSelector:", "crlaxCustomRotors")&& (v12.receiver = self, v12.super_class = (Class)CRLTextInteractiveCanvasControllerAccessibility, v3 = -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCustomRotors](&v12, "crlaxCustomRotors"), (v4 = objc_claimAutoreleasedReturnValue(v3)) != 0))
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility crlaxMisspelledWordsRotor](self, "crlaxMisspelledWordsRotor"));
  objc_msgSend(v6, "insertObject:atIndex:", v7, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility crlaxHyperlinksRotor](self, "crlaxHyperlinksRotor"));
  objc_msgSend(v6, "insertObject:atIndex:", v8, 0);

  if (-[CRLTextInteractiveCanvasControllerAccessibility crlaxSupportsHeadingsRotor](self, "crlaxSupportsHeadingsRotor"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility _crlaxHeadingsRotor](self, "_crlaxHeadingsRotor"));
    objc_msgSend(v6, "insertObject:atIndex:", v9, 0);

  }
  v10 = objc_msgSend(v6, "copy");

  return v10;
}

- (UIAccessibilityCustomRotor)_crlaxHeadingsRotor
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD *v7;
  CRLHeadingRotorSearchController *v8;
  void *v9;
  CRLHeadingRotorSearchController *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility _crlaxStoredHeadingsRotor](self, "_crlaxStoredHeadingsRotor"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Document headings"), 0, 0));

    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002632A4;
    v12[3] = &unk_101248BF8;
    objc_copyWeak(&v14, &location);
    v6 = v5;
    v13 = v6;
    v7 = objc_retainBlock(v12);
    v3 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomRotor), "initWithName:itemSearchBlock:", v6, v7);
    -[CRLTextInteractiveCanvasControllerAccessibility _crlaxSetStoredHeadingsRotor:](self, "_crlaxSetStoredHeadingsRotor:", v3);
    v8 = [CRLHeadingRotorSearchController alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
    v10 = -[CRLRotorSearchController initWithInteractiveCanvasController:](v8, "initWithInteractiveCanvasController:", v9);
    -[CRLTextInteractiveCanvasControllerAccessibility _crlaxSetStoredHeadingsRotorSearchController:](self, "_crlaxSetStoredHeadingsRotorSearchController:", v10);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
  return (UIAccessibilityCustomRotor *)v3;
}

- (UIAccessibilityCustomRotor)crlaxMisspelledWordsRotor
{
  id v3;
  void ***v4;
  CRLMisspelledWordRotorSearchController *v5;
  void *v6;
  CRLMisspelledWordRotorSearchController *v7;
  void **v9;
  uint64_t v10;
  id (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;
  id from;
  id location;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility _crlaxStoredMisspelledWordsRotor](self, "_crlaxStoredMisspelledWordsRotor"));
  if (!v3)
  {
    v3 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomRotor), "initWithSystemType:itemSearchBlock:", 13, &stru_101248C38);
    objc_initWeak(&location, v3);
    objc_initWeak(&from, self);
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_100263498;
    v12 = &unk_101248C60;
    objc_copyWeak(&v13, &from);
    objc_copyWeak(&v14, &location);
    v4 = objc_retainBlock(&v9);
    objc_msgSend(v3, "setItemSearchBlock:", v4, v9, v10, v11, v12);
    -[CRLTextInteractiveCanvasControllerAccessibility _crlaxSetStoredMisspelledWordsRotor:](self, "_crlaxSetStoredMisspelledWordsRotor:", v3);
    v5 = [CRLMisspelledWordRotorSearchController alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
    v7 = -[CRLRotorSearchController initWithInteractiveCanvasController:](v5, "initWithInteractiveCanvasController:", v6);
    -[CRLTextInteractiveCanvasControllerAccessibility _crlaxSetStoredMisspelledWordsRotorSearchController:](self, "_crlaxSetStoredMisspelledWordsRotorSearchController:", v7);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  return (UIAccessibilityCustomRotor *)v3;
}

- (UIAccessibilityCustomRotor)crlaxHyperlinksRotor
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD *v7;
  CRLHyperlinkRotorSearchController *v8;
  void *v9;
  CRLHyperlinkRotorSearchController *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility _crlaxStoredHyperlinksRotor](self, "_crlaxStoredHyperlinksRotor"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Links"), 0, 0));

    objc_initWeak(&location, self);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100263698;
    v12[3] = &unk_101248BF8;
    objc_copyWeak(&v14, &location);
    v6 = v5;
    v13 = v6;
    v7 = objc_retainBlock(v12);
    v3 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomRotor), "initWithName:itemSearchBlock:", v6, v7);
    -[CRLTextInteractiveCanvasControllerAccessibility _crlaxSetStoredHyperlinksRotor:](self, "_crlaxSetStoredHyperlinksRotor:", v3);
    v8 = [CRLHyperlinkRotorSearchController alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
    v10 = -[CRLRotorSearchController initWithInteractiveCanvasController:](v8, "initWithInteractiveCanvasController:", v9);
    -[CRLTextInteractiveCanvasControllerAccessibility _crlaxSetStoredHyperlinksRotorSearchController:](self, "_crlaxSetStoredHyperlinksRotorSearchController:", v10);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
  return (UIAccessibilityCustomRotor *)v3;
}

- (id)crlaxSearchReferenceForSelectionPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  objc_super v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "orderedSelections"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));

  objc_opt_class(CRLWPSelection, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    *(_QWORD *)&v10 = objc_opt_class(_TtC8Freeform12CRLWPStorage, v9).n128_u64[0];
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget", v10));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "infosForSelectionPath:", v4));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "crl_onlyObject"));
    v16 = sub_100221D0C(v12, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    v18 = 0;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)CRLTextInteractiveCanvasControllerAccessibility;
    v19 = -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxSearchReferenceForSelectionPath:](&v21, "crlaxSearchReferenceForSelectionPath:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v19);
  }

  return v18;
}

- (id)crlaxRotorSearchControllerForRotor:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility _crlaxStoredHeadingsRotor](self, "_crlaxStoredHeadingsRotor"));

  if (v5 == v4)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility _crlaxStoredHeadingsRotorSearchController](self, "_crlaxStoredHeadingsRotorSearchController"));
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility _crlaxStoredMisspelledWordsRotor](self, "_crlaxStoredMisspelledWordsRotor"));

    if (v6 == v4)
    {
      v9 = objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility _crlaxStoredMisspelledWordsRotorSearchController](self, "_crlaxStoredMisspelledWordsRotorSearchController"));
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility crlaxHyperlinksRotor](self, "crlaxHyperlinksRotor"));
      v8 = objc_msgSend(v4, "isEqual:", v7);

      if (v8)
      {
        v9 = objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility _crlaxStoredHyperlinksRotorSearchController](self, "_crlaxStoredHyperlinksRotorSearchController"));
      }
      else
      {
        v13.receiver = self;
        v13.super_class = (Class)CRLTextInteractiveCanvasControllerAccessibility;
        v10 = -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxRotorSearchControllerForRotor:](&v13, "crlaxRotorSearchControllerForRotor:", v4);
        v9 = objc_claimAutoreleasedReturnValue(v10);
      }
    }
  }
  v11 = (void *)v9;

  return v11;
}

- (id)crlaxFocusTextRangeFromSearchReference:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _TtC8Freeform12CRLTextRange *v19;
  id v20;
  _TtC8Freeform12CRLTextRange *v21;
  id v22;
  objc_super v24;
  objc_super v25;

  v4 = a3;
  objc_opt_class(CRLWPSearchReference, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxFocusElementFromSearchReference:](self, "crlaxFocusElementFromSearchReference:", v7));
    objc_opt_class(CRLTextRepAccessibility, v9);
    v11 = __CRLAccessibilityCastAsSafeCategory(v10, (uint64_t)v8, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crlaxTextEditor"));
      objc_msgSend(v14, "crlaxSetShouldSuppressSpeechForNextSelectionChangedNotification:", 1);

      v15 = objc_msgSend(v7, "range");
      v17 = objc_msgSend(v13, "crlaxRepRangeWithStorageRange:", v15, v16);
      v19 = -[CRLTextRange initWithRange:]([_TtC8Freeform12CRLTextRange alloc], "initWithRange:", v17, v18);
    }
    else
    {
      v25.receiver = self;
      v25.super_class = (Class)CRLTextInteractiveCanvasControllerAccessibility;
      v22 = -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxFocusTextRangeFromSearchReference:](&v25, "crlaxFocusTextRangeFromSearchReference:", v7);
      v19 = (_TtC8Freeform12CRLTextRange *)objc_claimAutoreleasedReturnValue(v22);
    }
    v21 = v19;

  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)CRLTextInteractiveCanvasControllerAccessibility;
    v20 = -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxFocusTextRangeFromSearchReference:](&v24, "crlaxFocusTextRangeFromSearchReference:", v4);
    v21 = (_TtC8Freeform12CRLTextRange *)objc_claimAutoreleasedReturnValue(v20);
  }

  return v21;
}

- (void)crlaxAnnounceSearchReference:(id)a3 forRotor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  objc_super v34;
  objc_super v35;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxTrackedChangesRotor](self, "crlaxTrackedChangesRotor"));
  if ((objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
    goto LABEL_4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxCommentsRotor](self, "crlaxCommentsRotor"));
  if (objc_msgSend(v7, "isEqual:", v9))
  {

LABEL_4:
    goto LABEL_5;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxHighlightsRotor](self, "crlaxHighlightsRotor"));
  v33 = objc_msgSend(v7, "isEqual:", v32);

  if ((v33 & 1) == 0)
  {
    v34.receiver = self;
    v34.super_class = (Class)CRLTextInteractiveCanvasControllerAccessibility;
    -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxAnnounceSearchReference:forRotor:](&v34, "crlaxAnnounceSearchReference:forRotor:", v6, v7);
    goto LABEL_14;
  }
LABEL_5:
  objc_opt_class(CRLWPSearchReference, v10);
  if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
  {
    v12 = v6;
    *(_QWORD *)&v14 = objc_opt_class(CRLTextRepAccessibility, v13).n128_u64[0];
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility crlaxRepForSearchReference:](self, "crlaxRepForSearchReference:", v12, v14));
    v18 = __CRLAccessibilityCastAsSafeCategory(v16, (uint64_t)v17, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    if (v19)
    {
      v26 = __CRLAccessibilityStringForVariables(1, &stru_1012A72B0, v20, v21, v22, v23, v24, v25, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v28 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v27);
      if (objc_msgSend(0, "length"))
      {
        v29 = objc_msgSend(v27, "rangeOfString:", 0);
        objc_msgSend(v28, "addAttribute:value:range:", CFSTR("UIAccessibilityTokenLowPitch"), &__kCFBooleanTrue, v29, v30);
      }
      UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "crlaxTextEditor"));
      objc_msgSend(v31, "crlaxSetShouldSuppressSpeechForNextSelectionChangedNotification:", 1);

    }
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)CRLTextInteractiveCanvasControllerAccessibility;
    -[CRLCanvasInteractiveCanvasControllerAccessibility crlaxAnnounceSearchReference:forRotor:](&v35, "crlaxAnnounceSearchReference:forRotor:", v6, v7);
  }
LABEL_14:

}

- (id)crlaxTextSearchReferenceFromRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;

  length = a3.length;
  location = a3.location;
  *(_QWORD *)&v6 = objc_opt_class(CRLTextRepAccessibility, a2).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInteractiveCanvasControllerAccessibility crlaxFocusedRep](self, "crlaxFocusedRep", v6));
  v10 = __CRLAccessibilityCastAsSafeCategory(v8, (uint64_t)v9, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crlaxStorage"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crlaxTarget"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "selectionModelTranslator"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectionPathForRange:onStorage:", location, length, v13));

  *(_QWORD *)&v18 = objc_opt_class(CRLWPSelection, v17).n128_u64[0];
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mostSpecificSelectionOfClass:", v19, v18));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSearchReference searchReferenceWithStorage:selection:selectionPath:](CRLWPSearchReference, "searchReferenceWithStorage:selection:selectionPath:", v13, v20, v16));

  return v21;
}

- (BOOL)crlaxSupportsHeadingsRotor
{
  return 0;
}

- (id)crlaxRepForSearchReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100263EF8;
  v18 = sub_100263F08;
  v19 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInteractiveCanvasControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100263F10;
  v11[3] = &unk_101248C88;
  v13 = &v14;
  v8 = v5;
  v12 = v8;
  objc_msgSend(v6, "withLayoutForSelectionPath:performBlock:", v7, v11);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (BOOL)crlaxHandleDoubleTapAtPoint:(CGPoint)a3
{
  -[CRLTextInteractiveCanvasControllerAccessibility convertBoundsToUnscaledPoint:](self, "convertBoundsToUnscaledPoint:", a3.x, a3.y);
  return -[CRLTextInteractiveCanvasControllerAccessibility handleDoubleTapAtPoint:inputType:](self, "handleDoubleTapAtPoint:inputType:", 1);
}

@end
