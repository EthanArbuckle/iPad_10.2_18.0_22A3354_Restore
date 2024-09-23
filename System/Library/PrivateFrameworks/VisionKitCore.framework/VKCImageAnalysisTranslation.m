@implementation VKCImageAnalysisTranslation

- (VKCImageAnalysisTranslation)initWithParagraphs:(id)a3
{
  id v5;
  VKCImageAnalysisTranslation *v6;
  VKCImageAnalysisTranslation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKCImageAnalysisTranslation;
  v6 = -[VKCImageAnalysisTranslation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_paragraphs, a3);

  return v7;
}

- (NSArray)paragraphs
{
  return self->_paragraphs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paragraphs, 0);
}

@end
