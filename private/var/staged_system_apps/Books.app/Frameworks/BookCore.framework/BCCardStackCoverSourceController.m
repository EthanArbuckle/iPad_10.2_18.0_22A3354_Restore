@implementation BCCardStackCoverSourceController

- (BCCardStackCoverSourceController)initWithCardStackViewController:(id)a3 isDismiss:(BOOL)a4 cardSetViewController:(id)a5 focusedIndex:(int64_t)a6 coverHost:(id)a7 dataSource:(id)a8
{
  id v15;
  id v16;
  id v17;
  BCCardStackCoverSourceController *v18;
  BCCardStackCoverSourceController *v19;
  id v21;
  objc_super v22;

  v21 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BCCardStackCoverSourceController;
  v18 = -[BCCardStackCoverSourceController init](&v22, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_cardStackViewController, a3);
    v19->_isDismiss = a4;
    objc_storeStrong((id *)&v19->_cardSetViewController, a5);
    v19->_focusedIndex = a6;
    objc_storeStrong((id *)&v19->_coverHost, a7);
    objc_storeStrong((id *)&v19->_dataSource, a8);
  }

  return v19;
}

+ (void)revealCoverSourceAtIndex:(int64_t)a3 dataSource:(id)a4 coverHost:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "representedObjectForCardAtIndex:", a3));
  objc_msgSend(v7, "revealCoverForRepresentedObject:", v8);

}

+ (BOOL)canUseCoverTransitionForDismissingCardSetViewController:(id)a3 dataSource:(id)a4 coverHost:(id)a5 coverYOffset:(double *)a6 inCoordinatesOfView:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double MidY;
  void *v41;
  void *v42;
  void *v43;
  CGRect v44;
  CGRect v45;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentCardViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "transitioningCardContent"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cardStackTransitioningCardContentCoverSource"));
  if (v17 && !objc_msgSend(v16, "visibilityOfCoverSource:ignoringYAxis:", v17, 0))
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "representedObjectForCardAtIndex:", objc_msgSend(v11, "focusedIndex")));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "coverSourceForRepresentedObject:"));
    v21 = (void *)v20;
    v18 = v20 != 0;
    v19 = NAN;
    if (a6 && v20)
    {
      v41 = (void *)v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "cardStackTransitioningCoverSourceReferenceView"));
      objc_msgSend(v17, "cardStackTransitioningCoverSourceFrame");
      objc_msgSend(v22, "convertRect:toView:", v14);
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;

      v21 = v41;
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "cardStackTransitioningCoverSourceReferenceView"));
      objc_msgSend(v41, "cardStackTransitioningCoverSourceFrame");
      objc_msgSend(v42, "convertRect:toView:", v14);
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;

      v44.origin.x = v32;
      v44.origin.y = v34;
      v44.size.width = v36;
      v44.size.height = v38;
      MidY = CGRectGetMidY(v44);
      v45.origin.x = v24;
      v45.origin.y = v26;
      v45.size.width = v28;
      v45.size.height = v30;
      v19 = MidY - CGRectGetMidY(v45);
    }

  }
  else
  {
    v18 = 0;
    v19 = NAN;
  }

  if (a6)
    *a6 = v19;

  return v18;
}

+ (id)coverHostFromPresentingViewController:(id)a3 previousCardSetViewController:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "currentCardViewController"));
  v7 = (void *)v6;
  if (v6)
    v8 = (void *)v6;
  else
    v8 = v5;
  v9 = v8;

  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "im_firstVisibleChildConformingToProtocol:includePresented:", &OBJC_PROTOCOL___BCCardStackTransitioningCoverHost, 0));
  if (v10)
  {
    v11 = (void *)v10;
  }
  else
  {
    while (1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentingViewController"));

      if (!v11)
        break;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "presentingViewController"));

      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "im_firstVisibleChildConformingToProtocol:includePresented:", &OBJC_PROTOCOL___BCCardStackTransitioningCoverHost, 0));
      v9 = v12;
      if (v13)
      {
        v11 = (void *)v13;
        v9 = v12;
        break;
      }
    }
  }

  return v11;
}

