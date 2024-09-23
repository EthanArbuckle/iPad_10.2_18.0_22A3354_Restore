@implementation CRLWPTextualAttachment

- (BOOL)shouldArchiveStringEquivalent
{
  return 1;
}

- (id)stringWithPageNumber:(unint64_t)a3 pageCount:(unint64_t)a4 charIndex:(unint64_t)a5
{
  return &stru_1012A72B0;
}

- (NSString)stringEquivalent
{
  return (NSString *)&stru_1012A72B0;
}

- (id)stringEquivalentWithLayoutParent:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[CRLWPTextualAttachment stringEquivalent](self, "stringEquivalent", a3));
}

@end
