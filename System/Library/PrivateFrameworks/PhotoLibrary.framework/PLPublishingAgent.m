@implementation PLPublishingAgent

- (BOOL)allowsCellularAccessForRequests
{
  return -[PLPublishingAgent selectedOption](self, "selectedOption") != 1
      || -[PLPublishingAgent allowsHDOver3GUpload](self, "allowsHDOver3GUpload");
}

- (void)_networkReachabilityDidChange:(id)a3
{
  void *v5;
  int v6;
  void *v7;

  v5 = (void *)objc_msgSend(a3, "userInfo");
  v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D71FF0]), "BOOLValue");
  v7 = (void *)objc_msgSend(a3, "userInfo");
  -[PLPublishingAgent setEnableHDUpload:](self, "setEnableHDUpload:", -[PLPublishingAgent allowsHDOver3GUpload](self, "allowsHDOver3GUpload") | objc_msgSend((id)objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D71FE8]), "BOOLValue") & v6);
}

- (void)_startNetworkObservation
{
  void **v3;
  void *v4;
  void *v5;

  v3 = (void **)MEMORY[0x1E0CEB258];
  NSClassFromString(CFSTR("PLPhotosApplication"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = *v3;
  else
    v4 = 0;
  objc_msgSend(v4, "enableNetworkObservation");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__networkReachabilityDidChange_, *MEMORY[0x1E0D71FE0], 0);
}

- (void)_stopNetworkObservation
{
  void **v3;
  void *v4;
  void *v5;

  v3 = (void **)MEMORY[0x1E0CEB258];
  NSClassFromString(CFSTR("PLPhotosApplication"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = *v3;
  else
    v4 = 0;
  objc_msgSend(v4, "disableNetworkObservation");
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0D71FE0], 0);
}

- (PLPublishingAgent)initWithMedia:(id)a3
{
  PLPublishingAgent *v4;
  PLPublishingAgent *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLPublishingAgent;
  v4 = -[PLPublishingAgent init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    -[PLPublishingAgent setUserInfo:](v4, "setUserInfo:", a3);
    -[PLPublishingAgent _startNetworkObservation](v5, "_startNetworkObservation");
    -[PLPublishingAgent _setUpPublishingParams](v5, "_setUpPublishingParams");
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__cancelRemaking_, *MEMORY[0x1E0D71CE8], 0);
    v5->_progressMultiplier = 1.0;
    v5->_remakerMode = 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  -[PLPublishingAgent setDelegate:](self, "setDelegate:", 0);

  -[PLVideoRemaker setDelegate:](self->_remaker, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PLPublishingAgent;
  -[PLPublishingAgent dealloc](&v3, sel_dealloc);
}

- (void)_setUpPublishingParams
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v7;
  void **v8;
  void *v9;

  v3 = -[PLPublishingAgent userInfo](self, "userInfo");
  if (objc_msgSend(v3, "isVideo"))
  {
    v4 = objc_msgSend(v3, "pathForVideoFile");
    v5 = objc_msgSend(v3, "isHDVideo");
    -[PLPublishingAgent setMediaPath:](self, "setMediaPath:", v4);
    -[PLPublishingAgent setDeleteMediaFileAfterPublishing:](self, "setDeleteMediaFileAfterPublishing:", 0);
    -[PLPublishingAgent setMediaIsHDVideo:](self, "setMediaIsHDVideo:", v5);
    if ((_DWORD)v5)
    {
      v6 = +[PLPublishingAgent canUploadHDVideoOverCellular](PLPublishingAgent, "canUploadHDVideoOverCellular");
      if (v6)
      {
        v7 = 1;
      }
      else
      {
        v8 = (void **)MEMORY[0x1E0CEB258];
        NSClassFromString(CFSTR("PLPhotosApplication"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v9 = *v8;
        else
          v9 = 0;
        v7 = objc_msgSend(v9, "isOnWifi");
      }
      -[PLPublishingAgent setEnableHDUpload:](self, "setEnableHDUpload:", v7);
      -[PLPublishingAgent setAllowsHDOver3GUpload:](self, "setAllowsHDOver3GUpload:", v6);
    }
  }
}

- (id)mediaPath
{
  return self->_mediaPath;
}

- (void)setMediaPath:(id)a3
{
  NSString *mediaPath;

  mediaPath = self->_mediaPath;
  if (mediaPath != a3)
  {

    self->_mediaPath = (NSString *)a3;
  }
}

- (void)setDeleteMediaFileAfterPublishing:(BOOL)a3
{
  self->_deleteAfterPublishing = a3;
}

- (BOOL)deleteMediaFileAfterPublishing
{
  return self->_deleteAfterPublishing;
}

- (id)mediaData
{
  return self->_mediaData;
}

- (void)setMediaData:(id)a3
{
  NSData *mediaData;

  mediaData = self->_mediaData;
  if (mediaData != a3)
  {

    self->_mediaData = (NSData *)a3;
  }
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  id userInfo;

  userInfo = self->_userInfo;
  if (userInfo != a3)
  {

    self->_userInfo = a3;
  }
}

- (BOOL)isPublishing
{
  return (*((unsigned __int8 *)self + 208) >> 2) & 1;
}

- (void)setPublishing:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 208) = *((_BYTE *)self + 208) & 0xFB | v3;
}

- (void)setRemakerMode:(int)a3
{
  if (!self->_remakerMode)
  {
    self->_remakerMode = a3;
    -[PLPublishingAgent _setApproximateVideoUploadSizes](self, "_setApproximateVideoUploadSizes");
  }
  self->_remakerMode = a3;
}

- (void)setTrimStartTime:(double)a3 andEndTime:(double)a4
{
  self->_startTime = a3;
  self->_endTime = a4;
}

- (void)_setApproximateVideoUploadSizes
{
  double v3;
  double v4;

  if (self->_needsTrimming)
  {
    v3 = self->_endTime - self->_startTime;
  }
  else
  {
    objc_msgSend(-[PLPublishingAgent userInfo](self, "userInfo"), "duration");
    v3 = v4;
  }
  -[PLPublishingAgent setApproximateSDUploadSize:](self, "setApproximateSDUploadSize:", +[PLVideoRemaker approximateByteSizeForMode:duration:](PLVideoRemaker, "approximateByteSizeForMode:duration:", +[PLVideoRemaker getSDRemakerModeForMode:](PLVideoRemaker, "getSDRemakerModeForMode:", self->_remakerMode), v3));
  -[PLPublishingAgent setApproximateHDUploadSize:](self, "setApproximateHDUploadSize:", +[PLVideoRemaker approximateByteSizeForMode:duration:](PLVideoRemaker, "approximateByteSizeForMode:duration:", +[PLVideoRemaker getHDRemakerModeForMode:](PLVideoRemaker, "getHDRemakerModeForMode:", self->_remakerMode), v3));
}

- (id)navigationController
{
  return 0;
}

- (void)cancelButtonClicked
{
  PLPublishingAgent *v3;

  v3 = self;
  objc_msgSend(self->_delegate, "publishingAgentCancelButtonClicked:", self);
}

- (void)doneButtonClicked
{
  double v3;
  double v4;
  char *v5;
  id v6;
  float v7;

  objc_msgSend(self->_delegate, "publishingAgentDoneButtonClicked:", self);
  self->_remakerMode = -[PLPublishingAgent _remakerModeForSelectedOption](self, "_remakerModeForSelectedOption");
  objc_msgSend(MEMORY[0x1E0CEAB98], "defaultDurationForTransition:", 3);
  v4 = v3;
  if (-[PLPublishingAgent isVideoMedia](self, "isVideoMedia"))
  {
    self->_completionSelector = sel__agentIsReadyToPublish_;
    v5 = sel__transcodeVideo_;
    v6 = -[PLPublishingAgent userInfo](self, "userInfo");
  }
  else
  {
    v6 = 0;
    v5 = sel_publish;
  }
  v7 = v4;
  -[PLPublishingAgent performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", v5, v6, v7);
}

- (void)_agentIsReadyToPublish:(id)a3
{
  if (a3)
  {
    -[PLPublishingAgent setMediaPath:](self, "setMediaPath:");
    -[PLPublishingAgent setDeleteMediaFileAfterPublishing:](self, "setDeleteMediaFileAfterPublishing:", 1);
  }
  -[PLPublishingAgent publish](self, "publish");
}

- (void)publish
{
  objc_msgSend(self->_delegate, "publishingAgentDidBeginPublishing:", self);
}

- (id)serviceName
{
  return CFSTR("<override -[PLPublishingAgent serviceName]");
}

- (void)presentModalSheetInViewController:(id)a3
{
  id v5;
  void *v6;

  v5 = -[PLPublishingAgent navigationController](self, "navigationController");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(self->_delegate, "publishingAgentWillBeDisplayed:", self);
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
      objc_msgSend(v6, "setModalPresentationStyle:", 2);
    objc_msgSend(a3, "presentViewController:animated:completion:", v6, 1, 0);
  }
}

- (void)dismiss
{
  -[PLPublishingAgent _stopNetworkObservation](self, "_stopNetworkObservation");
  objc_msgSend((id)objc_msgSend(-[PLPublishingAgent navigationController](self, "navigationController"), "presentingViewController"), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)mediaURL
{
  return CFSTR("SUBCLASS OVERRIDE");
}

- (id)mediaTitle
{
  return CFSTR("SUBCLASS OVERRIDE");
}

- (BOOL)isVideoMedia
{
  return objc_msgSend(-[PLPublishingAgent userInfo](self, "userInfo"), "isVideo");
}

- (id)tellAFriendURL
{
  return CFSTR("SUBCLASS OVERRIDE");
}

- (id)tellAFriendSubject
{
  id v2;

  v2 = -[PLPublishingAgent mediaTitle](self, "mediaTitle");
  if (objc_msgSend(v2, "length"))
    return v2;
  else
    return &stru_1E70B6A68;
}

- (id)tellAFriendBody
{
  return 0;
}

- (BOOL)allowsTellingFriend
{
  return 1;
}

- (BOOL)allowsViewingOnHost
{
  return 1;
}

- (double)maximumVideoDuration
{
  return 600.0;
}

- (void)dataArrayInputStreamBytesWereRead:(id)a3
{
  self->_currentValue = objc_msgSend(a3, "bytesRead");
  self->_maxValue = objc_msgSend(a3, "totalBytes");
}

- (void)setTotalBytesWritten:(int64_t)a3 totalBytes:(int64_t)a4
{
  self->_currentValue = a3;
  self->_maxValue = a4;
}

- (void)snapshot
{
  int64_t maxValue;
  float v4;
  NSMutableArray *snapshotTimes;
  void *v6;
  void *v7;

  maxValue = self->_maxValue;
  if (maxValue)
  {
    v4 = (double)self->_currentValue / (double)maxValue;
    self->_percentComplete = v4;
  }
  snapshotTimes = self->_snapshotTimes;
  if (!snapshotTimes)
  {
    self->_snapshotTimes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_snapshotValues = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    snapshotTimes = self->_snapshotTimes;
  }
  if ((unint64_t)-[NSMutableArray count](snapshotTimes, "count") >= 0x14)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_snapshotTimes, "removeObjectAtIndex:", 0);
    -[NSMutableArray removeObjectAtIndex:](self->_snapshotValues, "removeObjectAtIndex:", 0);
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", CFAbsoluteTimeGetCurrent());
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", self->_currentValue);
  -[NSMutableArray addObject:](self->_snapshotTimes, "addObject:", v6);
  -[NSMutableArray addObject:](self->_snapshotValues, "addObject:", v7);

  -[PLPublishingAgent _updateStatisticsFromSnapshots](self, "_updateStatisticsFromSnapshots");
}

- (void)_updateStatisticsFromSnapshots
{
  unint64_t v3;
  double v4;
  unint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  int64_t v14;

  v3 = -[NSMutableArray count](self->_snapshotTimes, "count");
  v4 = -1.0;
  if (v3 < 3)
  {
    v13 = -1.0;
  }
  else
  {
    v5 = v3;
    v6 = 0.0;
    for (i = 1; i != v5; ++i)
    {
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_snapshotTimes, "objectAtIndex:", i), "doubleValue");
      v9 = v8;
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_snapshotTimes, "objectAtIndex:", i - 1), "doubleValue");
      v11 = v9 - v10;
      v12 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_snapshotValues, "objectAtIndex:", i), "longLongValue");
      v6 = v6
         + (double)(v12
                  - objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_snapshotValues, "objectAtIndex:", i - 1), "longLongValue"))/ v11;
    }
    v13 = v6 / (double)v5;
    if (v13 > 0.00000011920929)
    {
      v14 = self->_maxValue - self->_currentValue;
      if ((v14 & 0x8000000000000000) == 0)
        v4 = (double)v14 / v13;
    }
  }
  self->_changeRate = v13;
  self->_estimatedTimeRemaining = v4;
}

