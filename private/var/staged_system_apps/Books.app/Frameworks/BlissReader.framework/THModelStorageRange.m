@implementation THModelStorageRange

- (TSWPStorage)storage
{
  return self->mStorage;
}

- (void)setStorage:(id)a3
{
  id v5;

  -[THModelStorageRange willModify](self, "willModify");
  v5 = a3;

  self->mStorage = (TSWPStorage *)a3;
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
  NSUInteger length;
  NSUInteger location;

  length = a3.length;
  location = a3.location;
  -[THModelStorageRange willModify](self, "willModify");
  self->mRange.location = location;
  self->mRange.length = length;
}

+ (id)storageRangeWithStorage:(id)a3 range:(_NSRange)a4 context:(id)a5
{
  return objc_msgSend(objc_alloc((Class)objc_opt_class(a1, a2)), "initWithStorage:range:context:", a3, a4.location, a4.length, a5);
}

- (THModelStorageRange)initWithStorage:(id)a3 range:(_NSRange)a4 context:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  THModelStorageRange *v8;
  THModelStorageRange *v9;
  id v10;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  v12.receiver = self;
  v12.super_class = (Class)THModelStorageRange;
  v8 = -[THModelStorageRange initWithContext:](&v12, "initWithContext:", a5);
  v9 = v8;
  if (v8)
  {
    v10 = -[THModelStorageRange context](v8, "context");
    if (v10 != objc_msgSend(a3, "context"))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelStorageRange initWithStorage:range:context:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelStorageRange.m"), 36, CFSTR("Creating a range in a storage from a different TSPObjectContext."));
    v9->mStorage = (TSWPStorage *)a3;
    v9->mRange.location = location;
    v9->mRange.length = length;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  self->mStorage = 0;
  v3.receiver = self;
  v3.super_class = (Class)THModelStorageRange;
  -[THModelStorageRange dealloc](&v3, "dealloc");
}

@end
