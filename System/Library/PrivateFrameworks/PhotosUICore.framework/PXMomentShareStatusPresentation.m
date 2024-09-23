@implementation PXMomentShareStatusPresentation

- (PXMomentShareStatusPresentation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMomentShareStatusPresentation.m"), 123, CFSTR("%s is not available as initializer"), "-[PXMomentShareStatusPresentation init]");

  abort();
}

- (PXMomentShareStatusPresentation)initWithMomentShareStatus:(id)a3 presentationStyle:(int64_t)a4
{
  id v8;
  PXMomentShareStatusPresentation *v9;
  PXMomentShareStatusPresentation *v10;
  uint64_t v11;
  PXCPLUIStatusProvider *statusProvider;
  void *v14;
  objc_super v15;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMomentShareStatusPresentation.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("momentShareStatus"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PXMomentShareStatusPresentation;
  v9 = -[PXMomentShareStatusPresentation init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_presentationStyle = a4;
    objc_storeStrong((id *)&v9->_momentShareStatus, a3);
    -[PXMomentShareStatus registerChangeObserver:context:](v10->_momentShareStatus, "registerChangeObserver:context:", v10, MomentShareStatusObservationContext);
    if ((v10->_presentationStyle & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      objc_msgSend(v8, "statusProvider");
      v11 = objc_claimAutoreleasedReturnValue();
      statusProvider = v10->_statusProvider;
      v10->_statusProvider = (PXCPLUIStatusProvider *)v11;

      -[PXCPLUIStatusProvider registerChangeObserver:context:](v10->_statusProvider, "registerChangeObserver:context:", v10, PXCPLUIStatusProviderObservationContext_271462);
      -[PXMomentShareStatusPresentation _updateCPLStatus](v10, "_updateCPLStatus");
    }
    -[PXMomentShareStatusPresentation _updateCountsAndStatus](v10, "_updateCountsAndStatus");
  }

  return v10;
}

- (PXMomentShareStatusPresentation)initWithMomentShare:(id)a3 presentationStyle:(int64_t)a4
{
  id v7;
  PXPhotoKitMomentShareStatus *v8;
  PXMomentShareStatusPresentation *v9;
  void *v11;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMomentShareStatusPresentation.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("momentShare"));

  }
  v8 = -[PXPhotoKitMomentShareStatus initWithPhotoKitMomentShare:]([PXPhotoKitMomentShareStatus alloc], "initWithPhotoKitMomentShare:", v7);
  v9 = -[PXMomentShareStatusPresentation initWithMomentShareStatus:presentationStyle:](self, "initWithMomentShareStatus:presentationStyle:", v8, a4);

  return v9;
}

- (NSString)description
{
  unint64_t presentationStyle;
  int64_t type;
  const __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  unint64_t state;
  const __CFString *activityTitle;
  double activityProgress;
  const __CFString *pauseTitle;
  const __CFString *actionTitle;
  const __CFString *actionConfirmationAlertTitle;
  const __CFString *actionConfirmationAlertSubtitle;
  const __CFString *actionConfirmationAlertButtonTitle;
  const __CFString *assetsTitle;
  const __CFString *expirationTitle;
  const __CFString *idleTitle;
  void *v19;
  void *v20;
  const __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;

  v27 = (void *)MEMORY[0x1E0CB3940];
  v26 = objc_opt_class();
  presentationStyle = self->_presentationStyle;
  if (presentationStyle > 4)
    v25 = 0;
  else
    v25 = off_1E5142FC8[presentationStyle];
  type = self->_type;
  v5 = CFSTR("receiver");
  if (type != 1)
    v5 = 0;
  if (type)
    v6 = (__CFString *)v5;
  else
    v6 = CFSTR("sender");
  v24 = v6;
  v7 = 0;
  state = self->_state;
  if (state <= 6)
    v7 = off_1E5142FF0[state];
  v23 = v7;
  activityTitle = (const __CFString *)self->_activityTitle;
  if (!activityTitle)
    activityTitle = CFSTR("-");
  v22 = activityTitle;
  activityProgress = self->_activityProgress;
  if (self->_pauseTitle)
    pauseTitle = (const __CFString *)self->_pauseTitle;
  else
    pauseTitle = CFSTR("-");
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
  if (self->_assetsTitle)
    assetsTitle = (const __CFString *)self->_assetsTitle;
  else
    assetsTitle = CFSTR("-");
  if (self->_expirationTitle)
    expirationTitle = (const __CFString *)self->_expirationTitle;
  else
    expirationTitle = CFSTR("-");
  if (self->_idleTitle)
    idleTitle = (const __CFString *)self->_idleTitle;
  else
    idleTitle = CFSTR("-");
  -[PXMomentShareStatus momentShare](self->_momentShareStatus, "momentShare");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("<%@:%p, style:\"%@\", type:\"%@\", state:\"%@\", activity:\"%@\", progress:%f, pause:\"%@\", action:\"%@\", alert:\"%@/%@/%@\", assets:\"%@\", expiration:\"%@\", idle:\"%@\", share:\"%@\">"), v26, self, v25, v24, v23, v22, *(_QWORD *)&activityProgress, pauseTitle, actionTitle, actionConfirmationAlertTitle, actionConfirmationAlertSubtitle, actionConfirmationAlertButtonTitle, assetsTitle, expirationTitle, idleTitle, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v20;
}