- (double)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (float)percentComplete
{
  return (float)(self->_percentComplete + self->_remakingPercentComplete) * self->_progressMultiplier;
}

- (float)remakingPercentComplete
{
  return self->_remakingPercentComplete * self->_progressMultiplier;
}

- (void)cancelRemaking
{
  -[PLPublishingAgent _cancelRemaking:](self, "_cancelRemaking:", 0);
}

- (BOOL)isRemaking
{
  return (*((unsigned __int8 *)self + 208) >> 1) & 1;
}

- (void)_cancelRemaking:(id)a3
{
  PLVideoRemaker *remaker;

  remaker = self->_remaker;
  if (remaker)
  {
    self->_completionSelector = 0;
    *((_BYTE *)self + 208) = *((_BYTE *)self + 208) & 0xFC | 1;
    self->_progressMultiplier = 1.0;
    -[PLVideoRemaker cancel](remaker, "cancel", a3);
  }
}

- (void)_transcodeVideo:(id)a3
{
  PLVideoRemaker *v5;

  -[PLVideoRemaker setDelegate:](self->_remaker, "setDelegate:", 0);

  v5 = -[PLVideoRemaker initWithPublishingMedia:]([PLVideoRemaker alloc], "initWithPublishingMedia:", a3);
  self->_remaker = v5;
  -[PLVideoRemaker setDelegate:](v5, "setDelegate:", self);
  -[PLVideoRemaker setMode:](self->_remaker, "setMode:", self->_remakerMode);
  if (self->_needsTrimming)
  {
    -[PLVideoRemaker setTrimStartTime:](self->_remaker, "setTrimStartTime:", self->_startTime);
    -[PLVideoRemaker setTrimEndTime:](self->_remaker, "setTrimEndTime:", self->_endTime);
  }
  -[PLVideoRemaker remake](self->_remaker, "remake");
}

