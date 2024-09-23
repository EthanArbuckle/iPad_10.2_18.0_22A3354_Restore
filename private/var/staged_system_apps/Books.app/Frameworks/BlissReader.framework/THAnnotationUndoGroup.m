@implementation THAnnotationUndoGroup

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THAnnotationUndoGroup;
  -[THAnnotationUndoGroup dealloc](&v3, "dealloc");
}

- (BOOL)hasActions
{
  return -[NSMutableArray count](self->_actions, "count") != 0;
}

- (void)addAction:(id)a3
{
  NSMutableArray *actions;

  if (a3)
  {
    actions = self->_actions;
    if (!actions)
    {
      actions = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      self->_actions = actions;
    }
    -[NSMutableArray addObject:](actions, "addObject:", a3);
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationUndoGroup addAction:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationUndoGroup.m"), 41, CFSTR("invalid nil value for '%s'"), "action");
  }
}

- (id)undoWithAnnotationHost:(id)a3 moc:(id)a4
{
  THAnnotationChangeList *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v7 = objc_alloc_init(THAnnotationChangeList);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = -[NSMutableArray reverseObjectEnumerator](self->_actions, "reverseObjectEnumerator", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), "undoWithChangeList:annotationHost:moc:", v7, a3, a4);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }
  return v7;
}

- (id)redoWithAnnotationHost:(id)a3 moc:(id)a4
{
  THAnnotationChangeList *v7;
  NSMutableArray *actions;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v7 = objc_alloc_init(THAnnotationChangeList);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  actions = self->_actions;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](actions, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(actions);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), "redoWithChangeList:annotationHost:moc:", v7, a3, a4);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](actions, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }
  return v7;
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
