@implementation THPageHint

- (THPageHint)initWithPageInfo:(id)a3
{
  THPageHint *v4;
  unint64_t v5;
  THBodyHint *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THPageHint;
  v4 = -[THPageHint init](&v8, "init");
  if (v4)
  {
    -[THPageHint setBodyCount:](v4, "setBodyCount:", objc_msgSend(objc_msgSend(a3, "modelBodyInfos"), "count"));
    objc_msgSend(objc_msgSend(a3, "geometry"), "size");
    -[THPageHint setSize:](v4, "setSize:");
    v4->mBodyHints = (TSUIntegerKeyDictionary *)objc_alloc_init((Class)TSUIntegerKeyDictionary);
    if (-[THPageHint bodyCount](v4, "bodyCount"))
    {
      v5 = 0;
      do
      {
        v6 = objc_alloc_init(THBodyHint);
        -[TSUIntegerKeyDictionary setObject:forKey:](v4->mBodyHints, "setObject:forKey:", v6, v5);

        ++v5;
      }
      while (v5 < -[THPageHint bodyCount](v4, "bodyCount"));
    }
    TSWPTopicNumberHints::reset(&v4->_topicNumbers);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (THPageHint)initWithCoder:(id)a3
{
  THPageHint *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  CGFloat width;
  CGFloat height;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSSet *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)THPageHint;
  v4 = -[THPageHint init](&v18, "init");
  if (v4)
  {
    v4->mNonEmptyBodyCount = (unint64_t)objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("nonEmptyBodyCount"));
    v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSValue, v5), CFSTR("size"));
    if (v6)
    {
      objc_msgSend(v6, "CGSizeValue");
    }
    else
    {
      width = CGSizeZero.width;
      height = CGSizeZero.height;
    }
    v4->mSize.width = width;
    v4->mSize.height = height;
    v10 = objc_opt_class(TSUIntegerKeyDictionary, v7);
    v12 = objc_opt_class(THBodyHint, v11);
    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v12, objc_opt_class(NSNumber, v13), 0);
    v16 = objc_opt_class(TSUIntegerKeyDictionary, v15);
    v4->mBodyHints = (TSUIntegerKeyDictionary *)(id)TSUDynamicCast(v16, objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v14, CFSTR("bodyHints")));
    v4->mBodyCount = (unint64_t)objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("bodyCount"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->mBodyHints, CFSTR("bodyHints"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->mBodyCount, CFSTR("bodyCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->mNonEmptyBodyCount, CFSTR("nonEmptyBodyCount"));
  objc_msgSend(a3, "encodeObject:forKey:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", self->mSize.width, self->mSize.height), CFSTR("size"));
}

- (void)dealloc
{
  objc_super v3;

  self->mBodyHints = 0;
  v3.receiver = self;
  v3.super_class = (Class)THPageHint;
  -[THPageHint dealloc](&v3, "dealloc");
}

- (id)p_bodyHintAtIndex:(unint64_t)a3
{
  return -[TSUIntegerKeyDictionary objectForKey:](self->mBodyHints, "objectForKey:", a3);
}

- (_NSRange)range
{
  id v3;
  id v4;
  unint64_t v5;
  id location;
  NSUInteger v7;
  NSUInteger length;
  NSRange v9;
  NSUInteger v10;
  NSUInteger v11;
  NSRange v12;
  _NSRange result;
  NSRange v14;

  v4 = NSInvalidRange[0];
  v3 = NSInvalidRange[1];
  if (-[THPageHint nonEmptyBodyCount](self, "nonEmptyBodyCount"))
  {
    v5 = 0;
    do
    {
      location = -[THPageHint rangeForBodyIndex:](self, "rangeForBodyIndex:", v5);
      length = v7;
      if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v12.location = (NSUInteger)v4;
        v12.length = (NSUInteger)v3;
        v14.location = (NSUInteger)location;
        v14.length = length;
        v9 = NSUnionRange(v12, v14);
        location = (id)v9.location;
        length = v9.length;
      }
      ++v5;
      v3 = (id)length;
      v4 = location;
    }
    while (v5 < -[THPageHint nonEmptyBodyCount](self, "nonEmptyBodyCount"));
  }
  else
  {
    location = v4;
    length = (NSUInteger)v3;
  }
  v10 = (NSUInteger)location;
  v11 = length;
  result.length = v11;
  result.location = v10;
  return result;
}

- (_NSRange)rangeForBodyIndex:(unint64_t)a3
{
  id v3;
  NSUInteger v4;
  _NSRange result;

  v3 = objc_msgSend(-[THPageHint p_bodyHintAtIndex:](self, "p_bodyHintAtIndex:", a3), "range");
  result.length = v4;
  result.location = (NSUInteger)v3;
  return result;
}