- (void)videoRemakerDidBeginRemaking:(id)a3
{
  PLPublishingAgent *v4;

  v4 = self;
  *((_BYTE *)self + 208) |= 2u;
  self->_progressMultiplier = 0.5;
  if (self->_delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->_delegate, "publishingAgentDidStartRemaking:", self);
  }
}

- (void)_remakerDidFinish:(id)a3
{
  SEL completionSelector;
  void *v6;

  if ((*((_BYTE *)self + 208) & 1) == 0)
  {
    if (objc_msgSend(a3, "length"))
    {
      completionSelector = self->_completionSelector;
      if (completionSelector)
        -[PLPublishingAgent performSelector:withObject:](self, "performSelector:withObject:", completionSelector, a3);
    }
    else
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", PLLocalizedFrameworkString(), 0, 1);
      objc_msgSend(v6, "addAction:", objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", PLLocalizedFrameworkString(), 0, 0));
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "pl_firstKeyWindow"), "pl_presentViewController:animated:", v6, 1);
    }
  }
  *((_BYTE *)self + 208) &= ~1u;
  -[PLVideoRemaker setDelegate:](self->_remaker, "setDelegate:", 0);

  self->_remaker = 0;
}

- (void)videoRemakerDidEndRemaking:(id)a3 temporaryPath:(id)a4
{
  PLPublishingAgent *v6;

  v6 = self;
  *((_BYTE *)self + 208) &= ~2u;
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_delegate, "publishingAgentDidEndRemaking:didSucceed:", self, a4 != 0);
  -[PLPublishingAgent performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__remakerDidFinish_, a4, 0.01);
}

