@implementation THDisplayPageNumberMap

- (THDisplayPageNumberMap)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THDisplayPageNumberMap;
  return -[THDisplayPageNumberMap init](&v3, "init");
}

- (void)dealloc
{
  objc_super v3;

  -[THDisplayPageNumberMap setAbsolutePageIndexArrayForDisplayPageNumberMap:](self, "setAbsolutePageIndexArrayForDisplayPageNumberMap:", 0);
  -[THDisplayPageNumberMap setDisplayPageNumberArray:](self, "setDisplayPageNumberArray:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THDisplayPageNumberMap;
  -[THDisplayPageNumberMap dealloc](&v3, "dealloc");
}

- (void)clearDisplayPageMapsWithDocumentRoot:(id)a3
{
  if (-[THDisplayPageNumberMap assignedPageNumbers](self, "assignedPageNumbers", a3))
  {
    -[THDisplayPageNumberMap setAssignedPageNumbers:](self, "setAssignedPageNumbers:", 0);
    -[THDisplayPageNumberMap setAbsolutePageIndexArrayForDisplayPageNumberMap:](self, "setAbsolutePageIndexArrayForDisplayPageNumberMap:", 0);
    -[THDisplayPageNumberMap setDisplayPageNumberArray:](self, "setDisplayPageNumberArray:", 0);
  }
}

- (void)buildDisplayPageMapsWithDocumentRoot:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  if (!-[THDisplayPageNumberMap assignedPageNumbers](self, "assignedPageNumbers"))
  {
    v5 = (unint64_t)objc_msgSend(objc_msgSend(a3, "rootNode"), "pageCountForPresentationType:", +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", objc_msgSend(a3, "context")));
    if (v5 >> 6 <= 0xC34)
    {
      v6 = v5;
      v16 = 0;
      v17 = &v16;
      v18 = 0x3052000000;
      v19 = sub_10BC90;
      v20 = sub_10BCA0;
      v21 = 0;
      v21 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", v5);
      v10 = 0;
      v11 = &v10;
      v12 = 0x3052000000;
      v13 = sub_10BC90;
      v14 = sub_10BCA0;
      v15 = 0;
      v15 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v6);
      v7 = objc_opt_class(THModelContainerNode);
      TSUDynamicCast(v7, objc_msgSend(a3, "rootNode"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10BCAC;
      v9[3] = &unk_429BD8;
      v9[4] = &v16;
      v9[5] = &v10;
      objc_msgSend(v8, "enumerateSubtreeUsingBlock:", v9);
      -[THDisplayPageNumberMap setAbsolutePageIndexArrayForDisplayPageNumberMap:](self, "setAbsolutePageIndexArrayForDisplayPageNumberMap:", v17[5]);
      -[THDisplayPageNumberMap setDisplayPageNumberArray:](self, "setDisplayPageNumberArray:", v11[5]);
      -[THDisplayPageNumberMap setAssignedPageNumbers:](self, "setAssignedPageNumbers:", 1);
      _Block_object_dispose(&v10, 8);
      _Block_object_dispose(&v16, 8);
    }
  }
}

- (id)absolutePageIndexesForDisplayPageNumber:(id)a3
{
  return -[NSDictionary objectForKey:](-[THDisplayPageNumberMap absolutePageIndexArrayForDisplayPageNumberMap](self, "absolutePageIndexArrayForDisplayPageNumberMap"), "objectForKey:", objc_msgSend(a3, "lowercaseString"));
}

- (id)absolutePageIndexesForAltsOfAbsolutePageIndex:(unint64_t)a3
{
  int v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  v3 = a3;
  if (!-[THDisplayPageNumberMap assignedPageNumbers](self, "assignedPageNumbers"))
    return 0;
  v5 = +[NSMutableSet set](NSMutableSet, "set");
  v6 = 0;
  v7 = (v3 + 1);
  do
  {
    v8 = +[NSString stringForValue:withListNumberFormat:includeFormatting:](NSString, "stringForValue:withListNumberFormat:includeFormatting:", v7, v6, 0);
    if (v8)
    {
      v9 = -[THDisplayPageNumberMap absolutePageIndexesForDisplayPageNumber:](self, "absolutePageIndexesForDisplayPageNumber:", v8);
      if (v9)
        objc_msgSend(v5, "addObjectsFromArray:", v9);
    }
    v6 = (v6 + 1);
  }
  while ((_DWORD)v6 != 14);
  if (v5)
    return objc_msgSend(v5, "allObjects");
  else
    return 0;
}

- (id)preferredAbsolutePageIndexesForDisplayPageNumber:(id)a3
{
  id v5;
  void *v6;
  int v7;

  if (-[THDisplayPageNumberMap assignedPageNumbers](self, "assignedPageNumbers"))
  {
    v5 = -[THDisplayPageNumberMap absolutePageIndexesForDisplayPageNumber:](self, "absolutePageIndexesForDisplayPageNumber:", a3);
    if (v5)
    {
      v6 = v5;
      if (objc_msgSend(v5, "count"))
        return v6;
    }
    v7 = objc_msgSend(a3, "intValue");
    if (v7 >= 1)
      return -[THDisplayPageNumberMap absolutePageIndexesForAltsOfAbsolutePageIndex:](self, "absolutePageIndexesForAltsOfAbsolutePageIndex:", v7 - 1);
  }
  return 0;
}

- (unint64_t)absolutePageIndexForDisplayPageNumber:(id)a3
{
  id v5;
  void *v6;

  if (-[THDisplayPageNumberMap assignedPageNumbers](self, "assignedPageNumbers")
    && (v5 = -[THDisplayPageNumberMap preferredAbsolutePageIndexesForDisplayPageNumber:](self, "preferredAbsolutePageIndexesForDisplayPageNumber:", a3)) != 0&& (v6 = v5, objc_msgSend(v5, "count")))
  {
    return objc_msgSend(objc_msgSend(v6, "objectAtIndex:", 0), "unsignedIntValue");
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)displayPageNumberForAbsolutePageIndex:(unint64_t)a3
{
  unsigned int v5;

  v5 = -[THDisplayPageNumberMap assignedPageNumbers](self, "assignedPageNumbers");
  if (a3 == 0x7FFFFFFFFFFFFFFFLL
    || !v5
    || -[NSArray count](-[THDisplayPageNumberMap displayPageNumberArray](self, "displayPageNumberArray"), "count") <= a3)
  {
    return 0;
  }
  else
  {
    return -[NSArray objectAtIndex:](-[THDisplayPageNumberMap displayPageNumberArray](self, "displayPageNumberArray"), "objectAtIndex:", a3);
  }
}

- (NSDictionary)absolutePageIndexArrayForDisplayPageNumberMap
{
  return self->mAbsolutePageIndexArrayForDisplayPageNumberMap;
}

- (void)setAbsolutePageIndexArrayForDisplayPageNumberMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSArray)displayPageNumberArray
{
  return self->mDisplayPageNumberArray;
}

- (void)setDisplayPageNumberArray:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)assignedPageNumbers
{
  return self->_assignedPageNumbers;
}

- (void)setAssignedPageNumbers:(BOOL)a3
{
  self->_assignedPageNumbers = a3;
}

@end
