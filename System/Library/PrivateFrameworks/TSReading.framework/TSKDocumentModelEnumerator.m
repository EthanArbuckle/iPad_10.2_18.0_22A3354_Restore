@implementation TSKDocumentModelEnumerator

- (TSKDocumentModelEnumerator)initWithRootModelObject:(id)a3 filter:(id)a4
{
  TSKDocumentModelEnumerator *v6;
  TSKDocumentModelEnumerator *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSKDocumentModelEnumerator;
  v6 = -[TSKDocumentModelEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[TSKDocumentModelEnumerator setRoot:](v6, "setRoot:", a3);
    -[TSKDocumentModelEnumerator setFilter:](v7, "setFilter:", a4);
    -[TSKDocumentModelEnumerator setFilterBeforeAddingChildren:](v7, "setFilterBeforeAddingChildren:", 0);
  }
  return v7;
}

- (TSKDocumentModelEnumerator)initWithEnumerator:(id)a3 filter:(id)a4
{
  void *v7;
  uint64_t v8;
  TSKDocumentModelEnumerator *v9;
  objc_super v11;

  if (!a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKDocumentModelEnumerator initWithEnumerator:filter:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentModelEnumerator.m"), 82, CFSTR("invalid nil value for '%s'"), "enumerator");
  }
  v11.receiver = self;
  v11.super_class = (Class)TSKDocumentModelEnumerator;
  v9 = -[TSKDocumentModelEnumerator init](&v11, sel_init);
  if (v9)
  {
    -[TSKDocumentModelEnumerator setEnumeratorStack:](v9, "setEnumeratorStack:", objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", a3));
    -[TSKDocumentModelEnumerator setFilter:](v9, "setFilter:", a4);
    -[TSKDocumentModelEnumerator setFilterBeforeAddingChildren:](v9, "setFilterBeforeAddingChildren:", 0);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[TSKDocumentModelEnumerator setRoot:](self, "setRoot:", 0);
  -[TSKDocumentModelEnumerator setFilter:](self, "setFilter:", 0);
  -[TSKDocumentModelEnumerator setEnumeratorStack:](self, "setEnumeratorStack:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TSKDocumentModelEnumerator;
  -[TSKDocumentModelEnumerator dealloc](&v3, sel_dealloc);
}

- (id)nextObject
{
  TSKModel *v3;
  unsigned int (**v4)(id, TSKModel *, BOOL *);
  uint64_t v5;
  unsigned int (**v6)(id, TSKModel *, BOOL *);
  unsigned int (**v7)(id, TSKModel *, BOOL *);

  if (self->_enumeratorStack)
  {
    v3 = 0;
  }
  else
  {
    if (-[TSKDocumentModelEnumerator filter](self, "filter")
      && (v4 = -[TSKDocumentModelEnumerator filter](self, "filter"),
          !v4[2](v4, -[TSKDocumentModelEnumerator root](self, "root"), &self->_stop)))
    {
      v3 = 0;
    }
    else
    {
      v3 = -[TSKDocumentModelEnumerator root](self, "root");
    }
    -[TSKDocumentModelEnumerator root](self, "root");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", -[TSKModel childEnumerator](-[TSKDocumentModelEnumerator root](self, "root"), "childEnumerator"));
    else
      v5 = objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    -[TSKDocumentModelEnumerator setEnumeratorStack:](self, "setEnumeratorStack:", v5);
  }
  if (-[NSMutableArray count](-[TSKDocumentModelEnumerator enumeratorStack](self, "enumeratorStack"), "count") && !v3)
  {
    while (!self->_stop)
    {
      v3 = (TSKModel *)objc_msgSend((id)-[NSMutableArray lastObject](-[TSKDocumentModelEnumerator enumeratorStack](self, "enumeratorStack"), "lastObject"), "nextObject");
      if (v3)
      {
        if (self->_filterBeforeAddingChildren)
        {
          if (-[TSKDocumentModelEnumerator filter](self, "filter"))
          {
            v6 = -[TSKDocumentModelEnumerator filter](self, "filter");
            if (!v6[2](v6, v3, &self->_stop))
              v3 = 0;
          }
        }
        if ((objc_opt_respondsToSelector() & 1) != 0 && -[TSKModel childEnumerator](v3, "childEnumerator"))
          -[NSMutableArray addObject:](-[TSKDocumentModelEnumerator enumeratorStack](self, "enumeratorStack"), "addObject:", -[TSKModel childEnumerator](v3, "childEnumerator"));
        if (!self->_filterBeforeAddingChildren)
        {
          if (-[TSKDocumentModelEnumerator filter](self, "filter"))
          {
            v7 = -[TSKDocumentModelEnumerator filter](self, "filter");
            if (!v7[2](v7, v3, &self->_stop))
              v3 = 0;
          }
        }
      }
      else
      {
        -[NSMutableArray removeLastObject](-[TSKDocumentModelEnumerator enumeratorStack](self, "enumeratorStack"), "removeLastObject");
      }
      if (!-[NSMutableArray count](-[TSKDocumentModelEnumerator enumeratorStack](self, "enumeratorStack"), "count")
        || v3)
      {
        return v3;
      }
    }
    return 0;
  }
  return v3;
}

- (void)enumerateUsingBlock:(id)a3
{
  id v5;
  id v6;
  id v7;
  char v8;

  v8 = 0;
  v5 = -[TSKDocumentModelEnumerator nextObject](self, "nextObject");
  if (v5)
  {
    v6 = v5;
    do
    {
      (*((void (**)(id, id, char *))a3 + 2))(a3, v6, &v8);
      v7 = -[TSKDocumentModelEnumerator nextObject](self, "nextObject");
      if (!v7)
        break;
      v6 = v7;
    }
    while (!v8);
  }
}

- (BOOL)filterBeforeAddingChildren
{
  return self->_filterBeforeAddingChildren;
}

- (void)setFilterBeforeAddingChildren:(BOOL)a3
{
  self->_filterBeforeAddingChildren = a3;
}

- (TSKModel)root
{
  return self->_root;
}

- (void)setRoot:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableArray)enumeratorStack
{
  return self->_enumeratorStack;
}

- (void)setEnumeratorStack:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)enumerateReferencedStylesUsingBlock:(id)a3
{
  id v5;
  _QWORD v6[7];
  _QWORD v7[6];

  v5 = objc_alloc_init(MEMORY[0x24BEB3CA8]);
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3052000000;
  v7[3] = __Block_byref_object_copy__8;
  v7[4] = __Block_byref_object_dispose__8;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __80__TSKDocumentModelEnumerator_TSSAdditions__enumerateReferencedStylesUsingBlock___block_invoke;
  v6[3] = &unk_24D82B098;
  v6[4] = v5;
  v6[5] = a3;
  v6[6] = v7;
  v7[5] = v6;
  -[TSKDocumentModelEnumerator enumerateUsingBlock:](self, "enumerateUsingBlock:", v6);

  _Block_object_dispose(v7, 8);
}

void *__80__TSKDocumentModelEnumerator_TSSAdditions__enumerateReferencedStylesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *result;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  result = (void *)TSUClassAndProtocolCast();
  if (result)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = (void *)objc_msgSend(result, "referencedStyles", &unk_254F65A58);
    result = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (result)
    {
      v7 = result;
      v8 = *(_QWORD *)v12;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v10) & 1) == 0)
        {
          result = (void *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
          if (*a3)
            break;
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
          result = (void *)(*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
          if (*a3)
            break;
        }
        if (v7 == (void *)++v9)
        {
          result = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          v7 = result;
          if (result)
            goto LABEL_4;
          return result;
        }
      }
    }
  }
  return result;
}

@end