- (void)videoRemaker:(id)a3 progressDidChange:(float)a4
{
  self->_remakingPercentComplete = a4;
}

- (id)progressViewMessageDuringRemake
{
  return -[PLVideoRemaker messageForRemakingProgress](self->_remaker, "messageForRemakingProgress");
}

- (int)_remakerModeForSelectedOption
{
  int selectedOption;

  selectedOption = self->_selectedOption;
  if (selectedOption == 1)
    return +[PLVideoRemaker getHDRemakerModeForMode:](PLVideoRemaker, "getHDRemakerModeForMode:", self->_remakerMode);
  if (selectedOption)
    return -1;
  return self->_remakerMode;
}

- (void)showAlertWithError:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  _QWORD v21[5];

  v5 = -[PLPublishingAgent mediaTitle](self, "mediaTitle");
  v6 = v5;
  if (a3)
  {
    if (v5)
    {
      PLLocalizedFrameworkString();
      v18 = v6;
      v7 = PFStringWithValidatedFormat();
    }
    else
    {
      -[PLPublishingAgent isVideoMedia](self, "isVideoMedia");
      v7 = PLLocalizedFrameworkString();
    }
    v9 = (void *)objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v7, 0, 1, v18);
    v10 = (void *)MEMORY[0x1E0CEA2E0];
    v11 = PLLocalizedFrameworkString();
    v12 = v10;
    v13 = 1;
    v14 = 0;
    goto LABEL_13;
  }
  if (v5)
  {
    PLLocalizedFrameworkString();
    v8 = PFStringWithValidatedFormat();
  }
  else
  {
    -[PLPublishingAgent isVideoMedia](self, "isVideoMedia");
    v8 = PLLocalizedFrameworkString();
  }
  v15 = v8;
  PLLocalizedFrameworkString();
  v19 = -[PLPublishingAgent serviceName](self, "serviceName");
  v16 = PFStringWithValidatedFormat();
  v9 = (void *)objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v15, 0, 1, v19);
  objc_msgSend(v9, "addAction:", objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", PLLocalizedFrameworkString(), 1, 0));
  if (-[PLPublishingAgent allowsViewingOnHost](self, "allowsViewingOnHost"))
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __40__PLPublishingAgent_showAlertWithError___block_invoke;
    v21[3] = &unk_1E70B5F50;
    v21[4] = self;
    objc_msgSend(v9, "addAction:", objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v16, 0, v21));
  }
  if (-[PLPublishingAgent allowsTellingFriend](self, "allowsTellingFriend"))
  {
    v17 = (void *)MEMORY[0x1E0CEA2E0];
    v11 = PLLocalizedFrameworkString();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __40__PLPublishingAgent_showAlertWithError___block_invoke_2;
    v20[3] = &unk_1E70B5F50;
    v20[4] = self;
    v14 = v20;
    v12 = v17;
    v13 = 0;
LABEL_13:
    objc_msgSend(v9, "addAction:", objc_msgSend(v12, "actionWithTitle:style:handler:", v11, v13, v14));
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "pl_firstKeyWindow"), "pl_presentViewController:animated:", v9, 1);
}

