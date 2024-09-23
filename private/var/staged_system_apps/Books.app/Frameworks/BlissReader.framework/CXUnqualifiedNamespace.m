@implementation CXUnqualifiedNamespace

- (CXUnqualifiedNamespace)initWithUri:(const char *)a3
{
  return 0;
}

- (BOOL)containsNode:(_xmlNode *)a3
{
  return a3->ns == 0;
}

- (BOOL)containsAttribute:(_xmlAttr *)a3
{
  return a3->ns == 0;
}

@end
