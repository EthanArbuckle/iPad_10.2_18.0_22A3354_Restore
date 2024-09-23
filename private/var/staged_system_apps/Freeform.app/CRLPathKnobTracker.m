@implementation CRLPathKnobTracker

- (CRLPathKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  CRLPathKnobTracker *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CRLPathKnobTracker *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  char *v25;
  id v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  CRLPathKnobTracker *v41;
  id v42;
  objc_super v43;
  _BYTE v44[128];

  v43.receiver = self;
  v43.super_class = (Class)CRLPathKnobTracker;
  v34 = a3;
  v35 = a4;
  v5 = -[CRLCanvasKnobTracker initWithRep:knob:](&v43, "initWithRep:knob:", v34);
  if (v5)
  {
    if ((objc_msgSend(v34, "conformsToProtocol:", &OBJC_PROTOCOL___CRLPathEditableRep) & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101257820);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2A7F0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101257840);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathKnobTracker initWithRep:knob:]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathKnobTracker.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 48, 0, "reps conforming to CRLPathEditableRep protocol only valid for path node knob tracker");

    }
    if (objc_msgSend(v35, "tag") != (id)17
      && objc_msgSend(v35, "tag") != (id)18
      && objc_msgSend(v35, "tag") != (id)19
      && objc_msgSend(v35, "tag") != (id)20
      && objc_msgSend(v35, "tag") != (id)22
      && objc_msgSend(v35, "tag") != (id)21
      && objc_msgSend(v35, "tag") != (id)23
      && objc_msgSend(v35, "tag") != (id)24)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101257860);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2A770();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101257880);
      v9 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathKnobTracker initWithRep:knob:]"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathKnobTracker.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 49, 0, "wrong knob for path node knob tracker");

    }
    if (objc_msgSend(v35, "tag") == (id)22 || objc_msgSend(v35, "tag") == (id)24)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnobTracker pathKnob](v5, "pathKnob"));
      -[CRLPathKnobTracker p_createDelegateIfNecessary](v5, "p_createDelegateIfNecessary");
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10039DAC8;
      v40[3] = &unk_10124E0C0;
      v12 = v5;
      v41 = v12;
      v13 = v33;
      v42 = v13;
      -[CRLPathKnobTracker startWithNodeCreationBlock:](v12, "startWithNodeCreationBlock:", v40);
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](v12, "rep"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "knobs"));

      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v37;
        while (2)
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v37 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
            objc_opt_class(CRLPathKnob, v16);
            v22 = sub_100221D0C(v21, v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
            v24 = v23;
            if (v23)
            {
              v25 = (char *)objc_msgSend(v23, "nodeIndex");
              if (v25 == (char *)objc_msgSend(v13, "nodeIndex") + 1)
              {
                v26 = objc_msgSend(v24, "subpathIndex");
                if (v26 == objc_msgSend(v13, "subpathIndex") && objc_msgSend(v24, "tag") == (id)17)
                {
                  -[CRLCanvasKnobTracker setKnob:](v12, "setKnob:", v24);

                  goto LABEL_44;
                }
              }
            }

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v17)
            continue;
          break;
        }
      }
LABEL_44:

    }
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](v5, "knob"));
  v28 = v27 == 0;

  if (v28)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012578A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2A6F0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012578C0);
    v29 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathKnobTracker initWithRep:knob:]"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathKnobTracker.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 96, 0, "knob tracker should never have a null knob");

  }
  return v5;
}

- (CRLPathKnobTracker)initWithRep:(id)a3 creatingKnobAtPoint:(CGPoint)a4 initialPoint:(BOOL)a5 reversed:(BOOL)a6
{
  CGFloat y;
  CGFloat x;
  CRLPathKnobTracker *v11;
  CRLPathKnobTracker *v12;
  CRLPathKnobTracker *v13;
  void *v14;
  void *v15;
  char *v16;
  char *v17;
  void *v18;
  char *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  char *v24;
  uint64_t v25;
  void *i;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  CRLPathKnobTracker *v46;
  CGFloat v47;
  CGFloat v48;
  BOOL v49;
  BOOL v50;
  objc_super v51;
  _BYTE v52[128];

  y = a4.y;
  x = a4.x;
  v40 = a3;
  v51.receiver = self;
  v51.super_class = (Class)CRLPathKnobTracker;
  v11 = -[CRLCanvasKnobTracker init](&v51, "init");
  v12 = v11;
  if (v11)
  {
    -[CRLCanvasKnobTracker setRep:](v11, "setRep:", v40);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10039E264;
    v45[3] = &unk_1012578E8;
    v13 = v12;
    v46 = v13;
    v49 = a5;
    v47 = x;
    v48 = y;
    v50 = a6;
    -[CRLPathKnobTracker startWithNodeCreationBlock:](v13, "startWithNodeCreationBlock:", v45);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnobTracker editablePathSource](v13, "editablePathSource"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "subpaths"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "subpaths"));
    v16 = (char *)objc_msgSend(v15, "count");

    if (a6)
    {
      v17 = 0;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "nodes"));
      v19 = (char *)objc_msgSend(v18, "count");

      v17 = v19 - 1;
    }
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](v13, "rep"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "knobs"));

    v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    if (v23)
    {
      v24 = v16 - 1;
      v25 = *(_QWORD *)v42;
      while (2)
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v42 != v25)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
          objc_opt_class(CRLPathKnob, v22);
          v29 = sub_100221D0C(v28, v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          v31 = v30;
          if (v30 && objc_msgSend(v30, "subpathIndex") == v24 && objc_msgSend(v31, "nodeIndex") == v17)
          {
            -[CRLCanvasKnobTracker setKnob:](v13, "setKnob:", v31);

            goto LABEL_17;
          }

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
        if (v23)
          continue;
        break;
      }
    }
