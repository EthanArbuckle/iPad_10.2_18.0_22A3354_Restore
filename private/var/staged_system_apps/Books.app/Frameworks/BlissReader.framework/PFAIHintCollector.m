@implementation PFAIHintCollector

- (PFAIHintCollector)initWithStorage:(id)a3
{
  PFAIHintCollector *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFAIHintCollector;
  v4 = -[PFAIHintCollector init](&v6, "init");
  if (v4)
  {
    v4->mStorage = (TSWPStorage *)a3;
    v4->mPresentations = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFAIHintCollector;
  -[PFAIHintCollector dealloc](&v3, "dealloc");
}

- (id)pHintCollectorForPresentationId:(id)a3
{
  PFAIPresentationHintCollector *v5;
  PFAIPresentationHintCollector *v6;

  v5 = (PFAIPresentationHintCollector *)-[NSMutableDictionary objectForKey:](self->mPresentations, "objectForKey:");
  if (!v5)
  {
    v5 = objc_alloc_init(PFAIPresentationHintCollector);
    -[NSMutableDictionary setObject:forKey:](self->mPresentations, "setObject:forKey:", v5, a3);
    v6 = v5;
  }
  return v5;
}

- (void)addStartHintWithIdref:(id)a3 presentationId:(id)a4
{
  objc_msgSend(-[PFAIHintCollector pHintCollectorForPresentationId:](self, "pHintCollectorForPresentationId:", a4), "addStartHint:withIdref:textStorage:", -[TSWPStorage length](self->mStorage, "length"), a3, self->mStorage);
}

- (void)addLineBreakHintWithPresentationId:(id)a3
{
  objc_msgSend(-[PFAIHintCollector pHintCollectorForPresentationId:](self, "pHintCollectorForPresentationId:", a3), "addLineBreakHint:textStorage:", -[TSWPStorage length](self->mStorage, "length"), self->mStorage);
}

- (id)lineBreaksForIdref:(id)a3 presentationId:(id)a4
{
  return objc_msgSend(-[NSMutableDictionary objectForKey:](self->mPresentations, "objectForKey:", a4), "lineBreaksForIdref:", a3);
}

- (void)addHintCollection:(id)a3 idref:(id)a4 presentationId:(id)a5
{
  objc_msgSend(-[NSMutableDictionary objectForKey:](self->mPresentations, "objectForKey:", a5), "addHintCollection:idref:", a3, a4);
}

- (void)processHintCollections
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[NSMutableDictionary objectEnumerator](self->mPresentations, "objectEnumerator", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "processHintCollectionsWithStorage:", self->mStorage);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)updateLastLineBreakHint
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = -[TSWPStorage length](self->mStorage, "length");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = -[NSMutableDictionary objectEnumerator](self->mPresentations, "objectEnumerator", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "updateLastLineBreakHintWithIndex:textStorage:", v3, self->mStorage);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

@end
