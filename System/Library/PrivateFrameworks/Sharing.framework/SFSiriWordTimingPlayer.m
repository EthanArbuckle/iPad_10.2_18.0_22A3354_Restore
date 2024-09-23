@implementation SFSiriWordTimingPlayer

- (SFSiriWordTimingPlayer)init
{
  SFSiriWordTimingPlayer *v2;
  SFSiriWordTimingPlayer *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFSiriWordTimingPlayer;
  v2 = -[SFSiriWordTimingPlayer init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SFSiriWordTimingPlayer_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __34__SFSiriWordTimingPlayer_activate__block_invoke(uint64_t a1)
{
  double *v2;

  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v2 = *(double **)(a1 + 32);
  if (v2[6] == 0.0)
  {
    *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 48) = CFAbsoluteTimeGetCurrent();
    v2 = *(double **)(a1 + 32);
  }
  return objc_msgSend(v2, "_processNextWord");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SFSiriWordTimingPlayer_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __36__SFSiriWordTimingPlayer_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = 0;

  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v6 + 64);
  if (v7)
  {
    NSErrorWithOSStatusF();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, void *))(v7 + 16))(v7, 0, 0, 4, v8);

    v6 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v6 + 64);
  }
  else
  {
    v9 = 0;
  }
  *(_QWORD *)(v6 + 64) = 0;

}

- (void)_processNextWord
{
  unint64_t wordIndex;
  NSArray *wordTimings;
  SFSiriWordTimingInfo *v5;
  SFSiriWordTimingInfo *wordInfo;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  NSObject *v9;
  OS_dispatch_source *timer;
  NSObject *v11;
  OS_dispatch_source *v12;
  id wordHandler;
  _QWORD handler[5];

  wordIndex = self->_wordIndex;
  if (wordIndex >= -[NSArray count](self->_wordTimings, "count"))
  {
    if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
    timer = self->_timer;
    if (timer)
    {
      v11 = timer;
      dispatch_source_cancel(v11);
      v12 = self->_timer;
      self->_timer = 0;

    }
    wordHandler = self->_wordHandler;
    if (wordHandler)
    {
      (*((void (**)(id, _QWORD, _QWORD, uint64_t, _QWORD))wordHandler + 2))(wordHandler, 0, 0, 4, 0);
      wordHandler = self->_wordHandler;
    }
    self->_wordHandler = 0;

  }
  else
  {
    wordTimings = self->_wordTimings;
    ++self->_wordIndex;
    -[NSArray objectAtIndexedSubscript:](wordTimings, "objectAtIndexedSubscript:");
    v5 = (SFSiriWordTimingInfo *)objc_claimAutoreleasedReturnValue();
    wordInfo = self->_wordInfo;
    self->_wordInfo = v5;

    -[SFSiriWordTimingInfo timeOffset](self->_wordInfo, "timeOffset");
    CFAbsoluteTimeGetCurrent();
    if (self->_timer)
    {
      CUDispatchTimerSet();
    }
    else
    {
      v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      v8 = self->_timer;
      self->_timer = v7;

      v9 = self->_timer;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __42__SFSiriWordTimingPlayer__processNextWord__block_invoke;
      handler[3] = &unk_1E482DF78;
      handler[4] = self;
      dispatch_source_set_event_handler(v9, handler);
      CUDispatchTimerSet();
      dispatch_activate((dispatch_object_t)self->_timer);
    }
  }
}

uint64_t __42__SFSiriWordTimingPlayer__processNextWord__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processWord");
}

- (void)_processWord
{
  _QWORD *wordHandler;
  void *v4;
  void (*v5)(_QWORD *, id, void *, _QWORD, _QWORD);
  _QWORD *v6;
  id v7;
  void *v8;
  unint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  NSUInteger v17;
  unint64_t v18;
  NSUInteger v19;
  id v20;

  -[SFSiriWordTimingInfo wordID](self->_wordInfo, "wordID");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    wordHandler = self->_wordHandler;
    if (wordHandler)
    {
      -[SFSiriWordTimingInfo localizedText](self->_wordInfo, "localizedText");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void (*)(_QWORD *, id, void *, _QWORD, _QWORD))wordHandler[2];
      v6 = wordHandler;
      v7 = v20;
      v8 = v4;
LABEL_16:
      v5(v6, v7, v8, 0, 0);
      goto LABEL_17;
    }
  }
  else
  {
    v9 = -[SFSiriWordTimingInfo textRange](self->_wordInfo, "textRange");
    v11 = v10;
    v12 = -[NSString length](self->_text, "length");
    if (v12 >= v9 && v12 - v9 >= v11)
    {
      v15 = self->_wordHandler;
      if ((self->_flags & 8) != 0)
      {
        if (!v15)
          goto LABEL_18;
        -[NSString substringToIndex:](self->_text, "substringToIndex:", v9 + v11);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v15)
          goto LABEL_18;
        -[NSString substringWithRange:](self->_text, "substringWithRange:", v9, v11);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      v4 = (void *)v16;
      v5 = (void (*)(_QWORD *, id, void *, _QWORD, _QWORD))v15[2];
      v6 = v15;
      v7 = v4;
      v8 = 0;
      goto LABEL_16;
    }
    v14 = self->_wordHandler;
    if (v14)
    {
      v18 = v9;
      v19 = v11;
      v17 = v12;
      NSErrorWithOSStatusF();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, const __CFString *, _QWORD, _QWORD, void *))v14 + 2))(v14, &stru_1E483B8E8, 0, 0, v4);
LABEL_17:

    }
  }
LABEL_18:
  -[SFSiriWordTimingPlayer _processNextWord](self, "_processNextWord", v17, v18, v19);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)wordHandler
{
  return self->_wordHandler;
}

- (void)setWordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)wordTimings
{
  return self->_wordTimings;
}

- (void)setWordTimings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordTimings, 0);
  objc_storeStrong(&self->_wordHandler, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_wordInfo, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
