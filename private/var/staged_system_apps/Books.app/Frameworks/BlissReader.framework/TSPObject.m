@implementation TSPObject

- (PFDContext)drmContext
{
  uint64_t v3;

  v3 = objc_opt_class(THDocumentRoot);
  return (PFDContext *)objc_msgSend(objc_msgSend((id)TSUCheckedDynamicCast(v3, -[TSPObject documentRoot](self, "documentRoot")), "bookDescription"), "drmContext");
}

@end
