@implementation THPageSpotHistory

- (THPageSpotHistory)init
{
  THPageSpotHistory *v2;
  THPageSpotHistory *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THPageSpotHistory;
  v2 = -[THPageSpotHistory init](&v5, "init");
  v3 = v2;
  if (v2)
    -[THPageSpotHistory resetWithDictionaryRepresentation:](v2, "resetWithDictionaryRepresentation:", 0);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->mStack = 0;
  v3.receiver = self;
  v3.super_class = (Class)THPageSpotHistory;
  -[THPageSpotHistory dealloc](&v3, "dealloc");
}

- (void)resetWithDictionaryRepresentation:(id)a3
{
  id v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  NSMutableArray *v15;

  -[THPageSpotHistory setCursorIndex:](self, "setCursorIndex:", 0);
  -[THPageSpotHistory setRejectDuplicates:](self, "setRejectDuplicates:", 1);
  -[THPageSpotHistory setSeekDistinctSpots:](self, "setSeekDistinctSpots:", 1);
  -[THPageSpotHistory setStackLimit:](self, "setStackLimit:", 20);
  if (!a3)
    goto LABEL_8;
  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("stack"));
  v6 = objc_msgSend(a3, "objectForKey:", CFSTR("cursor"));
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      v10 = 0;
      v11 = &v10;
      v12 = 0x3052000000;
      v13 = sub_FCA2C;
      v14 = sub_FCA3C;
      v15 = 0;
      v15 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_FCA48;
      v9[3] = &unk_429950;
      v9[4] = &v10;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);
      v8 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v11[5]);
      -[THPageSpotHistory setCursorIndex:](self, "setCursorIndex:", objc_msgSend(v7, "unsignedIntValue"));
      _Block_object_dispose(&v10, 8);
      if (v8)
        goto LABEL_9;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageSpotHistory resetWithDictionaryRepresentation:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THPageSpotHistory.m"), 117, CFSTR("missing stack in page history serialization"));
  if (!v7)
LABEL_7:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageSpotHistory resetWithDictionaryRepresentation:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THPageSpotHistory.m"), 118, CFSTR("missing cursor index in page history serialization"));
LABEL_8:
  v8 = +[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", +[THPageSpotHistory bookspotWithPageIndex:](THPageSpotHistory, "bookspotWithPageIndex:", 0));
LABEL_9:
  if (!-[NSMutableArray count](v8, "count"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageSpotHistory resetWithDictionaryRepresentation:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THPageSpotHistory.m"), 137, CFSTR("Page history must have at least one cursor"));
  -[THPageSpotHistory setStack:](self, "setStack:", v8);
}

- (id)dictionaryRepresentation
{
  NSNumber *v3;
  NSDictionary *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  NSMutableArray *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_FCA2C;
  v11 = sub_FCA3C;
  v12 = 0;
  v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[NSMutableArray count](-[THPageSpotHistory stack](self, "stack"), "count"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_FCBC8;
  v6[3] = &unk_429978;
  v6[4] = &v7;
  -[NSMutableArray enumerateObjectsUsingBlock:](-[THPageSpotHistory stack](self, "stack"), "enumerateObjectsUsingBlock:", v6);
  v3 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[THPageSpotHistory cursorIndex](self, "cursorIndex"));
  v4 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v3, CFSTR("cursor"), v8[5], CFSTR("stack"), 0);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)recordOutgoingMajorNavigationJump
{
  -[THPageSpotHistory recordOutgoingMajorNavigationJumpSuppressingToolbar:](self, "recordOutgoingMajorNavigationJumpSuppressingToolbar:", 0);
}

- (void)recordOutgoingMajorNavigationJumpSuppressingToolbar:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  THPageLocation *v6;
  NSNotificationCenter *v7;
  __CFString *v8;
  _QWORD v9[3];
  _QWORD v10[3];

  v3 = a3;
  -[THPageSpotHistory recordCurrentLocationInHistory](self, "recordCurrentLocationInHistory");
  v5 = +[THPageSpotHistory pageIndexFromBookspot:](THPageSpotHistory, "pageIndexFromBookspot:", -[THPageSpotHistory curBookspot](self, "curBookspot")) == 0x7FFFFFFFFFFFFFFFLL;
  v6 = -[THPageLocation initWithAbsolutePageIndex:]([THPageLocation alloc], "initWithAbsolutePageIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[THPageSpotHistory gotoBookspot:minor:](self, "gotoBookspot:minor:", v6, v5);
  v7 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  v8 = THNavigationHistoryDidChangeNotification;
  v10[0] = v6;
  v9[0] = CFSTR("pageLocation");
  v9[1] = CFSTR("minor");
  v10[1] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5);
  v9[2] = CFSTR("suppressToolbar");
  v10[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3);
  -[NSNotificationCenter postNotificationName:object:](v7, "postNotificationName:object:", v8, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));
}