- (void)performFirstHalfOfProcessing
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardStackViewController](self, "cardStackViewController"));
  -[BCCardStackCoverSourceController setTotalCoverCount:](self, "setTotalCoverCount:", objc_msgSend(v3, "numberOfCards:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardSetViewController](self, "cardSetViewController"));
  v6 = objc_msgSend(v5, "visibleCardRange");
  -[BCCardStackCoverSourceController setVisibleCardRange:](self, "setVisibleCardRange:", v6, v7);

  if (-[BCCardStackCoverSourceController isDismiss](self, "isDismiss")
    && -[BCCardStackCoverSourceController preferSlideForDismiss](self, "preferSlideForDismiss")
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardSetViewController](self, "cardSetViewController")),
        v9 = -[BCCardStackCoverSourceController _hasHiddenCoverSourcesForCardSet:](self, "_hasHiddenCoverSourcesForCardSet:", v8), v8, (v9 & 1) == 0))
  {
    -[BCCardStackCoverSourceController setVisibleRange:](self, "setVisibleRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    -[BCCardStackCoverSourceController setVisibleCoverSourceByIndex:](self, "setVisibleCoverSourceByIndex:", &__NSDictionary0__struct);
  }
  else
  {
    -[BCCardStackCoverSourceController _findVisibleCoverSources](self, "_findVisibleCoverSources");
  }
  if (-[BCCardStackCoverSourceController canUseCoverTransition](self, "canUseCoverTransition")
    && (!-[BCCardStackCoverSourceController isDismiss](self, "isDismiss")
     || !-[BCCardStackCoverSourceController preferSlideForDismiss](self, "preferSlideForDismiss")))
  {
    if (-[BCCardStackCoverSourceController coversAreInNonHorizontalLayout](self, "coversAreInNonHorizontalLayout"))
      -[BCCardStackCoverSourceController setHorizontalRange:](self, "setHorizontalRange:", -[BCCardStackCoverSourceController focusedIndex](self, "focusedIndex"), 1);
    else
      -[BCCardStackCoverSourceController _findHorizontalRange](self, "_findHorizontalRange");
    -[BCCardStackCoverSourceController _createImaginaryCovers](self, "_createImaginaryCovers");
    if (-[BCCardStackCoverSourceController coversNeedClipping](self, "coversNeedClipping"))
      -[BCCardStackCoverSourceController _handlePartiallyVisibleCovers](self, "_handlePartiallyVisibleCovers");
  }
}

- (BOOL)canUseCoverTransition
{
  uint64_t v4;

  if (-[BCCardStackCoverSourceController visibleRange](self, "visibleRange") == (id)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[BCCardStackCoverSourceController visibleRange](self, "visibleRange");
  return v4 != 0;
}

- (_NSRange)_rangeOfIndexesInRange:(_NSRange)a3 passingTest:(id)a4 aroundInnerRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  int64_t v8;
  uint64_t (**v9)(id, _QWORD);
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  _NSRange result;

  length = a5.length;
  location = a5.location;
  v7 = a3.length;
  v8 = a3.location;
  v9 = (uint64_t (**)(id, _QWORD))a4;
  if (v7)
  {
    v10 = v7 + v8 - 1;
    v11 = location;
    while (v11 > v8)
    {
      if ((v9[2](v9, --v11) & 1) == 0)
      {
        v12 = v11 + 1;
        goto LABEL_8;
      }
    }
    v12 = v8;
LABEL_8:
    v13 = location + length;
    if (v13 <= v10)
    {
      v14 = v7 + v8;
      while ((v9[2](v9, v13) & 1) != 0)
      {
        if (v14 == ++v13)
          goto LABEL_14;
      }
      v10 = v13 - 1;
    }
LABEL_14:
    v7 = v10 - v12 + 1;
  }
  else
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v15 = v12;
  v16 = v7;
  result.length = v16;
  result.location = v15;
  return result;
}

- (void)_findVisibleCoverSources
{
  int64_t v3;
  int64_t v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void **v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  BCCardStackCoverSourceController *v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;

  v3 = -[BCCardStackCoverSourceController totalCoverCount](self, "totalCoverCount");
  v4 = -[BCCardStackCoverSourceController focusedIndex](self, "focusedIndex");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_45800;
  v16[3] = &unk_28D430;
  v16[4] = self;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v3));
  v17 = v5;
  v6 = objc_retainBlock(v16);
  if (((unsigned int (*)(_QWORD *, int64_t, _QWORD))v6[2])(v6, v4, 0))
  {
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_45914;
    v13 = &unk_28D458;
    v14 = self;
    v15 = v6;
    v7 = (uint64_t)-[BCCardStackCoverSourceController _rangeOfIndexesInRange:passingTest:aroundInnerRange:](self, "_rangeOfIndexesInRange:passingTest:aroundInnerRange:", 0, v3, &v10, v4, 1);
    v9 = v8;

  }
  else
  {
    v9 = 0;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[BCCardStackCoverSourceController setVisibleRange:](self, "setVisibleRange:", v7, v9, v10, v11, v12, v13, v14);
  -[BCCardStackCoverSourceController setVisibleCoverSourceByIndex:](self, "setVisibleCoverSourceByIndex:", v5);

}