- (PXDisplayMomentShare)momentShare
{
  void *v2;
  void *v3;

  -[PXMomentShareStatusPresentation momentShareStatus](self, "momentShareStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentShare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXDisplayMomentShare *)v3;
}

- (PXCMMInvitation)invitation
{
  void *v2;
  void *v3;

  -[PXMomentShareStatusPresentation momentShareStatus](self, "momentShareStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invitation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXCMMInvitation *)v3;
}

- (void)didPerformChanges
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  PXMomentShareStatusPresentation *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)PXMomentShareStatusPresentation;
  -[PXMomentShareStatusPresentation didPerformChanges](&v4, sel_didPerformChanges);
  if (-[PXMomentShareStatusPresentation currentChanges](self, "currentChanges"))
  {
    PLSharingGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v6 = self;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "[PXMomentShareStatusPresentation] Did transition to %@", buf, 0xCu);
    }

  }
}

- (void)setType:(int64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    -[PXMomentShareStatusPresentation signalChange:](self, "signalChange:", 1);
  }
}

- (void)setAssetsTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *assetsTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_assetsTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      assetsTitle = self->_assetsTitle;
      self->_assetsTitle = v6;

      -[PXMomentShareStatusPresentation signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)setAssetsSaveStatusTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *assetsSaveStatusTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_assetsSaveStatusTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      assetsSaveStatusTitle = self->_assetsSaveStatusTitle;
      self->_assetsSaveStatusTitle = v6;

      -[PXMomentShareStatusPresentation signalChange:](self, "signalChange:", 0x8000);
    }
  }

}

- (void)setExpirationTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *expirationTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_expirationTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      expirationTitle = self->_expirationTitle;
      self->_expirationTitle = v6;

      -[PXMomentShareStatusPresentation signalChange:](self, "signalChange:", 4);
    }
  }

}

- (void)setActivityTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *activityTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_activityTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      activityTitle = self->_activityTitle;
      self->_activityTitle = v6;

      -[PXMomentShareStatusPresentation signalChange:](self, "signalChange:", 8);
    }
  }

}

- (void)setIdleTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *idleTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_idleTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      idleTitle = self->_idleTitle;
      self->_idleTitle = v6;

      -[PXMomentShareStatusPresentation signalChange:](self, "signalChange:", 16);
    }
  }

}

- (void)setPauseTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *pauseTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_pauseTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      pauseTitle = self->_pauseTitle;
      self->_pauseTitle = v6;

      -[PXMomentShareStatusPresentation signalChange:](self, "signalChange:", 32);
    }
  }

}

- (void)setActionTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *actionTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_actionTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      actionTitle = self->_actionTitle;
      self->_actionTitle = v6;

      -[PXMomentShareStatusPresentation signalChange:](self, "signalChange:", 64);
    }
  }

}

- (void)setActionConfirmationAlertTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *actionConfirmationAlertTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_actionConfirmationAlertTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      actionConfirmationAlertTitle = self->_actionConfirmationAlertTitle;
      self->_actionConfirmationAlertTitle = v6;

      -[PXMomentShareStatusPresentation signalChange:](self, "signalChange:", 128);
    }
  }

}

- (void)setActionConfirmationAlertSubtitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *actionConfirmationAlertSubtitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_actionConfirmationAlertSubtitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      actionConfirmationAlertSubtitle = self->_actionConfirmationAlertSubtitle;
      self->_actionConfirmationAlertSubtitle = v6;

      -[PXMomentShareStatusPresentation signalChange:](self, "signalChange:", 256);
    }
  }

}

- (void)setActionConfirmationAlertButtonTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *actionConfirmationAlertButtonTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_actionConfirmationAlertButtonTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      actionConfirmationAlertButtonTitle = self->_actionConfirmationAlertButtonTitle;
      self->_actionConfirmationAlertButtonTitle = v6;

      -[PXMomentShareStatusPresentation signalChange:](self, "signalChange:", 512);
    }
  }

}

- (void)setAction:(id)a3
{
  void *v4;
  id action;

  if (self->_action != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    action = self->_action;
    self->_action = v4;

    -[PXMomentShareStatusPresentation signalChange:](self, "signalChange:", 1024);
  }
}

- (void)setByline:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *byline;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_byline;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      byline = self->_byline;
      self->_byline = v6;

      -[PXMomentShareStatusPresentation signalChange:](self, "signalChange:", 2048);
    }
  }

}

- (void)setActivityProgress:(float)a3
{
  if (self->_activityProgress != a3)
  {
    self->_activityProgress = a3;
    -[PXMomentShareStatusPresentation signalChange:](self, "signalChange:", 4096);
  }
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[PXMomentShareStatusPresentation signalChange:](self, "signalChange:", 0x2000);
  }
}

