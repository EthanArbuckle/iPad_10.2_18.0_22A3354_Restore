@implementation THModelContentNodeReflowablePaginationResults

- (THModelContentNodeReflowablePaginationResults)init
{
  THModelContentNodeReflowablePaginationResults *v2;
  THModelContentNodeReflowablePaginationResults *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THModelContentNodeReflowablePaginationResults;
  v2 = -[THModelContentNodeReflowablePaginationResults init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    v2->_firstPageIndex = 0x7FFFFFFFFFFFFFFFLL;
    v2->_storageUIDToPageIndex = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->_storageUIDToPageIndex = 0;
  self->_bodyStorageUID = 0;

  self->_pageHints = 0;
  self->_presentationType = 0;

  self->_nodeGUID = 0;
  v3.receiver = self;
  v3.super_class = (Class)THModelContentNodeReflowablePaginationResults;
  -[THModelContentNodeReflowablePaginationResults dealloc](&v3, "dealloc");
}

- (unint64_t)firstPageIndexIntersectingRange:(_NSRange)a3
{
  _QWORD v4[4];
  _NSRange v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10C8E4;
  v4[3] = &unk_429BF8;
  v5 = a3;
  return (unint64_t)-[NSMutableArray indexOfObjectPassingTest:](-[THModelContentNodeReflowablePaginationResults pageHints](self, "pageHints"), "indexOfObjectPassingTest:", v4);
}

- (unint64_t)relativePageIndexForStorageAnchor:(id)a3
{
  unint64_t v5;
  id v6;
  uint64_t v7;
  id v9;

  if (objc_msgSend(objc_msgSend(a3, "storageUID"), "isEqualToString:", -[THModelContentNodeReflowablePaginationResults bodyStorageUID](self, "bodyStorageUID")))
  {
    v6 = objc_msgSend(a3, "range");
    if (v5 <= 1)
      v7 = 1;
    else
      v7 = v5;
    return -[THModelContentNodeReflowablePaginationResults firstPageIndexIntersectingRange:](self, "firstPageIndexIntersectingRange:", v6, v7);
  }
  else if (objc_msgSend(a3, "storageUID")
         && (v9 = -[NSMutableDictionary objectForKey:](-[THModelContentNodeReflowablePaginationResults storageUIDToPageIndex](self, "storageUIDToPageIndex"), "objectForKey:", objc_msgSend(a3, "storageUID"))) != 0)
  {
    return (unint64_t)objc_msgSend(v9, "integerValue");
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)assignRelativePageIndex:(unint64_t)a3 toStorageUID:(id)a4
{
  -[NSMutableDictionary setValue:forKey:](-[THModelContentNodeReflowablePaginationResults storageUIDToPageIndex](self, "storageUIDToPageIndex"), "setValue:forKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3), a4);
}

- (_NSRange)hintRangeForRelativePageIndex:(unint64_t)a3
{
  id v5;
  id v6;
  NSUInteger v7;
  _NSRange result;

  if ((unint64_t)-[NSMutableArray count](-[THModelContentNodeReflowablePaginationResults pageHints](self, "pageHints"), "count") <= a3)v5 = 0;
  else
    v5 = -[NSMutableArray objectAtIndex:](-[THModelContentNodeReflowablePaginationResults pageHints](self, "pageHints"), "objectAtIndex:", a3);
  v6 = objc_msgSend(v5, "range");
  result.length = v7;
  result.location = (NSUInteger)v6;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (THModelContentNodeReflowablePaginationResults)initWithCoder:(id)a3
{
  THModelContentNodeReflowablePaginationResults *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THModelContentNodeReflowablePaginationResults;
  v4 = -[THModelContentNodeReflowablePaginationResults init](&v10, "init");
  if (v4)
  {
    v4->_nodeGUID = (NSString *)objc_msgSend(objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("nodeGUID")), "copy");
    v4->_pageCount = (unint64_t)objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("pageCount"));
    v5 = objc_opt_class(NSArray);
    v6 = objc_opt_class(NSNumber);
    v4->_pageHints = (NSMutableArray *)objc_msgSend(objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, objc_opt_class(THPageHint), 0), CFSTR("pageHints")), "mutableCopy");
    v4->_presentationType = (THPresentationType *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(THPresentationType), CFSTR("presentationType"));
    v4->_bodyStorageUID = (NSString *)objc_msgSend(objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("bodyStorageUID")), "copy");
    v4->_firstPageIndex = (unint64_t)objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("firstPageIndex"));
    v7 = objc_opt_class(NSDictionary);
    v8 = objc_opt_class(NSNumber);
    v4->_storageUIDToPageIndex = (NSMutableDictionary *)objc_msgSend(objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, objc_opt_class(NSString), 0), CFSTR("storageUIDToPageIndex")), "mutableCopy");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;

  objc_msgSend(a3, "encodeObject:forKey:", -[THModelContentNodeReflowablePaginationResults nodeGUID](self, "nodeGUID"), CFSTR("nodeGUID"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[THModelContentNodeReflowablePaginationResults pageCount](self, "pageCount"), CFSTR("pageCount"));
  objc_msgSend(a3, "encodeObject:forKey:", -[THModelContentNodeReflowablePaginationResults pageHints](self, "pageHints"), CFSTR("pageHints"));
  objc_msgSend(a3, "encodeObject:forKey:", -[THModelContentNodeReflowablePaginationResults presentationType](self, "presentationType"), CFSTR("presentationType"));
  objc_msgSend(a3, "encodeObject:forKey:", -[THModelContentNodeReflowablePaginationResults bodyStorageUID](self, "bodyStorageUID"), CFSTR("bodyStorageUID"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[THModelContentNodeReflowablePaginationResults firstPageIndex](self, "firstPageIndex"), CFSTR("firstPageIndex"));
  v5 = -[NSMutableDictionary copy](-[THModelContentNodeReflowablePaginationResults storageUIDToPageIndex](self, "storageUIDToPageIndex"), "copy");
  objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("storageUIDToPageIndex"));

}

- (unint64_t)firstPageIndex
{
  return self->_firstPageIndex;
}

- (void)setFirstPageIndex:(unint64_t)a3
{
  self->_firstPageIndex = a3;
}

- (NSString)nodeGUID
{
  return self->_nodeGUID;
}

- (void)setNodeGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(unint64_t)a3
{
  self->_pageCount = a3;
}

- (NSMutableArray)pageHints
{
  return self->_pageHints;
}

- (void)setPageHints:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (THPresentationType)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)bodyStorageUID
{
  return self->_bodyStorageUID;
}

- (void)setBodyStorageUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSMutableDictionary)storageUIDToPageIndex
{
  return self->_storageUIDToPageIndex;
}

- (void)setStorageUIDToPageIndex:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

@end