- (void)_findHorizontalRange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  CGFloat MaxY;
  CGRect v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController visibleCoverSourceByIndex](self, "visibleCoverSourceByIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[BCCardStackCoverSourceController focusedIndex](self, "focusedIndex")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardStackTransitioningCoverSourceReferenceView"));
  objc_msgSend(v5, "cardStackTransitioningCoverSourceFrame");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_45A90;
  v13[3] = &unk_28D480;
  v13[4] = self;
  v14 = v6;
  MaxY = CGRectGetMaxY(v16);
  v7 = v6;
  v8 = objc_retainBlock(v13);
  v9 = -[BCCardStackCoverSourceController visibleRange](self, "visibleRange");
  v11 = -[BCCardStackCoverSourceController _rangeOfIndexesInRange:passingTest:aroundInnerRange:](self, "_rangeOfIndexesInRange:passingTest:aroundInnerRange:", v9, v10, v8, -[BCCardStackCoverSourceController focusedIndex](self, "focusedIndex"), 1);
  -[BCCardStackCoverSourceController setHorizontalRange:](self, "setHorizontalRange:", v11, v12);

}

- (BOOL)_isRTL
{
  return objc_msgSend(UIApp, "userInterfaceLayoutDirection") == (char *)&dword_0 + 1;
}

- (void)_createImaginaryCovers
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  BCCardStackCoverSourceController *v21;
  id v22;
  id v23;
  uint64_t v24;

  v3 = -[BCCardStackCoverSourceController visibleRange](self, "visibleRange");
  v5 = v4;
  v6 = -[BCCardStackCoverSourceController horizontalRange](self, "horizontalRange");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController visibleCoverSourceByIndex](self, "visibleCoverSourceByIndex"));
  v10 = -[BCCardStackCoverSourceController visibleCardRange](self, "visibleCardRange");
  v12 = (unint64_t)v10 + v11;
  v13 = -[BCCardStackCoverSourceController visibleRange](self, "visibleRange");
  if (v12 > (unint64_t)v13 + v14
    && v12 <= -[BCCardStackCoverSourceController totalCoverCount](self, "totalCoverCount"))
  {
    v5 = v12;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_45D14;
  v19[3] = &unk_28D4A8;
  v23 = v6;
  v24 = (uint64_t)v6 + v8 - 1;
  v20 = v9;
  v21 = self;
  v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v5 - v8));
  v15 = v22;
  v16 = v9;
  v17 = -[BCCardStackCoverSourceController _rangeOfIndexesInRange:passingTest:aroundInnerRange:](self, "_rangeOfIndexesInRange:passingTest:aroundInnerRange:", v3, v5, v19, v6, v8);
  -[BCCardStackCoverSourceController setHorizontalRangeIncludingFake:](self, "setHorizontalRangeIncludingFake:", v17, v18);
  -[BCCardStackCoverSourceController setFakeCoverSourceByIndex:](self, "setFakeCoverSourceByIndex:", v15);

}

- (_NSRange)_trimRange:(_NSRange)a3 withTest:(id)a4
{
  NSUInteger length;
  int64_t location;
  unsigned int (**v6)(id, int64_t);
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  int64_t v11;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v6 = (unsigned int (**)(id, int64_t))a4;
  if (length)
  {
    v7 = length + location - 1;
    if (location > v7)
      goto LABEL_8;
    while (v6[2](v6, location))
    {
      ++location;
      if (!--length)
        goto LABEL_8;
    }
    if (location == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_8:
      v8 = 0;
      location = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v11 = location;
      if (v7 > location)
      {
        while (v6[2](v6, v7))
        {
          if (--v7 <= location)
          {
            v11 = location;
            goto LABEL_15;
          }
        }
        v11 = v7;
      }
LABEL_15:
      v8 = v11 - location + 1;
    }
  }
  else
  {
    v8 = 0;
  }

  v9 = location;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)_coverSourceAtIndex:(int64_t)a3
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = -[BCCardStackCoverSourceController horizontalRange](self, "horizontalRange");
  if (a3 < (unint64_t)v5 || a3 - (uint64_t)v5 >= v6)
    v7 = objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController fakeCoverSourceByIndex](self, "fakeCoverSourceByIndex"));
  else
    v7 = objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController visibleCoverSourceByIndex](self, "visibleCoverSourceByIndex"));
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));

  return v10;
}

