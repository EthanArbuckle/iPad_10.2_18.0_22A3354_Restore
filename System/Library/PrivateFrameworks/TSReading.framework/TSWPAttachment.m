@implementation TSWPAttachment

- (TSWPAttachment)initWithContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSWPAttachment;
  return -[TSPObject initWithContext:](&v4, sel_initWithContext_, a3);
}

- (void)setParentStorage:(id)a3
{
  self->_parentStorage = (TSWPStorage *)a3;
}

- (unint64_t)findCharIndex
{
  return -[TSWPStorage findCharIndexForAttachment:](self->_parentStorage, "findCharIndexForAttachment:", self);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("It is illegal to instantiate TSWPAttachment; it is abstract"),
                               0));
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TSWPAttachment;
  return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

+ (unsigned)attributeArrayKind
{
  return 4;
}

- (id)copyWithContext:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", -[TSWPAttachment zone](self, "zone")), "initWithContext:", a3);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;

  if (!a3)
    return 0;
  v3 = objc_opt_class();
  return v3 == objc_opt_class();
}

- (int)elementKind
{
  return 0;
}

- (BOOL)changesWithPageCount
{
  return 0;
}

- (id)topLevelAttachment
{
  void *v2;
  int v3;
  void *v4;

  v2 = self;
  if (self)
  {
    while (objc_msgSend((id)objc_msgSend(v2, "parentStorage"), "wpKind"))
    {
      v3 = objc_msgSend((id)objc_msgSend(v2, "parentStorage"), "wpKind");
      objc_opt_class();
      v4 = (void *)objc_msgSend(v2, "parentStorage");
      if (v3 == 2)
      {
        objc_msgSend(v4, "owningAttachment");
        return (id)TSUDynamicCast();
      }
      objc_msgSend((id)objc_msgSend(v4, "parentInfo"), "owningAttachment");
      v2 = (void *)TSUDynamicCast();
      if (!v2)
        return v2;
    }
  }
  return v2;
}

- (BOOL)isDrawable
{
  return 0;
}

- (BOOL)isAnchored
{
  return 0;
}

- (BOOL)isPartitioned
{
  return 0;
}

- (BOOL)isAttachedToBodyText
{
  return -[TSWPStorage wpKind](-[TSWPAttachment parentStorage](self, "parentStorage"), "wpKind") == 0;
}

- (Class)positionerClass
{
  return 0;
}

- (BOOL)isSearchable
{
  return 0;
}

- (BOOL)specifiesEnabledKnobMask
{
  return 0;
}

- (unint64_t)enabledKnobMask
{
  return 0;
}

- (TSWPStorage)parentStorage
{
  return self->_parentStorage;
}

- (BOOL)changesWithPageNumber
{
  return 0;
}

@end
