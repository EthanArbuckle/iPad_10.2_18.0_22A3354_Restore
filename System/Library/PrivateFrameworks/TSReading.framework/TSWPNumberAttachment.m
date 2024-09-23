@implementation TSWPNumberAttachment

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPNumberAttachment;
  -[TSWPNumberAttachment dealloc](&v3, sel_dealloc);
}

- (id)copyWithContext:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", -[TSWPNumberAttachment zone](self, "zone")), "initWithContext:", a3);
  objc_msgSend(v4, "setNumberFormat:", self->_numberFormat);
  objc_msgSend(v4, "setStringValue:", self->_stringValue);
  return v4;
}

- (id)stringEquivalent
{
  if (-[TSWPNumberAttachment stringValue](self, "stringValue"))
    return -[TSWPNumberAttachment stringValue](self, "stringValue");
  else
    return &stru_24D82FEB0;
}

- (id)stringEquivalentWithLayoutParent:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  if (!a3)
    return -[TSWPNumberAttachment stringEquivalent](self, "stringEquivalent");
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPNumberAttachment stringEquivalentWithLayoutParent:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPNumberAttachment.mm"), 152, CFSTR("Expected protocol support."));
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPNumberAttachment stringEquivalentWithLayoutParent:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPNumberAttachment.mm"), 153, CFSTR("Expected protocol support."));
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(a3, "pageCountForAttachment:", self);
  else
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = objc_msgSend(a3, "pageNumberForAttachment:", self);
  else
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  return -[TSWPTextualAttachment stringWithPageNumber:pageCount:charIndex:](self, "stringWithPageNumber:pageCount:charIndex:", v11, v9, 0);
}

- (id)stringWithNumber:(unint64_t)a3
{
  uint64_t v4;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    v4 = 1;
  else
    v4 = a3;
  -[TSWPNumberAttachment setStringValue:](self, "setStringValue:", objc_msgSend(MEMORY[0x24BDD17C8], "stringForValue:withPageNumberFormat:", v4, -[TSWPNumberAttachment numberFormat](self, "numberFormat")));
  return -[TSWPNumberAttachment stringValue](self, "stringValue");
}

- (int)numberFormat
{
  return self->_numberFormat;
}

- (void)setNumberFormat:(int)a3
{
  self->_numberFormat = a3;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

@end
