@implementation TSDGroupInfo

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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
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
  v8.super_class = (Class)TSDGroupInfo;
  -[TSDDrawableInfo dealloc](&v8, sel_dealloc);
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return 0;
}

- (BOOL)aspectRatioLocked
{
  return 1;
}

- (TSDInfoGeometry)geometry
{
  return self->super.mGeometry;
}

- (void)setGeometry:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGroupInfo setGeometry:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupInfo.m"), 94, CFSTR("invalid nil value for '%s'"), "newGeometry");
  }
  if ((objc_msgSend(a3, "isEqual:", self->super.mGeometry) & 1) == 0)
  {
    -[TSPObject willModify](self, "willModify");
    if (objc_msgSend(a3, "isEqualExceptForPosition:", self->super.mGeometry))
      v7 = 513;
    else
      v7 = 512;
    -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", v7);

    self->super.mGeometry = (TSDInfoGeometry *)a3;
  }
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithContext:(id)a3
{
  id v5;
  NSMutableArray *mChildInfos;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)TSDGroupInfo;
  v5 = -[TSDDrawableInfo copyWithContext:](&v17, sel_copyWithContext_);
  if (v5)
  {
    if (-[NSMutableArray count](self->mChildInfos, "count"))
    {
      *((_QWORD *)v5 + 18) = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEB8], "allocWithZone:", -[TSDGroupInfo zone](self, "zone")), "initWithCapacity:", -[NSMutableArray count](self->mChildInfos, "count"));
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      mChildInfos = self->mChildInfos;
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v14 != v9)
              objc_enumerationMutation(mChildInfos);
            v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "copyWithContext:", a3);
            objc_msgSend(v11, "setParentInfo:", v5);
            objc_msgSend(*((id *)v5 + 18), "addObject:", v11);

          }
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        }
        while (v8);
      }
    }
    *((_BYTE *)v5 + 152) = self->mIsInDocument;
  }
  return v5;
}

- (id)allNestedChildrenInfos
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[TSDGroupInfo childInfos](self, "childInfos", 0);
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
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(v9, "allNestedChildrenInfos"));
        else
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)onlyChild
{
  if (-[NSMutableArray count](self->mChildInfos, "count") == 1)
    return (id)-[NSMutableArray lastObject](self->mChildInfos, "lastObject");
  else
    return 0;
}

- (id)allNestedChildrenInfosIncludingGroups
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  objc_msgSend(v3, "addObject:", self);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = -[TSDGroupInfo childInfos](self, "childInfos", 0);
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
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(v9, "allNestedChildrenInfosIncludingGroups"));
        objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)childInfos
{
  return self->mChildInfos;
}

- (void)setChildInfos:(id)a3
{
  NSMutableArray *mChildInfos;
  void *v6;
  id v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  mChildInfos = self->mChildInfos;
  if (mChildInfos != a3 && (-[NSMutableArray isEqual:](mChildInfos, "isEqual:") & 1) == 0)
  {
    -[TSPObject willModify](self, "willModify");
    -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", 514);
    v37 = a3;
    if (a3)
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", a3);
    else
      v6 = 0;
    if (self->mIsInDocument)
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v36 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v8 = -[TSPObject documentRoot](self, "documentRoot");
    }
    else
    {
      v8 = 0;
      v36 = 0;
      v7 = 0;
    }
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v9 = self->mChildInfos;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v51 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          if ((objc_msgSend(v6, "containsObject:", v14) & 1) == 0)
          {
            if (self->mIsInDocument)
            {
              objc_msgSend(v7, "addObject:", v14);
              objc_msgSend(v14, "willBeRemovedFromDocumentRoot:", v8);
            }
            objc_msgSend(v14, "setParentInfo:", 0);
          }
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
      }
      while (v11);
    }

    if (self->mChildInfos)
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", self->mChildInfos);
    else
      v15 = 0;
    v35 = v7;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v16 = v37;
    v17 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v47 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          objc_opt_class();
          if (!TSUDynamicCast())
          {
            v22 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGroupInfo setChildInfos:]");
            v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupInfo.m");
            v25 = v23;
            v16 = v37;
            objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v25, v24, 231, CFSTR("Group children must be TSDDrawableInfos."));
          }
          if ((objc_msgSend(v15, "containsObject:", v21) & 1) == 0)
          {
            objc_msgSend(v21, "parentInfo");
            objc_msgSend((id)TSUProtocolCast(), "removeChildInfo:", v21);
            if (self->mIsInDocument)
            {
              objc_msgSend(v36, "addObject:", v21);
              objc_msgSend(v21, "willBeAddedToDocumentRoot:context:", v8, 0);
            }
            objc_msgSend(v21, "setParentInfo:", self);
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      }
      while (v18);
    }

    v26 = (NSMutableArray *)objc_msgSend(v16, "mutableCopy");
    self->mChildInfos = v26;
    if (self->mIsInDocument)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v27 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v43;
        do
        {
          for (k = 0; k != v28; ++k)
          {
            if (*(_QWORD *)v43 != v29)
              objc_enumerationMutation(v35);
            objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * k), "wasRemovedFromDocumentRoot:", v8);
          }
          v28 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
        }
        while (v28);
      }
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v31 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v39;
        do
        {
          for (m = 0; m != v32; ++m)
          {
            if (*(_QWORD *)v39 != v33)
              objc_enumerationMutation(v36);
            objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * m), "wasAddedToDocumentRoot:context:", v8, 0);
          }
          v32 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
        }
        while (v32);
      }
    }

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
  -[TSDGroupInfo insertChildInfo:atIndex:](self, "insertChildInfo:atIndex:", a3, v6);
}

