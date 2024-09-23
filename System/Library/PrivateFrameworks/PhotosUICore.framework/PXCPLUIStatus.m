@implementation PXCPLUIStatus

- (PXCPLUIStatus)init
{
  PXCPLUIStatus *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCPLUIStatus;
  result = -[PXCPLUIStatus init](&v3, sel_init);
  if (result)
  {
    result->_progress = -1.0;
    result->_serviceAction = 0;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *stateDescription;
  const __CFString *startSyncDescription;
  const __CFString *failureDescription;
  const __CFString *internalInformationMessage;
  _BOOL8 paused;
  float progress;
  const __CFString *v11;
  unint64_t serviceAction;
  __CFString *v13;
  __CFString *v14;
  const __CFString *actionTitle;
  const __CFString *actionConfirmationAlertTitle;
  const __CFString *actionConfirmationAlertSubtitle;
  const __CFString *actionConfirmationAlertButtonTitle;
  unint64_t state;
  const __CFString *referencedItemsDescription;
  __CFString *v21;
  __CFString *v22;
  unint64_t pauseReason;
  const __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  unint64_t activity;
  const __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  __CFString *v38;
  uint64_t v39;
  void *v40;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_stateDescription)
    stateDescription = (const __CFString *)self->_stateDescription;
  else
    stateDescription = CFSTR("-");
  if (self->_startSyncDescription)
    startSyncDescription = (const __CFString *)self->_startSyncDescription;
  else
    startSyncDescription = CFSTR("-");
  if (self->_failureDescription)
    failureDescription = (const __CFString *)self->_failureDescription;
  else
    failureDescription = CFSTR("-");
  if (self->_internalInformationMessage)
    internalInformationMessage = (const __CFString *)self->_internalInformationMessage;
  else
    internalInformationMessage = CFSTR("-");
  paused = self->_paused;
  progress = self->_progress;
  if (progress == -1.0)
  {
    v11 = CFSTR("\"-\");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f"), progress);
    v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  serviceAction = self->_serviceAction;
  v39 = v4;
  v40 = v3;
  v38 = (__CFString *)v11;
  if (serviceAction > 0xB)
    v13 = 0;
  else
    v13 = off_1E5143398[serviceAction];
  v14 = v13;
  if (self->_actionTitle)
    actionTitle = (const __CFString *)self->_actionTitle;
  else
    actionTitle = CFSTR("-");
  if (self->_actionConfirmationAlertTitle)
    actionConfirmationAlertTitle = (const __CFString *)self->_actionConfirmationAlertTitle;
  else
    actionConfirmationAlertTitle = CFSTR("-");
  if (self->_actionConfirmationAlertSubtitle)
    actionConfirmationAlertSubtitle = (const __CFString *)self->_actionConfirmationAlertSubtitle;
  else
    actionConfirmationAlertSubtitle = CFSTR("-");
  if (self->_actionConfirmationAlertButtonTitle)
    actionConfirmationAlertButtonTitle = (const __CFString *)self->_actionConfirmationAlertButtonTitle;
  else
    actionConfirmationAlertButtonTitle = CFSTR("-");
  referencedItemsDescription = (const __CFString *)self->_referencedItemsDescription;
  state = self->_state;
  if (!referencedItemsDescription)
    referencedItemsDescription = CFSTR("-");
  v36 = actionTitle;
  v37 = startSyncDescription;
  v34 = actionConfirmationAlertSubtitle;
  v35 = actionConfirmationAlertTitle;
  v33 = referencedItemsDescription;
  if (state > 2)
    v21 = 0;
  else
    v21 = off_1E51432A8[state];
  v22 = v21;
  pauseReason = self->_pauseReason;
  v24 = failureDescription;
  if (pauseReason > 0x12)
    v25 = 0;
  else
    v25 = off_1E5143300[pauseReason];
  v26 = v25;
  activity = self->_activity;
  v28 = internalInformationMessage;
  if (activity > 7)
    v29 = 0;
  else
    v29 = off_1E51432C0[activity];
  v30 = v29;
  objc_msgSend(v40, "stringWithFormat:", CFSTR("<%@: stateDescription:\"%@\", startSyncDescription:\"%@\", failureDescription:\"%@\", internalInformationMessage:\"%@\", paused:%d, progress:%@, action:\"%@/%@\", alert:\"%@/%@/%@\", referencedItemsDescription:\"%@\", state:\"%@\", pause:\"%@\", activity:\"%@\", reset:%d, rebuild:%d, synced:%d, exiting:%d, failed:%lu, upgrade:%d, #photo/video/other:%lu/%lu/%lu>"), v39, stateDescription, v37, v24, v28, paused, v38, v14, v36, v35, v34, actionConfirmationAlertButtonTitle, v33, v22, v26, v30,
    self->_inResetSync,
    self->_isRestoringLibrary,
    self->_hasCompletedInitialSync,
    self->_isExiting,
    self->_numberOfItemsFailingToUpload,
    self->_isUpgradeSuggestedToAccessAllPhotos,
    self->_numberOfPhotoAssets,
    self->_numberOfVideoAssets,
    self->_numberOfOtherAssets);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (progress != -1.0)
  return v31;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && PXCPLUIStatusDiff(self, v4) == 0;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[PXCPLUIStatus stateDescription](self, "stateDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[3];
  v4[3] = v6;

  -[PXCPLUIStatus startSyncDescription](self, "startSyncDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  -[PXCPLUIStatus failureDescription](self, "failureDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "copy");
  v13 = (void *)v4[5];
  v4[5] = v12;

  -[PXCPLUIStatus internalInformationMessage](self, "internalInformationMessage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copy");
  v16 = (void *)v4[6];
  v4[6] = v15;

  *((_BYTE *)v4 + 8) = -[PXCPLUIStatus isPaused](self, "isPaused");
  -[PXCPLUIStatus progress](self, "progress");
  *((_DWORD *)v4 + 4) = v17;
  -[PXCPLUIStatus referencedItemsDescription](self, "referencedItemsDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "copy");
  v20 = (void *)v4[13];
  v4[13] = v19;

  -[PXCPLUIStatus actionTitle](self, "actionTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "copy");
  v23 = (void *)v4[7];
  v4[7] = v22;

  -[PXCPLUIStatus actionConfirmationAlertTitle](self, "actionConfirmationAlertTitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "copy");
  v26 = (void *)v4[8];
  v4[8] = v25;

  -[PXCPLUIStatus actionConfirmationAlertSubtitle](self, "actionConfirmationAlertSubtitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "copy");
  v29 = (void *)v4[9];
  v4[9] = v28;

  -[PXCPLUIStatus actionConfirmationAlertButtonTitle](self, "actionConfirmationAlertButtonTitle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "copy");
  v32 = (void *)v4[10];
  v4[10] = v31;

  -[PXCPLUIStatus action](self, "action");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "copy");
  v35 = (void *)v4[11];
  v4[11] = v34;

  v4[12] = -[PXCPLUIStatus serviceAction](self, "serviceAction");
  v4[14] = -[PXCPLUIStatus state](self, "state");
  v4[15] = -[PXCPLUIStatus activity](self, "activity");
  v4[16] = -[PXCPLUIStatus pauseReason](self, "pauseReason");
  *((_BYTE *)v4 + 9) = -[PXCPLUIStatus inResetSync](self, "inResetSync");
  *((_BYTE *)v4 + 10) = -[PXCPLUIStatus isRestoringLibrary](self, "isRestoringLibrary");
  *((_BYTE *)v4 + 11) = -[PXCPLUIStatus hasCompletedInitialSync](self, "hasCompletedInitialSync");
  *((_BYTE *)v4 + 12) = -[PXCPLUIStatus isExiting](self, "isExiting");
  v4[17] = -[PXCPLUIStatus numberOfItemsFailingToUpload](self, "numberOfItemsFailingToUpload");
  *((_BYTE *)v4 + 13) = -[PXCPLUIStatus isUpgradeSuggestedToAccessAllPhotos](self, "isUpgradeSuggestedToAccessAllPhotos");
  v4[18] = -[PXCPLUIStatus numberOfPhotoAssets](self, "numberOfPhotoAssets");
  v4[19] = -[PXCPLUIStatus numberOfVideoAssets](self, "numberOfVideoAssets");
  v4[20] = -[PXCPLUIStatus numberOfOtherAssets](self, "numberOfOtherAssets");
  return v4;
}

- (NSString)stateDescription
{
  return self->_stateDescription;
}

- (void)setStateDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)startSyncDescription
{
  return self->_startSyncDescription;
}

- (void)setStartSyncDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)failureDescription
{
  return self->_failureDescription;
}

- (void)setFailureDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)internalInformationMessage
{
  return self->_internalInformationMessage;
}

- (void)setInternalInformationMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)actionConfirmationAlertTitle
{
  return self->_actionConfirmationAlertTitle;
}

- (void)setActionConfirmationAlertTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)actionConfirmationAlertSubtitle
{
  return self->_actionConfirmationAlertSubtitle;
}