LABEL_17:

    -[CRLPathKnobTracker setIsCreatingNode:](v13, "setIsCreatingNode:", 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](v13, "knob"));
    v33 = v32 == 0;

    if (v33)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101257908);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2A870();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101257928);
      v34 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathKnobTracker initWithRep:creatingKnobAtPoint:initialPoint:reversed:]"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathKnobTracker.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v35, v36, 149, 0, "should have created a knob, but got nil");

    }
  }

  return v12;
}

- (void)startWithNodeCreationBlock:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(void);

  v11 = (void (**)(void))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker icc](self, "icc"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));

  if (!-[CRLPathKnobTracker didOpenGroup](self, "didOpenGroup"))
    objc_msgSend(v5, "openGroup");
  objc_msgSend(v5, "enableProgressiveEnqueuingInCurrentGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Add Point"), 0, CFSTR("UndoStrings")));
  objc_msgSend(v5, "setCurrentGroupActionString:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnobTracker pathRep](self, "pathRep"));
  objc_msgSend(v8, "dynamicOperationDidBeginWithRealTimeCommands:", 0);
  objc_msgSend(v8, "dynamicMovePathKnobDidBegin");
  v11[2]();
  objc_msgSend(v8, "dynamicMovePathKnobDidEndWithTracker:", 0);
  objc_msgSend(v8, "dynamicOperationDidEnd");
  objc_msgSend(v8, "invalidateKnobs");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layout"));
  objc_msgSend(v9, "invalidateFrame");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layout"));
  objc_msgSend(v10, "validate");

  -[CRLPathKnobTracker setDidOpenGroup:](self, "setDidOpenGroup:", 1);
  self->mCreatedNode = 1;

}

- (id)editablePathSource
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editablePathSource"));

  return v3;
}

- (NSArray)decoratorOverlayRenderables
{
  return (NSArray *)&__NSArray0__struct;
}

- (BOOL)shouldHideOtherKnobs
{
  return 0;
}

- (void)updateKnobs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char *v19;
  void *v20;
  char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *j;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnobTracker editablePathSource](self, "editablePathSource"));
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "knobs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObject:", v5));

  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        objc_opt_class(CRLPathKnob, v7);
        v13 = sub_100221D0C(v12, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "subpaths"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v14, "subpathIndex")));

          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "nodes"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v14, "nodeIndex")));
          objc_msgSend(v14, "setNode:", v18);

          if ((objc_msgSend(v16, "isClosed") & 1) != 0
            || (v19 = (char *)objc_msgSend(v14, "nodeIndex"), v19 + 1 < objc_msgSend(v17, "count")))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", ((unint64_t)objc_msgSend(v14, "nodeIndex") + 1)% (unint64_t)objc_msgSend(v17, "count")));
            objc_msgSend(v14, "setNextNode:", v20);

          }
          if ((objc_msgSend(v16, "isClosed") & 1) != 0 || objc_msgSend(v14, "nodeIndex"))
          {
            if (objc_msgSend(v14, "nodeIndex"))
              v21 = (char *)objc_msgSend(v14, "nodeIndex");
            else
              v21 = (char *)objc_msgSend(v17, "count");
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", v21 - 1));
            objc_msgSend(v14, "setPrevNode:", v22);

          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v8);
  }

  if (-[CRLPathKnobTracker didOpenGroup](self, "didOpenGroup")
    || -[CRLPathKnobTracker isCreatingNode](self, "isCreatingNode"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnobTracker pathKnob](self, "pathKnob"));
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "knobs"));

    v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v40;
      while (2)
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(_QWORD *)v40 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)j);
          objc_opt_class(CRLPathKnob, v26);
          v32 = sub_100221D0C(v31, v30);
          v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
          v34 = v33;
          if (v33)
          {
            v35 = objc_msgSend(v33, "subpathIndex");
            if (v35 == objc_msgSend(v23, "subpathIndex"))
            {
              v36 = objc_msgSend(v34, "nodeIndex");
              if (v36 == objc_msgSend(v23, "nodeIndex"))
              {
                v37 = objc_msgSend(v34, "tag");
                if (v37 == objc_msgSend(v23, "tag"))
                {
                  -[CRLCanvasKnobTracker setKnob:](self, "setKnob:", v34);

                  goto LABEL_34;
                }
              }
            }
          }

        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v27)
          continue;
        break;
      }
    }
