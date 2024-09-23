@implementation PFAIDrawablePlacement

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFAIDrawablePlacement;
  -[PFXDrawablePlacement dealloc](&v3, "dealloc");
}

+ (id)slotIdWithLayoutModeState:(id)a3
{
  id v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  id result;

  v3 = objc_msgSend(a3, "propertySet");
  v4 = objc_opt_class(NSArray);
  *(_QWORD *)&v5 = TSUDynamicCast(v4, objc_msgSend(v3, "valueForProperty:", "-ibooks-slot")).n128_u64[0];
  v7 = v6;
  if (objc_msgSend(v6, "count", v5) != (char *)&dword_0 + 1)
    return 0;
  v8 = objc_opt_class(PFSPair);
  *(_QWORD *)&v10 = TSUDynamicCast(v8, objc_msgSend(v7, "objectAtIndex:", 0)).n128_u64[0];
  if (!v9)
    return 0;
  v11 = v9;
  if (objc_msgSend(v9, "type", v10) != &stru_108)
    return 0;
  v12 = objc_opt_class(NSString);
  TSUDynamicCast(v12, objc_msgSend(v11, "value"));
  return result;
}

- (void)mapNonChildPlacementModeWithState:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v5 = objc_msgSend(a3, "currentStackEntry");
  v6 = objc_msgSend(objc_msgSend(v5, "parentEntry"), "reader");
  v7 = objc_opt_class(PFAIFlowInfo);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    self->super.mMode = 6;
    v8 = +[PFAIDrawablePlacement slotIdWithLayoutModeState:](PFAIDrawablePlacement, "slotIdWithLayoutModeState:", objc_msgSend(v5, "flowState"));
    if (v8)
      -[PFAIDrawablePlacement setSlot:](self, "setSlot:", objc_msgSend(objc_msgSend(objc_msgSend(a3, "flowState"), "pageCache"), "findMasterSlotWithId:", v8));
  }
  else
  {
    v9 = objc_msgSend(a3, "paginatedState");
    v10 = +[PFAIDrawablePlacement slotIdWithLayoutModeState:](PFAIDrawablePlacement, "slotIdWithLayoutModeState:", objc_msgSend(v5, "paginatedState"));
    if (v10)
    {
      v11 = v10;
      v15 = objc_msgSend(v9, "currentPageIndex");
      -[PFAIDrawablePlacement setSlot:](self, "setSlot:", objc_msgSend(objc_msgSend(v9, "pageCache"), "findSlotWithId:pageIndex:", v11, &v15));
      objc_msgSend(v9, "setCurrentPageIndex:", v15);
    }
    if (self->mSlot)
      v12 = 1;
    else
      v12 = 2;
    self->super.mMode = v12;
  }
  v13 = objc_opt_class(PFAINormal);
  if ((objc_opt_isKindOfClass(v6, v13) & 1) == 0)
  {
    v14 = objc_opt_class(PFAIGutter);
    if ((objc_opt_isKindOfClass(v6, v14) & 1) != 0)
      self->super.mMode = 5;
  }
}

- (id)wrapPropertyValueWithState:(id)a3
{
  PFSSlot *mSlot;
  objc_super v6;

  mSlot = self->mSlot;
  if (mSlot)
    return -[PFSSlot valueForProperty:](mSlot, "valueForProperty:", PFXPropNmApplePubBoxWrapExteriorPath[0]);
  v6.receiver = self;
  v6.super_class = (Class)PFAIDrawablePlacement;
  return -[PFXDrawablePlacement wrapPropertyValueWithState:](&v6, "wrapPropertyValueWithState:", a3);
}

- (void)mapBoundsWithState:(id)a3
{
  PFSSlot *mSlot;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  objc_super v10;

  mSlot = self->mSlot;
  if (mSlot)
  {
    +[PFXDrawablePlacement boundsWithProperties:readerState:](PFXDrawablePlacement, "boundsWithProperties:readerState:", mSlot, a3);
    self->super.mBounds.origin.x = v6;
    self->super.mBounds.origin.y = v7;
    self->super.mBounds.size.width = v8;
    self->super.mBounds.size.height = v9;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PFAIDrawablePlacement;
    -[PFXDrawablePlacement mapBoundsWithState:](&v10, "mapBoundsWithState:", a3);
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  objc_super v6;

  +[PFAIReferenceAnchor mapReferenceAnchorWithStackEntry:contentState:](PFAIReferenceAnchor, "mapReferenceAnchorWithStackEntry:contentState:", objc_msgSend(a3, "currentStackEntry"), a3);
  v6.receiver = self;
  v6.super_class = (Class)PFAIDrawablePlacement;
  LOBYTE(self) = -[PFXDrawablePlacement mapStartElementWithState:](&v6, "mapStartElementWithState:", a3);
  objc_msgSend(a3, "setCfiPathForCurrentStorage");
  return (char)self;
}

+ (void)cacheDrawable:(id)a3 forSlot:(id)a4 withContentState:(id)a5
{
  id v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  void *v16;
  uint64_t v17;
  double v18;
  id v19;
  id v20;
  NSNumber *v21;
  id v22;

  if (objc_msgSend(a5, "paginatedIsCurrent")
    && !objc_msgSend(a5, "ancestorEntryWithReaderClass:", objc_opt_class(PFXAside)))
  {
    v8 = objc_msgSend(objc_msgSend(a5, "paginatedState"), "currentPageDrawableMap");
    v9 = objc_opt_class(NSArray);
    *(_QWORD *)&v10 = TSUDynamicCast(v9, objc_msgSend(a4, "valueForProperty:", "z-index")).n128_u64[0];
    v12 = v11;
    if (objc_msgSend(v11, "count", v10) == (char *)&dword_0 + 1
      && (v13 = objc_opt_class(PFSPair),
          *(_QWORD *)&v15 = TSUDynamicCast(v13, objc_msgSend(v12, "objectAtIndex:", 0)).n128_u64[0],
          v14)
      && (v16 = v14, objc_msgSend(v14, "type", v15) == &stru_108.addr))
    {
      v17 = objc_opt_class(NSString);
      *(_QWORD *)&v18 = TSUDynamicCast(v17, objc_msgSend(v16, "value")).n128_u64[0];
      v20 = objc_msgSend(v19, "integerValue", v18);
    }
    else
    {
      v20 = 0;
    }
    v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v20);
    v22 = objc_msgSend(v8, "objectForKey:", v21);
    if (!v22)
    {
      v22 = objc_alloc_init((Class)NSMutableArray);
      objc_msgSend(v8, "setObject:forKey:", v22, v21);

    }
    objc_msgSend(v22, "addObject:", a3);
  }
}