- (void)_handlePartiallyVisibleCovers
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger location;
  NSUInteger length;
  NSRange v12;
  void *v13;
  _QWORD v14[7];
  NSRange v15;
  NSRange v16;

  v3 = -[BCCardStackCoverSourceController horizontalRangeIncludingFake](self, "horizontalRangeIncludingFake");
  v5 = v4;
  v6 = -[BCCardStackCoverSourceController horizontalRange](self, "horizontalRange");
  v8 = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_46120;
  v14[3] = &unk_28D4D0;
  v14[5] = -[BCCardStackCoverSourceController visibleCardRange](self, "visibleCardRange");
  v14[6] = v9;
  v14[4] = self;
  v15.location = (NSUInteger)-[BCCardStackCoverSourceController _trimRange:withTest:](self, "_trimRange:withTest:", v3, v5, v14);
  location = v15.location;
  length = v15.length;
  v16.location = (NSUInteger)v6;
  v16.length = v8;
  v12 = NSUnionRange(v15, v16);
  -[BCCardStackCoverSourceController setHorizontalRangeIncludingFake:](self, "setHorizontalRangeIncludingFake:", v12.location, v12.length);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSetWithIndexesInRange:](NSMutableIndexSet, "indexSetWithIndexesInRange:", v6, v8));
  objc_msgSend(v13, "removeIndexesInRange:", location, length);
  -[BCCardStackCoverSourceController setClippedCoverIndexes:](self, "setClippedCoverIndexes:", v13);

}

- (void)prepareForCoverSourceCapturingWithToViewController:(id)a3 toViewTransform:(CGAffineTransform *)a4 revealCoverBlock:(id)a5 captureCoverFrameBlock:(id)a6
{
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  __int128 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _OWORD v19[3];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[3];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v10 = a3;
  v11 = (void (**)(_QWORD))a6;
  (*((void (**)(id))a5 + 2))(a5);
  if (-[BCCardStackCoverSourceController preferSlideForDismiss](self, "preferSlideForDismiss"))
  {
    v11[2](v11);
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v27 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "transform");
    }
    else
    {
      v28 = 0u;
      v29 = 0u;
      v27 = 0u;
    }

    v14 = *(_OWORD *)&a4->c;
    v24 = *(_OWORD *)&a4->a;
    v25 = v14;
    v26 = *(_OWORD *)&a4->tx;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    v23[0] = v24;
    v23[1] = v25;
    v23[2] = v26;
    objc_msgSend(v15, "setTransform:", v23);

    v11[2](v11);
    if (-[BCCardStackCoverSourceController canUseCoverTransition](self, "canUseCoverTransition"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardStackViewController](self, "cardStackViewController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
      -[BCCardStackCoverSourceController _preserveNeededCoverSourceFramesWithNewReferenceView:](self, "_preserveNeededCoverSourceFramesWithNewReferenceView:", v17);

    }
    v20 = v27;
    v21 = v28;
    v22 = v29;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    v19[0] = v20;
    v19[1] = v21;
    v19[2] = v22;
    objc_msgSend(v18, "setTransform:", v19);

    -[BCCardStackCoverSourceController _refreshNeededCoverSources](self, "_refreshNeededCoverSources");
  }

}

- (void)_preserveNeededCoverSourceFramesWithNewReferenceView:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = -[BCCardStackCoverSourceController horizontalRangeIncludingFake](self, "horizontalRangeIncludingFake");
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSetWithIndexesInRange:](NSMutableIndexSet, "indexSetWithIndexesInRange:", v5, v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController clippedCoverIndexes](self, "clippedCoverIndexes"));
  objc_msgSend(v9, "removeIndexes:", v7);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_463FC;
  v10[3] = &unk_28D4F8;
  v10[4] = self;
  v11 = v4;
  v8 = v4;
  objc_msgSend(v9, "enumerateIndexesUsingBlock:", v10);

}