LABEL_34:

  }
}

- (void)beginMovingKnob
{
  CRLEditableBezierPathSourceMorphInfo *v3;
  CRLEditableBezierPathSourceMorphInfo *mMorphInfo;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v57;
  objc_super v58;
  _BYTE v59[128];

  v58.receiver = self;
  v58.super_class = (Class)CRLPathKnobTracker;
  -[CRLCanvasKnobTracker beginMovingKnob](&v58, "beginMovingKnob");
  -[CRLPathKnobTracker p_createDelegateIfNecessary](self, "p_createDelegateIfNecessary");
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker icc](self, "icc"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnobTracker pathKnob](self, "pathKnob"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  objc_msgSend(v47, "addDecorator:", self);
  objc_msgSend(v49, "dynamicMovePathKnobDidBegin");
  -[CRLPathKnobTracker updateKnobs](self, "updateKnobs");
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnobTracker editablePathSource](self, "editablePathSource"));
  v3 = -[CRLEditableBezierPathSourceMorphInfo initWithEditableBezierPathSource:]([CRLEditableBezierPathSourceMorphInfo alloc], "initWithEditableBezierPathSource:", v48);
  mMorphInfo = self->mMorphInfo;
  self->mMorphInfo = v3;

  if (!self->mToggleNodeType)
    goto LABEL_13;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker icc](self, "icc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));

  if (!-[CRLPathKnobTracker didOpenGroup](self, "didOpenGroup"))
    objc_msgSend(v6, "openGroup");
  if (-[CRLPathKnobTracker createBezierNode](self, "createBezierNode")
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "node")),
        v8 = objc_msgSend(v7, "type") == (id)2,
        v7,
        !v8))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Make Bézier Point"), 0, CFSTR("UndoStrings")));
    objc_msgSend(v6, "setCurrentGroupActionString:", v13);
    v14 = 2;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "node"));
    if (objc_msgSend(v9, "type") == (id)3)
    {

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "node"));
      v11 = objc_msgSend(v10, "type") == (id)2;

      if (!v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Make Smooth Point"), 0, CFSTR("UndoStrings")));
        objc_msgSend(v6, "setCurrentGroupActionString:", v13);
        v14 = 3;
        goto LABEL_12;
      }
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Make Sharp Point"), 0, CFSTR("UndoStrings")));
    objc_msgSend(v6, "setCurrentGroupActionString:", v13);
    v14 = 1;
  }
LABEL_12:

  -[CRLPathKnobTracker setDidOpenGroup:](self, "setDidOpenGroup:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "node"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "prevNode"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "nextNode"));
  objc_msgSend(v48, "toggleNode:toType:prevNode:nextNode:", v15, v14, v16, v17);

LABEL_13:
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "node"));
  self->mInitialReflectState = objc_msgSend(v18, "reflectedState");

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "prevNode"));
  self->mPrevInitialReflectState = objc_msgSend(v19, "reflectedState");

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "prevNode"));
  self->mPrevNodeOriginalType = (int64_t)objc_msgSend(v20, "type");

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "node"));
  self->mNodeOriginalType = (int64_t)objc_msgSend(v21, "type");

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "nextNode"));
  self->mNextNodeOriginalType = (int64_t)objc_msgSend(v22, "type");

  memset(&v57, 0, sizeof(v57));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layout"));
  v25 = v24;
  if (v24)
    objc_msgSend(v24, "transformInRoot");
  else
    memset(&t1, 0, sizeof(t1));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnobTracker pathRep](self, "pathRep"));
  v27 = v26;
  if (v26)
    objc_msgSend(v26, "naturalToEditablePathSpaceTransform");
  else
    memset(&t2, 0, sizeof(t2));
  CGAffineTransformConcat(&v57, &t1, &t2);

  objc_msgSend(v50, "position");
  self->mOriginalUnscaledKnobPosition = (CGPoint)vaddq_f64(*(float64x2_t *)&v57.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v57.c, v28), *(float64x2_t *)&v57.a, v29));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "node"));
  objc_msgSend(v30, "setSelected:", 1);

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "knobs"));
  v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(_QWORD *)v52 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
        objc_opt_class(CRLPathKnob, v32);
        v38 = sub_100221D0C(v37, v36);
        v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        v40 = v39;
        if (v39)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "node"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "node"));
          v43 = v41;
          if (v41 == v42)
            goto LABEL_30;
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "node"));
          if ((objc_msgSend(v44, "isSelected") & 1) == 0)
          {

            v43 = v42;
LABEL_30:

            goto LABEL_31;
          }
          v45 = objc_msgSend(v40, "tag") == (id)17;

          if (v45)
          {
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "node"));
            objc_msgSend(v46, "setSelected:", 0);

            objc_msgSend(v40, "updateImage");
          }
        }