- (void)recordCurrentLocationInHistory
{
  id v3;

  if (-[THPageSpotHistoryDelegate currentAbsolutePageIndex](-[THPageSpotHistory delegate](self, "delegate"), "currentAbsolutePageIndex") == (id)0x7FFFFFFFFFFFFFFFLL)v3 = 0;
  else
    v3 = -[THPageSpotHistoryDelegate currentBookspotLocation](-[THPageSpotHistory delegate](self, "delegate"), "currentBookspotLocation");
  -[THPageSpotHistory gotoBookspot:minor:](self, "gotoBookspot:minor:", v3, 1);
}

- (void)p_removeStackItemAtIndex:(unint64_t)a3
{
  char *v5;
  uint64_t v6;

  if ((unint64_t)-[NSMutableArray count](-[THPageSpotHistory stack](self, "stack"), "count") > a3)
  {
    -[NSMutableArray removeObjectAtIndex:](-[THPageSpotHistory stack](self, "stack"), "removeObjectAtIndex:", a3);
    if (-[THPageSpotHistory cursorIndex](self, "cursorIndex") > a3)
      -[THPageSpotHistory setCursorIndex:](self, "setCursorIndex:", (char *)-[THPageSpotHistory cursorIndex](self, "cursorIndex") - 1);
    v5 = (char *)-[THPageSpotHistory cursorIndex](self, "cursorIndex") + 1;
    if (v5 > -[NSMutableArray count](-[THPageSpotHistory stack](self, "stack"), "count"))
    {
      if (-[NSMutableArray count](-[THPageSpotHistory stack](self, "stack"), "count"))
        v6 = (uint64_t)-[NSMutableArray count](-[THPageSpotHistory stack](self, "stack"), "count") - 1;
      else
        v6 = 0x7FFFFFFFFFFFFFFFLL;
      -[THPageSpotHistory setCursorIndex:](self, "setCursorIndex:", v6);
    }
  }
}

- (void)p_cleanseStack
{
  char *v3;
  uint64_t v4;
  char *v5;
  id v6;

  if (-[THPageSpotHistory rejectDuplicates](self, "rejectDuplicates")
    && (unint64_t)-[NSMutableArray count](-[THPageSpotHistory stack](self, "stack"), "count") >= 2)
  {
    v3 = 0;
    v4 = 1;
    do
    {
      if (objc_msgSend(-[NSMutableArray objectAtIndex:](-[THPageSpotHistory stack](self, "stack"), "objectAtIndex:", v3), "isEqual:", -[NSMutableArray objectAtIndex:](-[THPageSpotHistory stack](self, "stack"), "objectAtIndex:", v4)))
      {
        if ((char *)-[THPageSpotHistory cursorIndex](self, "cursorIndex") == v3)
          v5 = (char *)v4;
        else
          v5 = v3;
        -[THPageSpotHistory p_removeStackItemAtIndex:](self, "p_removeStackItemAtIndex:", v5);
      }
      else
      {
        v3 = (char *)v4;
      }
      v4 = (uint64_t)(v3 + 1);
    }
    while (v3 + 1 < -[NSMutableArray count](-[THPageSpotHistory stack](self, "stack"), "count"));
  }
  if (-[THPageSpotHistory stackLimit](self, "stackLimit")
    && -[THPageSpotHistory stackLimit](self, "stackLimit") != 0x7FFFFFFFFFFFFFFFLL)
  {
    while (1)
    {
      v6 = -[NSMutableArray count](-[THPageSpotHistory stack](self, "stack"), "count");
      if (v6 <= (id)-[THPageSpotHistory stackLimit](self, "stackLimit"))
        break;
      -[THPageSpotHistory p_removeStackItemAtIndex:](self, "p_removeStackItemAtIndex:", 0);
    }
  }
}

