@implementation TSWPFootnoteMarkAttachment

- (id)stringEquivalent
{
  return 0;
}

- (int)elementKind
{
  return 128;
}

- (id)copyWithContext:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", -[TSWPFootnoteMarkAttachment zone](self, "zone")), "initWithContext:", a3);
}

- (BOOL)shouldStyleBeExtended
{
  return 0;
}

@end