LABEL_31:

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v33);
  }

  objc_msgSend(v49, "invalidateKnobs");
  objc_msgSend(v50, "updateImage");

}

- (int)reflectionStateForBendingNodeType:(int64_t)a3 originalReflectionState:(int)a4
{
  if (a3 == 1)
    a4 = 0;
  if (a3 == 3)
    return 1;
  else
    return a4;
}

- (void)moveSmoothControlKnob:(id)a3 to:(CGPoint)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  float v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  float v65;
  float v66;
  float v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  id v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  float v93;
  double v94;
  double v95;
  double v96;
  float v97;
  double v98;
  double v99;
  double v101;
  int64_t mNodeOriginalType;
  void *v103;
  double v104;
  double v105;
  double v106;
  float v107;
  float v108;
  double v109;
  float v110;
  float v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  uint64_t v124;
  int64_t v125;
  double v126;
  double v127;
  double v128;
  double v129;
  float v130;
  float v131;
  double v132;
  float v133;
  float v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  uint64_t v149;
  double v150;
  double v151;
  double v152;
  void *v153;
  double v154;
  double v155;
  BOOL v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double y;
  double v182;
  double x;
  id v184;

  y = a4.y;
  x = a4.x;
  v184 = a3;
  if (objc_msgSend(v184, "tag") == (id)21)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "node"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "nextNode"));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "prevNode"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "node"));
  }
  v7 = (void *)v6;
  v8 = v5;
  objc_msgSend(v5, "nodePoint");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v5, "outControlPoint");
  if (sub_10005FDF0(v10, v12, v13, v14))
  {
    objc_msgSend(v7, "inControlPoint");
    v16 = v15;
    v18 = v17;
    objc_msgSend(v7, "nodePoint");
    if (sub_10005FDF0(v16, v18, v19, v20))
    {
      objc_msgSend(v5, "nodePoint");
      v22 = v21;
      v24 = v23;
      objc_msgSend(v7, "nodePoint");
      objc_msgSend(v5, "setOutControlPoint:", sub_100061A8C(v22, v24, v25, v26, 0.333333333));
      objc_msgSend(v5, "nodePoint");
      v28 = v27;
      v30 = v29;
      objc_msgSend(v7, "nodePoint");
      objc_msgSend(v7, "setInControlPoint:", sub_100061A8C(v28, v30, v31, v32, 0.666666667));
    }
  }
  objc_msgSend(v5, "nodePoint");
  v34 = v33;
  v36 = v35;
  objc_msgSend(v5, "outControlPoint");
  v38 = v37;
  v40 = v39;
  objc_msgSend(v7, "inControlPoint");
  v42 = v41;
  v44 = v43;
  objc_msgSend(v7, "nodePoint");
  v46 = v45;
  v48 = v47;
  if (objc_msgSend(v184, "tag") != (id)23)
  {
    if (objc_msgSend(v184, "tag") == (id)21)
    {
      mNodeOriginalType = self->mNodeOriginalType;
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "node"));
      v179 = sub_1000603DC(v34, v36, -1.0);
      v176 = y + v104;
      v105 = sub_1000603DC(v42, v44, 3.0);
      v168 = v106;
      v172 = v105;
      v161 = v36 + v106 - v48;
      v163 = v34 + v105 - v46;
      v107 = sub_100061070(x - v34, y - v36);
      v108 = v107 * 3.0;
      v109 = sub_100061070(v34 - v42, v36 - v44);
      v110 = v109 + sub_100061070(v42 - v46, v44 - v48);
      v111 = fminf(sqrtf(v108 / v110) / 3.0, 0.5);
      v112 = sub_1000603DC(v163, v161, (float)(v111 * (float)(v111 * v111)));
      v114 = v176 + v113;
      v115 = sub_1000603DC(v34, v36, -3.0);
      v117 = sub_1000603DC(v115 - v172, v116 - v168, (float)(v111 * v111));
      v119 = v114 + v118;
      v120 = sub_1000603DC(v34, v36, (float)(v111 * 3.0));
      v122 = (float)((float)(v111 + -1.0) * (float)((float)(v111 * 3.0) * (float)(v111 + -1.0)));
      objc_msgSend(v103, "setOutControlPoint:reflect:constrain:", mNodeOriginalType == 3, 0, (x + v179 + v112 + v117 + v120) / v122, (v119 + v121) / v122);
    }
    else
    {
      if (objc_msgSend(v184, "tag") != (id)20)
        goto LABEL_42;
      v125 = self->mNodeOriginalType;
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "node"));
      v173 = v36 - y;
      v126 = sub_1000603DC(v34, v36, -1.0);
      v164 = v127;
      v128 = sub_1000603DC(v38, v40, 3.0);
      v177 = v129;
      v180 = v128;
      v165 = v48 + v164 + v129;
      v169 = v46 + v126 + v128;
      v130 = sub_100061070(x - v46, y - v48);
      v131 = v130 * 3.0;
      v132 = sub_100061070(v34 - v38, v36 - v40);
      v133 = v132 + sub_100061070(v38 - v46, v40 - v48);
      v134 = 1.0 - fminf(sqrtf(v131 / v133) / 3.0, 0.33333);
      v182 = sub_1000603DC(v169, v165, (float)(v134 * (float)(v134 * v134)));
      v174 = v173 + v135;
      v136 = sub_1000603DC(v34, v36, 3.0);
      v138 = v137;
      v139 = sub_1000603DC(v38, v40, 6.0);
      v141 = sub_1000603DC(v136 - v139, v138 - v140, (float)(v134 * v134));
      v143 = v174 + v142;
      v144 = sub_1000603DC(v34, v36, -3.0);
      v146 = sub_1000603DC(v180 + v144, v177 + v145, v134);
      v148 = (float)((float)(v134 + -1.0) * (float)(v134 * (float)(v134 * 3.0)));
      objc_msgSend(v103, "setInControlPoint:reflect:constrain:", v125 == 3, 0, (v34 - x + v182 + v141 + v146) / v148, (v143 + v147) / v148);
    }