- (void)setNumberOfAssetsNotCopied:(int64_t)a3
{
  if (self->_numberOfAssetsNotCopied != a3)
  {
    self->_numberOfAssetsNotCopied = a3;
    -[PXMomentShareStatusPresentation signalChange:](self, "signalChange:", 0x4000);
  }
}

- (void)setNumberOfAssetsCopied:(int64_t)a3
{
  if (self->_numberOfAssetsCopied != a3)
  {
    self->_numberOfAssetsCopied = a3;
    -[PXMomentShareStatusPresentation signalChange:](self, "signalChange:", 0x10000);
  }
}

- (void)_updateCountsAndStatus
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t presentationStyle;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  float v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  BOOL v37;
  int v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  float v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  char v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  __CFString *v76;
  id v77;
  id v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t Result;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  __CFString *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  id v113;
  unint64_t v114;
  id v115;
  PXMomentShareStatusPresentation *v116;
  _QWORD v117[4];
  id v118;
  id v119;
  __CFString *v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  uint64_t v134;
  float v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;

  -[PXMomentShareStatusPresentation momentShareStatus](self, "momentShareStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "momentShare");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "copyingAssetsFetchResult");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v108, "count");
    objc_msgSend(v3, "copiedAssetsFetchResult");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = objc_msgSend(v105, "count");
    objc_msgSend(v3, "allAssetsFetchResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend(v5, "count");

    v6 = objc_msgSend(v4, "uploadedPhotosCount");
    v7 = objc_msgSend(v4, "uploadedVideosCount");
    v8 = objc_msgSend(v4, "photosCount");
    v9 = objc_msgSend(v4, "videosCount");
    objc_msgSend(v3, "invitation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "owner");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedName");
    v12 = objc_claimAutoreleasedReturnValue();

    v116 = self;
    presentationStyle = self->_presentationStyle;
    v112 = objc_msgSend(v4, "px_momentShareType");
    PLLocalizedCountDescription();
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "expiryDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v4, "expiryDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PXCMMStringForExpiryDate(v15, 1);
      v104 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v104 = CFSTR(" ");
    }
    v114 = v9 + v8;

    v101 = (void *)v12;
    if (v12)
    {
      PXLocalizedStringFromTable(CFSTR("PXCMMFromSender"), CFSTR("PhotosUICore"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v12;
      PXStringWithValidatedFormat();
      v17 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
    v18 = v7 + v6;
    v19 = -[PXMomentShareStatusPresentation isPaused](v116, "isPaused", v97);
    v20 = objc_msgSend(v4, "aggregateMediaType");
    v21 = -1.0;
    v22 = v112;
    v102 = v4;
    v103 = v3;
    v99 = (void *)v17;
    if (v112 != 1)
    {
      if (!v112)
      {
        v23 = v114 > v106 && v114 <= v18;
        if (v114 <= v18 || presentationStyle > 3)
        {
          if (presentationStyle != 2 || !v23)
          {
            if (presentationStyle == 1)
              v48 = 19;
            else
              v48 = 0;
            PXLocalizedAssetCountForUsage(v114, v20, 0, v48);
            v49 = objc_claimAutoreleasedReturnValue();
            v32 = v114;
            v35 = (void *)v49;
            v34 = 0;
            v25 = 0;
            v26 = 0;
            v27 = 0;
            v28 = 0;
            v31 = 0;
            v33 = 0;
            goto LABEL_41;
          }
          PXLocalizedAssetCountForUsage(v114 - v106, v20, 0, 4);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v114;
          v35 = 0;
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v31 = 0;
          v33 = 0;
          v45 = (float)v106;
        }
        else
        {
          if (v19)
          {
            PXLocalizedAssetCountForUsage(v114 - v18, v20, 0, 3);
            v24 = objc_claimAutoreleasedReturnValue();
            -[PXMomentShareStatusPresentation pauseStatusDescription](v116, "pauseStatusDescription");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXMomentShareStatusPresentation pauseResolutionActionTitle](v116, "pauseResolutionActionTitle");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXMomentShareStatusPresentation pauseResolutionActionConfirmationAlertTitle](v116, "pauseResolutionActionConfirmationAlertTitle");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXMomentShareStatusPresentation pauseResolutionActionConfirmationAlertSubtitle](v116, "pauseResolutionActionConfirmationAlertSubtitle");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXMomentShareStatusPresentation pauseResolutionActionConfirmationAlertButtonTitle](v116, "pauseResolutionActionConfirmationAlertButtonTitle");
            v29 = objc_claimAutoreleasedReturnValue();
            -[PXMomentShareStatusPresentation pauseResolutionAction](v116, "pauseResolutionAction");
            v30 = objc_claimAutoreleasedReturnValue();
            v31 = (void *)v29;
            v32 = v114;
            v33 = (void *)v30;
            v34 = (void *)v24;
            v35 = 0;
LABEL_41:
            v40 = 0;
            v42 = 2;
            if (!v23)
              v42 = 0;
            if (v32 > v18)
              v42 = 1;
            v43 = v110;
            v22 = 0;
            goto LABEL_67;
          }
          PXLocalizedAssetCountForUsage(v114, v20, 0, 2);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v114;
          v35 = 0;
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v28 = 0;
          v31 = 0;
          v33 = 0;
          v45 = (float)v18;
        }
        v21 = v45 / (float)v32;
        goto LABEL_41;
      }
      v34 = 0;
      v35 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v31 = 0;
      v33 = 0;
      v42 = 0;
      v40 = 0;
      v43 = v110;
      v32 = v114;
LABEL_67:
      v107 = v40;
      v117[0] = MEMORY[0x1E0C809B0];
      v117[1] = 3221225472;
      v117[2] = __57__PXMomentShareStatusPresentation__updateCountsAndStatus__block_invoke;
      v117[3] = &unk_1E5142FA8;
      v118 = v100;
      v119 = v40;
      v120 = v104;
      v121 = v34;
      v122 = v35;
      v123 = v25;
      v124 = v26;
      v125 = v27;
      v126 = v28;
      v127 = v31;
      v128 = v99;
      v129 = v33;
      v135 = v21;
      v130 = v22;
      v131 = v42;
      v132 = v32;
      v133 = v43;
      v134 = v109;
      v67 = v34;
      v68 = v31;
      v69 = v33;
      v113 = v99;
      v111 = v69;
      v70 = v68;
      v71 = v28;
      v72 = v27;
      v115 = v26;
      v73 = v25;
      v74 = v35;
      v75 = v67;
      v76 = v104;
      v77 = v107;
      v78 = v100;
      -[PXMomentShareStatusPresentation performChanges:](v116, "performChanges:", v117);

      v4 = v102;
      v3 = v103;
      goto LABEL_68;
    }
    v36 = objc_msgSend(v4, "status");
    v32 = v9 + v8;
    v37 = v36 == 3 && v114 > v106;
    v38 = v37;
    if (v114 == v110)
    {
      v136 = v8;
      v137 = v9;
      v138 = 0;
      PXLocalizedStringForDetailedCounts(&v136, CFSTR("PXCMMFooterPhotosSavedAllTitle"), CFSTR("PXCMMFooterVideosSavedAllTitle"), CFSTR("PXCMMFooterItemsSavedAllTitle"));
      v39 = objc_claimAutoreleasedReturnValue();
      v32 = v9 + v8;
      v40 = (void *)v39;
      v41 = v109;
      if ((v38 & 1) == 0)
        goto LABEL_52;
    }
    else
    {
      v41 = v109;
      if (v109 <= 0)
      {
        v98 = v20;
        if (v110 < 1)
        {
          v40 = 0;
        }
        else
        {
          v136 = v8;
          v137 = v9;
          v138 = 0;
          PXLocalizedStringForDetailedCounts(&v136, CFSTR("PXCMMFooter_%ld_PhotosSavedTitleFormat"), CFSTR("PXCMMFooter_%ld_VideosSavedTitleFormat"), CFSTR("PXCMMFooter_%ld_ItemsSavedTitleFormat"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          PXLocalizedStringWithValidatedFormat(v50, CFSTR("%ld"));
          v51 = objc_claimAutoreleasedReturnValue();

          v40 = (void *)v51;
          v32 = v114;
        }
        v20 = v98;
        if ((v38 & 1) == 0)
        {
LABEL_52:
          if (v41 >= 1)
            goto LABEL_53;
          v43 = v110;
          if (v110 >= 1)
          {
            v34 = 0;
            v79 = v32 - v110;
            if (v32 == v110)
            {
              v42 = 6;
              v80 = presentationStyle;
              v35 = 0;
              v25 = 0;
              v26 = 0;
              v27 = 0;
              v28 = 0;
              v31 = 0;
              v33 = 0;
              v22 = 1;
              switch(v80)
              {
                case 0uLL:
                  Result = PXCMMMediaTypeForFetchResult(v105);
                  PXLocalizedAssetMessageForUsage(Result, 0, 0);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();

                  v22 = 1;
                  v32 = v114;
                  v34 = 0;
                  v25 = 0;
                  v26 = 0;
                  v27 = 0;
                  v28 = 0;
                  v31 = 0;
                  v33 = 0;
                  v42 = 6;
                  v104 = CFSTR(" ");
                  goto LABEL_67;
                case 1uLL:
                  v92 = PXCMMMediaTypeForFetchResult(v105);
                  PXLocalizedAssetMessageForUsage(v92, 1, 0);
                  v93 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_94;
                case 2uLL:
                  goto LABEL_67;
                case 3uLL:
                  PXLocalizedAssetCountForUsage(v110, v20, 0, 0);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v94 = PXCMMMediaTypeForFetchResult(v105);
                  PXLocalizedAssetMessageForUsage(v94, 0, 0);
                  v95 = objc_claimAutoreleasedReturnValue();

                  v22 = 1;
                  v32 = v114;
                  v34 = 0;
                  v25 = 0;
                  v26 = 0;
                  v27 = 0;
                  v28 = 0;
                  v31 = 0;
                  v33 = 0;
                  v42 = 6;
                  v104 = (__CFString *)v95;
                  goto LABEL_67;
                case 4uLL:
                  PXLocalizedAssetCountForUsage(v110, v20, 0, 0);
                  v93 = objc_claimAutoreleasedReturnValue();
LABEL_94:
                  v22 = 1;
                  v32 = v114;
                  v35 = (void *)v93;
                  v34 = 0;
                  v25 = 0;
                  v26 = 0;
                  v27 = 0;
                  v28 = 0;
                  v31 = 0;
                  v33 = 0;
                  v42 = 6;
                  break;
                default:
                  goto LABEL_95;
              }
            }
            else
            {
              v42 = 5;
              v87 = presentationStyle;
              v35 = 0;
              v25 = 0;
              v26 = 0;
              v27 = 0;
              v28 = 0;
              v31 = 0;
              v33 = 0;
              v22 = 1;
              switch(v87)
              {
                case 0uLL:
                case 3uLL:
                  v88 = PXCMMMediaTypeForFetchResult(v105);
                  v89 = v79;
                  v90 = 20;
                  goto LABEL_98;
                case 1uLL:
                  v88 = PXCMMMediaTypeForFetchResult(v105);
                  v89 = v110;
                  v90 = 18;
                  goto LABEL_98;
                case 2uLL:
                  goto LABEL_67;
                case 4uLL:
                  v89 = v32;
                  v88 = v20;
                  v90 = 0;
LABEL_98:
                  PXLocalizedAssetCountForUsage(v89, v88, 0, v90);
                  v96 = objc_claimAutoreleasedReturnValue();
                  v22 = 1;
                  v32 = v114;
                  v35 = (void *)v96;
                  v34 = 0;
                  v25 = 0;
                  v26 = 0;
                  v27 = 0;
                  v28 = 0;
                  v31 = 0;
                  v33 = 0;
                  v42 = 5;
                  break;
                default:
LABEL_95:
                  v35 = 0;
                  v25 = 0;
                  v26 = 0;
                  v27 = 0;
                  v28 = 0;
                  v31 = 0;
                  v33 = 0;
                  goto LABEL_66;
              }
            }
            goto LABEL_67;
          }
          if (presentationStyle - 3 >= 2 && presentationStyle)
          {
            if (presentationStyle == 2)
            {
              PXLocalizedAssetCountForUsage(v32, v20, 0, 4);
              v82 = v20;
              v83 = objc_claimAutoreleasedReturnValue();
              PXLocalizedStringFromTable(CFSTR("PXCMMWaitingForUploadSubtitle"), CFSTR("PhotosUICore"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              PXLocalizedAssetCountForUsage(v114, v82, 0, 0);
              v84 = objc_claimAutoreleasedReturnValue();
              v32 = v114;
              v35 = (void *)v84;
              v34 = (void *)v83;
LABEL_90:
              v26 = 0;
              v27 = 0;
              v28 = 0;
              v31 = 0;
              v33 = 0;
              v42 = 0;
              goto LABEL_66;
            }
            v34 = 0;
            v35 = 0;
          }
          else
          {
            PXLocalizedAssetCountForUsage(v32, v20, 0, 0);
            v91 = objc_claimAutoreleasedReturnValue();
            v32 = v114;
            v35 = (void *)v91;
            v34 = 0;
          }
          v25 = 0;
          goto LABEL_90;
        }
      }
      else
      {
        v46 = PXCMMMediaTypeForFetchResult(v108);
        PXLocalizedAssetCountForUsage(v109, v46, 0, 8);
        v47 = objc_claimAutoreleasedReturnValue();
        v32 = v9 + v8;
        v40 = (void *)v47;
        if (!v38)
        {
LABEL_53:
          v43 = v110;
          v57 = v110 + v41;
          v58 = PXCMMMediaTypeForFetchResult(v108);
          v59 = v110 + v41;
          if (v19)
          {
            PXLocalizedAssetCountForUsage(v59, v58, 0, 9);
            v60 = objc_claimAutoreleasedReturnValue();
            -[PXMomentShareStatusPresentation pauseStatusDescription](v116, "pauseStatusDescription");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXMomentShareStatusPresentation pauseResolutionActionTitle](v116, "pauseResolutionActionTitle");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXMomentShareStatusPresentation pauseResolutionActionConfirmationAlertTitle](v116, "pauseResolutionActionConfirmationAlertTitle");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXMomentShareStatusPresentation pauseResolutionActionConfirmationAlertSubtitle](v116, "pauseResolutionActionConfirmationAlertSubtitle");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXMomentShareStatusPresentation pauseResolutionActionConfirmationAlertButtonTitle](v116, "pauseResolutionActionConfirmationAlertButtonTitle");
            v61 = objc_claimAutoreleasedReturnValue();
            -[PXMomentShareStatusPresentation pauseResolutionAction](v116, "pauseResolutionAction");
            v62 = objc_claimAutoreleasedReturnValue();
            v31 = (void *)v61;
            v33 = (void *)v62;
            v34 = (void *)v60;
          }
          else
          {
            PXLocalizedAssetCountForUsage(v59, v58, 0, 8);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 0;
            v26 = 0;
            v27 = 0;
            v28 = 0;
            v31 = 0;
            v33 = 0;
            v21 = (float)v110 / (float)v57;
          }
          v35 = 0;
          v32 = v114;
          v42 = 3;
          if (v114 == v57)
            v42 = 4;
          goto LABEL_66;
        }
      }
    }
    v52 = v20;
    v53 = v32 - v106;
    if (v19)
    {
      PXLocalizedAssetCountForUsage(v32 - v106, v52, 0, 6);
      v54 = objc_claimAutoreleasedReturnValue();
      -[PXMomentShareStatusPresentation pauseStatusDescription](v116, "pauseStatusDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXMomentShareStatusPresentation pauseResolutionActionTitle](v116, "pauseResolutionActionTitle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXMomentShareStatusPresentation pauseResolutionActionConfirmationAlertTitle](v116, "pauseResolutionActionConfirmationAlertTitle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXMomentShareStatusPresentation pauseResolutionActionConfirmationAlertSubtitle](v116, "pauseResolutionActionConfirmationAlertSubtitle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXMomentShareStatusPresentation pauseResolutionActionConfirmationAlertButtonTitle](v116, "pauseResolutionActionConfirmationAlertButtonTitle");
      v55 = objc_claimAutoreleasedReturnValue();
      -[PXMomentShareStatusPresentation pauseResolutionAction](v116, "pauseResolutionAction");
      v56 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v55;
      v32 = v114;
      v33 = (void *)v56;
      v34 = (void *)v54;
      v35 = 0;
      v42 = 2;
      v43 = v110;
LABEL_66:
      v22 = 1;
      goto LABEL_67;
    }
    if (presentationStyle > 4)
    {
      v63 = 0;
    }
    else if (presentationStyle == 2)
    {
      v63 = 4;
      if (-[PXMomentShareStatusPresentation isReadyForUpdates](v116, "isReadyForUpdates"))
      {
        v37 = v114 > v18;
        v43 = v110;
        if (v37)
        {
          +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
          v85 = v40;
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v86, "disableDescriptiveWaiting"))
            v63 = 4;
          else
            v63 = 7;

          v40 = v85;
        }
        goto LABEL_59;
      }
    }
    else
    {
      v63 = 4;
    }
    v43 = v110;
