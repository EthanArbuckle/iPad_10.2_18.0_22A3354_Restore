@implementation PFAITable

- (BOOL)canAddColumnBreak:(id)a3
{
  return objc_msgSend(a3, "paginatedIsCurrent");
}

@end
