@implementation BRFieldContentSignature(BRAdditions)

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<ct %@|%@ sz:%llu sig:%@>"), self->_versionIdentifier, self->_oldVersionIdentifier, -[BRFieldContentSignature size](self, "size"), self->_contentSignature);
}

@end