- (void)_refreshNeededCoverSources
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v3 = -[BCCardStackCoverSourceController visibleRange](self, "visibleRange");
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSetWithIndexesInRange:](NSMutableIndexSet, "indexSetWithIndexesInRange:", v3, v4));
  v5 = -[BCCardStackCoverSourceController horizontalRange](self, "horizontalRange");
  objc_msgSend(v11, "removeIndexesInRange:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController clippedCoverIndexes](self, "clippedCoverIndexes"));
  objc_msgSend(v11, "addIndexes:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController visibleCoverSourceByIndex](self, "visibleCoverSourceByIndex"));
  v9 = objc_msgSend(v8, "mutableCopy");

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_46544;
  v12[3] = &unk_28D4F8;
  v12[4] = self;
  v13 = v9;
  v10 = v9;
  objc_msgSend(v11, "enumerateIndexesUsingBlock:", v12);
  -[BCCardStackCoverSourceController setVisibleCoverSourceByIndex:](self, "setVisibleCoverSourceByIndex:", v10);

}

- (void)performSecondHalfOfProcessing
{
  if (-[BCCardStackCoverSourceController isDismiss](self, "isDismiss")
    && (!-[BCCardStackCoverSourceController canUseCoverTransition](self, "canUseCoverTransition")
     || -[BCCardStackCoverSourceController preferSlideForDismiss](self, "preferSlideForDismiss")))
  {
    -[BCCardStackCoverSourceController _generateDismissSlideAnimationItems](self, "_generateDismissSlideAnimationItems");
  }
  else
  {
    -[BCCardStackCoverSourceController _obtainCardCoverSources](self, "_obtainCardCoverSources");
    -[BCCardStackCoverSourceController _generateAnimationItems](self, "_generateAnimationItems");
  }
}

- (id)_placeholderCoverSourceForRelativeCoverFrame:(CGRect)a3 inCardView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BCCardStackTransitioningPlaceholderCoverSource *v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  v9 = objc_msgSend(v8, "bounds");
  v12 = CGPointAdd(v9, x, y, v10, v11);
  v14 = -[BCCardStackTransitioningPlaceholderCoverSource initWithCoverFrame:referenceView:]([BCCardStackTransitioningPlaceholderCoverSource alloc], "initWithCoverFrame:referenceView:", v8, v12, v13, width, height);

  return v14;
}

- (void)_obtainCardCoverSources
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  char *v41;
  unint64_t v42;
  void *v43;
  BCCardStackCoverSourceController *v44;
  double v45;
  double v46;
  id v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  int64_t v57;
  id v58;

  v3 = -[BCCardStackCoverSourceController focusedIndex](self, "focusedIndex");
  v58 = (id)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardSetViewController](self, "cardSetViewController"));
  v57 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "cardViewControllerAtIndex:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "layoutIfNeeded");

  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitioningCardContent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "cardStackTransitioningCardContentCoverSource"));
  v56 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v6, "cardStackTransitioningCoverSourceFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cardStackTransitioningCoverSourceReferenceView"));
  objc_msgSend(v7, "convertRect:fromView:", v16, v9, v11, v13, v15);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = (char *)-[BCCardStackCoverSourceController _rangeForCoverMove](self, "_rangeForCoverMove");
  v27 = v26;
  v28 = (char *)-[BCCardStackCoverSourceController _rangeForCardMove](self, "_rangeForCardMove");
  v30 = v29;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v27));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", v30));
  v55 = objc_alloc_init((Class)NSMutableIndexSet);
  if ((uint64_t)v28 < (uint64_t)&v28[v30])
  {
    do
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "cardViewControllerAtIndex:", v28));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v28));
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, v34);

      ++v28;
      --v30;
    }
    while (v30);
  }
  v35 = (char *)v57;
  if ((uint64_t)v25 < (uint64_t)&v25[v27])
  {
    while (v35 == v25)
    {
      v36 = v6;
LABEL_19:
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v25));
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v36, v53);

      ++v25;
      if (!--v27)
        goto LABEL_20;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v25));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v37));

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "transitioningCardContent"));
    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "cardStackTransitioningCardContentCoverSource"));
    if (v40)
    {
      v36 = (id)v40;
      if (!-[BCCardStackCoverSourceController isDismiss](self, "isDismiss")
        || !objc_msgSend(v39, "visibilityOfCoverSource:ignoringYAxis:", v36, 0))
      {
LABEL_18:

        goto LABEL_19;
      }

    }
    if (-[BCCardStackCoverSourceController isDismiss](self, "isDismiss"))
    {
      v41 = (char *)-[BCCardStackCoverSourceController visibleCardRange](self, "visibleCardRange");
      if (v25 >= v41 && v25 - v41 < v42)
        objc_msgSend(v55, "addIndex:", v25);
    }
    if (v38)
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "view"));
      v44 = self;
      v45 = v18;
      v46 = v20;
    }
    else
    {
      v47 = objc_msgSend(v58, "frameForCardAtIndex:inCoordinatesOfCardAtIndex:", v25, v35);
      v50 = CGPointAdd(v47, v18, v20, v48, v49);
      v52 = v51;
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "view"));
      v44 = self;
      v45 = v50;
      v46 = v52;
    }
    v36 = (id)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController _placeholderCoverSourceForRelativeCoverFrame:inCardView:](v44, "_placeholderCoverSourceForRelativeCoverFrame:inCardView:", v43, v45, v46, v22, v24));

    v35 = (char *)v57;
    goto LABEL_18;
  }