- (PLPublishingAgentDelegate)delegate
{
  return (PLPublishingAgentDelegate *)self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (BOOL)ownerIsCamera
{
  return self->_ownerIsCamera;
}

- (void)setOwnerIsCamera:(BOOL)a3
{
  self->_ownerIsCamera = a3;
}

- (int64_t)approximateHDUploadSize
{
  return self->_approximateHDUploadSize;
}

- (void)setApproximateHDUploadSize:(int64_t)a3
{
  self->_approximateHDUploadSize = a3;
}

- (int64_t)approximateSDUploadSize
{
  return self->_approximateSDUploadSize;
}

- (void)setApproximateSDUploadSize:(int64_t)a3
{
  self->_approximateSDUploadSize = a3;
}

- (BOOL)mediaIsHDVideo
{
  return self->_mediaIsHDVideo;
}

- (void)setMediaIsHDVideo:(BOOL)a3
{
  self->_mediaIsHDVideo = a3;
}

- (BOOL)enableHDUpload
{
  return self->_enableHDUpload;
}

- (void)setEnableHDUpload:(BOOL)a3
{
  self->_enableHDUpload = a3;
}

- (BOOL)needsTrimming
{
  return self->_needsTrimming;
}

- (void)setNeedsTrimming:(BOOL)a3
{
  self->_needsTrimming = a3;
}

- (int)remakerMode
{
  return self->_remakerMode;
}

- (int)selectedOption
{
  return self->_selectedOption;
}

- (void)setSelectedOption:(int)a3
{
  self->_selectedOption = a3;
}

- (float)progressMultiplier
{
  return self->_progressMultiplier;
}

- (void)setProgressMultiplier:(float)a3
{
  self->_progressMultiplier = a3;
}

- (BOOL)allowsHDOver3GUpload
{
  return self->_allowsHDOver3GUpload;
}

- (void)setAllowsHDOver3GUpload:(BOOL)a3
{
  self->_allowsHDOver3GUpload = a3;
}

- (BOOL)shouldCancelPublish
{
  return self->_shouldCancelPublish;
}

- (void)setShouldCancelPublish:(BOOL)a3
{
  self->_shouldCancelPublish = a3;
}

uint64_t __40__PLPublishingAgent_showAlertWithError___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "mediaURL");
  v2 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v1);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace"), "openSensitiveURL:withOptions:", v2, 0);
}