- (void)insertChildInfo:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (a3)
  {
    objc_opt_class();
    if (!TSUDynamicCast())
    {
      v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGroupInfo insertChildInfo:atIndex:]");
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupInfo.m"), 276, CFSTR("Group children must be TSDDrawableInfos."));
    }
    -[TSPObject willModify](self, "willModify");
    -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", 514);
    objc_msgSend(a3, "parentInfo");
    v8 = (void *)TSUProtocolCast();
    if (v8)
    {
      v9 = a3;
      objc_msgSend(v8, "removeChildInfo:", a3);
    }
    if (!self->mChildInfos)
      self->mChildInfos = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(a3, "setParentInfo:", self);
    if (self->mIsInDocument)
      objc_msgSend(a3, "willBeAddedToDocumentRoot:context:", -[TSPObject documentRoot](self, "documentRoot"), 0);
    -[NSMutableArray insertObject:atIndex:](self->mChildInfos, "insertObject:atIndex:", a3, a4);
    if (self->mIsInDocument)
      objc_msgSend(a3, "wasAddedToDocumentRoot:context:", -[TSPObject documentRoot](self, "documentRoot"), 0);
    if (v8)

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
      -[TSDGroupInfo insertChildInfo:atIndex:](self, "insertChildInfo:atIndex:", a3, v7);
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
      -[TSDGroupInfo insertChildInfo:atIndex:](self, "insertChildInfo:atIndex:", a3, v7 + 1);
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
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGroupInfo moveChildren:toIndexes:]");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupInfo.m"), 338, CFSTR("Can't move drawables to indexes, counts don't match."));
    if (v9 < v11)
      return;
    goto LABEL_9;
  }
  if (v9 >= v10)
  {
LABEL_9:
    v17 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGroupInfo moveChildren:toIndexes:]");
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupInfo.m"), 339, CFSTR("Can't move drawables to indexes, one or more indexes out of range."));
    return;
  }
  v19 = (id)-[NSMutableArray mutableCopy](self->mChildInfos, "mutableCopy");
  objc_msgSend(v19, "removeObjectsInArray:", a3);
  v12 = v11 - v7;
  if (objc_msgSend(v19, "count") != v12)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGroupInfo moveChildren:toIndexes:]");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupInfo.m"), 345, CFSTR("Can't move drawables to indexes, not all drawables are in this group."));
  }
  if (objc_msgSend(v19, "count") == v12)
  {
    objc_msgSend(v19, "insertObjects:atIndexes:", a3, a4);
    -[TSDGroupInfo setChildInfos:](self, "setChildInfos:", v19);
  }

}

- (void)removeAllChildrenInDocument:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *mChildInfos;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  -[TSPObject willModify](self, "willModify");
  mChildInfos = self->mChildInfos;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(mChildInfos);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        if (v3)
          objc_msgSend(v10, "willBeRemovedFromDocumentRoot:", -[TSPObject documentRoot](self, "documentRoot"));
        objc_msgSend(v10, "setParentInfo:", 0);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }
  self->mChildInfos = 0;
  if (v3)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(mChildInfos);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "wasRemovedFromDocumentRoot:", -[TSPObject documentRoot](self, "documentRoot"));
        }
        while (v12 != v14);
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v12);
    }
  }

}