- (_NSRange)anchoredRangeForBodyIndex:(unint64_t)a3
{
  id v3;
  NSUInteger v4;
  _NSRange result;

  v3 = objc_msgSend(-[THPageHint p_bodyHintAtIndex:](self, "p_bodyHintAtIndex:", a3), "anchoredRange");
  result.length = v4;
  result.location = (NSUInteger)v3;
  return result;
}

- (void)offsetStartCharIndicesBy:(int64_t)a3
{
  unint64_t v5;

  if (-[THPageHint nonEmptyBodyCount](self, "nonEmptyBodyCount"))
  {
    v5 = 0;
    do
      objc_msgSend(-[THPageHint p_bodyHintAtIndex:](self, "p_bodyHintAtIndex:", v5++), "offsetStartCharIndexBy:", a3);
    while (v5 < -[THPageHint nonEmptyBodyCount](self, "nonEmptyBodyCount"));
  }
}

- (void)setHints:(const void *)a3 forBodyIndex:(unint64_t)a4
{
  objc_msgSend(-[THPageHint p_bodyHintAtIndex:](self, "p_bodyHintAtIndex:", a4), "setHints:", a3);
}

- (vector<TSWPTargetHint,)hintsForBodyIndex:(THPageHint *)self
{
  vector<TSWPTargetHint, std::allocator<TSWPTargetHint>> *result;

  result = -[THPageHint p_bodyHintAtIndex:](self, "p_bodyHintAtIndex:", a4);
  if (result)
    return (vector<TSWPTargetHint, std::allocator<TSWPTargetHint>> *)unk_548680(result, "hints");
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return result;
}

- (void)setSize:(CGSize)a3 forBodyIndex:(unint64_t)a4
{
  objc_msgSend(-[THPageHint p_bodyHintAtIndex:](self, "p_bodyHintAtIndex:", a4), "setSize:", a3.width, a3.height);
}

- (CGSize)sizeForBodyIndex:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(-[THPageHint p_bodyHintAtIndex:](self, "p_bodyHintAtIndex:", a3), "size");
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setFirstChildHint:(id)a3 forBodyIndex:(unint64_t)a4
{
  objc_msgSend(-[THPageHint p_bodyHintAtIndex:](self, "p_bodyHintAtIndex:", a4), "setFirstChildHint:", a3);
}

- (id)firstChildHintForBodyIndex:(unint64_t)a3
{
  return objc_msgSend(-[THPageHint p_bodyHintAtIndex:](self, "p_bodyHintAtIndex:", a3), "firstChildHint");
}

- (void)setLastChildHint:(id)a3 forBodyIndex:(unint64_t)a4
{
  objc_msgSend(-[THPageHint p_bodyHintAtIndex:](self, "p_bodyHintAtIndex:", a4), "setLastChildHint:", a3);
}

- (id)lastChildHintForBodyIndex:(unint64_t)a3
{
  return objc_msgSend(-[THPageHint p_bodyHintAtIndex:](self, "p_bodyHintAtIndex:", a3), "lastChildHint");
}

- (id)firstColumn
{
  id result;

  result = -[THPageHint nonEmptyBodyCount](self, "nonEmptyBodyCount");
  if (result)
    return -[THPageHint firstColumnForBodyIndex:](self, "firstColumnForBodyIndex:", 0);
  return result;
}

- (id)lastColumn
{
  id result;

  result = -[THPageHint nonEmptyBodyCount](self, "nonEmptyBodyCount");
  if (result)
    return -[THPageHint lastColumnForBodyIndex:](self, "lastColumnForBodyIndex:", (char *)-[THPageHint nonEmptyBodyCount](self, "nonEmptyBodyCount") - 1);
  return result;
}

- (id)firstColumnForBodyIndex:(unint64_t)a3
{
  return objc_msgSend(-[THPageHint p_bodyHintAtIndex:](self, "p_bodyHintAtIndex:", a3), "firstColumn");
}

- (id)lastColumnForBodyIndex:(unint64_t)a3
{
  return objc_msgSend(-[THPageHint p_bodyHintAtIndex:](self, "p_bodyHintAtIndex:", a3), "lastColumn");
}

- (id)firstChildHint
{
  id result;

  result = -[THPageHint nonEmptyBodyCount](self, "nonEmptyBodyCount");
  if (result)
    return -[THPageHint firstChildHintForBodyIndex:](self, "firstChildHintForBodyIndex:", 0);
  return result;
}

- (id)lastChildHint
{
  id result;

  result = -[THPageHint nonEmptyBodyCount](self, "nonEmptyBodyCount");
  if (result)
    return -[THPageHint lastChildHintForBodyIndex:](self, "lastChildHintForBodyIndex:", (char *)-[THPageHint nonEmptyBodyCount](self, "nonEmptyBodyCount") - 1);
  return result;
}

