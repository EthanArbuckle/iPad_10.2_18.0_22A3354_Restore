@implementation PMLWordPieceVocabTrie

- (unsigned)payloadForString:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PMLWordPieceVocabTrie;
  return -[_PASCFBurstTrie payloadForString:](&v4, sel_payloadForString_, a3) - 1;
}

@end