LABEL_59:
    PXLocalizedAssetCountForUsage(v53, v52, 0, v63);
    v64 = objc_claimAutoreleasedReturnValue();
    +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "disableDescriptiveWaiting");

    v25 = 0;
    if ((v66 & 1) == 0 && !v106)
    {
      PXLocalizedStringFromTable(CFSTR("PXCMMWaitingForUploadSubtitle"), CFSTR("PhotosUICore"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v35 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v31 = 0;
    v33 = 0;
    v22 = 1;
    v32 = v114;
    v21 = (float)v106 / (float)v114;
    v42 = 2;
    v34 = (void *)v64;
    goto LABEL_67;
  }
LABEL_68:

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v8;
  id v9;

  v9 = a3;
  if ((void *)MomentShareStatusObservationContext == a5)
  {
    -[PXMomentShareStatusPresentation _updateCountsAndStatus](self, "_updateCountsAndStatus");
  }
  else
  {
    if ((void *)PXCPLUIStatusProviderObservationContext_271462 != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMomentShareStatusPresentation.m"), 637, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXMomentShareStatusPresentation _updateCPLStatus](self, "_updateCPLStatus");
  }

}

- (void)_updateCPLStatus
{
  void *v3;
  unsigned int IsPaused;
  BOOL v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  id v13;
  char v14;
  char v15;
  id v16;
  int v17;
  void *v18;
  BOOL v19;
  char v20;
  id v21;
  int v22;
  id v23;
  int v24;
  char v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  _BOOL8 v31;
  void *v32;
  char v33;
  void *v34;
  uint64_t v35;
  id v36;
  unsigned int v37;
  void *v38;
  _QWORD aBlock[4];
  id v40;

  -[PXCPLUIStatusProvider status](self->_statusProvider, "status");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsPaused = _IsPaused(v3);
  v5 = -[PXMomentShareStatusPresentation isPaused](self, "isPaused");
  v37 = IsPaused;
  if (IsPaused)
  {
    objc_msgSend(v3, "failureDescription");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "actionTitle");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "actionConfirmationAlertTitle");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "actionConfirmationAlertSubtitle");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "actionConfirmationAlertButtonTitle");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__PXMomentShareStatusPresentation__updateCPLStatus__block_invoke;
    aBlock[3] = &unk_1E5149198;
    v10 = v3;
    v40 = v10;
    v38 = _Block_copy(aBlock);

    v35 = objc_msgSend(v10, "serviceAction");
  }
  else
  {
    v38 = 0;
    v9 = 0;
    v7 = 0;
    v6 = 0;
    v8 = 0;
    v35 = 0;
    v36 = 0;
  }
  -[PXMomentShareStatusPresentation pauseStatusDescription](self, "pauseStatusDescription");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v11)
  {

  }
  else
  {
    v12 = objc_msgSend(v6, "isEqualToString:", v11);

    if (!v12)
      goto LABEL_11;
  }
  -[PXMomentShareStatusPresentation pauseResolutionActionTitle](self, "pauseResolutionActionTitle");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v13)
  {

  }
  else
  {
    v14 = objc_msgSend(v7, "isEqualToString:", v13);

    if ((v14 & 1) == 0)
    {

LABEL_11:
      goto LABEL_29;
    }
  }
  v15 = v37 ^ v5;
  -[PXMomentShareStatusPresentation pauseResolutionActionConfirmationAlertTitle](self, "pauseResolutionActionConfirmationAlertTitle");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v34 = v9;
  v33 = v15;
  if (v8 == v16)
  {

  }
  else
  {
    v17 = objc_msgSend(v8, "isEqualToString:", v16);

    if (!v17)
    {
      v18 = v8;
      v19 = 1;
      v20 = v33;
      goto LABEL_28;
    }
  }
  -[PXMomentShareStatusPresentation pauseResolutionActionConfirmationAlertSubtitle](self, "pauseResolutionActionConfirmationAlertSubtitle", v7);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v21)
  {

LABEL_21:
    -[PXMomentShareStatusPresentation pauseResolutionActionConfirmationAlertButtonTitle](self, "pauseResolutionActionConfirmationAlertButtonTitle");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v8;
    if (v36 == v23)
    {

    }
    else
    {
      v24 = objc_msgSend(v36, "isEqualToString:", v23);

      if (!v24)
      {
        v19 = 1;
LABEL_26:

        goto LABEL_27;
      }
    }
    v19 = v35 != -[PXMomentShareStatusPresentation pauseResolutionActionType](self, "pauseResolutionActionType");
    goto LABEL_26;
  }
  v22 = objc_msgSend(v9, "isEqualToString:", v21);

  if (v22)
    goto LABEL_21;
  v18 = v8;
  v19 = 1;
