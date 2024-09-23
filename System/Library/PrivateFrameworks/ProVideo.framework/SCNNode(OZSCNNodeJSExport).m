@implementation SCNNode(OZSCNNodeJSExport)

- (uint64_t)firstChildNodeWithGeometry
{
  void *v1;
  uint64_t result;

  v1 = (void *)objc_msgSend(a1, "childNodesPassingTest:", &__block_literal_global_75);
  result = objc_msgSend(v1, "count");
  if (result)
    return objc_msgSend(v1, "objectAtIndexedSubscript:", 0);
  return result;
}

@end
