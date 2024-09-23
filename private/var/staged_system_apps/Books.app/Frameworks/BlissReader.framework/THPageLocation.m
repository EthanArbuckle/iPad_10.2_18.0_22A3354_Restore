@implementation THPageLocation

- (THPageLocation)init
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLocation init]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLocation.m"), 27, CFSTR("Initializing without specifying a page index"));
  return -[THPageLocation initWithAbsolutePageIndex:](self, "initWithAbsolutePageIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

- (THPageLocation)initWithAbsolutePageIndex:(unint64_t)a3
{
  return -[THPageLocation initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:](self, "initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:", a3, NSInvalidRange[0], NSInvalidRange[1], 0, 0);
}

- (THPageLocation)initWithAbsolutePageIndex:(unint64_t)a3 range:(_NSRange)a4 storageUID:(id)a5 contentNodeGUID:(id)a6
{
  id length;
  id location;
  THPageLocation *v11;
  BOOL v12;
  objc_super v14;

  length = (id)a4.length;
  location = (id)a4.location;
  v14.receiver = self;
  v14.super_class = (Class)THPageLocation;
  v11 = -[THPageLocation init](&v14, "init");
  if (v11)
  {
    if (a3 && a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (!objc_msgSend(a5, "length")
        || (NSInvalidRange[0] == location ? (v12 = NSInvalidRange[1] == length) : (v12 = 0), v12))
      {
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLocation initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLocation.m"), 41, CFSTR("Required info missing."));
      }
    }
    -[THPageLocation setAbsolutePhysicalPageIndex:](v11, "setAbsolutePhysicalPageIndex:", a3);
    -[THPageLocation setRange:](v11, "setRange:", location, length);
    -[THPageLocation setStorageUID:](v11, "setStorageUID:", a5);
    -[THPageLocation setContentNodeGUID:](v11, "setContentNodeGUID:", a6);
  }
  return v11;
}

+ (id)pageLocationWithAnnotation:(id)a3
{
  THPageLocation *v4;
  id v5;
  id v6;
  uint64_t v7;

  v4 = [THPageLocation alloc];
  v5 = objc_msgSend(a3, "annotationAbsolutePhysicalPageIndex");
  v6 = objc_msgSend(a3, "annotationStorageRange");
  return -[THPageLocation initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:](v4, "initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:", v5, v6, v7, objc_msgSend(a3, "annotationStorageUID"), objc_msgSend(a3, "annotationContentNodeID"));
}

+ (id)pageLocationWithStorageAnchor:(id)a3
{
  THPageLocation *v4;
  id v5;
  id v6;
  uint64_t v7;

  v4 = [THPageLocation alloc];
  v5 = objc_msgSend(a3, "absolutePageIndex");
  v6 = objc_msgSend(a3, "range");
  return -[THPageLocation initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:](v4, "initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:", v5, v6, v7, objc_msgSend(a3, "storageUID"), objc_msgSend(objc_msgSend(a3, "contentNode"), "nodeGUID"));
}

- (void)dealloc
{
  objc_super v3;

  -[THPageLocation setStorageUID:](self, "setStorageUID:", 0);
  -[THPageLocation setContentNodeGUID:](self, "setContentNodeGUID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THPageLocation;
  -[THPageLocation dealloc](&v3, "dealloc");
}

- (NSString)description
{
  unint64_t v3;
  NSString *v4;
  const __CFString *v5;
  NSRange v7;

  v3 = -[THPageLocation absolutePhysicalPageIndex](self, "absolutePhysicalPageIndex");
  v4 = -[THPageLocation storageUID](self, "storageUID");
  if (-[THPageLocation range](self, "range") == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = CFSTR("--");
  }
  else
  {
    v7.location = (NSUInteger)-[THPageLocation range](self, "range");
    v5 = (const __CFString *)NSStringFromRange(v7);
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<pg %lu (%@,%@) [%p]>"), v3, v4, v5, self);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  _BOOL4 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    v20 = v6;
    v21 = v5;
    v22 = v4;
    v23 = v3;
    v11 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(a3, v11) & 1) != 0)
    {
      if (!objc_msgSend(objc_msgSend(a3, "storageUID"), "length")
        || !-[NSString length](-[THPageLocation storageUID](self, "storageUID"), "length")
        || (v12 = -[NSString isEqualToString:](-[THPageLocation storageUID](self, "storageUID"), "isEqualToString:", objc_msgSend(a3, "storageUID")))&& (v13 = -[THPageLocation range](self, "range"), v15 = v14, v17 = objc_msgSend(a3, "range"), LOBYTE(v12) = 0, v13 == v17)&& v15 == v16)
      {
        v18 = -[THPageLocation absolutePhysicalPageIndex](self, "absolutePhysicalPageIndex", v20, v21, v22, v23, v7, v8);
        LOBYTE(v12) = v18 == objc_msgSend(a3, "absolutePhysicalPageIndex");
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSRange v6;

  v3 = -[THPageLocation absolutePhysicalPageIndex](self, "absolutePhysicalPageIndex");
  if (-[THPageLocation storageUID](self, "storageUID"))
  {
    v4 = -[NSString hash](-[THPageLocation storageUID](self, "storageUID"), "hash");
    v6.location = (NSUInteger)-[THPageLocation range](self, "range");
    v3 &= v4 & -[NSString hash](NSStringFromRange(v6), "hash");
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  unint64_t v5;
  id v6;
  uint64_t v7;

  v4 = objc_msgSend((id)objc_opt_class(THPageLocation), "allocWithZone:", a3);
  v5 = -[THPageLocation absolutePhysicalPageIndex](self, "absolutePhysicalPageIndex");
  v6 = -[THPageLocation range](self, "range");
  return objc_msgSend(v4, "initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:", v5, v6, v7, -[THPageLocation storageUID](self, "storageUID"), -[THPageLocation contentNodeGUID](self, "contentNodeGUID"));
}

- (THPageLocation)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  NSRange v11;
  NSUInteger location;
  NSUInteger length;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;

  v5 = objc_opt_class(NSNumber);
  *(_QWORD *)&v7 = TSUDynamicCast(v5, objc_msgSend(a3, "objectForKey:", CFSTR("pageIndex"))).n128_u64[0];
  if (v6)
    v8 = (uint64_t)objc_msgSend(v6, "unsignedIntegerValue", v7);
  else
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = objc_opt_class(NSString);
  TSUDynamicCast(v9, objc_msgSend(a3, "objectForKey:", CFSTR("range")));
  if (v10)
  {
    v11 = NSRangeFromString(v10);
    location = v11.location;
    length = v11.length;
  }
  else
  {
    length = 0;
    location = 0x7FFFFFFFFFFFFFFFLL;
  }
  v14 = objc_opt_class(NSString);
  TSUDynamicCast(v14, objc_msgSend(a3, "objectForKey:", CFSTR("storage")));
  v16 = v15;
  v17 = objc_opt_class(NSString);
  *(_QWORD *)&v18 = TSUDynamicCast(v17, objc_msgSend(a3, "objectForKey:", CFSTR("nodeGUID"))).n128_u64[0];
  return -[THPageLocation initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:](self, "initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:", v8, location, length, v16, v19, v18);
}

- (id)dictionaryRepresentation
{
  id v3;
  NSString *storageUID;
  NSString *contentNodeGUID;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_absolutePhysicalPageIndex), CFSTR("pageIndex"));
  objc_msgSend(v3, "setObject:forKey:", NSStringFromRange(self->_range), CFSTR("range"));
  storageUID = self->_storageUID;
  if (storageUID)
    objc_msgSend(v3, "setObject:forKey:", storageUID, CFSTR("storage"));
  contentNodeGUID = self->_contentNodeGUID;
  if (contentNodeGUID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", contentNodeGUID, CFSTR("nodeGUID"));
  return v3;
}

- (id)stringValue
{
  unint64_t v3;
  NSString *v4;
  const __CFString *v5;
  NSRange v7;

  v3 = -[THPageLocation absolutePhysicalPageIndex](self, "absolutePhysicalPageIndex");
  v4 = -[THPageLocation storageUID](self, "storageUID");
  if (-[THPageLocation range](self, "range") == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = CFSTR("--");
  }
  else
  {
    v7.location = (NSUInteger)-[THPageLocation range](self, "range");
    v5 = (const __CFString *)NSStringFromRange(v7);
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<pg %lu (%@,%@) >"), v3, v4, v5);
}

- (unint64_t)absolutePhysicalPageIndex
{
  return self->_absolutePhysicalPageIndex;
}

- (void)setAbsolutePhysicalPageIndex:(unint64_t)a3
{
  self->_absolutePhysicalPageIndex = a3;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSString)storageUID
{
  return self->_storageUID;
}

- (void)setStorageUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)contentNodeGUID
{
  return self->_contentNodeGUID;
}

- (void)setContentNodeGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