- (void)p_pushBookspot:(id)a3
{
  if (!-[THPageSpotHistory rejectDuplicates](self, "rejectDuplicates")
    || (objc_msgSend(a3, "isEqual:", -[THPageSpotHistory curBookspot](self, "curBookspot")) & 1) == 0)
  {
    -[NSMutableArray addObject:](-[THPageSpotHistory stack](self, "stack"), "addObject:", a3);
    -[THPageSpotHistory setCursorIndex:](self, "setCursorIndex:", (char *)-[NSMutableArray count](-[THPageSpotHistory stack](self, "stack"), "count") - 1);
    -[THPageSpotHistory p_cleanseStack](self, "p_cleanseStack");
  }
}

- (void)p_clearUpperStack
{
  char *v3;

  v3 = -[THPageSpotHistory cursorIndex](self, "cursorIndex");
  if (v3 < (char *)-[NSMutableArray count](-[THPageSpotHistory stack](self, "stack"), "count") - 1)
    -[NSMutableArray removeObjectsInRange:](-[THPageSpotHistory stack](self, "stack"), "removeObjectsInRange:", (char *)-[THPageSpotHistory cursorIndex](self, "cursorIndex") + 1, (char *)-[NSMutableArray count](-[THPageSpotHistory stack](self, "stack"), "count")+ ~-[THPageSpotHistory cursorIndex](self, "cursorIndex"));
}

- (id)p_bookspotAtCursor:(unint64_t)a3
{
  if ((unint64_t)-[NSMutableArray count](-[THPageSpotHistory stack](self, "stack"), "count") <= a3)
    return 0;
  else
    return -[NSMutableArray objectAtIndex:](-[THPageSpotHistory stack](self, "stack"), "objectAtIndex:", a3);
}

- (void)p_setBookspot:(id)a3
{
  if (a3)
    -[NSMutableArray replaceObjectAtIndex:withObject:](-[THPageSpotHistory stack](self, "stack"), "replaceObjectAtIndex:withObject:", -[THPageSpotHistory cursorIndex](self, "cursorIndex"), a3);
}

+ (id)bookspotWithPageIndex:(unint64_t)a3
{
  return -[THPageLocation initWithAbsolutePageIndex:]([THPageLocation alloc], "initWithAbsolutePageIndex:", a3);
}

+ (unint64_t)pageIndexFromBookspot:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;

  v4 = objc_opt_class(THPageLocation);
  *(_QWORD *)&v6 = TSUDynamicCast(v4, a3).n128_u64[0];
  if (v5)
    return (unint64_t)objc_msgSend(v5, "absolutePhysicalPageIndex", v6);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)curBookspot
{
  return -[THPageSpotHistory p_bookspotAtCursor:](self, "p_bookspotAtCursor:", -[THPageSpotHistory cursorIndex](self, "cursorIndex"));
}

- (BOOL)p_hasPrevImmediateBookspot
{
  return -[THPageSpotHistory cursorIndex](self, "cursorIndex") != 0;
}

- (unint64_t)p_prevImmediateBookspotCursorIndex
{
  if (-[THPageSpotHistory cursorIndex](self, "cursorIndex"))
    return -[THPageSpotHistory cursorIndex](self, "cursorIndex") - 1;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)p_prevImmediateBookspot
{
  unint64_t v3;
  _BOOL8 v5;
  unint64_t v6;

  v3 = -[THPageSpotHistory cursorIndex](self, "cursorIndex");
  v5 = objc_msgSend(-[THPageSpotHistory curBookspot](self, "curBookspot"), "pageIndex") == (id)0x7FFFFFFFFFFFFFFFLL
    && v3 != 0;
  v6 = v3 - v5;
  if (v6)
    return -[THPageSpotHistory p_bookspotAtCursor:](self, "p_bookspotAtCursor:", v6 - 1);
  else
    return 0;
}