LABEL_20:
  -[BCCardStackCoverSourceController setCardByIndex:](self, "setCardByIndex:", v32);
  -[BCCardStackCoverSourceController setCardCoverSourceByIndex:](self, "setCardCoverSourceByIndex:", v31);
  -[BCCardStackCoverSourceController setVisibleCardIndexesWithAdjustedCoverSource:](self, "setVisibleCardIndexesWithAdjustedCoverSource:", v55);

}

- (void)_generateAnimationItems
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  int64_t v19;
  _QWORD v20[5];
  id v21;
  int64_t v22;

  v3 = -[BCCardStackCoverSourceController _rangeForCoverMove](self, "_rangeForCoverMove");
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v3, v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = -[BCCardStackCoverSourceController focusedIndex](self, "focusedIndex");
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_46C48;
  v20[3] = &unk_28D520;
  v21 = v5;
  v22 = v7;
  v20[4] = self;
  v8 = v5;
  objc_msgSend(v16, "enumerateIndexesUsingBlock:", v20);
  v9 = -[BCCardStackCoverSourceController _rangeForCardMove](self, "_rangeForCardMove");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v9, v10));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_46DF4;
  v17[3] = &unk_28D520;
  v18 = v6;
  v19 = v7;
  v17[4] = self;
  v12 = v6;
  objc_msgSend(v11, "enumerateIndexesUsingBlock:", v17);
  v13 = -[BCCardStackCoverSourceController _rangeForCoverMove](self, "_rangeForCoverMove");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController _coverFadeItemsExcludingRange:](self, "_coverFadeItemsExcludingRange:", v13, v14));
  -[BCCardStackCoverSourceController setCoverMoveItems:](self, "setCoverMoveItems:", v8);
  -[BCCardStackCoverSourceController setCardMoveItems:](self, "setCardMoveItems:", v12);
  -[BCCardStackCoverSourceController setCoverFadeItems:](self, "setCoverFadeItems:", v15);

}

- (id)_coverFadeItemsExcludingRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void *v15;
  BCCardStackCoverSourceController *v16;
  id v17;

  length = a3.length;
  location = a3.location;
  v6 = -[BCCardStackCoverSourceController visibleRange](self, "visibleRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSetWithIndexesInRange:](NSMutableIndexSet, "indexSetWithIndexesInRange:", v6, v7));
  objc_msgSend(v8, "removeIndexesInRange:", location, length);
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_471D4;
  v15 = &unk_28D4F8;
  v16 = self;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v8, "count")));
  v9 = v17;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", &v12);
  v10 = objc_msgSend(v9, "copy", v12, v13, v14, v15, v16);

  return v10;
}

- (void)_generateDismissSlideAnimationItems
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  BCCardStackTransitionCardSlideAnimationItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BCCardStackTransitionCardSlideAnimationItem *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = (char *)-[BCCardStackCoverSourceController visibleCardRange](self, "visibleCardRange");
  v5 = v4;
  v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v4));
  if ((uint64_t)v3 < (uint64_t)&v3[v5])
  {
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld-slide"), v3));
      v7 = -[BCCardStackTransitionAnimationItem initWithKey:]([BCCardStackTransitionCardSlideAnimationItem alloc], "initWithKey:", v6);
      -[BCCardStackTransitionCardSlideAnimationItem setIsFocusedCard:](v7, "setIsFocusedCard:", v3 == (char *)-[BCCardStackCoverSourceController focusedIndex](self, "focusedIndex"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardSetViewController](self, "cardSetViewController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardViewControllerAtIndex:", v3));
      -[BCCardStackTransitionCardSlideAnimationItem setCard:](v7, "setCard:", v9);

      objc_msgSend(v18, "addObject:", v7);
      ++v3;
      --v5;
    }
    while (v5);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController underlyingCardSetViewController](self, "underlyingCardSetViewController"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController underlyingCardSetViewController](self, "underlyingCardSetViewController"));
    v12 = objc_msgSend(v11, "focusedIndex");

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld-slide"), v12));
    v14 = -[BCCardStackTransitionAnimationItem initWithKey:]([BCCardStackTransitionCardSlideAnimationItem alloc], "initWithKey:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController underlyingCardSetViewController](self, "underlyingCardSetViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cardViewControllerAtIndex:", v12));
    -[BCCardStackTransitionCardSlideAnimationItem setCard:](v14, "setCard:", v16);

    objc_msgSend(v18, "addObject:", v14);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController _coverFadeItemsExcludingRange:](self, "_coverFadeItemsExcludingRange:", 0, 0));
  -[BCCardStackCoverSourceController setCardSlideItems:](self, "setCardSlideItems:", v18);
  -[BCCardStackCoverSourceController setCoverFadeItems:](self, "setCoverFadeItems:", v17);

}

