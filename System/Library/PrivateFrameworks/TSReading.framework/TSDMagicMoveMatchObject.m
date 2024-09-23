@implementation TSDMagicMoveMatchObject

- (TSDMagicMoveMatchObject)init
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveMatchObject init]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 621, CFSTR("Do not call method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[TSDMagicMoveMatchObject init]"), 0));
}

- (TSDMagicMoveMatchObject)initWithRep:(id)a3 position:(CGPoint)a4 stringValue:(id)a5 stringRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  double y;
  double x;
  TSDMagicMoveMatchObject *v12;
  TSDMagicMoveMatchObject *v13;
  void *v14;
  uint64_t v15;
  objc_super v17;

  length = a6.length;
  location = a6.location;
  y = a4.y;
  x = a4.x;
  v17.receiver = self;
  v17.super_class = (Class)TSDMagicMoveMatchObject;
  v12 = -[TSDMagicMoveMatchObject init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    -[TSDMagicMoveMatchObject setRep:](v12, "setRep:", a3);
    -[TSDMagicMoveMatchObject setPosition:](v13, "setPosition:", x, y);
    -[TSDMagicMoveMatchObject setStringValue:](v13, "setStringValue:", a5);
    -[TSDMagicMoveMatchObject setStringRange:](v13, "setStringRange:", location, length);
    -[TSDMagicMoveMatchObject setZOrder:](v13, "setZOrder:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "canvas"), "allRepsOrdered"), "indexOfObject:", a3));
    if (-[TSDMagicMoveMatchObject zOrder](v13, "zOrder") >= 10000)
    {
      v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMagicMoveMatchObject initWithRep:position:stringValue:stringRange:]");
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 634, CFSTR("zOrder is too large (%ld > 10000)"), -[TSDMagicMoveMatchObject zOrder](v13, "zOrder"));
    }
  }
  return v13;
}

+ (id)matchObjectWithRep:(id)a3 position:(CGPoint)a4
{
  return +[TSDMagicMoveMatchObject matchObjectWithTextRep:position:stringValue:stringRange:](TSDMagicMoveMatchObject, "matchObjectWithTextRep:position:stringValue:stringRange:", a3, 0, 0x7FFFFFFFFFFFFFFFLL, 0, a4.x, a4.y);
}

