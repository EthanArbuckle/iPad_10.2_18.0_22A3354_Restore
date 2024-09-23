@implementation PECopyEditsConfigurationResult

- (PECopyEditsConfigurationResult)initWithCompositionController:(id)a3
{
  id v4;
  PECopyEditsConfigurationResult *v5;
  uint64_t v6;
  PICompositionController *compositionController;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PECopyEditsConfigurationResult;
  v5 = -[PECopyEditsConfigurationResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    compositionController = v5->_compositionController;
    v5->_compositionController = (PICompositionController *)v6;

    v5->_smartCopyEnabled = 0;
  }

  return v5;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (BOOL)smartCopyEnabled
{
  return self->_smartCopyEnabled;
}

- (void)setSmartCopyEnabled:(BOOL)a3
{
  self->_smartCopyEnabled = a3;
}

- (NSDictionary)analyticsPayload
{
  return self->_analyticsPayload;
}

- (void)setAnalyticsPayload:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsPayload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsPayload, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
}

@end
