@implementation SBSystemNotesContentPresentationContext

- (SBSystemNotesContentPresentationContext)initWithLaunchBundleID:(id)a3 presentationMode:(int64_t)a4 source:(unint64_t)a5 positionConfiguration:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  SBSystemNotesContentPresentationContext *v14;

  v10 = (objc_class *)MEMORY[0x1E0DAB028];
  v11 = a6;
  v12 = a3;
  v13 = (void *)objc_msgSend([v10 alloc], "initWithSceneBundleIdentifier:userActivity:preferredPresentationMode:", v12, 0, a4);

  v14 = -[SBSystemNotesContentPresentationContext initWithRequestedConfiguration:source:positionConfiguration:](self, "initWithRequestedConfiguration:source:positionConfiguration:", v13, a5, v11);
  return v14;
}

- (SBSystemNotesContentPresentationContext)initWithRequestedConfiguration:(id)a3 source:(unint64_t)a4 positionConfiguration:(id)a5
{
  id v9;
  id v10;
  SBSystemNotesContentPresentationContext *v11;
  SBSystemNotesContentPresentationContext *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBSystemNotesContentPresentationContext;
  v11 = -[SBSystemNotesContentPresentationContext init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_requestedConfiguration, a3);
    v12->_source = a4;
    objc_storeStrong((id *)&v12->_positionConfiguration, a5);
  }

  return v12;
}

- (SBSSystemNotesPresentationConfiguration)requestedConfiguration
{
  return self->_requestedConfiguration;
}

- (void)setRequestedConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_requestedConfiguration, a3);
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (SBSystemNotesPositionConfiguration)positionConfiguration
{
  return self->_positionConfiguration;
}

- (void)setPositionConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_positionConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positionConfiguration, 0);
  objc_storeStrong((id *)&self->_requestedConfiguration, 0);
}

@end