LABEL_27:
  v20 = v33;

  v7 = v32;
LABEL_28:

  v25 = v19 | v20;
  v8 = v18;
  v9 = v34;
  if ((v25 & 1) == 0)
  {
    v26 = v8;
    v28 = 0;
    v27 = v36;
    goto LABEL_31;
  }
LABEL_29:
  -[PXMomentShareStatusPresentation setIsPaused:](self, "setIsPaused:", v37);
  -[PXMomentShareStatusPresentation setPauseStatusDescription:](self, "setPauseStatusDescription:", v6);
  -[PXMomentShareStatusPresentation setPauseResolutionActionTitle:](self, "setPauseResolutionActionTitle:", v7);
  v26 = v8;
  -[PXMomentShareStatusPresentation setPauseResolutionActionConfirmationAlertTitle:](self, "setPauseResolutionActionConfirmationAlertTitle:", v8);
  -[PXMomentShareStatusPresentation setPauseResolutionActionConfirmationAlertSubtitle:](self, "setPauseResolutionActionConfirmationAlertSubtitle:", v9);
  v27 = v36;
  -[PXMomentShareStatusPresentation setPauseResolutionActionConfirmationAlertButtonTitle:](self, "setPauseResolutionActionConfirmationAlertButtonTitle:", v36);
  -[PXMomentShareStatusPresentation setPauseResolutionAction:](self, "setPauseResolutionAction:", v38);
  -[PXMomentShareStatusPresentation setPauseResolutionActionType:](self, "setPauseResolutionActionType:", v35);
  v28 = 1;
