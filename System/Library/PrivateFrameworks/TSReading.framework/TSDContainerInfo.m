@implementation TSDContainerInfo

- (TSDContainerInfo)initWithContext:(id)a3 geometry:(id)a4
{
  TSDContainerInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDContainerInfo;
  v5 = -[TSPObject initWithContext:](&v7, sel_initWithContext_, a3);
  if (v5)
    v5->mGeometry = (TSDInfoGeometry *)objc_msgSend(a4, "copy");
  return v5;
}

- (void)dealloc
{
  NSMutableArray *mChildInfos;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  mChildInfos = self->mChildInfos;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(mChildInfos);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "clearBackPointerToParentInfoIfNeeded:", self);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)TSDContainerInfo;
  -[TSDContainerInfo dealloc](&v8, sel_dealloc);
}

- (void)clearBackPointerToParentInfoIfNeeded:(id)a3
{
  if (self->mParentInfo == a3)
    self->mParentInfo = 0;
}

- (void)setGeometry:(id)a3
{
  void *v5;
  uint64_t v6;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDContainerInfo setGeometry:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContainerInfo.m"), 59, CFSTR("invalid nil value for '%s'"), "newGeometry");
  }
  if ((objc_msgSend(a3, "isEqual:", self->mGeometry) & 1) == 0)
  {
    -[TSPObject willModify](self, "willModify");

    self->mGeometry = (TSDInfoGeometry *)a3;
  }
}

- (TSDOwningAttachment)owningAttachment
{
  return 0;
}

- (void)setOwningAttachment:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDContainerInfo setOwningAttachment:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContainerInfo.m"), 75, CFSTR("TSDContainerInfo cannot be owned by an attachment because it is not a subclass of TSDDrawableInfo"));
}

- (TSDOwningAttachment)owningAttachmentNoRecurse
{
  return 0;
}

- (BOOL)isFloatingAboveText
{
  return 0;
}

- (BOOL)isAnchoredToText
{
  return 0;
}

- (BOOL)isInlineWithText
{
  return 0;
}

- (BOOL)isAttachedToBodyText
{
  return 0;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isThemeContent
{
  return -[TSDContainerInfo isThemeContent](-[TSDContainerInfo parentInfo](self, "parentInfo"), "isThemeContent");
}

- (id)copyWithContext:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *mChildInfos;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = -[TSDContainerInfo zone](self, "zone");
  v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", v5), "initWithContext:", a3);
  if (v6)
  {
    *(_QWORD *)(v6 + 48) = -[TSDInfoGeometry copyWithZone:](self->mGeometry, "copyWithZone:", v5);
    if (-[NSMutableArray count](self->mChildInfos, "count"))
    {
      *(_QWORD *)(v6 + 64) = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEB8], "allocWithZone:", v5), "initWithCapacity:", -[NSMutableArray count](self->mChildInfos, "count"));
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      mChildInfos = self->mChildInfos;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v15;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v15 != v10)
              objc_enumerationMutation(mChildInfos);
            v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyWithContext:", a3);
            objc_msgSend(v12, "setParentInfo:", v6);
            objc_msgSend(*(id *)(v6 + 64), "addObject:", v12);

            ++v11;
          }
          while (v9 != v11);
          v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v9);
      }
    }
  }
  return (id)v6;
}

- (id)childInfos
{
  return self->mChildInfos;
}

- (void)setChildInfos:(id)a3
{
  NSMutableArray *mChildInfos;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSMutableArray *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  mChildInfos = self->mChildInfos;
  if (mChildInfos != a3 && (-[NSMutableArray isEqual:](mChildInfos, "isEqual:") & 1) == 0)
  {
    -[TSPObject willModify](self, "willModify");
    if (a3)
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", a3);
    else
      v6 = 0;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = self->mChildInfos;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v25 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if ((objc_msgSend(v6, "containsObject:", v12) & 1) == 0)
            objc_msgSend(v12, "setParentInfo:", 0);
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v9);
    }

    if (self->mChildInfos)
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", self->mChildInfos);
    else
      v13 = 0;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(a3);
          v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
          if ((objc_msgSend(v13, "containsObject:", v18) & 1) == 0)
          {
            objc_msgSend(v18, "parentInfo");
            objc_msgSend((id)TSUProtocolCast(), "removeChildInfo:", v18);
            objc_msgSend(v18, "setParentInfo:", self);
          }
        }
        v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v15);
    }

    v19 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
    self->mChildInfos = v19;
  }
}

- (void)addChildInfo:(id)a3
{
  NSMutableArray *mChildInfos;
  uint64_t v6;

  mChildInfos = self->mChildInfos;
  if (mChildInfos)
    v6 = -[NSMutableArray count](mChildInfos, "count");
  else
    v6 = 0;
  -[TSDContainerInfo insertChildInfo:atIndex:](self, "insertChildInfo:atIndex:", a3, v6);
}