- (void)mapNonChildResults:(id)a3 withState:(id)a4
{
  int mMode;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  mMode = self->super.mMode;
  if (mMode == 6)
  {
    if (objc_msgSend(a4, "flowIsCurrent"))
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v19)
              objc_enumerationMutation(a3);
            v21 = TSUProtocolCast(&OBJC_PROTOCOL___TSDInfo, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i));
            if (v21)
            {
              v22 = v21;
              v23 = objc_msgSend(objc_msgSend(a4, "flowState"), "pageAtRelativeIndex:", 0);
              objc_msgSend(v23, "addFloatingDrawable:insertContext:", v22, 0);
              objc_msgSend(objc_msgSend(v23, "drawablesZOrder"), "addDrawable:", v22);
            }
          }
          v18 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        }
        while (v18);
      }
    }
  }
  else if (mMode == 1)
  {
    if (objc_msgSend(a4, "paginatedIsCurrent"))
    {
      v7 = objc_msgSend(a4, "paginatedState");
      v8 = objc_msgSend(v7, "currentPageIndex");
      v24 = objc_msgSend(v7, "contentNodeBody");
      v9 = objc_msgSend(v7, "pageAtRelativeIndex:", v8);
      v10 = (void *)objc_opt_class(self);
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v31;
        do
        {
          for (j = 0; j != v12; j = (char *)j + 1)
          {
            if (*(_QWORD *)v31 != v13)
              objc_enumerationMutation(a3);
            v15 = TSUProtocolCast(&OBJC_PROTOCOL___TSDInfo, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)j));
            if (v15)
            {
              v16 = v15;
              if (!objc_msgSend(a4, "ancestorEntryWithReaderClass:", objc_opt_class(PFXAside)))
              {
                objc_msgSend(v9, "addFloatingDrawable:insertContext:", v16, 0);
                objc_msgSend(v10, "cacheDrawable:forSlot:withContentState:", v16, self->mSlot, a4);
                objc_msgSend(v24, "setRelativePageIndex:forInfo:", v8, v16);
              }
            }
          }
          v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v12);
      }
    }
  }
}

+ (id)lineHintsForPropertySet:(id)a3 textStorage:(id)a4 contentState:(id)a5
{
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  int64_t v15;
  int64_t v16;
  id v17;
  BOOL v18;

  v8 = objc_opt_class(NSArray);
  *(_QWORD *)&v9 = TSUDynamicCast(v8, objc_msgSend(a3, "valueForProperty:", PFXPropNmApplePubLineHints[0])).n128_u64[0];
  v11 = v10;
  if (objc_msgSend(v10, "count", v9) == (char *)&dword_4 + 1)
  {
    v12 = +[PFXStyleUtilities identValueInPair:](PFXStyleUtilities, "identValueInPair:", objc_msgSend(v11, "objectAtIndex:", 0));
    v13 = +[PFXStyleUtilities identValueInPair:](PFXStyleUtilities, "identValueInPair:", objc_msgSend(v11, "objectAtIndex:", 1));
    v14 = +[PFXStyleUtilities uriValueInPair:](PFXStyleUtilities, "uriValueInPair:", objc_msgSend(v11, "objectAtIndex:", 2));
    v15 = +[PFXStyleUtilities integerValueInPair:](PFXStyleUtilities, "integerValueInPair:", objc_msgSend(v11, "objectAtIndex:", 3));
    v16 = +[PFXStyleUtilities integerValueInPair:](PFXStyleUtilities, "integerValueInPair:", objc_msgSend(v11, "objectAtIndex:", 4));
    v17 = 0;
    if (v12)
      v18 = v13 == 0;
    else
      v18 = 1;
    if (!v18 && v14 != 0)
    {
      v17 = objc_msgSend(objc_msgSend(a5, "hintCollectionWithUrl:data:", v14, objc_msgSend(objc_msgSend(a5, "paginatedState"), "hintsData")), "newSubCollectionWithRange:", v15, v16);
      if (v17)
        objc_msgSend(objc_msgSend(a5, "hintCollectorForStorage:", a4), "addHintCollection:idref:presentationId:", v17, v12, v13);
    }
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (PFSSlot)slot
{
  return self->mSlot;
}

- (void)setSlot:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

@end