- (BOOL)p_hasNextImmediateBookspot
{
  char *v3;

  v3 = (char *)-[THPageSpotHistory cursorIndex](self, "cursorIndex") + 1;
  return v3 < -[NSMutableArray count](-[THPageSpotHistory stack](self, "stack"), "count");
}

- (unint64_t)p_nextImmediateBookspotCursorIndex
{
  char *v3;

  v3 = (char *)-[THPageSpotHistory cursorIndex](self, "cursorIndex") + 1;
  if (v3 >= -[NSMutableArray count](-[THPageSpotHistory stack](self, "stack"), "count"))
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return -[THPageSpotHistory cursorIndex](self, "cursorIndex") + 1;
}

- (id)p_nextImmediateBookspot
{
  char *v3;

  v3 = (char *)-[THPageSpotHistory cursorIndex](self, "cursorIndex") + 1;
  if (v3 >= -[NSMutableArray count](-[THPageSpotHistory stack](self, "stack"), "count"))
    return 0;
  else
    return -[THPageSpotHistory p_bookspotAtCursor:](self, "p_bookspotAtCursor:", (char *)-[THPageSpotHistory cursorIndex](self, "cursorIndex") + 1);
}

- (BOOL)p_hasPrevDistinctBookspot
{
  return -[THPageSpotHistory p_prevDistinctBookspot](self, "p_prevDistinctBookspot") != 0;
}