- (void)insertChildInfo:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  id v7;
  NSMutableArray *mChildInfos;

  if (a3)
  {
    -[TSPObject willModify](self, "willModify");
    objc_msgSend(a3, "parentInfo");
    v6 = (void *)TSUProtocolCast();
    if (v6)
    {
      v7 = a3;
      objc_msgSend(v6, "removeChildInfo:", a3);
    }
    mChildInfos = self->mChildInfos;
    if (!mChildInfos)
    {
      mChildInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      self->mChildInfos = mChildInfos;
    }
    -[NSMutableArray insertObject:atIndex:](mChildInfos, "insertObject:atIndex:", a3, a4);
    objc_msgSend(a3, "setParentInfo:", self);
    if (v6)

  }
}

- (void)insertChildInfo:(id)a3 below:(id)a4
{
  NSMutableArray *mChildInfos;
  uint64_t v7;

  mChildInfos = self->mChildInfos;
  if (mChildInfos)
  {
    v7 = -[NSMutableArray indexOfObjectIdenticalTo:](mChildInfos, "indexOfObjectIdenticalTo:", a4);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      -[TSDContainerInfo insertChildInfo:atIndex:](self, "insertChildInfo:atIndex:", a3, v7);
  }
}

- (void)insertChildInfo:(id)a3 above:(id)a4
{
  NSMutableArray *mChildInfos;
  uint64_t v7;

  mChildInfos = self->mChildInfos;
  if (mChildInfos)
  {
    v7 = -[NSMutableArray indexOfObjectIdenticalTo:](mChildInfos, "indexOfObjectIdenticalTo:", a4);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
      -[TSDContainerInfo insertChildInfo:atIndex:](self, "insertChildInfo:atIndex:", a3, v7 + 1);
  }
}

- (void)moveChildren:(id)a3 toIndexes:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;

  v7 = objc_msgSend(a3, "count");
  v8 = objc_msgSend(a4, "count");
  v9 = objc_msgSend(a4, "lastIndex");
  v10 = -[NSMutableArray count](self->mChildInfos, "count");
  v11 = v10;
  if (v7 != v8)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDContainerInfo moveChildren:toIndexes:]");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContainerInfo.m"), 241, CFSTR("Can't move drawables to indexes, counts don't match."));
    if (v9 < v11)
      return;
    goto LABEL_9;
  }
  if (v9 >= v10)
  {
LABEL_9:
    v17 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDContainerInfo moveChildren:toIndexes:]");
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContainerInfo.m"), 242, CFSTR("Can't move drawables to indexes, one or more indexes out of range."));
    return;
  }
  v19 = (id)-[NSMutableArray mutableCopy](self->mChildInfos, "mutableCopy");
  objc_msgSend(v19, "removeObjectsInArray:", a3);
  v12 = v11 - v7;
  if (objc_msgSend(v19, "count") != v12)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDContainerInfo moveChildren:toIndexes:]");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContainerInfo.m"), 248, CFSTR("Can't move drawables to indexes, not all drawables are in this container."));
  }
  if (objc_msgSend(v19, "count") == v12)
  {
    objc_msgSend(v19, "insertObjects:atIndexes:", a3, a4);
    -[TSDContainerInfo setChildInfos:](self, "setChildInfos:", v19);
  }

}

- (void)removeChildInfo:(id)a3
{
  -[TSDContainerInfo replaceChildInfo:with:](self, "replaceChildInfo:with:", a3, 0);
}

- (void)replaceChildInfo:(id)a3 with:(id)a4
{
  NSMutableArray *mChildInfos;
  uint64_t v8;
  uint64_t v9;
  id v10;

  mChildInfos = self->mChildInfos;
  if (mChildInfos)
  {
    v8 = -[NSMutableArray indexOfObjectIdenticalTo:](mChildInfos, "indexOfObjectIdenticalTo:");
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = v8;
      -[TSPObject willModify](self, "willModify");
      v10 = a3;
      -[NSMutableArray removeObjectAtIndex:](self->mChildInfos, "removeObjectAtIndex:", v9);
      objc_msgSend(a3, "setParentInfo:", 0);

      -[TSDContainerInfo insertChildInfo:atIndex:](self, "insertChildInfo:atIndex:", a4, v9);
    }
  }
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDContainerInfo mixingTypeWithObject:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContainerInfo.m"), 302, CFSTR("TSDContainerInfo does not implement TSDMixing!"));
  return 1;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a4, a3);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDContainerInfo mixedObjectWithFraction:ofObject:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContainerInfo.m"), 309, CFSTR("TSDContainerInfo does not implement TSDMixing!"));
  return 0;
}

- (TSDInfoGeometry)geometry
{
  return self->mGeometry;
}

- (TSDContainerInfo)parentInfo
{
  return self->mParentInfo;
}

- (void)setParentInfo:(id)a3
{
  self->mParentInfo = (TSDContainerInfo *)a3;
}

@end
