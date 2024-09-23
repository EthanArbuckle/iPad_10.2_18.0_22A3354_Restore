@implementation TSWPInteractiveCanvasControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPInteractiveCanvasController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDInteractiveCanvasControllerAccessibility, a2);
}

- (NSMutableSet)_tsaxRegisteredLinkedTextContainerElements
{
  return (NSMutableSet *)__TSAccessibilityGetAssociatedObject(self, &unk_543848);
}

- (void)_tsaxSetRegisteredLinkedTextContainerElements:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_543848, a3);
}

- (BOOL)tsaxHyperlinkPopoverIsShown
{
  return -[TSWPInteractiveCanvasControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("hyperlinkPopoverIsShown"));
}

- (id)tsaxTextRepsForStorage:(id)a3
{
  void *v3;
  id result;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_229FBC;
  v10 = sub_229FCC;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_229FD8;
  v5[3] = &unk_427D68;
  v5[5] = a3;
  v5[6] = &v6;
  v5[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  LOBYTE(v6) = 0;
  result = __TSAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___NSFastEnumeration, v3, 1, &v6);
  if ((_BYTE)v6)
    abort();
  return result;
}

- (void)tsaxRegisterLinkedTextElement:(id)a3
{
  uint64_t v5;
  NSMutableSet *v6;

  v6 = -[TSWPInteractiveCanvasControllerAccessibility _tsaxRegisteredLinkedTextContainerElements](self, "_tsaxRegisteredLinkedTextContainerElements");
  if (!v6)
  {
    v6 = (NSMutableSet *)objc_opt_new(NSMutableSet, v5);
    -[TSWPInteractiveCanvasControllerAccessibility _tsaxSetRegisteredLinkedTextContainerElements:](self, "_tsaxSetRegisteredLinkedTextContainerElements:", v6);

  }
  -[NSMutableSet addObject:](v6, "addObject:", +[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:", a3));
}

- (void)tsaxUnregisterLinkedTextElement:(id)a3
{
  NSMutableSet *v5;

  v5 = -[TSWPInteractiveCanvasControllerAccessibility _tsaxRegisteredLinkedTextContainerElements](self, "_tsaxRegisteredLinkedTextContainerElements");
  -[NSMutableSet removeObject:](v5, "removeObject:", +[NSValue valueWithNonretainedObject:](NSValue, "valueWithNonretainedObject:", a3));
  if (!-[NSMutableSet count](v5, "count"))
    -[TSWPInteractiveCanvasControllerAccessibility _tsaxSetRegisteredLinkedTextContainerElements:](self, "_tsaxSetRegisteredLinkedTextContainerElements:", 0);
}

- (void)dealloc
{
  NSMutableSet *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = -[TSWPInteractiveCanvasControllerAccessibility _tsaxRegisteredLinkedTextContainerElements](self, "_tsaxRegisteredLinkedTextContainerElements");
  -[TSWPInteractiveCanvasControllerAccessibility _tsaxSetRegisteredLinkedTextContainerElements:](self, "_tsaxSetRegisteredLinkedTextContainerElements:", 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7), "nonretainedObjectValue");
        if (objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___TSWPRepAccessibilityContainedElement))objc_msgSend(v8, "tsaxSetParentInteractiveCanvasController:", 0);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)TSWPInteractiveCanvasControllerAccessibility;
  -[TSWPInteractiveCanvasControllerAccessibility dealloc](&v9, "dealloc");
}

@end