- (void)prepareForAnimation:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  void *v6;
  _QWORD v7[6];

  v3 = a3;
  -[BCCardStackCoverSourceController _hideVisibleCoverSources](self, "_hideVisibleCoverSources");
  if (v3)
    -[BCCardStackCoverSourceController hideCardCoverSources](self, "hideCardCoverSources");
  v5 = -[BCCardStackCoverSourceController focusedIndex](self, "focusedIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardByIndex](self, "cardByIndex"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4754C;
  v7[3] = &unk_28D548;
  v7[4] = self;
  v7[5] = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)_hideVisibleCoverSources
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardStackViewController](self, "cardStackViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "unhideBlocksByCardSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardSetViewController](self, "cardSetViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  if (!v6)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardStackViewController](self, "cardStackViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "unhideBlocksByCardSet"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardSetViewController](self, "cardSetViewController"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController visibleCoverSourceByIndex](self, "visibleCoverSourceByIndex"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_47718;
  v12[3] = &unk_28D570;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v12);

}

- (void)hideCardCoverSources
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardCoverSourceByIndex](self, "cardCoverSourceByIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v3, "count")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardCoverSourceByIndex](self, "cardCoverSourceByIndex"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_47878;
  v7[3] = &unk_28D570;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

  -[BCCardStackCoverSourceController setCardCoverSourceUnhideBlocksByIndex:](self, "setCardCoverSourceUnhideBlocksByIndex:", v6);
}

- (void)finalizeForAnimation
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (-[BCCardStackCoverSourceController isDismiss](self, "isDismiss"))
  {
    if (-[BCCardStackCoverSourceController isDismissingCardStack](self, "isDismissingCardStack"))
    {
      -[BCCardStackCoverSourceController _unhideAllCoverSources](self, "_unhideAllCoverSources");
    }
    else
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardSetViewController](self, "cardSetViewController"));
      -[BCCardStackCoverSourceController _unhideCoverSourcesForCardSet:](self, "_unhideCoverSourcesForCardSet:", v3);

    }
  }
  -[BCCardStackCoverSourceController _unhideCardCoverSources](self, "_unhideCardCoverSources");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardByIndex](self, "cardByIndex"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_4799C;
  v5[3] = &unk_28D598;
  v5[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

- (BOOL)_hasHiddenCoverSourcesForCardSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardStackViewController](self, "cardStackViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "unhideBlocksByCardSet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));

  return v7 != 0;
}

- (void)_unhideAllCoverSources
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardStackViewController](self, "cardStackViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "unhideBlocksByCardSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectEnumerator"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v9);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allValues", 0));
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v15) + 16))();
              v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v13);
        }

        v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardStackViewController](self, "cardStackViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "unhideBlocksByCardSet"));
  objc_msgSend(v17, "removeAllObjects");

}

- (void)_unhideCoverSourcesForCardSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardStackViewController](self, "cardStackViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "unhideBlocksByCardSet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allValues", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
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
          objc_enumerationMutation(v8);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12) + 16))();
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardStackViewController](self, "cardStackViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "unhideBlocksByCardSet"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", 0, v4);

}

- (void)_unhideCardCoverSources
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BCCardStackCoverSourceController cardCoverSourceUnhideBlocksByIndex](self, "cardCoverSourceUnhideBlocksByIndex"));
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &stru_28D5D8);

}

- (BOOL)preferSlideForDismiss
{
  return self->_preferSlideForDismiss;
}

- (void)setPreferSlideForDismiss:(BOOL)a3
{
  self->_preferSlideForDismiss = a3;
}

- (BOOL)coversNeedClipping
{
  return self->_coversNeedClipping;
}

- (void)setCoversNeedClipping:(BOOL)a3
{
  self->_coversNeedClipping = a3;
}

- (BOOL)coversAreInNonHorizontalLayout
{
  return self->_coversAreInNonHorizontalLayout;
}

- (void)setCoversAreInNonHorizontalLayout:(BOOL)a3
{
  self->_coversAreInNonHorizontalLayout = a3;
}

- (BCCardSetViewController)underlyingCardSetViewController
{
  return (BCCardSetViewController *)objc_loadWeakRetained((id *)&self->_underlyingCardSetViewController);
}

- (void)setUnderlyingCardSetViewController:(id)a3
{
  objc_storeWeak((id *)&self->_underlyingCardSetViewController, a3);
}

- (BOOL)isDismissingCardStack
{
  return self->_isDismissingCardStack;
}

- (void)setIsDismissingCardStack:(BOOL)a3
{
  self->_isDismissingCardStack = a3;
}

