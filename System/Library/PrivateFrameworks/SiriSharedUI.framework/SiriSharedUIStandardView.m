@implementation SiriSharedUIStandardView

- (BOOL)isSemanticContentAttributeRightToLeft
{
  return -[SiriSharedUIStandardView semanticContentAttribute](self, "semanticContentAttribute") == 4;
}

@end
