@implementation BRFieldStructureSignature(BRAdditions)

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<st %@|%@>"), self->_versionIdentifier, self->_oldVersionIdentifier);
}

@end