LABEL_41:

    goto LABEL_42;
  }
  objc_msgSend(v184, "tValue");
  if (v49 > 0.5)
    v50 = v36;
  else
    v50 = v48;
  if (v49 > 0.5)
    v51 = v34;
  else
    v51 = v46;
  v175 = v51;
  v178 = v50;
  if (v49 <= 0.5)
  {
    v52 = v42;
  }
  else
  {
    v44 = v40;
    v52 = v38;
  }
  if (v49 <= 0.5)
  {
    v53 = v34;
  }
  else
  {
    v36 = v48;
    v53 = v46;
  }
  if (v49 > 0.5)
    v49 = 1.0 - v49;
  v170 = v49;
  v54 = sub_100061070(x - v53, y - v36);
  objc_msgSend(v184, "bendParameter");
  v56 = v55;
  objc_msgSend(v184, "bendParameter");
  v166 = v57;
  v58 = v54;
  v59 = v53 - v52;
  v60 = v52 - v175;
  v61 = v52;
  v62 = v53;
  v63 = v56 * v58;
  v64 = sub_100061070(v59, v36 - v44);
  v65 = v64 + sub_100061070(v60, v44 - v178);
  v66 = sqrt(v63 / v65) / v166;
  v67 = v170;
  *(float *)&v64 = fminf(v66, fmaxf(v67, 0.33333));
  v68 = sub_1000603DC(v62, v36, -1.0);
  v167 = v69;
  v171 = v68;
  v157 = v61;
  v158 = v44;
  v70 = sub_1000603DC(v61, v44, 3.0);
  v72 = v71;
  v73 = sub_1000603DC(v62 + v70 - v175, v36 + v71 - v178, (float)(*(float *)&v64 * (float)(*(float *)&v64 * *(float *)&v64)));
  v160 = v74;
  v162 = v73;
  v75 = sub_1000603DC(v62, v36, -3.0);
  v77 = sub_1000603DC(v75 - v70, v76 - v72, (float)(*(float *)&v64 * *(float *)&v64));
  v79 = v78;
  v159 = v62;
  v80 = v62;
  v81 = v36;
  v82 = sub_1000603DC(v80, v36, (float)(*(float *)&v64 * 3.0));
  v84 = v83;
  v85 = objc_msgSend(v5, "type");
  v86 = y + v167 + v160 + v79 + v84;
  v87 = (float)((float)(*(float *)&v64 + -1.0) * (float)((float)(*(float *)&v64 * 3.0) * (float)(*(float *)&v64 + -1.0)));
  v88 = (x + v171 + v162 + v77 + v82) / v87;
  v89 = v86 / v87;
  if (v85 == (id)1 && objc_msgSend(v7, "type") == (id)1)
  {
    v90 = v159;
    v91 = v81;
    v92 = v178 - v81;
    v93 = sub_100061070(v175 - v159, v178 - v81);
    v94 = (v175 - v159) / v93;
    v95 = v92 / v93;
    v96 = sub_1000603C4(v88 - v159, v89 - v91, v94, v95);
    v97 = v96;
    v98 = sub_1000603DC(v94, v95, v96);
    if (v97 < 0.0 || v97 > v93)
    {
      v101 = v178;
    }
    else
    {
      v150 = v159 + v98;
      v151 = v91 + v99;
      v152 = sub_100061070(v159 + v98 - v88, v91 + v99 - v89);
      v153 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker icc](self, "icc"));
      objc_msgSend(v153, "viewScale");
      v155 = v152 * v154;

      v156 = v155 < 10.0;
      v101 = v178;
      if (v156)
      {
        v89 = v151;
        v88 = v150;
      }
    }
  }
  else
  {
    v101 = v178;
    v90 = v159;
    v91 = v81;
  }
  if (!sub_1000600B4(v90, v91, v88, v89, v175, v101) || !sub_1000600B4(v90, v91, v157, v158, v175, v101))
  {
    objc_msgSend(v184, "tValue", *(_QWORD *)&v157, *(_QWORD *)&v158);
    if (v123 <= 0.5)
    {
      v149 = -[CRLPathKnobTracker reflectionStateForBendingNodeType:originalReflectionState:](self, "reflectionStateForBendingNodeType:originalReflectionState:", self->mPrevNodeOriginalType, self->mPrevInitialReflectState);
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "prevNode"));
      objc_msgSend(v103, "setOutControlPoint:reflect:constrain:", v149, 0, v88, v89);
    }
    else
    {
      v124 = -[CRLPathKnobTracker reflectionStateForBendingNodeType:originalReflectionState:](self, "reflectionStateForBendingNodeType:originalReflectionState:", self->mNodeOriginalType, self->mInitialReflectState);
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "node"));
      objc_msgSend(v103, "setInControlPoint:reflect:constrain:", v124, 0, v88, v89);
    }
    goto LABEL_41;
  }
  objc_msgSend(v8, "nodePoint");
  objc_msgSend(v8, "setOutControlPoint:");
  objc_msgSend(v7, "nodePoint");
  objc_msgSend(v7, "setInControlPoint:");