LABEL_31:
  v29 = v3;
  v30 = v29;
  if (!v29)
    goto LABEL_36;
  if ((_IsPaused(v29) & 1) != 0)
  {
    v31 = 0;
    goto LABEL_37;
  }
  if (objc_msgSend(v30, "state"))
    v31 = objc_msgSend(v30, "activity") != 2;
  else
LABEL_36:
    v31 = 1;
LABEL_37:

  if (v31 != -[PXMomentShareStatusPresentation isReadyForUpdates](self, "isReadyForUpdates"))
  {
    -[PXMomentShareStatusPresentation setIsReadyForUpdates:](self, "setIsReadyForUpdates:", v31);
LABEL_40:
    -[PXMomentShareStatusPresentation _updateCountsAndStatus](self, "_updateCountsAndStatus");
    goto LABEL_41;
  }
  if (v28)
    goto LABEL_40;
LABEL_41:

}

- (int64_t)type
{
  return self->_type;
}

- (NSString)assetsTitle
{
  return self->_assetsTitle;
}

- (NSString)assetsSaveStatusTitle
{
  return self->_assetsSaveStatusTitle;
}

- (NSString)expirationTitle
{
  return self->_expirationTitle;
}

- (NSString)activityTitle
{
  return self->_activityTitle;
}

