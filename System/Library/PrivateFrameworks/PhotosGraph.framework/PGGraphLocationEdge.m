@implementation PGGraphLocationEdge

+ (id)filter
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", 0, 200);
}

- (MAEdgeFilter)uniquelyIdentifyingFilter
{
  return (MAEdgeFilter *)objc_msgSend((id)objc_opt_class(), "filter");
}

@end