LABEL_42:

}

- (void)moveKnobToRepPosition:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  float64x2_t v34;
  double v35;
  double v36;
  long double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  unsigned __int8 v43;
  unsigned int v44;
  uint64_t v45;
  unsigned int v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  int64_t mNodeOriginalType;
  void *v55;
  id v56;
  BOOL v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  double v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  CGAffineTransform v84;
  CGAffineTransform v85;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v88;
  CGAffineTransform v89;
  CGAffineTransform v90;
  CGAffineTransform v91;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasBackground"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "alignmentProvider"));
  if (!v9)
    goto LABEL_9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interactiveCanvasController"));
  if ((objc_msgSend(v11, "isCanvasBackgroundAlignmentSnappingEnabled") & 1) == 0)
    goto LABEL_7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnobTracker pathKnob](self, "pathKnob"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "node"));
  if (objc_msgSend(v13, "type") != (id)1)
  {

LABEL_7:
    goto LABEL_8;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnobTracker pathKnob](self, "pathKnob"));
  v15 = objc_msgSend(v14, "tag");

  if (v15 == (id)23)
    goto LABEL_9;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  objc_msgSend(v16, "convertKnobPositionToUnscaledCanvas:", x, y);
  v18 = v17;
  v20 = v19;

  objc_msgSend(v9, "alignmentPointForPoint:", v18, v20);
  v22 = v21;
  v24 = v23;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  objc_msgSend(v10, "convertKnobPositionFromUnscaledCanvas:", v22, v24);
  x = v25;
  y = v26;
LABEL_8:

