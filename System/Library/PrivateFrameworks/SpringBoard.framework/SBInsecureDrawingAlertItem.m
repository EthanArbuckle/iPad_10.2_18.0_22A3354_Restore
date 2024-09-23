@implementation SBInsecureDrawingAlertItem

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)ignoreIfAlreadyDisplaying
{
  return 1;
}

- (id)title
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBInsecureDrawingAlertItem processName](self, "processName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("INSECURE_DRAWING_ALERT_TITLE_WITH_PROCESS"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", v5, v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("INSECURE_DRAWING_ALERT_TITLE_NO_PROCESS"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)message
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("INSECURE_DRAWING_ALERT_MESSAGE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBInsecureDrawingAlertItem radarComponentName](self, "radarComponentName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBInsecureDrawingAlertItem radarComponentVersion](self, "radarComponentVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)radarTitle
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;

  -[SBInsecureDrawingAlertItem processName](self, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBInsecureDrawingAlertItem _buildVersion](self, "_buildVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Secure Draw Violation Reported - %@"), v4, v3);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: Secure Draw Violation Reported - Unknown Process"), v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)radarDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("INSECURE_DRAWING_RADAR_DESCRIPTION"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBDiagnosticRequestAlertItem radarAttachments](self, "radarAttachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_map:", &__block_literal_global_213);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@\n\n%@"), v4, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  if (-[NSSet count](self->_layerNames, "count"))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[NSSet allObjects](self->_layerNames, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@\n\nLayer names:\n%@"), v4, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v13;
  }

  return v4;
}

uint64_t __46__SBInsecureDrawingAlertItem_radarDescription__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "lastPathComponent");
}

- (id)radarKeywordIDs
{
  return &unk_1E91CEB30;
}

- (id)radarComponentID
{
  return &unk_1E91D11F0;
}

- (id)radarComponentName
{
  return CFSTR("SpringBoard");
}

- (id)radarComponentVersion
{
  return CFSTR("Secure Draw Violations");
}

- (int64_t)radarClassification
{
  return 7;
}

- (int64_t)radarReproducibility
{
  return 5;
}

- (id)_buildVersion
{
  return (id)_CFCopySystemVersionDictionaryValue();
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSSet)layerNames
{
  return self->_layerNames;
}

- (void)setLayerNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerNames, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

@end