+ (id)matchObjectWithTextRep:(id)a3 position:(CGPoint)a4 stringValue:(id)a5 stringRange:(_NSRange)a6
{
  return -[TSDMagicMoveMatchObject initWithRep:position:stringValue:stringRange:]([TSDMagicMoveMatchObject alloc], "initWithRep:position:stringValue:stringRange:", a3, a5, a6.location, a6.length, a4.x, a4.y);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDMagicMoveMatchObject;
  -[TSDMagicMoveMatchObject dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSDMagicMoveMatchObject *v4;
  TSDRep *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSString *v10;
  uint64_t v11;
  uint64_t v12;
  TSDMagicMoveMatchObject *v13;

  v4 = [TSDMagicMoveMatchObject alloc];
  v5 = -[TSDMagicMoveMatchObject rep](self, "rep");
  -[TSDMagicMoveMatchObject position](self, "position");
  v7 = v6;
  v9 = v8;
  v10 = -[TSDMagicMoveMatchObject stringValue](self, "stringValue");
  v11 = -[TSDMagicMoveMatchObject stringRange](self, "stringRange");
  v13 = -[TSDMagicMoveMatchObject initWithRep:position:stringValue:stringRange:](v4, "initWithRep:position:stringValue:stringRange:", v5, v10, v11, v12, v7, v9);
  -[TSDMagicMoveMatchObject setAttributes:](v13, "setAttributes:", -[TSDMagicMoveMatchObject attributes](self, "attributes"));
  -[TSDMagicMoveMatchObject setName:](v13, "setName:", -[TSDMagicMoveMatchObject name](self, "name"));
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  void *v5;
  uint64_t v6;
  TSDRep *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = (void *)objc_opt_class();
  LODWORD(v6) = objc_msgSend(v5, "isEqual:", objc_opt_class());
  if ((_DWORD)v6)
  {
    v7 = -[TSDMagicMoveMatchObject rep](self, "rep");
    if (v7 != (TSDRep *)objc_msgSend(a3, "rep"))
    {
LABEL_3:
      LOBYTE(v6) = 0;
      return v6;
    }
    if (!-[TSDMagicMoveMatchObject stringValue](self, "stringValue") || (v6 = objc_msgSend(a3, "stringValue")) != 0)
    {
      if (!-[TSDMagicMoveMatchObject stringValue](self, "stringValue") && objc_msgSend(a3, "stringValue"))
        goto LABEL_3;
      if (!-[TSDMagicMoveMatchObject stringValue](self, "stringValue")
        || !objc_msgSend(a3, "stringValue")
        || (LODWORD(v6) = -[NSString isEqual:](-[TSDMagicMoveMatchObject stringValue](self, "stringValue"), "isEqual:", objc_msgSend(a3, "stringValue")), (_DWORD)v6))
      {
        v8 = -[TSDMagicMoveMatchObject stringRange](self, "stringRange");
        v10 = v9;
        LOBYTE(v6) = v8 == objc_msgSend(a3, "stringRange") && v10 == v11;
      }
    }
  }
  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[TSDRep hash](-[TSDMagicMoveMatchObject rep](self, "rep"), "hash");
  v4 = -[NSString hash](-[TSDMagicMoveMatchObject stringValue](self, "stringValue"), "hash") + v3;
  v5 = v4 + 10000 * -[TSDMagicMoveMatchObject stringRange](self, "stringRange");
  -[TSDMagicMoveMatchObject stringRange](self, "stringRange");
  return v5 + 1000000 * v6;
}

- (id)description
{
  NSString *v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  TSDRep *v7;
  NSString *v8;
  NSString *v9;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;
  NSRange v14;
  CGPoint v15;
  CGPoint v16;

  if (-[TSDMagicMoveMatchObject name](self, "name"))
  {
    v3 = -[TSDMagicMoveMatchObject name](self, "name");
  }
  else
  {
    v4 = -[TSDMagicMoveMatchObject stringValue](self, "stringValue");
    v5 = (void *)MEMORY[0x24BDD17C8];
    -[TSDMagicMoveMatchObject rep](self, "rep");
    v6 = objc_msgSend((id)objc_opt_class(), "description");
    v7 = -[TSDMagicMoveMatchObject rep](self, "rep");
    if (v4)
    {
      v8 = -[TSDMagicMoveMatchObject stringValue](self, "stringValue");
      v14.location = -[TSDMagicMoveMatchObject stringRange](self, "stringRange");
      v9 = NSStringFromRange(v14);
      -[TSDMagicMoveMatchObject position](self, "position");
      v3 = (NSString *)objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p> (\"%@\")(%@) @ %@"), v6, v7, v8, v9, NSStringFromCGPoint(v15));
    }
    else
    {
      -[TSDMagicMoveMatchObject position](self, "position");
      v3 = (NSString *)objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p> @ %@"), v6, v7, NSStringFromCGPoint(v16), v11, v12);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)TSDMagicMoveMatchObject;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %@"), -[TSDMagicMoveMatchObject description](&v13, sel_description), v3);
}

- (BOOL)conflictsWithMatchObject:(id)a3
{
  TSDRep *v5;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSRange v11;
  NSRange v12;

  v5 = -[TSDMagicMoveMatchObject rep](self, "rep");
  if (v5 != (TSDRep *)objc_msgSend(a3, "rep"))
    return 0;
  if (!-[TSDMagicMoveMatchObject stringValue](self, "stringValue") || !objc_msgSend(a3, "stringValue"))
    return 1;
  v7 = -[TSDMagicMoveMatchObject stringRange](self, "stringRange");
  v9 = v8;
  v12.location = objc_msgSend(a3, "stringRange");
  v12.length = v10;
  v11.location = v7;
  v11.length = v9;
  return NSIntersectionRange(v11, v12).length != 0;
}

- (TSDRep)rep
{
  return self->_rep;
}

- (void)setRep:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->_position.x;
  y = self->_position.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->_position = a3;
}

- (int64_t)zOrder
{
  return self->_zOrder;
}

- (void)setZOrder:(int64_t)a3
{
  self->_zOrder = a3;
}

- (NSMutableDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (_NSRange)stringRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_stringRange.length;
  location = self->_stringRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setStringRange:(_NSRange)a3
{
  self->_stringRange = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