LABEL_9:
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnobTracker editablePathSource](self, "editablePathSource"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnobTracker pathKnob](self, "pathKnob"));
  memset(&v91, 0, sizeof(v91));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnobTracker pathRep](self, "pathRep"));
  v30 = v29;
  if (v29)
    objc_msgSend(v29, "naturalToEditablePathSpaceTransform");
  else
    memset(&v91, 0, sizeof(v91));

  v89 = v91;
  CGAffineTransformInvert(&v90, &v89);
  v83 = v90.tx + y * v90.c + v90.a * x;
  v81 = v90.ty + y * v90.d + v90.b * x;
  if (-[CRLPathKnobTracker constrain](self, "constrain"))
  {
    memset(&v88, 0, sizeof(v88));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "layout"));
    v33 = v32;
    if (v32)
      objc_msgSend(v32, "transformInRoot");
    else
      memset(&t1, 0, sizeof(t1));
    t2 = v91;
    CGAffineTransformConcat(&v88, &t1, &t2);

    v84 = v88;
    memset(&v85, 0, sizeof(v85));
    CGAffineTransformInvert(&v85, &v84);
    v34 = vaddq_f64(*(float64x2_t *)&v88.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v88.c, v81), *(float64x2_t *)&v88.a, v83));
    v35 = self->mOriginalUnscaledKnobPosition.x;
    v36 = sub_1000603B8(v34.f64[0], v34.f64[1], v35);
    v38 = sub_100061F98(v36, v37);
    v40 = sub_1000603D0(v38, v39, v35);
    v81 = v85.ty + v41 * v85.d + v85.b * v40;
    v83 = v85.tx + v41 * v85.c + v85.a * v40;
  }
  if (-[CRLPathKnobTracker isCreatingNode](self, "isCreatingNode", *(_QWORD *)&v81)
    && -[CRLPathKnobTracker createBezierNode](self, "createBezierNode"))
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    if (objc_msgSend(v42, "BOOLForKey:", CFSTR("TSDCreateBezierNodesByDefault")))
    {

    }
    else
    {
      v43 = -[CRLPathKnobTracker toggleMirrored](self, "toggleMirrored");

      if ((v43 & 1) == 0)
      {
        v45 = 2;
        goto LABEL_27;
      }
    }
  }
  v44 = -[CRLPathKnobTracker initialReflectState](self, "initialReflectState");
  if ((((v44 == 0) ^ -[CRLPathKnobTracker toggleMirrored](self, "toggleMirrored")) & 1) != 0)
  {
    v45 = 0;
  }
  else
  {
    v46 = -[CRLPathKnobTracker initialReflectState](self, "initialReflectState");
    if ((v46 != 2) != -[CRLPathKnobTracker toggleMirrorMagnitude](self, "toggleMirrorMagnitude"))
      v45 = 1;
    else
      v45 = 2;
  }
LABEL_27:
  if (!-[CRLPathKnobTracker isCreatingNode](self, "isCreatingNode"))
  {
    switch((unint64_t)objc_msgSend(v28, "tag"))
    {
      case 0x11uLL:
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "node"));
        objc_msgSend(v69, "nodePoint");
        v71 = sub_1000603B8(v83, v82, v70);
        v73 = v72;

        objc_msgSend(v27, "offsetSelectedNodesByDelta:", v71, v73);
        goto LABEL_46;
      case 0x12uLL:
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "node"));
        objc_msgSend(v74, "setInControlPoint:reflect:constrain:", v45, -[CRLPathKnobTracker constrain](self, "constrain"), v83, v82);
        goto LABEL_45;
      case 0x13uLL:
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "node"));
        objc_msgSend(v74, "setOutControlPoint:reflect:constrain:", v45, -[CRLPathKnobTracker constrain](self, "constrain"), v83, v82);
LABEL_45:

        goto LABEL_46;
      case 0x14uLL:
      case 0x15uLL:
      case 0x17uLL:
        -[CRLPathKnobTracker moveSmoothControlKnob:to:](self, "moveSmoothControlKnob:to:", v28, v83, v82);
        goto LABEL_47;
      default:
        goto LABEL_47;
    }
  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "node"));
  objc_msgSend(v47, "nodePoint");
  v50 = sub_10006108C(v83, v82, v48, v49);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker icc](self, "icc"));
  objc_msgSend(v51, "viewScale");
  v53 = v50 * v52;

  if (v53 <= 10.0)
  {
    mNodeOriginalType = self->mNodeOriginalType;
  }
  else if (-[CRLPathKnobTracker createBezierNode](self, "createBezierNode"))
  {
    mNodeOriginalType = 2;
  }
  else
  {
    mNodeOriginalType = 3;
  }
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "node"));
  v56 = objc_msgSend(v55, "type");

  if ((id)mNodeOriginalType == v56)
  {
    v57 = 0;
  }
  else
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "node"));
    objc_msgSend(v58, "setType:", mNodeOriginalType);

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    objc_msgSend(v59, "invalidateKnobs");

    v57 = mNodeOriginalType != 2;
  }
  if (mNodeOriginalType == 2)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "node"));
    objc_msgSend(v60, "setOutControlPoint:reflect:constrain:", v45, -[CRLPathKnobTracker constrain](self, "constrain"), v83, v82);

    v61 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    objc_msgSend(v61, "invalidateKnobs");

    v57 = 1;
  }
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker icc](self, "icc"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "editorController"));
  *(_QWORD *)&v65 = objc_opt_class(CRLPathEditor, v64).n128_u64[0];
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "mostSpecificCurrentEditorOfClass:", v66, v65));

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  objc_msgSend(v68, "convertNaturalPointToUnscaledCanvas:", v83, v82);
  objc_msgSend(v67, "updateGhostForNodeCreationAtPoint:");

  if (v57)
