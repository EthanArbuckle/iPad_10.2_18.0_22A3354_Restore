@implementation PXStorySongResourcePreloadingOperation

- (PXStorySongResourcePreloadingOperation)initWithSongResource:(id)a3
{
  id v5;
  PXStorySongResourcePreloadingOperation *v6;
  PXStorySongResourcePreloadingOperation *v7;
  uint64_t v8;
  NSProgress *progress;
  uint64_t v10;
  OS_dispatch_queue *queue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXStorySongResourcePreloadingOperation;
  v6 = -[PXAsyncOperation init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resource, a3);
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 100);
    v8 = objc_claimAutoreleasedReturnValue();
    progress = v7->_progress;
    v7->_progress = (NSProgress *)v8;

    px_dispatch_queue_create();
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

  }
  return v7;
}

- (PXStorySongResourcePreloadingOperation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStorySongResourcePreloadingOperation.m"), 44, CFSTR("%s is not available as initializer"), "-[PXStorySongResourcePreloadingOperation init]");

  abort();
}

- (void)px_start
{
  void *v3;
  void *v4;
  id v5;
  OS_dispatch_queue *queue;
  double v7;
  void *v8;
  __int128 v9;
  uint64_t v10;

  -[PXStorySongResourcePreloadingOperation resource](self, "resource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_storyResourceSongAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc((Class)objc_msgSend(v4, "audioSessionClass"));
  queue = self->_queue;
  v9 = *MEMORY[0x1E0CA2E68];
  HIDWORD(v7) = DWORD1(v9);
  v10 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  LODWORD(v7) = 0;
  v8 = (void *)objc_msgSend(v5, "initWithAsset:volume:startTime:queue:audioSessionDelegate:", v4, &v9, queue, 0, v7);
  objc_msgSend(v8, "registerChangeObserver:context:", self, SessionContext);
  -[PXStorySongResourcePreloadingOperation setSession:](self, "setSession:", v8);
  objc_msgSend(v8, "performChanges:", &__block_literal_global_24804);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v7;

  if ((a4 & 0xA) != 0 && SessionContext == (_QWORD)a5)
  {
    -[PXStorySongResourcePreloadingOperation session](self, "session", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isReadyToPlay") & 1) != 0 || objc_msgSend(v7, "status") == 4)
      -[PXAsyncOperation px_finishIfPossible](self, "px_finishIfPossible");

  }
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 256, 1);
}

- (PXStorySongResource)resource
{
  return self->_resource;
}

- (PXAudioSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_progress, 0);
}

uint64_t __50__PXStorySongResourcePreloadingOperation_px_start__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "prepareToPlay");
}

@end