- (id)groupedGeometryForChildInfo:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend(a3, "geometry"), "geometryRelativeToGeometry:", -[TSDGroupInfo geometry](self, "geometry"));
}

- (id)ungroupedGeometryForChildInfo:(id)a3
{
  void *v5;
  uint64_t v6;

  if ((-[NSMutableArray containsObject:](self->mChildInfos, "containsObject:") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGroupInfo ungroupedGeometryForChildInfo:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupInfo.m"), 385, CFSTR("Can't get ungrouped geometry for a drawable which isn't a child of the group."));
  }
  return (id)objc_msgSend((id)objc_msgSend(a3, "geometry"), "geometryWithParentGeometry:", -[TSDGroupInfo geometry](self, "geometry"));
}

+ (id)groupGeometryFromChildrenInfos:(id)a3
{
  double y;
  double x;
  double height;
  double width;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CGAffineTransform v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v20 = *MEMORY[0x24BDAC8D0];
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(a3);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
        if (v12)
          objc_msgSend(v12, "computeLayoutFullTransform");
        else
          memset(&v14, 0, sizeof(v14));
        v21.origin.x = 0.0;
        v21.origin.y = 0.0;
        v21.size.width = 1.0;
        v21.size.height = 1.0;
        v24 = CGRectApplyAffineTransform(v21, &v14);
        v22.origin.x = x;
        v22.origin.y = y;
        v22.size.width = width;
        v22.size.height = height;
        v23 = CGRectUnion(v22, v24);
        x = v23.origin.x;
        y = v23.origin.y;
        width = v23.size.width;
        height = v23.size.height;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
  return -[TSDInfoGeometry initWithPosition:size:]([TSDInfoGeometry alloc], "initWithPosition:size:", x, y, fmax(width, 1.0), fmax(height, 1.0));
}

- (void)makeChildGeometriesRelativeAndComputeOwnAbsoluteGeometry
{
  NSMutableArray *mChildInfos;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[TSDGroupInfo setGeometry:](self, "setGeometry:", +[TSDGroupInfo groupGeometryFromChildrenInfos:](TSDGroupInfo, "groupGeometryFromChildrenInfos:", self->mChildInfos));
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  mChildInfos = self->mChildInfos;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(mChildInfos);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "setGeometry:", -[TSDGroupInfo groupedGeometryForChildInfo:](self, "groupedGeometryForChildInfo:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i)));
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)removeChildInfo:(id)a3
{
  -[TSDGroupInfo replaceChildInfo:with:](self, "replaceChildInfo:with:", a3, 0);
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
      -[TSDDrawableInfo willChangeProperty:](self, "willChangeProperty:", 514);
      v10 = a3;
      if (self->mIsInDocument)
        objc_msgSend(a3, "willBeRemovedFromDocumentRoot:", -[TSPObject documentRoot](self, "documentRoot"));
      -[NSMutableArray removeObjectAtIndex:](self->mChildInfos, "removeObjectAtIndex:", v9);
      objc_msgSend(a3, "setParentInfo:", 0);

      if (self->mIsInDocument)
        objc_msgSend(a3, "wasRemovedFromDocumentRoot:", -[TSPObject documentRoot](self, "documentRoot"));
      -[TSDGroupInfo insertChildInfo:atIndex:](self, "insertChildInfo:atIndex:", a4, v9);
    }
  }
}