- ($76C9DF09DF30CB4FBD89D11B5573AD82)firstHint
{
  if (-[THPageHint nonEmptyBodyCount](self, "nonEmptyBodyCount"))
    return -[THPageHint firstHintForBodyIndex:](self, "firstHintForBodyIndex:", 0);
  else
    return ($76C9DF09DF30CB4FBD89D11B5573AD82 *)&self->mBodylessStubHint;
}

- ($76C9DF09DF30CB4FBD89D11B5573AD82)lastHint
{
  if (-[THPageHint nonEmptyBodyCount](self, "nonEmptyBodyCount"))
    return -[THPageHint lastHintForBodyIndex:](self, "lastHintForBodyIndex:", (char *)-[THPageHint nonEmptyBodyCount](self, "nonEmptyBodyCount") - 1);
  else
    return ($76C9DF09DF30CB4FBD89D11B5573AD82 *)&self->mBodylessStubHint;
}

- ($76C9DF09DF30CB4FBD89D11B5573AD82)firstHintForBodyIndex:(unint64_t)a3
{
  return ($76C9DF09DF30CB4FBD89D11B5573AD82 *)objc_msgSend(-[THPageHint p_bodyHintAtIndex:](self, "p_bodyHintAtIndex:", a3), "firstHint");
}

- ($76C9DF09DF30CB4FBD89D11B5573AD82)lastHintForBodyIndex:(unint64_t)a3
{
  return ($76C9DF09DF30CB4FBD89D11B5573AD82 *)objc_msgSend(-[THPageHint p_bodyHintAtIndex:](self, "p_bodyHintAtIndex:", a3), "lastHint");
}

- (id)anchoredAttachmentPositionsForBodyChildAtIndex:(unint64_t)a3
{
  return objc_msgSend(-[THPageHint p_bodyHintAtIndex:](self, "p_bodyHintAtIndex:", a3), "anchoredAttachmentPositions");
}

- (void)setAnchoredAttachmentPositions:(id)a3 forBodyIndex:(unint64_t)a4
{
  objc_msgSend(-[THPageHint p_bodyHintAtIndex:](self, "p_bodyHintAtIndex:", a4), "setAnchoredAttachmentPositions:", a3);
}

- (void)setTopicNumbers:(void *)a3
{
  NSUInteger v5;
  $76C9DF09DF30CB4FBD89D11B5573AD82 *v6;

  v5 = *((_QWORD *)a3 + 3);
  v6 = -[THPageHint firstHint](self, "firstHint");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL && v5 >= v6->var1.location)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageHint setTopicNumbers:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageHint.mm"), 254, CFSTR("topicNumbers is out of sync with target hints"));
  TSWPTopicNumberHints::operator=(&self->_topicNumbers, a3);
}

- (unint64_t)bodyCount
{
  return self->mBodyCount;
}

- (void)setBodyCount:(unint64_t)a3
{
  self->mBodyCount = a3;
}

- (unint64_t)nonEmptyBodyCount
{
  return self->mNonEmptyBodyCount;
}

- (void)setNonEmptyBodyCount:(unint64_t)a3
{
  self->mNonEmptyBodyCount = a3;
}

- ($76C9DF09DF30CB4FBD89D11B5573AD82)bodylessStubHint
{
  CGSize size;
  CGSize v4;

  size = self[1].var0.size;
  retstr->var1 = (_NSRange)self[1].var0.origin;
  *(CGSize *)&retstr->var2 = size;
  *(_NSRange *)&retstr->var3.length = self[1].var1;
  v4 = *(CGSize *)&self->var3.length;
  retstr->var0.origin = *(CGPoint *)&self->var2;
  retstr->var0.size = v4;
  return self;
}

- (void)setBodylessStubHint:(id *)a3
{
  CGSize size;
  _NSRange var1;
  __int128 v5;

  self->mBodylessStubHint._frameBounds.origin = a3->var0.origin;
  size = a3->var0.size;
  var1 = a3->var1;
  v5 = *(_OWORD *)&a3->var3.length;
  *(_OWORD *)&self->mBodylessStubHint._nextWidowPullsDownFromCharIndex = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->mBodylessStubHint._anchoredRange.length = v5;
  self->mBodylessStubHint._frameBounds.size = size;
  self->mBodylessStubHint._range = var1;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->mSize.width;
  height = self->mSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->mSize = a3;
}

- (void)topicNumbers
{
  return &self->_topicNumbers;
}

- (void).cxx_destruct
{
  TSWPTopicNumberHints::~TSWPTopicNumberHints(&self->_topicNumbers);
}

- (id).cxx_construct
{
  TSWPTopicNumberHints::TSWPTopicNumberHints(&self->_topicNumbers, 0);
  return self;
}

@end