- (unint64_t)p_prevDistinctBookspotCursorIndex
{
  unint64_t v3;
  id v4;

  v3 = -[THPageSpotHistory cursorIndex](self, "cursorIndex");
  v4 = -[THPageSpotHistory curBookspot](self, "curBookspot");
  if (objc_msgSend(v4, "pageIndex") == (id)0x7FFFFFFFFFFFFFFFLL && v3)
  {
    --v3;
  }
  else
  {
    if (v3)
    {
      while (v3)
      {
        if ((objc_msgSend(v4, "isEqual:", -[THPageSpotHistory p_bookspotAtCursor:](self, "p_bookspotAtCursor:", --v3)) & 1) == 0)return v3;
      }
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v3;
}

- (id)p_prevDistinctBookspot
{
  unint64_t v3;

  v3 = -[THPageSpotHistory p_prevDistinctBookspotCursorIndex](self, "p_prevDistinctBookspotCursorIndex");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return -[THPageSpotHistory p_bookspotAtCursor:](self, "p_bookspotAtCursor:", v3);
}

- (BOOL)p_hasNextDistinctBookspot
{
  return -[THPageSpotHistory p_nextDistinctBookspot](self, "p_nextDistinctBookspot") != 0;
}

- (unint64_t)p_nextDistinctBookspotCursorIndex
{
  id v3;
  char *v4;
  unint64_t v5;

  v3 = -[THPageSpotHistory curBookspot](self, "curBookspot");
  v4 = (char *)-[THPageSpotHistory cursorIndex](self, "cursorIndex") + 1;
  if (v4 < -[NSMutableArray count](-[THPageSpotHistory stack](self, "stack"), "count"))
  {
    v5 = -[THPageSpotHistory cursorIndex](self, "cursorIndex");
    while (++v5 < (unint64_t)-[NSMutableArray count](-[THPageSpotHistory stack](self, "stack"), "count"))
    {
      if ((objc_msgSend(v3, "isEqual:", -[THPageSpotHistory p_bookspotAtCursor:](self, "p_bookspotAtCursor:", v5)) & 1) == 0)return v5;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)p_nextDistinctBookspot
{
  unint64_t v3;

  v3 = -[THPageSpotHistory p_nextDistinctBookspotCursorIndex](self, "p_nextDistinctBookspotCursorIndex");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return -[THPageSpotHistory p_bookspotAtCursor:](self, "p_bookspotAtCursor:", v3);
}

- (BOOL)gotoBookspot:(id)a3 minor:(BOOL)a4
{
  if (a3)
  {
    if (a4)
    {
      -[THPageSpotHistory p_setBookspot:](self, "p_setBookspot:", a3);
      if (-[THPageSpotHistory clearUpperStackOnMinorPaging](self, "clearUpperStackOnMinorPaging"))
        -[THPageSpotHistory p_clearUpperStack](self, "p_clearUpperStack");
    }
    else
    {
      -[THPageSpotHistory p_clearUpperStack](self, "p_clearUpperStack");
      -[THPageSpotHistory p_pushBookspot:](self, "p_pushBookspot:", a3);
    }
  }
  return a3 != 0;
}

- (BOOL)p_gotoPrevImmediateBookspot
{
  _BOOL4 v3;

  v3 = -[THPageSpotHistory p_hasPrevBookspot](self, "p_hasPrevBookspot");
  if (v3)
    -[THPageSpotHistory setCursorIndex:](self, "setCursorIndex:", (char *)-[THPageSpotHistory cursorIndex](self, "cursorIndex") - 1);
  -[THPageSpotHistory p_cleanseStack](self, "p_cleanseStack");
  return v3;
}

- (BOOL)p_gotoNextImmediateBookspot
{
  _BOOL4 v3;

  v3 = -[THPageSpotHistory p_hasNextBookspot](self, "p_hasNextBookspot");
  if (v3)
    -[THPageSpotHistory setCursorIndex:](self, "setCursorIndex:", (char *)-[THPageSpotHistory cursorIndex](self, "cursorIndex") + 1);
  -[THPageSpotHistory p_cleanseStack](self, "p_cleanseStack");
  return v3;
}

- (BOOL)p_gotoPrevDistinctBookspot
{
  unint64_t v3;

  v3 = -[THPageSpotHistory p_prevDistinctBookspotCursorIndex](self, "p_prevDistinctBookspotCursorIndex");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    -[THPageSpotHistory setCursorIndex:](self, "setCursorIndex:", v3);
  -[THPageSpotHistory p_cleanseStack](self, "p_cleanseStack");
  return v3 != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)p_gotoNextDistinctBookspot
{
  unint64_t v3;

  v3 = -[THPageSpotHistory p_nextDistinctBookspotCursorIndex](self, "p_nextDistinctBookspotCursorIndex");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    -[THPageSpotHistory setCursorIndex:](self, "setCursorIndex:", v3);
  -[THPageSpotHistory p_cleanseStack](self, "p_cleanseStack");
  return v3 != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)gotoPrevBookspot
{
  unsigned int v3;
  uint64_t v4;
  double v5;
  uint64_t v6;

  v3 = -[THPageSpotHistory hasPrevBookspot](self, "hasPrevBookspot");
  if (v3)
  {
    -[THPageSpotHistory recordCurrentLocationInHistory](self, "recordCurrentLocationInHistory");
    if (-[THPageSpotHistory seekDistinctSpots](self, "seekDistinctSpots"))
      -[THPageSpotHistory p_gotoPrevDistinctBookspot](self, "p_gotoPrevDistinctBookspot");
    else
      -[THPageSpotHistory p_gotoPrevImmediateBookspot](self, "p_gotoPrevImmediateBookspot");
    v4 = objc_opt_class(THPageLocation);
    *(_QWORD *)&v5 = TSUDynamicCast(v4, -[THPageSpotHistory curBookspot](self, "curBookspot")).n128_u64[0];
    LOBYTE(v3) = -[THPageSpotHistoryDelegate jumpToPageLocation:touchHistory:minor:](-[THPageSpotHistory delegate](self, "delegate", v5), "jumpToPageLocation:touchHistory:minor:", v6, 0, 1);
  }
  return v3;
}

- (BOOL)gotoNextBookspot
{
  unsigned int v3;
  uint64_t v4;
  double v5;
  uint64_t v6;

  v3 = -[THPageSpotHistory hasNextBookspot](self, "hasNextBookspot");
  if (v3)
  {
    -[THPageSpotHistory recordCurrentLocationInHistory](self, "recordCurrentLocationInHistory");
    if (-[THPageSpotHistory seekDistinctSpots](self, "seekDistinctSpots"))
      -[THPageSpotHistory p_gotoNextDistinctBookspot](self, "p_gotoNextDistinctBookspot");
    else
      -[THPageSpotHistory p_gotoNextImmediateBookspot](self, "p_gotoNextImmediateBookspot");
    v4 = objc_opt_class(THPageLocation);
    *(_QWORD *)&v5 = TSUDynamicCast(v4, -[THPageSpotHistory curBookspot](self, "curBookspot")).n128_u64[0];
    LOBYTE(v3) = -[THPageSpotHistoryDelegate jumpToPageLocation:touchHistory:minor:](-[THPageSpotHistory delegate](self, "delegate", v5), "jumpToPageLocation:touchHistory:minor:", v6, 0, 1);
  }
  return v3;
}

- (id)prevBookspot
{
  return -[THPageSpotHistory p_prevBookspot](self, "p_prevBookspot");
}

- (id)nextBookspot
{
  return -[THPageSpotHistory p_nextBookspot](self, "p_nextBookspot");
}

- (BOOL)gotoBookspotPageIndex:(unint64_t)a3 minor:(BOOL)a4
{
  return -[THPageSpotHistory gotoBookspot:minor:](self, "gotoBookspot:minor:", +[THPageSpotHistory bookspotWithPageIndex:](THPageSpotHistory, "bookspotWithPageIndex:", a3), a4);
}

- (BOOL)p_hasPrevBookspot
{
  if (-[THPageSpotHistory seekDistinctSpots](self, "seekDistinctSpots"))
    return -[THPageSpotHistory p_hasPrevDistinctBookspot](self, "p_hasPrevDistinctBookspot");
  else
    return -[THPageSpotHistory p_hasPrevImmediateBookspot](self, "p_hasPrevImmediateBookspot");
}

- (id)p_prevBookspot
{
  if (-[THPageSpotHistory seekDistinctSpots](self, "seekDistinctSpots"))
    return -[THPageSpotHistory p_prevDistinctBookspot](self, "p_prevDistinctBookspot");
  else
    return -[THPageSpotHistory p_prevImmediateBookspot](self, "p_prevImmediateBookspot");
}

- (BOOL)p_hasNextBookspot
{
  if (-[THPageSpotHistory seekDistinctSpots](self, "seekDistinctSpots"))
    return -[THPageSpotHistory p_hasNextDistinctBookspot](self, "p_hasNextDistinctBookspot");
  else
    return -[THPageSpotHistory p_hasNextImmediateBookspot](self, "p_hasNextImmediateBookspot");
}

- (id)p_nextBookspot
{
  if (-[THPageSpotHistory seekDistinctSpots](self, "seekDistinctSpots"))
    return -[THPageSpotHistory p_nextDistinctBookspot](self, "p_nextDistinctBookspot");
  else
    return -[THPageSpotHistory p_nextImmediateBookspot](self, "p_nextImmediateBookspot");
}

- (THPageSpotHistoryDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THPageSpotHistoryDelegate *)a3;
}

- (NSMutableArray)stack
{
  return self->mStack;
}

- (void)setStack:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)cursorIndex
{
  return self->mCursorIndex;
}

- (void)setCursorIndex:(unint64_t)a3
{
  self->mCursorIndex = a3;
}

- (unint64_t)stackLimit
{
  return self->mStackLimit;
}

- (void)setStackLimit:(unint64_t)a3
{
  self->mStackLimit = a3;
}

- (BOOL)clearUpperStackOnMinorPaging
{
  return self->mClearUpperStackOnMinorPaging;
}

- (void)setClearUpperStackOnMinorPaging:(BOOL)a3
{
  self->mClearUpperStackOnMinorPaging = a3;
}

- (BOOL)rejectDuplicates
{
  return self->mRejectDuplicates;
}

- (void)setRejectDuplicates:(BOOL)a3
{
  self->mRejectDuplicates = a3;
}

- (BOOL)seekDistinctSpots
{
  return self->mSeekDistinctSpots;
}

- (void)setSeekDistinctSpots:(BOOL)a3
{
  self->mSeekDistinctSpots = a3;
}

@end
