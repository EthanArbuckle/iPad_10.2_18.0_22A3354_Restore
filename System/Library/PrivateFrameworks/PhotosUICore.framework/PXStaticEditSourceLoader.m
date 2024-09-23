@implementation PXStaticEditSourceLoader

- (PXStaticEditSourceLoader)initWithEditSource:(id)a3 compositionController:(id)a4 baseVersion:(int64_t)a5 contentIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  PXStaticEditSourceLoader *v14;
  PXStaticEditSourceLoader *v15;
  uint64_t v16;
  PICompositionController *compositionController;
  uint64_t v18;
  NSProgress *progress;
  uint64_t v20;
  NSString *contentIdentifier;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PXStaticEditSourceLoader;
  v14 = -[PXStaticEditSourceLoader init](&v23, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_editSource, a3);
    v16 = objc_msgSend(v12, "copy");
    compositionController = v15->_compositionController;
    v15->_compositionController = (PICompositionController *)v16;

    v15->_baseVersion = a5;
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
    v18 = objc_claimAutoreleasedReturnValue();
    progress = v15->_progress;
    v15->_progress = (NSProgress *)v18;

    -[NSProgress setCompletedUnitCount:](v15->_progress, "setCompletedUnitCount:", -[NSProgress totalUnitCount](v15->_progress, "totalUnitCount"));
    v20 = objc_msgSend(v13, "copy");
    contentIdentifier = v15->_contentIdentifier;
    v15->_contentIdentifier = (NSString *)v20;

  }
  return v15;
}

- (NSNumber)loadDuration
{
  return (NSNumber *)&unk_1E53EF930;
}

- (PLEditSource)editSource
{
  return self->_editSource;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (PICompositionController)originalCompositionController
{
  return self->_originalCompositionController;
}

- (int64_t)baseVersion
{
  return self->_baseVersion;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (NSString)livePhotoPairingIdentifier
{
  return self->_livePhotoPairingIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_livePhotoPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_originalCompositionController, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_editSource, 0);
}

@end