- (NSString)idleTitle
{
  return self->_idleTitle;
}

- (NSString)pauseTitle
{
  return self->_pauseTitle;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (NSString)actionConfirmationAlertTitle
{
  return self->_actionConfirmationAlertTitle;
}

- (NSString)actionConfirmationAlertSubtitle
{
  return self->_actionConfirmationAlertSubtitle;
}

- (NSString)actionConfirmationAlertButtonTitle
{
  return self->_actionConfirmationAlertButtonTitle;
}

- (id)action
{
  return self->_action;
}

- (NSString)byline
{
  return self->_byline;
}

- (float)activityProgress
{
  return self->_activityProgress;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (PXMomentShareStatus)momentShareStatus
{
  return self->_momentShareStatus;
}

- (int64_t)numberOfAssetsNotCopied
{
  return self->_numberOfAssetsNotCopied;
}

- (int64_t)numberOfAssetsCopied
{
  return self->_numberOfAssetsCopied;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (void)setIsPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (NSString)pauseStatusDescription
{
  return self->_pauseStatusDescription;
}

- (void)setPauseStatusDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSString)pauseResolutionActionTitle
{
  return self->_pauseResolutionActionTitle;
}

- (void)setPauseResolutionActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSString)pauseResolutionActionConfirmationAlertTitle
{
  return self->_pauseResolutionActionConfirmationAlertTitle;
}

- (void)setPauseResolutionActionConfirmationAlertTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)pauseResolutionActionConfirmationAlertSubtitle
{
  return self->_pauseResolutionActionConfirmationAlertSubtitle;
}

