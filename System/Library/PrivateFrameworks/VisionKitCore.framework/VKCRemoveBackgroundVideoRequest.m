@implementation VKCRemoveBackgroundVideoRequest

- (VKCRemoveBackgroundVideoRequest)initWithPhotosAnalyzerRequest:(id)a3
{
  id v5;
  VKCRemoveBackgroundVideoRequest *v6;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VKCRemoveBackgroundVideoRequest;
  v6 = -[VKCRemoveBackgroundVideoRequest init](&v8, sel_init);
  if (v6)
  {
    if (!v5)
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((request) != nil)", "-[VKCRemoveBackgroundVideoRequest initWithPhotosAnalyzerRequest:]", 0, 0, CFSTR("Expected non-nil value for '%s'"), "request");
    objc_storeStrong((id *)&v6->_photosRequest, a3);
    -[VKCRemoveBackgroundVideoRequest commonInit]((uint64_t)v6);
  }

  return v6;
}

- (__n128)commonInit
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  __n128 result;

  if (a1)
  {
    *(_DWORD *)(a1 + 12) = 0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UUIDString");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = v3;

    *(_DWORD *)(a1 + 8) = -1;
    v5 = MEMORY[0x1E0CA2E68];
    result = *(__n128 *)MEMORY[0x1E0CA2E68];
    *(_OWORD *)(a1 + 80) = *MEMORY[0x1E0CA2E68];
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(v5 + 16);
  }
  return result;
}

- (void)setMadRequestID:(int)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_madRequestID = a3;
  os_unfair_lock_unlock(p_lock);
}

- (int)madRequestID
{
  VKCRemoveBackgroundVideoRequest *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_madRequestID;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (id)createMADRequest
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  CMTime time2;
  CMTime time1;

  v3 = objc_alloc_init(MEMORY[0x1E0D47878]);
  -[VKCRemoveBackgroundVideoRequest maxDimension](self, "maxDimension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[VKCRemoveBackgroundVideoRequest maxDimension](self, "maxDimension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMaxDimension:", v5);

  }
  -[VKCRemoveBackgroundVideoRequest minDimension](self, "minDimension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[VKCRemoveBackgroundVideoRequest minDimension](self, "minDimension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMinDimension:", v7);

  }
  -[VKCRemoveBackgroundVideoRequest maxFileSize](self, "maxFileSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[VKCRemoveBackgroundVideoRequest maxFileSize](self, "maxFileSize");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMaxFileSize:", v9);

  }
  -[VKCRemoveBackgroundVideoRequest instancePoint](self, "instancePoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[VKCRemoveBackgroundVideoRequest instancePoint](self, "instancePoint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setInstancePoint:", v11);

  }
  -[VKCRemoveBackgroundVideoRequest outputType](self, "outputType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[VKCRemoveBackgroundVideoRequest outputType](self, "outputType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOutputType:", v13);

  }
  -[VKCRemoveBackgroundVideoRequest stickerIDs](self, "stickerIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[VKCRemoveBackgroundVideoRequest stickerIDs](self, "stickerIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setStickerIdentifiers:", v15);

  }
  -[VKCRemoveBackgroundVideoRequest maskTime](self, "maskTime");
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&time1, &time2))
  {
    -[VKCRemoveBackgroundVideoRequest maskTime](self, "maskTime");
    v17 = v19;
    v18 = v20;
    objc_msgSend(v3, "setMaskTime:", &v17);
  }
  return v3;
}

- (id)createMADPreviewRequest
{
  objc_class *v2;

  v2 = NSClassFromString(CFSTR("MADVideoRemoveBackgroundPreviewRequest"));
  if (v2)
    v2 = (objc_class *)objc_alloc_init(v2);
  return v2;
}

- (NSValue)instancePoint
{
  return self->_instancePoint;
}

- (void)setInstancePoint:(id)a3
{
  objc_storeStrong((id *)&self->_instancePoint, a3);
}

- (NSNumber)maxDimension
{
  return self->_maxDimension;
}

- (void)setMaxDimension:(id)a3
{
  objc_storeStrong((id *)&self->_maxDimension, a3);
}

- (NSNumber)minDimension
{
  return self->_minDimension;
}

- (void)setMinDimension:(id)a3
{
  objc_storeStrong((id *)&self->_minDimension, a3);
}

- (NSNumber)maxFileSize
{
  return self->_maxFileSize;
}

- (void)setMaxFileSize:(id)a3
{
  objc_storeStrong((id *)&self->_maxFileSize, a3);
}

- (NSArray)stickerIDs
{
  return self->_stickerIDs;
}

- (void)setStickerIDs:(id)a3
{
  objc_storeStrong((id *)&self->_stickerIDs, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maskTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (void)setMaskTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_maskTime.epoch = a3->var3;
  *(_OWORD *)&self->_maskTime.value = v3;
}

- (UTType)outputType
{
  return self->_outputType;
}

- (void)setOutputType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (VKCImageAnalyzerRequest)photosRequest
{
  return self->_photosRequest;
}

- (void)setPhotosRequest:(id)a3
{
  objc_storeStrong((id *)&self->_photosRequest, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_photosRequest, 0);
  objc_storeStrong((id *)&self->_outputType, 0);
  objc_storeStrong((id *)&self->_stickerIDs, 0);
  objc_storeStrong((id *)&self->_maxFileSize, 0);
  objc_storeStrong((id *)&self->_minDimension, 0);
  objc_storeStrong((id *)&self->_maxDimension, 0);
  objc_storeStrong((id *)&self->_instancePoint, 0);
}

@end
