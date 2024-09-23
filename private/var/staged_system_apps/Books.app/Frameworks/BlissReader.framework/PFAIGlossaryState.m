@implementation PFAIGlossaryState

- (PFAIGlossaryState)initWithEntryBody:(id)a3 documentRoot:(id)a4 archive:(id)a5 documentEntryUri:(id)a6
{
  PFAIGlossaryState *v7;
  PFXHtmlDocMediaState *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PFAIGlossaryState;
  v7 = -[PFXHtmlReaderState initWithDocumentRoot:contentNode:entry:inArchive:](&v11, "initWithDocumentRoot:contentNode:entry:inArchive:", a4, 0, a6, a5);
  if (v7)
  {
    v8 = [PFXHtmlDocMediaState alloc];
    v9 = objc_msgSend(a3, "bodyStorage");
    v7->mDocMediaState = -[PFXHtmlDocMediaState initWithStorage:readerState:defaultParagraphStyleIdentifier:](v8, "initWithStorage:readerState:defaultParagraphStyleIdentifier:", v9, v7, kTSWPDefaultGlossaryParagraphStyleIdentifier);
    v7->mEntryBody = (THModelGlossaryEntryBody *)a3;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFAIGlossaryState;
  -[PFXHtmlReaderState dealloc](&v3, "dealloc");
}

- (id)currentHtmlDocMediaState
{
  return self->mDocMediaState;
}

- (THModelGlossaryEntryBody)entryBody
{
  return self->mEntryBody;
}

- (Class)drawablePlacementClass
{
  return (Class)objc_opt_class(PFAIGlossaryDrawablePlacement, a2);
}

@end
