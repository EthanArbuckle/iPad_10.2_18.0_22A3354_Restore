@implementation VMUCallTreePseudoNode

- (BOOL)isPseudo
{
  return 1;
}

- (id)pseudoNodeTopOfStackChild
{
  return 0;
}

- (id)sortedChildrenWithPseudoNode
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
}

- (id)largestTopOfStackPath
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", self);
}

@end
