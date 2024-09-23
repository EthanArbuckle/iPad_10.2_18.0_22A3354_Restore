@implementation THModelStorageAnchor

- (THModelStorageAnchor)initWithContentNode:(id)a3 storageUID:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  THModelStorageAnchor *v8;
  THModelStorageAnchor *v9;
  objc_super v11;

  length = a5.length;
  location = a5.location;
  v11.receiver = self;
  v11.super_class = (Class)THModelStorageAnchor;
  v8 = -[THModelBoundAnchor initWithContentNode:](&v11, "initWithContentNode:", a3);
  v9 = v8;
  if (v8)
  {
    -[THModelStorageAnchor setStorageUID:](v8, "setStorageUID:", a4);
    -[THModelStorageAnchor setRange:](v9, "setRange:", location, length);
    -[THModelStorageAnchor setNodeRelativePageIndex:](v9, "setNodeRelativePageIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }
  return v9;
}

- (THModelStorageAnchor)initWithGlossaryEntry:(id)a3 storageUID:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  THModelStorageAnchor *v8;
  THModelStorageAnchor *v9;
  objc_super v11;

  length = a5.length;
  location = a5.location;
  v11.receiver = self;
  v11.super_class = (Class)THModelStorageAnchor;
  v8 = -[THModelBoundAnchor initWithGlossaryEntry:](&v11, "initWithGlossaryEntry:", a3);
  v9 = v8;
  if (v8)
  {
    -[THModelStorageAnchor setStorageUID:](v8, "setStorageUID:", a4);
    -[THModelStorageAnchor setRange:](v9, "setRange:", location, length);
    -[THModelStorageAnchor setNodeRelativePageIndex:](v9, "setNodeRelativePageIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }
  return v9;
}

- (THModelStorageAnchor)initWithContentNode:(id)a3 storage:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  uint64_t v10;

  length = a5.length;
  location = a5.location;
  v9 = objc_msgSend(a3, "nodeUniqueIDForInfo:", a4);
  if (v9)
    return (THModelStorageAnchor *)objc_msgSend(objc_alloc((Class)objc_opt_class(self, v10)), "initWithContentNode:storageUID:range:", a3, v9, location, length);
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelStorageAnchor initWithContentNode:storage:range:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelStorageAnchor.m"), 45, CFSTR("invalid nil value for '%s'"), "storageUID");
  return 0;
}

+ (THModelStorageAnchor)storageAnchorWithContentNode:(id)a3 storage:(id)a4 range:(_NSRange)a5
{
  return (THModelStorageAnchor *)objc_msgSend(objc_alloc((Class)objc_opt_class(a1, a2)), "initWithContentNode:storage:range:", a3, a4, a5.location, a5.length);
}

- (THModelStorageAnchor)initWithContentNode:(id)a3 pageLocation:(id)a4
{
  id v7;
  id v8;
  uint64_t v9;

  v7 = objc_msgSend(a4, "storageUID");
  v8 = objc_msgSend(a4, "range");
  return -[THModelStorageAnchor initWithContentNode:storageUID:range:](self, "initWithContentNode:storageUID:range:", a3, v7, v8, v9);
}

+ (THModelStorageAnchor)storageAnchorWithContentNode:(id)a3 pageLocation:(id)a4
{
  return (THModelStorageAnchor *)objc_msgSend(objc_alloc((Class)objc_opt_class(THModelStorageAnchor, a2)), "initWithContentNode:pageLocation:", a3, a4);
}

- (void)dealloc
{
  objc_super v3;

  -[THModelStorageAnchor setStorageUID:](self, "setStorageUID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THModelStorageAnchor;
  -[THModelBoundAnchor dealloc](&v3, "dealloc");
}

+ (THModelStorageAnchor)storageAnchorWithContentNode:(id)a3 storageUID:(id)a4 range:(_NSRange)a5
{
  return -[THModelStorageAnchor initWithContentNode:storageUID:range:]([THModelStorageAnchor alloc], "initWithContentNode:storageUID:range:", a3, a4, a5.location, a5.length);
}

+ (THModelStorageAnchor)storageAnchorWithGlossaryEntry:(id)a3 storageUID:(id)a4 range:(_NSRange)a5
{
  return -[THModelStorageAnchor initWithGlossaryEntry:storageUID:range:]([THModelStorageAnchor alloc], "initWithGlossaryEntry:storageUID:range:", a3, a4, a5.location, a5.length);
}

- (void)setAbsolutePageIndex:(unint64_t)a3
{
  THModelContentNode *v5;

  v5 = -[THModelBoundAnchor contentNode](self, "contentNode");
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && v5)
    -[THModelNode relativePageIndexForAbsolutePageIndex:forPresentationType:](-[THModelBoundAnchor contentNode](self, "contentNode"), "relativePageIndexForAbsolutePageIndex:forPresentationType:", a3, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THModelContentNode context](-[THModelBoundAnchor contentNode](self, "contentNode"), "context")));
  -[THModelStorageAnchor setNodeRelativePageIndex:](self, "setNodeRelativePageIndex:");
}

- (unint64_t)absolutePageIndex
{
  if (-[THModelBoundAnchor contentNode](self, "contentNode")
    && -[THModelStorageAnchor nodeRelativePageIndex](self, "nodeRelativePageIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    return -[THModelNode absolutePageIndexForRelativePageIndex:forPresentationType:](-[THModelBoundAnchor contentNode](self, "contentNode"), "absolutePageIndexForRelativePageIndex:forPresentationType:", -[THModelStorageAnchor nodeRelativePageIndex](self, "nodeRelativePageIndex"), +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THModelContentNode context](-[THModelBoundAnchor contentNode](self, "contentNode"), "context")));
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (THWPStorage)storage
{
  uint64_t v3;

  v3 = objc_opt_class(THWPStorage, a2);
  return (THWPStorage *)TSUDynamicCast(v3, -[THModelContentNode infoForNodeUniqueID:forPresentationType:](-[THModelBoundAnchor contentNode](self, "contentNode"), "infoForNodeUniqueID:forPresentationType:", -[THModelStorageAnchor storageUID](self, "storageUID"), +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THModelContentNode context](-[THModelBoundAnchor contentNode](self, "contentNode"), "context"))));
}

- (id)description
{
  unint64_t v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = -[THModelStorageAnchor absolutePageIndex](self, "absolutePageIndex");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    v4 = CFSTR("?");
  else
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), v3);
  if (-[THModelBoundAnchor glossaryEntry](self, "glossaryEntry"))
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("glossary:'%@'; "),
           -[THModelGlossaryEntry normalizedTerm](-[THModelBoundAnchor glossaryEntry](self, "glossaryEntry"), "normalizedTerm"));
  else
    v5 = &stru_43D7D8;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("anchor<%@pgi=%@; %@ @(%u,%u)>"),
           v5,
           v4,
           self->mStorageUID,
           self->mRange.location,
           self->mRange.length);
}

- (NSString)storageUID
{
  return self->mStorageUID;
}

- (void)setStorageUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (_NSRange)range
{
  _NSRange *p_mRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_mRange = &self->mRange;
  location = self->mRange.location;
  length = p_mRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->mRange = a3;
}

- (unint64_t)nodeRelativePageIndex
{
  return self->mNodeRelativePageIndex;
}

- (void)setNodeRelativePageIndex:(unint64_t)a3
{
  self->mNodeRelativePageIndex = a3;
}

@end