- (void)ensureGeometryFitsChildren
{
  double y;
  double x;
  double height;
  double width;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  TSDInfoGeometry *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v42 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(-[TSDGroupInfo childInfos](self, "childInfos"), "count"))
  {
    x = *MEMORY[0x24BDBF070];
    y = *(double *)(MEMORY[0x24BDBF070] + 8);
    width = *(double *)(MEMORY[0x24BDBF070] + 16);
    height = *(double *)(MEMORY[0x24BDBF070] + 24);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v7 = -[TSDGroupInfo childInfos](self, "childInfos");
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if (v12)
            objc_msgSend(v12, "computeFullTransform");
          else
            memset(&v35, 0, sizeof(v35));
          v43.origin.x = 0.0;
          v43.origin.y = 0.0;
          v43.size.width = 1.0;
          v43.size.height = 1.0;
          v46 = CGRectApplyAffineTransform(v43, &v35);
          v44.origin.x = x;
          v44.origin.y = y;
          v44.size.width = width;
          v44.size.height = height;
          v45 = CGRectUnion(v44, v46);
          x = v45.origin.x;
          y = v45.origin.y;
          width = v45.size.width;
          height = v45.size.height;
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v9);
    }
    -[TSDInfoGeometry size](-[TSDGroupInfo geometry](self, "geometry"), "size");
    v14 = fmax(v13, 1.0);
    v16 = fmax(v15, 1.0);
    memset(&v34, 0, sizeof(v34));
    CGAffineTransformMakeScale(&v34, fmax(width, 1.0) / v14, fmax(height, 1.0) / v16);
    CGAffineTransformMakeTranslation(&t2, x / v14, y / v16);
    t1 = v34;
    CGAffineTransformConcat(&v33, &t1, &t2);
    v34 = v33;
    v17 = -[TSDGroupInfo geometry](self, "geometry");
    if (v17)
      -[TSDInfoGeometry fullTransform](v17, "fullTransform");
    else
      memset(&v29, 0, sizeof(v29));
    v33 = v34;
    CGAffineTransformConcat(&v30, &v33, &v29);
    -[TSDGroupInfo setGeometry:](self, "setGeometry:", +[TSDInfoGeometry geometryFromFullTransform:](TSDInfoGeometry, "geometryFromFullTransform:", &v30));
    CGAffineTransformMakeTranslation(&v33, -x, -y);
    v34 = v33;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v18 = -[TSDGroupInfo childInfos](self, "childInfos", 0);
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
          v24 = (void *)objc_msgSend(v23, "geometry");
          v33 = v34;
          objc_msgSend(v23, "setGeometry:", objc_msgSend(v24, "geometryByAppendingTransform:", &v33));
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v40, 16);
      }
      while (v20);
    }
  }
}

- (void)willCopyWithOtherDrawables:(id)a3
{
  objc_msgSend(-[TSDGroupInfo childInfos](self, "childInfos"), "makeObjectsPerformSelector:withObject:", a2, a3);
}

- (void)didCopy
{
  objc_msgSend(-[TSDGroupInfo childInfos](self, "childInfos"), "makeObjectsPerformSelector:", a2);
}

- (id)childEnumerator
{
  return (id)-[NSMutableArray objectEnumerator](self->mChildInfos, "objectEnumerator");
}

- (void)acceptVisitor:(id)a3
{
  objc_msgSend(a3, "visitTSDGroupInfo:", self);
}

- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4
{
  NSMutableArray *mChildInfos;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)TSDGroupInfo;
  -[TSDDrawableInfo willBeAddedToDocumentRoot:context:](&v16, sel_willBeAddedToDocumentRoot_context_);
  if ((objc_msgSend(a4, "wasUnarchived") & 1) == 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    mChildInfos = self->mChildInfos;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(mChildInfos);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "willBeAddedToDocumentRoot:context:", a3, a4);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v9);
    }
  }
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  NSMutableArray *mChildInfos;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)TSDGroupInfo;
  -[TSDDrawableInfo wasAddedToDocumentRoot:context:](&v16, sel_wasAddedToDocumentRoot_context_);
  self->mIsInDocument = 1;
  if ((objc_msgSend(a4, "wasUnarchived") & 1) == 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    mChildInfos = self->mChildInfos;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(mChildInfos);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "wasAddedToDocumentRoot:context:", a3, a4);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v9);
    }
  }
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  NSMutableArray *mChildInfos;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)TSDGroupInfo;
  -[TSDDrawableInfo willBeRemovedFromDocumentRoot:](&v14, sel_willBeRemovedFromDocumentRoot_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  mChildInfos = self->mChildInfos;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(mChildInfos);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "willBeRemovedFromDocumentRoot:", a3);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }
  self->mIsInDocument = 0;
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  NSMutableArray *mChildInfos;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)TSDGroupInfo;
  -[TSDDrawableInfo wasRemovedFromDocumentRoot:](&v14, sel_wasRemovedFromDocumentRoot_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  mChildInfos = self->mChildInfos;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(mChildInfos);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "wasRemovedFromDocumentRoot:", a3);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }
}

