@implementation TSKAnnotationAuthorStorage

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKAnnotationAuthorStorage;
  -[TSKAnnotationAuthorStorage dealloc](&v3, sel_dealloc);
}

- (void)addAuthor:(id)a3
{
  -[TSKAnnotationAuthorStorage p_addAuthor:isFromDocumentSupport:](self, "p_addAuthor:isFromDocumentSupport:", a3, 0);
}

- (void)p_addAuthor:(id)a3 isFromDocumentSupport:(BOOL)a4
{
  NSMutableSet *mAuthors;
  void *v8;
  uint64_t v9;

  if (-[TSKAnnotationAuthorStorage authorWithName:](self, "authorWithName:", objc_msgSend(a3, "name")))
  {
    if (!a4)
    {
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKAnnotationAuthorStorage p_addAuthor:isFromDocumentSupport:]");
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAnnotationAuthorStorage.mm"), 44, CFSTR("Cannot have two authors with the same name in a collection!"));
    }
  }
  else
  {
    if (!a4)
      -[TSPObject willModify](self, "willModify");
    mAuthors = self->mAuthors;
    if (!mAuthors)
    {
      mAuthors = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
      self->mAuthors = mAuthors;
    }
    -[NSMutableSet addObject:](mAuthors, "addObject:", a3);
  }
}

- (void)removeAuthor:(id)a3
{
  -[TSPObject willModify](self, "willModify");
  -[NSMutableSet removeObject:](self->mAuthors, "removeObject:", a3);
}

- (id)authorWithName:(id)a3
{
  NSSet *v4;
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
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[TSKAnnotationAuthorStorage authors](self, "authors", 0);
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "name"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)nextAuthorColor
{
  return +[TSKAnnotationAuthor authorStorageColorForIndex:](TSKAnnotationAuthor, "authorStorageColorForIndex:", -[NSSet count](-[TSKAnnotationAuthorStorage authors](self, "authors"), "count")% +[TSKAnnotationAuthor presetColorCount](TSKAnnotationAuthor, "presetColorCount"));
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<TSKAnnotationAuthorStorage: %p authors %@>"), self, self->mAuthors);
}

- (BOOL)shouldDelayArchiving
{
  return 1;
}

- (unsigned)delayedArchivingPriority
{
  return 1000;
}

- (id)packageLocator
{
  return CFSTR("AnnotationAuthorStorage");
}

- (void)didLoadChildObjectFromDocumentSupport:(id)a3
{
  -[TSKAnnotationAuthorStorage p_addAuthor:isFromDocumentSupport:](self, "p_addAuthor:isFromDocumentSupport:", a3, 1);
}

- (NSSet)authors
{
  return &self->mAuthors->super;
}

@end