- (void)setActionConfirmationAlertSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)actionConfirmationAlertButtonTitle
{
  return self->_actionConfirmationAlertButtonTitle;
}

- (void)setActionConfirmationAlertButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)serviceAction
{
  return self->_serviceAction;
}

- (void)setServiceAction:(int64_t)a3
{
  self->_serviceAction = a3;
}

- (NSString)referencedItemsDescription
{
  return self->_referencedItemsDescription;
}

- (void)setReferencedItemsDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (unint64_t)activity
{
  return self->_activity;
}

- (void)setActivity:(unint64_t)a3
{
  self->_activity = a3;
}

- (int64_t)pauseReason
{
  return self->_pauseReason;
}

- (void)setPauseReason:(int64_t)a3
{
  self->_pauseReason = a3;
}

- (BOOL)inResetSync
{
  return self->_inResetSync;
}

- (void)setInResetSync:(BOOL)a3
{
  self->_inResetSync = a3;
}

- (BOOL)isRestoringLibrary
{
  return self->_isRestoringLibrary;
}

- (void)setIsRestoringLibrary:(BOOL)a3
{
  self->_isRestoringLibrary = a3;
}

- (BOOL)hasCompletedInitialSync
{
  return self->_hasCompletedInitialSync;
}

- (void)setHasCompletedInitialSync:(BOOL)a3
{
  self->_hasCompletedInitialSync = a3;
}

