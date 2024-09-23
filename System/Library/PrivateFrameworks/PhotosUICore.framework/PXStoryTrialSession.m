@implementation PXStoryTrialSession

- (PXStoryTrialSession)init
{
  PXStoryTrialSession *v2;
  uint64_t v3;
  TRIClient *trialClient;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXStoryTrialSession;
  v2 = -[PXStoryTrialSession init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 235);
    v3 = objc_claimAutoreleasedReturnValue();
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v3;

  }
  return v2;
}

- (id)_levelForFactorName:(id)a3
{
  return (id)-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", a3, CFSTR("PHOTOS_GENERAL"));
}

- (id)fileURLForFactorName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXStoryTrialSession _levelForFactorName:](self, "_levelForFactorName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasPath"))
  {
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
  objc_storeStrong((id *)&self->_trialClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClient, 0);
}

@end
