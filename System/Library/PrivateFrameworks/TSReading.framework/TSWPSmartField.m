@implementation TSWPSmartField

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("It is illegal to instantiate TSWPSmartField; it is abstract"),
                               0));
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TSWPSmartField;
  return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (TSWPSmartField)initWithContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSWPSmartField;
  return -[TSPObject initWithContext:](&v4, sel_initWithContext_, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSWPSmartField;
  -[TSWPSmartField dealloc](&v2, sel_dealloc);
}

- (id)copyWithContext:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", -[TSWPSmartField zone](self, "zone")), "initWithContext:", a3);
}

- (int)elementKind
{
  return 0x2000;
}

- (unsigned)attributeArrayKind
{
  return 6;
}

- (int)styleAttributeArrayKind
{
  return 6;
}

- (_NSRange)range
{
  TSWPAttributeArray *v3;
  TSWPAttributeArray *v4;
  unint64_t Object;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v3 = -[TSWPStorage attributeArrayForKind:](-[TSWPSmartField parentStorage](self, "parentStorage"), "attributeArrayForKind:", -[TSWPSmartField attributeArrayKind](self, "attributeArrayKind"));
  if (v3
    && (v4 = v3,
        Object = TSWPAttributeArray::findObject(v3, (objc_object *)self, self->_lastTableIndex),
        self->_lastTableIndex = Object,
        Object != 0x7FFFFFFFFFFFFFFFLL))
  {
    v6 = TSWPAttributeArray::rangeForAttributeIndex(v4, Object);
  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    v7 = 0;
  }
  result.length = v7;
  result.location = v6;
  return result;
}

- (BOOL)allowsEditing
{
  return 0;
}

- (BOOL)allowsPasteAsSmartField
{
  return 1;
}

- (BOOL)canCopy:(_NSRange)a3
{
  return 1;
}

- (id)text
{
  return 0;
}

+ (id)defaultFieldStyleIdentifier
{
  return 0;
}

- (TSWPStorage)parentStorage
{
  return self->_parentStorage;
}

- (void)setParentStorage:(id)a3
{
  self->_parentStorage = (TSWPStorage *)a3;
}

@end
