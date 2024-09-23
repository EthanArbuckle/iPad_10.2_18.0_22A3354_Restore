@implementation PXVideoPlaybackReporterAVPlayerItemEndpoint

- (PXVideoPlaybackReporterAVPlayerItemEndpoint)initWithPlayerItem:(id)a3
{
  id v5;
  PXVideoPlaybackReporterAVPlayerItemEndpoint *v6;
  PXVideoPlaybackReporterAVPlayerItemEndpoint *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXVideoPlaybackReporterAVPlayerItemEndpoint;
  v6 = -[PXVideoPlaybackReporterAVPlayerItemEndpoint init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_playerItem, a3);

  return v7;
}

- (PXVideoPlaybackReporterAVPlayerItemEndpoint)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoPlaybackReporter+AVFoundation.m"), 117, CFSTR("%s is not available as initializer"), "-[PXVideoPlaybackReporterAVPlayerItemEndpoint init]");

  abort();
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVideoPlaybackReporterAVPlayerItemEndpoint playerItem](self, "playerItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; Item: %@>"), v5, self, v6);

  return v7;
}

- (void)sendPayload:(_PXVideoPlaybackReporterPayload *)a3
{
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  __int128 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  void *v15;
  __int128 v16;
  void *v17;
  _QWORD block[5];
  id v19;
  __int128 v20;
  __int128 v21;
  SEL v22;
  _BYTE buf[32];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend((id)objc_opt_class(), "isReportingAvailable");
  PLVideoPlaybackGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      -[PXVideoPlaybackReporterAVPlayerItemEndpoint loggingIdentifier](self, "loggingIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_OWORD *)&a3->var2;
      *(_OWORD *)buf = *(_OWORD *)&a3->var0;
      *(_OWORD *)&buf[16] = v10;
      PXVideoPlaybackReporterPayloadDescription(buf);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "[VideoPlaybackReporting] %@: Sending video playback payload:\n\t%@", buf, 0x16u);

    }
    -[PXVideoPlaybackReporterAVPlayerItemEndpoint playerItem](self, "playerItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "reportingQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__PXVideoPlaybackReporterAVPlayerItemEndpoint_sendPayload___block_invoke;
    block[3] = &unk_1E5146140;
    v14 = *(_OWORD *)&a3->var2;
    v20 = *(_OWORD *)&a3->var0;
    v21 = v14;
    v22 = a2;
    block[4] = self;
    v19 = v12;
    v7 = v12;
    dispatch_async(v13, block);

  }
  else if (v8)
  {
    -[PXVideoPlaybackReporterAVPlayerItemEndpoint loggingIdentifier](self, "loggingIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_OWORD *)&a3->var2;
    *(_OWORD *)buf = *(_OWORD *)&a3->var0;
    *(_OWORD *)&buf[16] = v16;
    PXVideoPlaybackReporterPayloadDescription(buf);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v17;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "[VideoPlaybackReporting] %@: Unable to send video playback payload because reporting is not available:\n\t%@", buf, 0x16u);

  }
}

- (NSString)loggingIdentifier
{
  return self->loggingIdentifier;
}

- (void)setLoggingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->loggingIdentifier, 0);
}

void __59__PXVideoPlaybackReporterAVPlayerItemEndpoint_sendPayload___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v2 = a1[9];
  switch(v2)
  {
    case 1:
      v3 = CFSTR("PhotosUiStartToSetRateMs");
      break;
    case 2:
      v3 = CFSTR("PhotosUiStartToLeaveMs");
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a1[10], a1[4], CFSTR("PXVideoPlaybackReporter+AVFoundation.m"), 138, CFSTR("Code which should be unreachable has been reached"));

      abort();
    default:
      v3 = 0;
      break;
  }
  v4 = (void *)a1[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReportingValueWithNumber:forKey:", v5, v3);

  v6 = a1[8];
  if (v6 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Priority PriorityForLoadingPriority(PXVideoLoadingPriority)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    v16 = v14;
    v17 = 95;
    goto LABEL_12;
  }
  v7 = (void *)a1[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", qword_1A7C092E8[v6]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setReportingValueWithNumber:forKey:", v8, CFSTR("PhotosUiIntentPriority"));

  v9 = a1[8];
  if (v9 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "VideoIntent VideoIntentForLoadingPriority(PXVideoLoadingPriority)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    v16 = v14;
    v17 = 75;
LABEL_12:
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXVideoPlaybackReporter+AVFoundation.m"), v17, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = (void *)a1[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", qword_1A7C09320[v9]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setReportingValueWithNumber:forKey:", v11, CFSTR("PhotosUiIntent"));

  v12 = (void *)a1[5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[7]);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setReportingValueWithNumber:forKey:", v19, CFSTR("PhotosUiStartToAssetCreationMs"));

}

+ (BOOL)isReportingAvailable
{
  if (isReportingAvailable_onceToken != -1)
    dispatch_once(&isReportingAvailable_onceToken, &__block_literal_global_30262);
  return isReportingAvailable_isAvailable;
}

+ (OS_dispatch_queue)reportingQueue
{
  if (reportingQueue_onceToken != -1)
    dispatch_once(&reportingQueue_onceToken, &__block_literal_global_27);
  return (OS_dispatch_queue *)(id)reportingQueue_reportingQueue;
}

void __61__PXVideoPlaybackReporterAVPlayerItemEndpoint_reportingQueue__block_invoke()
{
  uint64_t v0;
  void *v1;

  px_dispatch_queue_create_serial_with_priority();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reportingQueue_reportingQueue;
  reportingQueue_reportingQueue = v0;

}

uint64_t __67__PXVideoPlaybackReporterAVPlayerItemEndpoint_isReportingAvailable__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0C8B300], "instancesRespondToSelector:", sel_setReportingValueWithNumber_forKey_);
  isReportingAvailable_isAvailable = result;
  if ((_DWORD)result)
    result = objc_msgSend(MEMORY[0x1E0C8B300], "instancesRespondToSelector:", sel_setReportingValueWithString_forKey_);
  isReportingAvailable_isAvailable = result;
  return result;
}

@end
