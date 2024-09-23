@implementation PFAIEntryOrientationState

- (PFAIEntryOrientationState)initWithStackEntry:(id)a3 parentEntryOrientationState:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFAIEntryOrientationState;
  return -[PFXHtmlEntryMediaState initWithHtmlStackEntry:parentEntryMediaState:](&v5, "initWithHtmlStackEntry:parentEntryMediaState:", a3, a4);
}

- (PFAIEntryOrientationState)parentEntryOrientationState
{
  return (PFAIEntryOrientationState *)self->super.mParentEntryMediaState;
}

- (void)loadPropertiesIfNecessary
{
  PFXHtmlStackEntry *mHtmlStackEntry;
  id v4;
  id v5;
  id v6;
  objc_super v7;

  if (!self->super.mPropertySet)
  {
    mHtmlStackEntry = self->super.mHtmlStackEntry;
    v4 = -[PFXHtmlStackEntry currentEntryOrientationState](mHtmlStackEntry, "currentEntryOrientationState");
    v5 = -[PFXHtmlStackEntry flowState](mHtmlStackEntry, "flowState");
    v7.receiver = self;
    v7.super_class = (Class)PFAIEntryOrientationState;
    -[PFXHtmlEntryMediaState loadPropertiesIfNecessary](&v7, "loadPropertiesIfNecessary");
    v6 = -[PFXHtmlStackEntry applePubReaderState](mHtmlStackEntry, "applePubReaderState");
    if (v4 == v5)
      objc_msgSend(v6, "setFlowAsCurrent");
    else
      objc_msgSend(v6, "setPaginatedAsCurrent");
  }
}

@end
