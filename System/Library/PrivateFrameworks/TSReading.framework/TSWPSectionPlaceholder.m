@implementation TSWPSectionPlaceholder

- (TSWPSectionPlaceholder)initWithContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSWPSectionPlaceholder;
  return -[TSPObject initWithContext:](&v4, sel_initWithContext_, a3);
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSWPSectionPlaceholder;
  return -[TSWPSectionPlaceholder isEqual:](&v4, sel_isEqual_, a3);
}

- (id)copyWithContext:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:", a3);
}

- (id)parentStorage
{
  return self->_parentStorage;
}

- (void)setParentStorage:(id)a3
{
  self->_parentStorage = (TSWPStorage *)a3;
}

- (void)i_ensureHeaderFooterStoragesExistWithStylesheet:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPSectionPlaceholder i_ensureHeaderFooterStoragesExistWithStylesheet:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPSectionPlaceholder.mm"), 89, CFSTR("Should be defined in the real section class: i_ensureHeaderFooterStoragesExistWithStylesheet:"));
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] 0x%p"), NSStringFromClass(v4), self);
}

@end
