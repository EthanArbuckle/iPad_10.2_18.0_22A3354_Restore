@implementation PFEICharacterRun

- (BOOL)mapStartElementWithState:(id)a3
{
  objc_super v6;

  objc_msgSend(a3, "setCfiPathForCurrentStorage");
  v6.receiver = self;
  v6.super_class = (Class)PFEICharacterRun;
  return -[PFXCharacterRun mapStartElementWithState:](&v6, "mapStartElementWithState:", a3);
}

+ (void)startReferenceAnchorWithStackEntry:(id)a3 readerState:(id)a4
{
  +[PFEIReferenceAnchor startReferenceAnchorWithStackEntry:contentState:](PFEIReferenceAnchor, "startReferenceAnchorWithStackEntry:contentState:", a3, a4);
}

+ (void)endCurrentReferenceAnchorForEntryOrientation:(id)a3 readerState:(id)a4
{
  +[PFEIReferenceAnchor endCurrentReferenceAnchorWithContentState:](PFEIReferenceAnchor, "endCurrentReferenceAnchorWithContentState:", a4);
}

@end
