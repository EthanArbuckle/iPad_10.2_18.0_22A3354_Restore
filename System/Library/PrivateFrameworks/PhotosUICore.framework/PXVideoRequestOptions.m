@implementation PXVideoRequestOptions

- (PXVideoRequestOptions)init
{
  char *v2;
  PXVideoRequestOptions *v3;
  void *v4;
  id progressHandler;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXVideoRequestOptions;
  v2 = -[PXVideoRequestOptions init](&v7, sel_init);
  v3 = (PXVideoRequestOptions *)v2;
  if (v2)
  {
    v2[9] = 0;
    *((_WORD *)v2 + 6) = 0;
    *(_QWORD *)(v2 + 23) = 0;
    *(_QWORD *)(v2 + 15) = 0;
    v2[31] = 0;
    v4 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = 0;

    progressHandler = v3->_progressHandler;
    v3->_progressHandler = 0;

    *(_WORD *)&v3->_restrictToPlayableOnCurrentDevice = 1;
    v3->_restrictToStreamable = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  __int128 v5;
  _OWORD v7[3];

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setAllowMediumHighQuality:", self->_allowMediumHighQuality);
  objc_msgSend(v4, "setDeliveryMode:", self->_deliveryMode);
  objc_msgSend(v4, "setDownloadIntent:", self->_downloadIntent);
  objc_msgSend(v4, "setDownloadPriority:", self->_downloadPriority);
  objc_msgSend(v4, "setLiveRenderVideoIfNeeded:", self->_liveRenderVideoIfNeeded);
  objc_msgSend(v4, "setNetworkAccessAllowed:", self->_networkAccessAllowed);
  objc_msgSend(v4, "setProgressHandler:", self->_progressHandler);
  objc_msgSend(v4, "setRestrictToPlayableOnCurrentDevice:", self->_restrictToPlayableOnCurrentDevice);
  objc_msgSend(v4, "setRestrictToStreamable:", self->_restrictToStreamable);
  objc_msgSend(v4, "setRestrictToEncryptedStream:", self->_restrictToEncryptedStream);
  objc_msgSend(v4, "setStreamingAllowed:", self->_streamingAllowed);
  objc_msgSend(v4, "setResultHandlerQueue:", self->_resultHandlerQueue);
  objc_msgSend(v4, "setStreamingVideoIntent:", self->_streamingVideoIntent);
  objc_msgSend(v4, "setTargetSize:", self->_targetSize.width, self->_targetSize.height);
  v5 = *(_OWORD *)&self->_timeRange.start.epoch;
  v7[0] = *(_OWORD *)&self->_timeRange.start.value;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  objc_msgSend(v4, "setTimeRange:", v7);
  objc_msgSend(v4, "setVersion:", self->_version);
  objc_msgSend(v4, "setIncludeTimeRangeMapper:", self->_includeTimeRangeMapper);
  return v4;
}

- (void)setRestrictToStreamable:(BOOL)a3
{
  self->_restrictToStreamable = a3;
  if (a3)
  {
    -[PXVideoRequestOptions setStreamingAllowed:](self, "setStreamingAllowed:", 1);
    -[PXVideoRequestOptions setNetworkAccessAllowed:](self, "setNetworkAccessAllowed:", 1);
  }
}

- (BOOL)restrictToStreamable
{
  return self->_restrictToStreamable;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_networkAccessAllowed = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (int64_t)deliveryMode
{
  return self->_deliveryMode;
}

- (void)setDeliveryMode:(int64_t)a3
{
  self->_deliveryMode = a3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (BOOL)restrictToPlayableOnCurrentDevice
{
  return self->_restrictToPlayableOnCurrentDevice;
}

- (void)setRestrictToPlayableOnCurrentDevice:(BOOL)a3
{
  self->_restrictToPlayableOnCurrentDevice = a3;
}

- (BOOL)restrictToEncryptedStream
{
  return self->_restrictToEncryptedStream;
}

- (void)setRestrictToEncryptedStream:(BOOL)a3
{
  self->_restrictToEncryptedStream = a3;
}

- (BOOL)isStreamingAllowed
{
  return self->_streamingAllowed;
}

- (void)setStreamingAllowed:(BOOL)a3
{
  self->_streamingAllowed = a3;
}

- (OS_dispatch_queue)resultHandlerQueue
{
  return self->_resultHandlerQueue;
}

- (void)setResultHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resultHandlerQueue, a3);
}

- (int64_t)streamingVideoIntent
{
  return self->_streamingVideoIntent;
}

- (void)setStreamingVideoIntent:(int64_t)a3
{
  self->_streamingVideoIntent = a3;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
}

- (int64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (void)setDownloadPriority:(int64_t)a3
{
  self->_downloadPriority = a3;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var0;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- (BOOL)isMediumHighQualityAllowed
{
  return self->_allowMediumHighQuality;
}

- (void)setAllowMediumHighQuality:(BOOL)a3
{
  self->_allowMediumHighQuality = a3;
}

- (BOOL)liveRenderVideoIfNeeded
{
  return self->_liveRenderVideoIfNeeded;
}

- (void)setLiveRenderVideoIfNeeded:(BOOL)a3
{
  self->_liveRenderVideoIfNeeded = a3;
}

- (BOOL)includeTimeRangeMapper
{
  return self->_includeTimeRangeMapper;
}

- (void)setIncludeTimeRangeMapper:(BOOL)a3
{
  self->_includeTimeRangeMapper = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHandlerQueue, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

- (id)photoKitRequestOptions
{
  id v3;
  void *v4;
  void *v5;
  _OWORD v7[6];

  v3 = objc_alloc_init(MEMORY[0x1E0CD1808]);
  objc_msgSend(v3, "setNetworkAccessAllowed:", -[PXVideoRequestOptions isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
  objc_msgSend(v3, "setVersion:", -[PXVideoRequestOptions version](self, "version"));
  objc_msgSend(v3, "setDeliveryMode:", -[PXVideoRequestOptions deliveryMode](self, "deliveryMode"));
  -[PXVideoRequestOptions progressHandler](self, "progressHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProgressHandler:", v4);

  objc_msgSend(v3, "setVideoComplementAllowed:", 1);
  -[PXVideoRequestOptions targetSize](self, "targetSize");
  objc_msgSend(v3, "setTargetSize:");
  objc_msgSend(v3, "setRestrictToPlayableOnCurrentDevice:", -[PXVideoRequestOptions restrictToPlayableOnCurrentDevice](self, "restrictToPlayableOnCurrentDevice"));
  objc_msgSend(v3, "setRestrictToStreamable:", -[PXVideoRequestOptions restrictToStreamable](self, "restrictToStreamable"));
  objc_msgSend(v3, "setRestrictToEncryptedStream:", -[PXVideoRequestOptions restrictToEncryptedStream](self, "restrictToEncryptedStream"));
  objc_msgSend(v3, "setStreamingAllowed:", -[PXVideoRequestOptions isStreamingAllowed](self, "isStreamingAllowed"));
  -[PXVideoRequestOptions resultHandlerQueue](self, "resultHandlerQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setResultHandlerQueue:", v5);

  objc_msgSend(v3, "setStreamingVideoIntent:", -[PXVideoRequestOptions streamingVideoIntent](self, "streamingVideoIntent"));
  objc_msgSend(v3, "setDownloadIntent:", -[PXVideoRequestOptions downloadIntent](self, "downloadIntent"));
  objc_msgSend(v3, "setDownloadPriority:", -[PXVideoRequestOptions downloadPriority](self, "downloadPriority"));
  -[PXVideoRequestOptions timeRange](self, "timeRange");
  v7[0] = v7[3];
  v7[1] = v7[4];
  v7[2] = v7[5];
  objc_msgSend(v3, "setTimeRange:", v7);
  objc_msgSend(v3, "setAllowMediumHighQuality:", -[PXVideoRequestOptions isMediumHighQualityAllowed](self, "isMediumHighQualityAllowed"));
  objc_msgSend(v3, "setLiveRenderVideoIfNeeded:", -[PXVideoRequestOptions liveRenderVideoIfNeeded](self, "liveRenderVideoIfNeeded"));
  objc_msgSend(v3, "setIncludeTimeRangeMapper:", -[PXVideoRequestOptions includeTimeRangeMapper](self, "includeTimeRangeMapper"));
  return v3;
}

@end