- (void)setPauseResolutionActionConfirmationAlertSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)pauseResolutionActionConfirmationAlertButtonTitle
{
  return self->_pauseResolutionActionConfirmationAlertButtonTitle;
}

- (void)setPauseResolutionActionConfirmationAlertButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (id)pauseResolutionAction
{
  return self->_pauseResolutionAction;
}

- (void)setPauseResolutionAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (int64_t)pauseResolutionActionType
{
  return self->_pauseResolutionActionType;
}

- (void)setPauseResolutionActionType:(int64_t)a3
{
  self->_pauseResolutionActionType = a3;
}

- (BOOL)isReadyForUpdates
{
  return self->_isReadyForUpdates;
}

- (void)setIsReadyForUpdates:(BOOL)a3
{
  self->_isReadyForUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pauseResolutionAction, 0);
  objc_storeStrong((id *)&self->_pauseResolutionActionConfirmationAlertButtonTitle, 0);
  objc_storeStrong((id *)&self->_pauseResolutionActionConfirmationAlertSubtitle, 0);
  objc_storeStrong((id *)&self->_pauseResolutionActionConfirmationAlertTitle, 0);
  objc_storeStrong((id *)&self->_pauseResolutionActionTitle, 0);
  objc_storeStrong((id *)&self->_pauseStatusDescription, 0);
  objc_storeStrong((id *)&self->_momentShareStatus, 0);
  objc_storeStrong((id *)&self->_byline, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertButtonTitle, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertSubtitle, 0);
  objc_storeStrong((id *)&self->_actionConfirmationAlertTitle, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_pauseTitle, 0);
  objc_storeStrong((id *)&self->_idleTitle, 0);
  objc_storeStrong((id *)&self->_activityTitle, 0);
  objc_storeStrong((id *)&self->_expirationTitle, 0);
  objc_storeStrong((id *)&self->_assetsSaveStatusTitle, 0);
  objc_storeStrong((id *)&self->_assetsTitle, 0);
  objc_storeStrong((id *)&self->_statusProvider, 0);
}

void __51__PXMomentShareStatusPresentation__updateCPLStatus__block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "action");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2](v2, *(_QWORD *)(a1 + 32));
    v2 = (void (**)(_QWORD, _QWORD))v3;
  }

}

void __57__PXMomentShareStatusPresentation__updateCountsAndStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 128);
  v5 = a2;
  objc_msgSend(v5, "setType:", v3);
  objc_msgSend(v5, "setAssetsTitle:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setAssetsSaveStatusTitle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setExpirationTitle:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "setActivityTitle:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v5, "setIdleTitle:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v5, "setPauseTitle:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v5, "setActionTitle:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v5, "setActionConfirmationAlertTitle:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v5, "setActionConfirmationAlertSubtitle:", *(_QWORD *)(a1 + 96));
  objc_msgSend(v5, "setActionConfirmationAlertButtonTitle:", *(_QWORD *)(a1 + 104));
  objc_msgSend(v5, "setAction:", *(_QWORD *)(a1 + 120));
  objc_msgSend(v5, "setByline:", *(_QWORD *)(a1 + 112));
  LODWORD(v4) = *(_DWORD *)(a1 + 168);
  objc_msgSend(v5, "setActivityProgress:", v4);
  objc_msgSend(v5, "setState:", *(_QWORD *)(a1 + 136));
  objc_msgSend(v5, "setNumberOfAssetsNotCopied:", *(_QWORD *)(a1 + 144) - (*(_QWORD *)(a1 + 152) + *(_QWORD *)(a1 + 160)));
  objc_msgSend(v5, "setNumberOfAssetsCopied:", *(_QWORD *)(a1 + 152));

}

+ (PXMomentShareStatusPresentation)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXMomentShareStatusPresentation.m"), 127, CFSTR("%s is not available as initializer"), "+[PXMomentShareStatusPresentation new]");

  abort();
}

@end
