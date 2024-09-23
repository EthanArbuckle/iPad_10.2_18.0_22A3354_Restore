@implementation THBodyRep

- (THBodyRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THBodyRep *v4;
  THBodyRep *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THBodyRep;
  v4 = -[THWPRep initWithLayout:canvas:](&v7, "initWithLayout:canvas:", a3, a4);
  v5 = v4;
  if (v4)
    objc_msgSend(objc_msgSend(-[THBodyRep canvas](v4, "canvas"), "changeNotifier"), "addObserver:forChangeSource:", v4, -[THBodyRep storage](v4, "storage"));
  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)THBodyRep;
  -[THWPRep dealloc](&v2, "dealloc");
}

- (id)storage
{
  return objc_msgSend(-[THBodyRep info](self, "info"), "bodyStorage");
}

- (id)hitRep:(CGPoint)a3
{
  double y;
  double x;
  id result;
  objc_super v7;

  y = a3.y;
  x = a3.x;
  result = objc_msgSend(-[THBodyRep columns](self, "columns"), "count");
  if (result)
  {
    v7.receiver = self;
    v7.super_class = (Class)THBodyRep;
    return -[THWPRep hitRep:](&v7, "hitRep:", x, y);
  }
  return result;
}

- (id)hitReps:(CGPoint)a3 withSlop:(CGSize)a4
{
  double height;
  double width;
  double y;
  double x;
  id result;
  objc_super v10;

  height = a4.height;
  width = a4.width;
  y = a3.y;
  x = a3.x;
  result = objc_msgSend(-[THBodyRep columns](self, "columns"), "count");
  if (result)
  {
    v10.receiver = self;
    v10.super_class = (Class)THBodyRep;
    return -[THBodyRep hitReps:withSlop:](&v10, "hitReps:withSlop:", x, y, width, height);
  }
  return result;
}

- (id)hitRepChrome:(CGPoint)a3
{
  double y;
  double x;
  id result;
  objc_super v7;

  y = a3.y;
  x = a3.x;
  result = objc_msgSend(-[THBodyRep columns](self, "columns"), "count");
  if (result)
  {
    v7.receiver = self;
    v7.super_class = (Class)THBodyRep;
    return -[THBodyRep hitRepChrome:](&v7, "hitRepChrome:", x, y);
  }
  return result;
}

- (BOOL)p_doesRep:(id)a3 containCharIndex:(unint64_t)a4 isStart:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  BOOL v10;

  v5 = a5;
  v7 = objc_msgSend(a3, "range");
  if (v5 && (unint64_t)v7 <= a4)
    return (unint64_t)v7 + v8 > a4;
  v10 = (unint64_t)v7 + v8 >= a4;
  if ((unint64_t)v7 >= a4)
    v10 = 0;
  return !v5 && v10;
}

- (id)repForCharIndex:(unint64_t)a3 isStart:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a4;
  if (-[THBodyRep p_doesRep:containCharIndex:isStart:](self, "p_doesRep:containCharIndex:isStart:", self, a3, a4))
    return self;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = -[THBodyRep siblings](self, "siblings", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v9)
    return 0;
  v10 = v9;
  v11 = *(_QWORD *)v15;
LABEL_5:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v15 != v11)
      objc_enumerationMutation(v8);
    v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
    if (-[THBodyRep p_doesRep:containCharIndex:isStart:](self, "p_doesRep:containCharIndex:isStart:", v7, a3, v4))
      return v7;
    if (v10 == (id)++v12)
    {
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v7 = 0;
      if (v10)
        goto LABEL_5;
      return v7;
    }
  }
}

- (id)siblings
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  THBodyRep *v14;
  BOOL v15;
  id obj;
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

  v3 = +[NSMutableSet set](NSMutableSet, "set");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(-[THBodyRep parentRep](self, "parentRep"), "layout"), "parent"), "info"), "pages");
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v7);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v9 = objc_msgSend(v8, "modelBodyInfos");
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v19;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v19 != v12)
                objc_enumerationMutation(v9);
              v14 = (THBodyRep *)objc_msgSend(-[THBodyRep interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v13), 0);
              if (v14)
                v15 = v14 == self;
              else
                v15 = 1;
              if (!v15)
                objc_msgSend(v3, "addObject:", v14);
              v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v11);
        }
        v7 = (char *)v7 + 1;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }
  return v3;
}

- (void)willBeRemoved
{
  objc_super v3;

  objc_msgSend(objc_msgSend(-[THBodyRep canvas](self, "canvas"), "changeNotifier"), "removeObserver:forChangeSource:", self, -[THBodyRep storage](self, "storage"));
  v3.receiver = self;
  v3.super_class = (Class)THBodyRep;
  -[THWPRep willBeRemoved](&v3, "willBeRemoved");
}

- (void)updateFromLayout
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)THBodyRep;
  -[THWPRep updateFromLayout](&v2, "updateFromLayout");
}

- (id)marginNotesController
{
  return objc_msgSend(-[THBodyRep parentRep](self, "parentRep"), "marginNotesController");
}

- (id)marginNotesOwner
{
  return (id)TSUProtocolCast(&OBJC_PROTOCOL___THMarginNotesOwner, -[THBodyRep parentRep](self, "parentRep"));
}

- (void)setupMarginNotesControllerForHighlightController:(id)a3
{
  objc_msgSend(a3, "setMarginNotesController:", -[THBodyRep marginNotesController](self, "marginNotesController"));
}

@end