- (NSArray)coverMoveItems
{
  return self->_coverMoveItems;
}

- (void)setCoverMoveItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)cardMoveItems
{
  return self->_cardMoveItems;
}

- (void)setCardMoveItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)coverFadeItems
{
  return self->_coverFadeItems;
}

- (void)setCoverFadeItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)cardSlideItems
{
  return self->_cardSlideItems;
}

- (void)setCardSlideItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BCCardStackViewController)cardStackViewController
{
  return self->_cardStackViewController;
}

- (void)setCardStackViewController:(id)a3
{
  objc_storeStrong((id *)&self->_cardStackViewController, a3);
}

- (BOOL)isDismiss
{
  return self->_isDismiss;
}

- (BCCardSetViewController)cardSetViewController
{
  return self->_cardSetViewController;
}

- (int64_t)focusedIndex
{
  return self->_focusedIndex;
}

- (BCCardStackViewControllerDataSource)dataSource
{
  return self->_dataSource;
}

- (BCCardStackTransitioningCoverHost)coverHost
{
  return self->_coverHost;
}

- (_NSRange)visibleCardRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_visibleCardRange.length;
  location = self->_visibleCardRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setVisibleCardRange:(_NSRange)a3
{
  self->_visibleCardRange = a3;
}

- (int64_t)totalCoverCount
{
  return self->_totalCoverCount;
}

- (void)setTotalCoverCount:(int64_t)a3
{
  self->_totalCoverCount = a3;
}

- (_NSRange)visibleRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_visibleRange.length;
  location = self->_visibleRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setVisibleRange:(_NSRange)a3
{
  self->_visibleRange = a3;
}

- (NSDictionary)visibleCoverSourceByIndex
{
  return self->_visibleCoverSourceByIndex;
}

- (void)setVisibleCoverSourceByIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (_NSRange)horizontalRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_horizontalRange.length;
  location = self->_horizontalRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setHorizontalRange:(_NSRange)a3
{
  self->_horizontalRange = a3;
}

- (_NSRange)horizontalRangeIncludingFake
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_horizontalRangeIncludingFake.length;
  location = self->_horizontalRangeIncludingFake.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setHorizontalRangeIncludingFake:(_NSRange)a3
{
  self->_horizontalRangeIncludingFake = a3;
}

- (NSDictionary)fakeCoverSourceByIndex
{
  return self->_fakeCoverSourceByIndex;
}

- (void)setFakeCoverSourceByIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSIndexSet)clippedCoverIndexes
{
  return self->_clippedCoverIndexes;
}

- (void)setClippedCoverIndexes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDictionary)cardByIndex
{
  return self->_cardByIndex;
}

- (void)setCardByIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSDictionary)cardCoverSourceByIndex
{
  return self->_cardCoverSourceByIndex;
}

- (void)setCardCoverSourceByIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSIndexSet)visibleCardIndexesWithAdjustedCoverSource
{
  return self->_visibleCardIndexesWithAdjustedCoverSource;
}

- (void)setVisibleCardIndexesWithAdjustedCoverSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)clippedCoverFlyItems
{
  return self->_clippedCoverFlyItems;
}

- (void)setClippedCoverFlyItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSDictionary)cardCoverSourceUnhideBlocksByIndex
{
  return self->_cardCoverSourceUnhideBlocksByIndex;
}

- (void)setCardCoverSourceUnhideBlocksByIndex:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardCoverSourceUnhideBlocksByIndex, 0);
  objc_storeStrong((id *)&self->_clippedCoverFlyItems, 0);
  objc_storeStrong((id *)&self->_visibleCardIndexesWithAdjustedCoverSource, 0);
  objc_storeStrong((id *)&self->_cardCoverSourceByIndex, 0);
  objc_storeStrong((id *)&self->_cardByIndex, 0);
  objc_storeStrong((id *)&self->_clippedCoverIndexes, 0);
  objc_storeStrong((id *)&self->_fakeCoverSourceByIndex, 0);
  objc_storeStrong((id *)&self->_visibleCoverSourceByIndex, 0);
  objc_storeStrong((id *)&self->_coverHost, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_cardSetViewController, 0);
  objc_storeStrong((id *)&self->_cardStackViewController, 0);
  objc_storeStrong((id *)&self->_cardSlideItems, 0);
  objc_storeStrong((id *)&self->_coverFadeItems, 0);
  objc_storeStrong((id *)&self->_cardMoveItems, 0);
  objc_storeStrong((id *)&self->_coverMoveItems, 0);
  objc_destroyWeak((id *)&self->_underlyingCardSetViewController);
}

@end
