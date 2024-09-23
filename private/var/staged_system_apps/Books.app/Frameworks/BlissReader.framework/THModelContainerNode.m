@implementation THModelContainerNode

- (NSMutableArray)children
{
  return self->mChildren;
}

- (void)setChildren:(id)a3
{
  id v5;

  -[THModelContainerNode willModify](self, "willModify");
  v5 = a3;

  self->mChildren = (NSMutableArray *)a3;
}

- (THModelContainerNode)initWithTitle:(id)a3 includeInTOC:(BOOL)a4 context:(id)a5
{
  THModelContainerNode *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THModelContainerNode;
  v5 = -[THModelNode initWithTitle:includeInTOC:context:](&v7, "initWithTitle:includeInTOC:context:", a3, a4, a5);
  if (v5)
    -[THModelContainerNode setChildren:](v5, "setChildren:", +[NSMutableArray array](NSMutableArray, "array"));
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->mChildren = 0;
  self->mPublicationContext = 0;

  self->mApplePubURL = 0;
  v3.receiver = self;
  v3.super_class = (Class)THModelContainerNode;
  -[THModelNode dealloc](&v3, "dealloc");
}

- (unint64_t)pageCountForPresentationType:(id)a3
{
  NSMutableArray *v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *i;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = -[THModelContainerNode children](self, "children", 0);
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v13;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v4);
      v10 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "pageCountForPresentationType:", a3);
      if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
        return 0x7FFFFFFFFFFFFFFFLL;
      v7 += (unint64_t)v10;
    }
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
      continue;
    break;
  }
  return v7;
}

- (id)pageAtRelativeIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  id result;
  unint64_t v6;
  NSMutableArray *v7;
  id v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0x7FFFFFFFFFFFFFFFLL, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContainerNode pageAtRelativeIndex:forPresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContainerNode.m"), 67, CFSTR("Invalid index."));
    return 0;
  }
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = -[THModelContainerNode children](self, "children", 0);
  result = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (result)
  {
    v8 = result;
    v9 = *(_QWORD *)v15;
LABEL_6:
    v10 = 0;
    v11 = v6;
    while (1)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
      v13 = (unint64_t)objc_msgSend(v12, "pageCountForPresentationType:", a4);
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        return 0;
      v6 = v11 - v13;
      if (v11 < v13)
        return objc_msgSend(v12, "pageAtRelativeIndex:forPresentationType:", v11, a4);
      v10 = (char *)v10 + 1;
      v11 -= v13;
      if (v8 == v10)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        result = 0;
        if (v8)
          goto LABEL_6;
        return result;
      }
    }
  }
  return result;
}

- (id)contentNodeForRelativePageIndex:(unint64_t)a3 forPresentationType:(id)a4
{
  id result;
  unint64_t v6;
  NSMutableArray *v7;
  id v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0x7FFFFFFFFFFFFFFFLL, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContainerNode contentNodeForRelativePageIndex:forPresentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContainerNode.m"), 97, CFSTR("Invalid index."));
    return 0;
  }
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = -[THModelContainerNode children](self, "children", 0);
  result = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (result)
  {
    v8 = result;
    v9 = *(_QWORD *)v15;
LABEL_6:
    v10 = 0;
    v11 = v6;
    while (1)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10);
      v13 = (unint64_t)objc_msgSend(v12, "pageCountForPresentationType:", a4);
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
        return 0;
      v6 = v11 - v13;
      if (v11 < v13)
        return objc_msgSend(v12, "contentNodeForRelativePageIndex:forPresentationType:", v11, a4);
      v10 = (char *)v10 + 1;
      v11 -= v13;
      if (v8 == v10)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        result = 0;
        if (v8)
          goto LABEL_6;
        return result;
      }
    }
  }
  return result;
}

- (void)addMappingFromGUIDToNodeToDictionary:(id)a3
{
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];

  v14.receiver = self;
  v14.super_class = (Class)THModelContainerNode;
  -[THModelNode addMappingFromGUIDToNodeToDictionary:](&v14, "addMappingFromGUIDToNodeToDictionary:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[THModelContainerNode children](self, "children", 0);
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
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
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "addMappingFromGUIDToNodeToDictionary:", a3);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }
}

