@implementation _PIThumbnailGeneratorSnapshot

- (_PIThumbnailGeneratorSnapshot)initWithGenerator:(id)a3
{
  id v3;
  _PIThumbnailGeneratorSnapshot *v4;
  void *v5;
  uint64_t v6;
  NUComposition *composition;
  void *v8;
  uint64_t v9;
  NSArray *thumbnailTimes;
  uint64_t v11;
  OS_dispatch_queue *resultQueue;
  uint64_t v13;
  id partialResultHandler;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_PIThumbnailGeneratorSnapshot;
  v3 = a3;
  v4 = -[_PIThumbnailGeneratorSnapshot init](&v16, sel_init);
  objc_storeWeak((id *)&v4->_generator, v3);
  objc_msgSend(v3, "composition", v16.receiver, v16.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  composition = v4->_composition;
  v4->_composition = (NUComposition *)v6;

  objc_msgSend(v3, "thumbnailTimes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  thumbnailTimes = v4->_thumbnailTimes;
  v4->_thumbnailTimes = (NSArray *)v9;

  objc_msgSend(v3, "resultQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  resultQueue = v4->_resultQueue;
  v4->_resultQueue = (OS_dispatch_queue *)v11;

  objc_msgSend(v3, "partialResultHandler");
  v13 = objc_claimAutoreleasedReturnValue();

  partialResultHandler = v4->_partialResultHandler;
  v4->_partialResultHandler = (id)v13;

  return v4;
}

- (NUComposition)composition
{
  return self->_composition;
}

- (void)setComposition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NUImageBufferRenderRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSArray)thumbnailTimes
{
  return self->_thumbnailTimes;
}

- (void)setThumbnailTimes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)unadjustedThumbnails
{
  return self->_unadjustedThumbnails;
}

- (void)setUnadjustedThumbnails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)referenceTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 80);
  return self;
}

- (void)setReferenceTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_referenceTime.epoch = a3->var3;
  *(_OWORD *)&self->_referenceTime.value = v3;
}

- (OS_dispatch_queue)resultQueue
{
  return self->_resultQueue;
}

- (void)setResultQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resultQueue, a3);
}

- (id)partialResultHandler
{
  return self->_partialResultHandler;
}

- (void)setPartialResultHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (_PIThumbnailGeneratorSnapshot)pendingSnapshot
{
  return self->_pendingSnapshot;
}

- (void)setPendingSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSnapshot, a3);
}

- (PIThumbnailGenerator)generator
{
  return (PIThumbnailGenerator *)objc_loadWeakRetained((id *)&self->_generator);
}

- (void)setGenerator:(id)a3
{
  objc_storeWeak((id *)&self->_generator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_generator);
  objc_storeStrong((id *)&self->_pendingSnapshot, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_partialResultHandler, 0);
  objc_storeStrong((id *)&self->_resultQueue, 0);
  objc_storeStrong((id *)&self->_unadjustedThumbnails, 0);
  objc_storeStrong((id *)&self->_thumbnailTimes, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_composition, 0);
}

@end