uint64_t __40__PLPublishingAgent_showAlertWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "tellAFriendBody");
  if (!v2)
    v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "tellAFriendURL");
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "tellAFriendSubject");
  v5 = objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E0CB3500], "URLFragmentAllowedCharacterSet"));
  v6 = objc_msgSend(v3, "stringWithFormat:", CFSTR("mailto:?subject=%@&body=%@"), v5, objc_msgSend(v2, "stringByAddingPercentEncodingWithAllowedCharacters:", objc_msgSend(MEMORY[0x1E0CB3500], "URLFragmentAllowedCharacterSet")));
  v7 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace"), "openSensitiveURL:withOptions:", v7, 0);
}

+ (id)publishingAgentForBundleNamed:(id)a3 toPublishMedia:(id)a4
{
  uint64_t v5;
  void *v6;

  v5 = objc_msgSend(CFSTR("/System/Library/PublishingBundles/"), "stringByAppendingPathComponent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.bundle"), a3));
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v5), "principalClass")), "initWithMedia:", a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v6;

  return 0;
}

+ (BOOL)canUploadHDVideoOverCellular
{
  void *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  BOOL result;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__2386;
  v13 = __Block_byref_object_dispose__2387;
  v2 = (void *)getMCProfileConnectionClass_softClass;
  v14 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getMCProfileConnectionClass_block_invoke;
    v8[3] = &unk_1E70B61D8;
    v8[4] = &v9;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v8);
    v2 = (void *)v10[5];
  }
  _Block_object_dispose(&v9, 8);
  v3 = (void *)objc_msgSend(v2, "sharedConnection");
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v4 = (_QWORD *)getMCFeatureCellularHDUploadsAllowedSymbolLoc_ptr;
  v12 = (void (*)(uint64_t, uint64_t))getMCFeatureCellularHDUploadsAllowedSymbolLoc_ptr;
  if (!getMCFeatureCellularHDUploadsAllowedSymbolLoc_ptr)
  {
    v5 = ManagedConfigurationLibrary();
    v4 = dlsym(v5, "MCFeatureCellularHDUploadsAllowed");
    v10[3] = (uint64_t)v4;
    getMCFeatureCellularHDUploadsAllowedSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v9, 8);
  if (v4)
    return objc_msgSend(v3, "effectiveBoolValueForSetting:", *v4) == 1;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  result = objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMCFeatureCellularHDUploadsAllowed(void)"), CFSTR("PLPublishingAgent.m"), 41, CFSTR("%s"), dlerror());
  __break(1u);
  return result;
}

@end