LABEL_46:
    objc_msgSend(v27, "morphWithMorphInfo:", self->mMorphInfo);
LABEL_47:
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnobTracker pathRep](self, "pathRep"));
  objc_msgSend(v75, "dynamicallyMovedPathKnobTo:withTracker:", self, v83, v82);

  v76 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "knobs"));
  objc_msgSend(v76, "updatePositionsOfKnobs:", v78);

  v79 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "layout"));
  objc_msgSend(v80, "adjustCustomMagnetPositions");

}

- (void)endMovingKnob
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CRLEditableBezierPathSourceMorphInfo *mMorphInfo;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];

  v25.receiver = self;
  v25.super_class = (Class)CRLPathKnobTracker;
  -[CRLCanvasKnobTracker endMovingKnob](&v25, "endMovingKnob");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPathKnobTracker pathRep](self, "pathRep"));
  objc_msgSend(v3, "dynamicMovePathKnobDidEndWithTracker:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandsForAdjustingMagnetsFromClineLayouts"));

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker icc](self, "icc", (_QWORD)v21));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "commandController"));
        objc_msgSend(v13, "enqueueCommand:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  mMorphInfo = self->mMorphInfo;
  self->mMorphInfo = 0;

  -[CRLPathKnobTracker p_closeCommandGroupIfNeeded](self, "p_closeCommandGroupIfNeeded");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker icc](self, "icc"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "editorController"));
  *(_QWORD *)&v18 = objc_opt_class(CRLPathEditor, v17).n128_u64[0];
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mostSpecificCurrentEditorOfClass:", v19, v18));

  if (v20)
    objc_msgSend(v20, "endMovingKnob");

}

- (void)p_closeCommandGroupIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[CRLPathKnobTracker didOpenGroup](self, "didOpenGroup"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker icc](self, "icc"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "commandController"));

    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101257948);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2A8F0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101257968);
      v5 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPathKnobTracker p_closeCommandGroupIfNeeded]"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLPathKnobTracker.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 647, 0, "Can't close command group. This is bad news.");

    }
    objc_msgSend(v4, "closeGroup");

  }
}

- (int)initialReflectState
{
  return self->mInitialReflectState;
}

- (BOOL)constrain
{
  return self->mConstrain;
}

- (void)setConstrain:(BOOL)a3
{
  self->mConstrain = a3;
}

- (BOOL)toggleMirrored
{
  return self->mToggleMirrored;
}

- (void)setToggleMirrored:(BOOL)a3
{
  self->mToggleMirrored = a3;
}

- (BOOL)toggleMirrorMagnitude
{
  return self->mToggleMirrorMagnitude;
}

- (void)setToggleMirrorMagnitude:(BOOL)a3
{
  self->mToggleMirrorMagnitude = a3;
}

- (BOOL)toggleNodeType
{
  return self->mToggleNodeType;
}

- (void)setToggleNodeType:(BOOL)a3
{
  self->mToggleNodeType = a3;
}

- (BOOL)isCreatingNode
{
  return self->mIsCreatingNode;
}

- (void)setIsCreatingNode:(BOOL)a3
{
  self->mIsCreatingNode = a3;
}

- (BOOL)createdNode
{
  return self->mCreatedNode;
}

- (BOOL)createBezierNode
{
  return self->mCreateBezierNode;
}

- (void)setCreateBezierNode:(BOOL)a3
{
  self->mCreateBezierNode = a3;
}

- (BOOL)didOpenGroup
{
  return self->mDidOpenGroup;
}

- (void)setDidOpenGroup:(BOOL)a3
{
  self->mDidOpenGroup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMorphInfo, 0);
}

@end