- (BOOL)isExiting
{
  return self->_isExiting;
}

- (void)setIsExiting:(BOOL)a3
{
  self->_isExiting = a3;
}

- (unint64_t)numberOfItemsFailingToUpload
{
  return self->_numberOfItemsFailingToUpload;
}

- (void)setNumberOfItemsFailingToUpload:(unint64_t)a3
{
  self->_numberOfItemsFailingToUpload = a3;
}

- (BOOL)isUpgradeSuggestedToAccessAllPhotos
{
  return self->_isUpgradeSuggestedToAccessAllPhotos;
}

- (void)setIsUpgradeSuggestedToAccessAllPhotos:(BOOL)a3
{
  self->_isUpgradeSuggestedToAccessAllPhotos = a3;
}

- (unint64_t)numberOfPhotoAssets
{
  return self->_numberOfPhotoAssets;
}

- (void)setNumberOfPhotoAssets:(unint64_t)a3
{
  self->_numberOfPhotoAssets = a3;
}

- (unint64_t)numberOfVideoAssets
{
  return self->_numberOfVideoAssets;
}

- (void)setNumberOfVideoAssets:(unint64_t)a3
{
  self->_numberOfVideoAssets = a3;
}

- (unint64_t)numberOfOtherAssets
{
  return self->_numberOfOtherAssets;
}

- (void)setNumberOfOtherAssets:(unint64_t)a3
{
  self->_numberOfOtherAssets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referencedItemsDescription, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertButtonTitle, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertSubtitle, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertTitle, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_internalInformationMessage, 0);
  objc_storeStrong((id *)&self->_failureDescription, 0);
  objc_storeStrong((id *)&self->_startSyncDescription, 0);
  objc_storeStrong((id *)&self->_stateDescription, 0);
}

@end