- (void)adoptStylesheet:(id)a3 withMapper:(id)a4
{
  NSMutableArray *mChildInfos;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)TSDGroupInfo;
  -[TSDDrawableInfo adoptStylesheet:withMapper:](&v16, sel_adoptStylesheet_withMapper_);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  mChildInfos = self->mChildInfos;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(mChildInfos);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "adoptStylesheet:withMapper:", a3, a4);
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildInfos, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v9);
  }
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__TSDGroupInfo_mixingTypeWithObject___block_invoke;
  v4[3] = &unk_24D82B868;
  v4[4] = a3;
  v4[5] = self;
  return TSDMixingTypeWithObject((unint64_t)self, (unint64_t)a3, (uint64_t)v4);
}

uint64_t __37__TSDGroupInfo_mixingTypeWithObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_opt_class();
  v2 = (void *)TSUDynamicCast();
  if (!v2)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGroupInfo mixingTypeWithObject:]_block_invoke");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupInfo.m"), 639, CFSTR("nil object after cast"));
  }
  v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "childInfos"), "count");
  if (v5 == objc_msgSend((id)objc_msgSend(v2, "childInfos"), "count"))
  {
    if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "childInfos"), "count"))
      return 4;
    v6 = 0;
    v7 = 4;
    while (1)
    {
      v8 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "childInfos"), "objectAtIndex:", v6);
      v9 = (void *)objc_msgSend((id)objc_msgSend(v2, "childInfos"), "objectAtIndex:", v6);
      if (!objc_msgSend(v8, "conformsToProtocol:", &unk_254F6FDA0)
        || (objc_msgSend(v9, "conformsToProtocol:", &unk_254F6FDA0) & 1) == 0)
      {
        break;
      }
      if (++v6 >= (unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "childInfos"), "count"))
        return v7;
    }
  }
  return 1;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a4, a3);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGroupInfo mixedObjectWithFraction:ofObject:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGroupInfo.m"), 667, CFSTR("TSDGroupInfo does not implement TSDMixing!"));
  return 0;
}

+ (id)drawablesToInsertForGroup:(id)a3 filteredWithTarget:(id)a4 action:(SEL)a5
{
  return (id)objc_msgSend(a1, "p_drawablesToInsertForGroup:filteredWithTarget:action:didUngroup:", a3, a4, a5, 0);
}

+ (id)p_drawablesToInsertForGroup:(id)a3 filteredWithTarget:(id)a4 action:(SEL)a5 didUngroup:(BOOL *)a6
{
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  BOOL *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  char v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  char v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v9 = (unint64_t)objc_msgSend((id)objc_msgSend(a3, "childInfos"), "count") < 2;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "childInfos"), "count"));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v30 = a3;
  v11 = (void *)objc_msgSend(a3, "childInfos");
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v43 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_opt_class();
        v17 = TSUDynamicCast();
        v41 = 0;
        if (v17)
        {
          objc_msgSend(v10, "addObjectsFromArray:", objc_msgSend(a1, "p_drawablesToInsertForGroup:filteredWithTarget:action:didUngroup:", v17, a4, a5, &v41));
          v9 |= v41 != 0;
        }
        else
        {
          objc_msgSend(v10, "addObject:", v16);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v13);
  }
  if ((v9 & 1) == 0)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v26 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (!v26)
    {
LABEL_30:
      v18 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v30);

      v24 = 0;
      v20 = a6;
      if (!a6)
        return v18;
      goto LABEL_20;
    }
    v27 = v26;
    v28 = *(_QWORD *)v38;
LABEL_24:
    v29 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v28)
        objc_enumerationMutation(v10);
      objc_opt_class();
      if (!objc_msgSend(a4, a5, TSUDynamicCast()))
        break;
      if (v27 == ++v29)
      {
        v27 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
        if (v27)
          goto LABEL_24;
        goto LABEL_30;
      }
    }
  }
  v18 = v10;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  v20 = a6;
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "setGeometry:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "geometry"), "geometryWithParentGeometry:", objc_msgSend(v30, "geometry")));
      }
      v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
    }
    while (v21);
  }

  objc_msgSend(v30, "removeAllChildrenInDocument:", 0);
  v24 = 1;
  if (a6)
LABEL_20:
    *v20 = v24;
  return v18;
}

- (void)processSelectedStoragesWithStatisticsController:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = -[TSDGroupInfo allNestedChildrenInfos](self, "allNestedChildrenInfos");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8), "conformsToProtocol:", &unk_254F895D0))
          objc_msgSend((id)TSUProtocolCast(), "processSelectedStoragesWithStatisticsController:", a3);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

@end
