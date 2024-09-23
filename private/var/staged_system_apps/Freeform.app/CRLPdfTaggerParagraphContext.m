@implementation CRLPdfTaggerParagraphContext

- (CRLPdfTaggerParagraphContext)initWithStateOfTagger:(id)a3 needsSpans:(BOOL)a4
{
  CRLPdfTaggerParagraphContext *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLPdfTaggerParagraphContext;
  result = -[CRLPdfTaggerContext initWithStateOfTagger:](&v6, "initWithStateOfTagger:", a3);
  if (result)
    result->_needsSpans = a4;
  return result;
}

- (BOOL)needsSpans
{
  return self->_needsSpans;
}

@end