- (NSArray)childNodes
{
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", -[THModelContainerNode children](self, "children"));
}

- (void)addNode:(id)a3
{
  -[NSMutableArray addObject:](-[THModelContainerNode children](self, "children"), "addObject:", a3);
  objc_msgSend(a3, "setParent:", self);
}

- (void)insertNode:(id)a3 atIndex:(unint64_t)a4
{
  -[NSMutableArray insertObject:atIndex:](-[THModelContainerNode children](self, "children"), "insertObject:atIndex:", a3, a4);
  objc_msgSend(a3, "setParent:", self);
}

- (void)removeNodeAtIndex:(unint64_t)a3
{
  objc_msgSend(-[NSMutableArray objectAtIndex:](-[THModelContainerNode children](self, "children"), "objectAtIndex:", a3), "setParent:", 0);
  -[NSMutableArray removeObjectAtIndex:](-[THModelContainerNode children](self, "children"), "removeObjectAtIndex:", a3);
}

- (unint64_t)removeNode:(id)a3
{
  id v5;

  v5 = -[NSMutableArray indexOfObject:](-[THModelContainerNode children](self, "children"), "indexOfObject:", a3);
  objc_msgSend(a3, "setParent:", 0);
  -[NSMutableArray removeObject:](-[THModelContainerNode children](self, "children"), "removeObject:", a3);
  return (unint64_t)v5;
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](-[THModelContainerNode children](self, "children"), "count");
}

- (id)nodeAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](-[THModelContainerNode children](self, "children"), "objectAtIndex:", a3);
}

- (id)nodeAfterNode:(id)a3
{
  char *v4;

  v4 = (char *)-[NSMutableArray indexOfObject:](-[THModelContainerNode children](self, "children"), "indexOfObject:", a3)+ 1;
  if (-[NSMutableArray count](-[THModelContainerNode children](self, "children"), "count") <= v4)
    return 0;
  else
    return -[NSMutableArray objectAtIndex:](-[THModelContainerNode children](self, "children"), "objectAtIndex:", v4);
}

- (id)nodeBeforeNode:(id)a3
{
  id result;

  result = -[NSMutableArray indexOfObject:](-[THModelContainerNode children](self, "children"), "indexOfObject:", a3);
  if (result)
    return -[NSMutableArray objectAtIndex:](-[THModelContainerNode children](self, "children"), "objectAtIndex:", (char *)result - 1);
  return result;
}

- (unint64_t)indexOfNode:(id)a3
{
  return (unint64_t)-[NSMutableArray indexOfObject:](-[THModelContainerNode children](self, "children"), "indexOfObject:", a3);
}

- (id)contentNodeAfterContentNode:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = -[THModelContainerNode nodeAfterNode:](self, "nodeAfterNode:", a3);
  if (v4)
  {
    v5 = objc_opt_class(THModelContentNode, v3);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelContainerNode contentNodeAfterContentNode:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelContainerNode.m"), 186, CFSTR("Expecting sibling to be a content node"));
  }
  v6 = objc_opt_class(THModelContentNode, v3);
  return (id)TSUDynamicCast(v6, v4);
}

- (id)applePubRelativePath
{
  return self->mPublicationContext;
}

- (id)applePubAbsoluteURL
{
  return +[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", self->mPublicationContext, self->mApplePubURL);
}

- (BOOL)enumerateSubtreeUsingBlock:(id)a3
{
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  _BYTE v11[8];

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11[0] = 0;
  (*((void (**)(id, THModelContainerNode *, _QWORD, _BYTE *))a3 + 2))(a3, self, 0, v11);
  if (*((_BYTE *)v9 + 24))
  {
    v5 = 1;
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_2FF40;
    v7[3] = &unk_4276C0;
    v7[4] = a3;
    v7[5] = &v8;
    -[NSMutableArray enumerateObjectsUsingBlock:](-[THModelContainerNode children](self, "children"), "enumerateObjectsUsingBlock:", v7);
    v5 = *((_BYTE *)v9 + 24) != 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@* %p pages = %@>"), objc_opt_class(self, a2), self, -[NSMutableArray description](self->mChildren, "description"));
}

@end
