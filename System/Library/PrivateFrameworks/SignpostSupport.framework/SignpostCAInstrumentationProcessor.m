@implementation SignpostCAInstrumentationProcessor

- (void)_handleLongFrameLifetimeBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  +[SignpostFrameLifetimeInterval _frameSeedForLifetimeIntervalBegin:](SignpostFrameLifetimeInterval, "_frameSeedForLifetimeIntervalBegin:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    -[SignpostCAInstrumentationProcessor setCurFrameSeed:](self, "setCurFrameSeed:", objc_msgSend(v5, "unsignedLongLongValue"));
    -[SignpostCAInstrumentationProcessor setCurLongFrameLifetimeBegin:](self, "setCurLongFrameLifetimeBegin:", v4);
  }
  else
  {
    _signpost_debug_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[SignpostCAInstrumentationProcessor _handleFrameLifetimeBegin:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
}

- (void)setCurLongFrameLifetimeBegin:(id)a3
{
  objc_storeStrong((id *)&self->_curLongFrameLifetimeBegin, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curFrameLifetimeBegin, 0);
  objc_storeStrong((id *)&self->_curLongFrameLifetimeBegin, 0);
  objc_storeStrong((id *)&self->_previousFrameLifetime, 0);
  objc_storeStrong((id *)&self->_queueIDToSurfaceIDToClientDrawableIntervalDict, 0);
  objc_storeStrong((id *)&self->_frameSeedToAccumulatedRenderStateDict, 0);
  objc_storeStrong((id *)&self->_frameSeedToAccumulatedStateDict, 0);
  objc_storeStrong(&self->_imageQueueSampleEventBlock, 0);
  objc_storeStrong(&self->_contextInfoBlock, 0);
  objc_storeStrong(&self->_frameLifetimeBlock, 0);
  objc_storeStrong(&self->_renderBlock, 0);
  objc_storeStrong(&self->_hidLatencyBlock, 0);
  objc_storeStrong(&self->_frameLatencyBlock, 0);
  objc_storeStrong(&self->_transactionLifetimeBlock, 0);
  objc_storeStrong(&self->_clientDrawableIntervalBlock, 0);
  objc_storeStrong(&self->_commitIntervalBlock, 0);
}

- (void)setTransactionLifetimeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setRenderBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setHidLatencyBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setFrameLifetimeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setFrameLatencyBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setCommitIntervalBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setClientDrawableIntervalBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SignpostCAInstrumentationProcessor)init
{
  SignpostCAInstrumentationProcessor *v2;
  uint64_t v3;
  NSMutableDictionary *frameSeedToAccumulatedStateDict;
  uint64_t v5;
  NSMutableDictionary *frameSeedToAccumulatedRenderStateDict;
  uint64_t v7;
  NSMutableDictionary *queueIDToSurfaceIDToClientDrawableIntervalDict;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SignpostCAInstrumentationProcessor;
  v2 = -[SignpostCAInstrumentationProcessor init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    frameSeedToAccumulatedStateDict = v2->_frameSeedToAccumulatedStateDict;
    v2->_frameSeedToAccumulatedStateDict = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    frameSeedToAccumulatedRenderStateDict = v2->_frameSeedToAccumulatedRenderStateDict;
    v2->_frameSeedToAccumulatedRenderStateDict = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    queueIDToSurfaceIDToClientDrawableIntervalDict = v2->_queueIDToSurfaceIDToClientDrawableIntervalDict;
    v2->_queueIDToSurfaceIDToClientDrawableIntervalDict = (NSMutableDictionary *)v7;

    v2->_isConciseFormat = 0;
  }
  return v2;
}

- (void)handleSignpostIntervalBegin:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int IsHitchSubsystem;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("FrameLifetime"));

  if (v5)
  {
    objc_msgSend(v14, "subsystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IsHitchSubsystem = _subsystemIsHitchSubsystem(v6);

    if (IsHitchSubsystem)
    {
      objc_msgSend(v14, "category");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("IOMFBServer")))
      {

      }
      else
      {
        objc_msgSend(v14, "category");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("tracing"));

        if (!v10)
        {
          objc_msgSend(v14, "category");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqualToString:", CFSTR("IOMFBServer.Stalls")))
          {

          }
          else
          {
            objc_msgSend(v14, "category");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("tracing.stalls"));

            if (!v13)
              goto LABEL_11;
          }
          -[SignpostCAInstrumentationProcessor _handleLongFrameLifetimeBegin:](self, "_handleLongFrameLifetimeBegin:", v14);
          goto LABEL_11;
        }
      }
      -[SignpostCAInstrumentationProcessor _handleFrameLifetimeBegin:](self, "_handleFrameLifetimeBegin:", v14);
    }
  }
LABEL_11:

}

- (BOOL)handleSignpostEvent:(id)a3
{
  id v4;
  int v5;
  SignpostImageQueueSampleEvent *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  v5 = SSCAEventTypeForSignpost(v4);
  if (v5 == 1)
  {
    v6 = -[SignpostImageQueueSampleEvent initWithImageQueueSampleEvent:]([SignpostImageQueueSampleEvent alloc], "initWithImageQueueSampleEvent:", v4);
    if (!v6)
      goto LABEL_10;
    -[SignpostCAInstrumentationProcessor _handleImageQueueSampleEvent:](self, "_handleImageQueueSampleEvent:", v6);
    -[SignpostCAInstrumentationProcessor imageQueueSampleEventBlock](self, "imageQueueSampleEventBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_10;
    -[SignpostCAInstrumentationProcessor imageQueueSampleEventBlock](self, "imageQueueSampleEventBlock");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (v5)
  {
    v11 = 0;
    goto LABEL_12;
  }
  v6 = -[SignpostContextInfo initWithContextInfoEvent:]([SignpostContextInfo alloc], "initWithContextInfoEvent:", v4);
  if (v6)
  {
    -[SignpostCAInstrumentationProcessor _handleContextInfo:](self, "_handleContextInfo:", v6);
    -[SignpostCAInstrumentationProcessor contextInfoBlock](self, "contextInfoBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[SignpostCAInstrumentationProcessor contextInfoBlock](self, "contextInfoBlock");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v10 = (void *)v8;
      (*(void (**)(uint64_t, SignpostImageQueueSampleEvent *))(v8 + 16))(v8, v6);

    }
  }
LABEL_10:

  v11 = 1;
LABEL_12:

  return v11;
}

- (id)contextInfoBlock
{
  return self->_contextInfoBlock;
}

- (BOOL)handleSignpostInterval:(id)a3
{
  id v4;
  int v5;
  _BOOL8 v6;
  void *v7;
  SignpostCommitInterval *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  SignpostFrameLifetimeInterval *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SignpostFrameLifetimeInterval *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void (**v32)(_QWORD, _QWORD, _QWORD);
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void (**v37)(_QWORD, _QWORD, _QWORD);
  void *v38;
  void *v39;
  void (**v40)(_QWORD, _QWORD, _QWORD);
  void *v42;
  void *v43;

  v4 = a3;
  v5 = SSCAIntervalTypeForSignpostInterval(v4);
  if (!-[SignpostCAInstrumentationProcessor isConciseFormat](self, "isConciseFormat")
    && objc_msgSend(v4, "isSyntheticInterval"))
  {
    -[SignpostCAInstrumentationProcessor setIsConciseFormat:](self, "setIsConciseFormat:", 1);
  }
  v6 = 0;
  switch(v5)
  {
    case 0:
      goto LABEL_6;
    case 1:
      v6 = 1;
LABEL_6:
      -[SignpostCAInstrumentationProcessor commitIntervalBlock](self, "commitIntervalBlock");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_49;
      v8 = -[SignpostCommitInterval initWithCommitInterval:]([SignpostCommitInterval alloc], "initWithCommitInterval:", v4);
      if (!v8)
        goto LABEL_48;
      -[SignpostCAInstrumentationProcessor commitIntervalBlock](self, "commitIntervalBlock");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 2:
      goto LABEL_10;
    case 3:
      v6 = 1;
LABEL_10:
      -[SignpostCAInstrumentationProcessor setIsConciseFormat:](self, "setIsConciseFormat:", 0);
      -[SignpostCAInstrumentationProcessor transactionLifetimeBlock](self, "transactionLifetimeBlock");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_49;
      v8 = -[SignpostAnimationTransactionLifetime initWithTransactionSeedInterval:]([SignpostAnimationTransactionLifetime alloc], "initWithTransactionSeedInterval:", v4);
      if (!v8)
        goto LABEL_48;
      -[SignpostCAInstrumentationProcessor transactionLifetimeBlock](self, "transactionLifetimeBlock");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 4:
      goto LABEL_14;
    case 5:
      v6 = 1;
LABEL_14:
      -[SignpostCAInstrumentationProcessor setIsConciseFormat:](self, "setIsConciseFormat:", 0);
      v8 = -[SignpostHIDLatencyInterval initWithHIDLatencyInterval:]([SignpostHIDLatencyInterval alloc], "initWithHIDLatencyInterval:", v4);
      if (!v8)
        goto LABEL_48;
      -[SignpostCAInstrumentationProcessor _handleHIDInterval:](self, "_handleHIDInterval:", v8);
      -[SignpostCAInstrumentationProcessor hidLatencyBlock](self, "hidLatencyBlock");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        goto LABEL_48;
      -[SignpostCAInstrumentationProcessor hidLatencyBlock](self, "hidLatencyBlock");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 6:
      goto LABEL_18;
    case 7:
      v6 = 1;
LABEL_18:
      -[SignpostCAInstrumentationProcessor setIsConciseFormat:](self, "setIsConciseFormat:", 0);
      v8 = -[SignpostFrameLatencyInterval initWithFrameLatencyInterval:isLong:]([SignpostFrameLatencyInterval alloc], "initWithFrameLatencyInterval:isLong:", v4, v6);
      if (!v8)
        goto LABEL_48;
      -[SignpostCAInstrumentationProcessor _handleFrameLatencyInterval:](self, "_handleFrameLatencyInterval:", v8);
      -[SignpostCAInstrumentationProcessor frameLatencyBlock](self, "frameLatencyBlock");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_48;
      -[SignpostCAInstrumentationProcessor frameLatencyBlock](self, "frameLatencyBlock");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 8:
      goto LABEL_22;
    case 9:
      v6 = 1;
LABEL_22:
      v8 = -[SignpostRenderServerRenderInterval initWithRenderServerRenderInterval:]([SignpostRenderServerRenderInterval alloc], "initWithRenderServerRenderInterval:", v4);
      if (!v8)
        goto LABEL_48;
      -[SignpostCAInstrumentationProcessor _handleRenderInterval:](self, "_handleRenderInterval:", v8);
      -[SignpostCAInstrumentationProcessor renderBlock](self, "renderBlock");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_48;
      -[SignpostCAInstrumentationProcessor renderBlock](self, "renderBlock");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    case 10:
      goto LABEL_26;
    case 11:
      v6 = 1;
LABEL_26:
      objc_msgSend(v4, "beginEvent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[SignpostFrameLifetimeInterval _frameSeedForLifetimeIntervalBegin:](SignpostFrameLifetimeInterval, "_frameSeedForLifetimeIntervalBegin:", v14);
      v8 = (SignpostCommitInterval *)objc_claimAutoreleasedReturnValue();

      -[SignpostCAInstrumentationProcessor frameSeedToAccumulatedStateDict](self, "frameSeedToAccumulatedStateDict");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = -[SignpostCAInstrumentationProcessor isConciseFormat](self, "isConciseFormat");
      v18 = [SignpostFrameLifetimeInterval alloc];
      objc_msgSend(v16, "contextIDtoContextInfoDict");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "allValues");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v16, "renderInterval");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "frameSeedToSkippedRenderIntervals");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[SignpostFrameLifetimeInterval initWithInterval:contextArray:renderInterval:frameSeedToSkippedRenderIntervals:](v18, "initWithInterval:contextArray:renderInterval:frameSeedToSkippedRenderIntervals:", v4, v20, v21, v22);

      }
      else
      {
        objc_msgSend(v16, "hidLatency");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "renderInterval");
        v43 = v19;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "frameLatency");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "frameSeedToSkippedRenderIntervals");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[SignpostFrameLifetimeInterval initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:](v18, "initWithInterval:contextArray:hidLatencyInterval:renderInterval:frameLatencyInterval:frameSeedToSkippedRenderIntervals:", v4, v20, v42, v25, v26, v27);

        -[SignpostFrameLifetimeInterval frameLatencyInterval](v23, "frameLatencyInterval");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
          goto LABEL_36;
        -[SignpostFrameLifetimeInterval frameLatencyInterval](v23, "frameLatencyInterval");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SignpostCAInstrumentationProcessor _handleFrameLatencyInterval:](self, "_handleFrameLatencyInterval:", v19);
      }

LABEL_36:
      if (v23)
      {
        -[SignpostFrameLifetimeInterval setLifetimeIsLong:](v23, "setLifetimeIsLong:", v6);
        if (-[SignpostCAInstrumentationProcessor isConciseFormat](self, "isConciseFormat"))
        {
          -[SignpostCAInstrumentationProcessor hidLatencyBlock](self, "hidLatencyBlock");
          v29 = objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            v30 = (void *)v29;
            -[SignpostFrameLifetimeInterval hidLatencyInterval](v23, "hidLatencyInterval");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (v31)
            {
              -[SignpostCAInstrumentationProcessor hidLatencyBlock](self, "hidLatencyBlock");
              v32 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              -[SignpostFrameLifetimeInterval hidLatencyInterval](v23, "hidLatencyInterval");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *, BOOL))v32)[2](v32, v33, -[SignpostFrameLifetimeInterval hidLatencyIsLong](v23, "hidLatencyIsLong"));

            }
          }
          -[SignpostCAInstrumentationProcessor frameLatencyBlock](self, "frameLatencyBlock");
          v34 = objc_claimAutoreleasedReturnValue();
          if (v34)
          {
            v35 = (void *)v34;
            -[SignpostFrameLifetimeInterval frameLatencyInterval](v23, "frameLatencyInterval");
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
            {
              -[SignpostCAInstrumentationProcessor frameLatencyBlock](self, "frameLatencyBlock");
              v37 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              -[SignpostFrameLifetimeInterval frameLatencyInterval](v23, "frameLatencyInterval");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *, BOOL))v37)[2](v37, v38, -[SignpostFrameLifetimeInterval frameLatencyIsLong](v23, "frameLatencyIsLong"));

            }
          }
        }
        -[SignpostCAInstrumentationProcessor _handleFrameLifetimeInterval:](self, "_handleFrameLifetimeInterval:", v23);
        -[SignpostCAInstrumentationProcessor frameLifetimeBlock](self, "frameLifetimeBlock");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          -[SignpostCAInstrumentationProcessor frameLifetimeBlock](self, "frameLifetimeBlock");
          v40 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, SignpostFrameLifetimeInterval *, _BOOL8))v40)[2](v40, v23, v6);

        }
      }

LABEL_47:
LABEL_48:

LABEL_49:
      LOBYTE(v6) = 1;
LABEL_50:

      return v6;
    case 12:
      goto LABEL_29;
    case 13:
      v6 = 1;
LABEL_29:
      v8 = -[SignpostClientDrawableInterval initWithClientDrawableInterval:]([SignpostClientDrawableInterval alloc], "initWithClientDrawableInterval:", v4);
      if (!v8)
        goto LABEL_48;
      -[SignpostCAInstrumentationProcessor _handleClientDrawableInterval:](self, "_handleClientDrawableInterval:", v8);
      -[SignpostCAInstrumentationProcessor clientDrawableIntervalBlock](self, "clientDrawableIntervalBlock");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
        goto LABEL_48;
      -[SignpostCAInstrumentationProcessor clientDrawableIntervalBlock](self, "clientDrawableIntervalBlock");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_32:
      v16 = (void *)v9;
      (*(void (**)(uint64_t, SignpostCommitInterval *, _BOOL8))(v9 + 16))(v9, v8, v6);
      goto LABEL_47;
    default:
      goto LABEL_50;
  }
}

- (BOOL)isConciseFormat
{
  return self->_isConciseFormat;
}

- (id)renderBlock
{
  return self->_renderBlock;
}

- (id)frameLatencyBlock
{
  return self->_frameLatencyBlock;
}

- (id)frameLifetimeBlock
{
  return self->_frameLifetimeBlock;
}

- (id)commitIntervalBlock
{
  return self->_commitIntervalBlock;
}

- (void)_handleContextInfo:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  if (-[SignpostCAInstrumentationProcessor curFrameSeed](self, "curFrameSeed")
    && (v5 = objc_msgSend(v4, "frameSeed"),
        v5 != -[SignpostCAInstrumentationProcessor curFrameSeed](self, "curFrameSeed")))
  {
    _signpost_debug_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SignpostCAInstrumentationProcessor _handleContextInfo:].cold.1(v4, (const char *)self);

  }
  else
  {
    -[SignpostCAInstrumentationProcessor _stateForFrameSeed:](self, "_stateForFrameSeed:", objc_msgSend(v4, "frameSeed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contextIDtoContextInfoDict");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v4, "contextId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, v8);

  }
}

- (unsigned)curFrameSeed
{
  return self->_curFrameSeed;
}

- (void)_handleRenderInterval:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SignpostCAInstrumentationProcessor _renderStateForFrameSeed:](self, "_renderStateForFrameSeed:", objc_msgSend(v4, "frameSeed"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "imageQueueSampleEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageQueueSampleEvents:", v5);

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v4, "imageQueueSampleEvents");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[SignpostCAInstrumentationProcessor queueIDToSurfaceIDToClientDrawableIntervalDict](self, "queueIDToSurfaceIDToClientDrawableIntervalDict");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v11, "queueID"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v11, "surfaceID"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v6, "addObject:", v16);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v11, "surfaceID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObjectForKey:", v17);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v6, "count"))
    objc_msgSend(v4, "setClientDrawableIntervals:", v6);
  -[SignpostCAInstrumentationProcessor _stateForFrameSeed:](self, "_stateForFrameSeed:", objc_msgSend(v4, "frameSeed"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "didSkipRender"))
    objc_msgSend(v18, "_addSkippedRender:", v4);
  else
    objc_msgSend(v18, "setRenderInterval:", v4);

}

- (id)hidLatencyBlock
{
  return self->_hidLatencyBlock;
}

- (void)_handleFrameLifetimeBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  +[SignpostFrameLifetimeInterval _frameSeedForLifetimeIntervalBegin:](SignpostFrameLifetimeInterval, "_frameSeedForLifetimeIntervalBegin:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    -[SignpostCAInstrumentationProcessor setCurFrameSeed:](self, "setCurFrameSeed:", objc_msgSend(v5, "unsignedLongLongValue"));
    -[SignpostCAInstrumentationProcessor setCurFrameLifetimeBegin:](self, "setCurFrameLifetimeBegin:", v4);
  }
  else
  {
    _signpost_debug_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[SignpostCAInstrumentationProcessor _handleFrameLifetimeBegin:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
}

- (void)setCurFrameLifetimeBegin:(id)a3
{
  objc_storeStrong((id *)&self->_curFrameLifetimeBegin, a3);
}

- (SignpostEvent)curLongFrameLifetimeBegin
{
  return self->_curLongFrameLifetimeBegin;
}

- (void)setIsConciseFormat:(BOOL)a3
{
  self->_isConciseFormat = a3;
}

+ (void)addNeededSCToAllowlist:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "addSubsystem:category:", CFSTR("com.apple.coreanimation"), CFSTR("Transaction.Stalls"));
  objc_msgSend(v3, "addSubsystem:category:", CFSTR("com.apple.coreanimation"), CFSTR("Transaction"));
  objc_msgSend(v3, "addSubsystem:category:", CFSTR("com.apple.coreanimation"), CFSTR("IOMFBServer.Stalls"));
  objc_msgSend(v3, "addSubsystem:category:", CFSTR("com.apple.coreanimation"), CFSTR("IOMFBServer"));
  objc_msgSend(v3, "addSubsystem:category:", CFSTR("com.apple.coreanimation"), CFSTR("WindowServer.Stalls"));
  objc_msgSend(v3, "addSubsystem:category:", CFSTR("com.apple.coreanimation"), CFSTR("WindowServer"));
  objc_msgSend(v3, "addSubsystem:category:", CFSTR("com.apple.coreanimation"), CFSTR("WindowServer"));
  objc_msgSend(v3, "addSubsystem:category:", CFSTR("com.apple.SkyLight"), CFSTR("tracing"));
  objc_msgSend(v3, "addSubsystem:category:", CFSTR("com.apple.SkyLight"), CFSTR("tracing.stalls"));

}

- (void)_cleanupStateWithSeed:(unsigned int)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[SignpostCAInstrumentationProcessor frameSeedToAccumulatedRenderStateDict](self, "frameSeedToAccumulatedRenderStateDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v11, "unsignedLongLongValue") <= (unint64_t)a3)
        {
          -[SignpostCAInstrumentationProcessor frameSeedToAccumulatedRenderStateDict](self, "frameSeedToAccumulatedRenderStateDict");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeObjectForKey:", v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[SignpostCAInstrumentationProcessor frameSeedToAccumulatedStateDict](self, "frameSeedToAccumulatedStateDict", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    v18 = a3;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
        if (objc_msgSend(v20, "unsignedLongLongValue") <= v18)
        {
          -[SignpostCAInstrumentationProcessor frameSeedToAccumulatedStateDict](self, "frameSeedToAccumulatedStateDict");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "removeObjectForKey:", v20);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }

  -[SignpostCAInstrumentationProcessor setCurFrameSeed:](self, "setCurFrameSeed:", 0);
}

- (id)_stateForFrameSeed:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  SignpostFrameAccumulatedState *v7;
  void *v8;
  void *v9;

  v3 = *(_QWORD *)&a3;
  -[SignpostCAInstrumentationProcessor frameSeedToAccumulatedStateDict](self, "frameSeedToAccumulatedStateDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (SignpostFrameAccumulatedState *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = -[SignpostFrameAccumulatedState initWithFrameSeed:]([SignpostFrameAccumulatedState alloc], "initWithFrameSeed:", v3);
    -[SignpostCAInstrumentationProcessor frameSeedToAccumulatedStateDict](self, "frameSeedToAccumulatedStateDict");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  return v7;
}

- (NSMutableDictionary)frameSeedToAccumulatedStateDict
{
  return self->_frameSeedToAccumulatedStateDict;
}

- (void)setCurFrameSeed:(unsigned int)a3
{
  self->_curFrameSeed = a3;
}

- (id)_renderStateForFrameSeed:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  SignpostRenderAccumulatedState *v7;
  void *v8;
  void *v9;

  v3 = *(_QWORD *)&a3;
  -[SignpostCAInstrumentationProcessor frameSeedToAccumulatedRenderStateDict](self, "frameSeedToAccumulatedRenderStateDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (SignpostRenderAccumulatedState *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = -[SignpostRenderAccumulatedState initWithFrameSeed:]([SignpostRenderAccumulatedState alloc], "initWithFrameSeed:", v3);
    -[SignpostCAInstrumentationProcessor frameSeedToAccumulatedRenderStateDict](self, "frameSeedToAccumulatedRenderStateDict");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  return v7;
}

- (NSMutableDictionary)frameSeedToAccumulatedRenderStateDict
{
  return self->_frameSeedToAccumulatedRenderStateDict;
}

+ (BOOL)filterPassesRequiredSCForCAInstrumentation:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "passesSubsystem:category:", CFSTR("com.apple.coreanimation"), CFSTR("Transaction.Stalls"))&& objc_msgSend(v3, "passesSubsystem:category:", CFSTR("com.apple.coreanimation"), CFSTR("Transaction"))&& objc_msgSend(v3, "passesSubsystem:category:", CFSTR("com.apple.coreanimation"), CFSTR("IOMFBServer.Stalls"))&& objc_msgSend(v3, "passesSubsystem:category:", CFSTR("com.apple.coreanimation"), CFSTR("IOMFBServer"))
    && objc_msgSend(v3, "passesSubsystem:category:", CFSTR("com.apple.coreanimation"), CFSTR("WindowServer.Stalls"))&& objc_msgSend(v3, "passesSubsystem:category:", CFSTR("com.apple.coreanimation"), CFSTR("WindowServer"))&& objc_msgSend(v3, "passesSubsystem:category:", CFSTR("com.apple.SkyLight"), CFSTR("tracing")))
  {
    v4 = objc_msgSend(v3, "passesSubsystem:category:", CFSTR("com.apple.SkyLight"), CFSTR("tracing.stalls"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)filterPassesRequiredSCForCAMetalInstrumentation:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "passesSubsystem:category:", CFSTR("com.apple.coreanimation"), CFSTR("CAMetalLayer"))&& objc_msgSend(v3, "passesSubsystem:category:", CFSTR("com.apple.coreanimation"), CFSTR("CAMetalLayer.Stalls")))
  {
    v4 = objc_msgSend(v3, "passesSubsystem:category:", CFSTR("com.apple.coreanimation"), CFSTR("CAImageQueue"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)addNeededSCToWhitelist:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "addNeededSCToAllowlist:", v3);

}

+ (void)addNeededMetalSCToAllowlist:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "addSubsystem:category:", CFSTR("com.apple.coreanimation"), CFSTR("CAMetalLayer"));
  objc_msgSend(v3, "addSubsystem:category:", CFSTR("com.apple.coreanimation"), CFSTR("CAMetalLayer.Stalls"));
  objc_msgSend(v3, "addSubsystem:category:", CFSTR("com.apple.coreanimation"), CFSTR("CAImageQueue"));
  objc_msgSend(v3, "addSubsystem:category:", CFSTR("com.apple.coreanimation"), CFSTR("CAImageQueue.Stalls"));

}

- (void)_handleHIDInterval:(id)a3
{
  id v4;
  int v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  if (-[SignpostCAInstrumentationProcessor curFrameSeed](self, "curFrameSeed")
    && (v5 = objc_msgSend(v4, "frameSeed"),
        v5 != -[SignpostCAInstrumentationProcessor curFrameSeed](self, "curFrameSeed")))
  {
    _signpost_debug_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[SignpostCAInstrumentationProcessor _handleHIDInterval:].cold.1(v4, (const char *)self);

  }
  else
  {
    -[SignpostCAInstrumentationProcessor _stateForFrameSeed:](self, "_stateForFrameSeed:", -[SignpostCAInstrumentationProcessor curFrameSeed](self, "curFrameSeed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidLatency:", v4);

  }
}

- (void)_handleClientDrawableInterval:(id)a3
{
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
  id v14;

  v14 = a3;
  -[SignpostCAInstrumentationProcessor queueIDToSurfaceIDToClientDrawableIntervalDict](self, "queueIDToSurfaceIDToClientDrawableIntervalDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v14, "queueID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostCAInstrumentationProcessor queueIDToSurfaceIDToClientDrawableIntervalDict](self, "queueIDToSurfaceIDToClientDrawableIntervalDict");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v14, "queueID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  -[SignpostCAInstrumentationProcessor queueIDToSurfaceIDToClientDrawableIntervalDict](self, "queueIDToSurfaceIDToClientDrawableIntervalDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v14, "queueID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v14, "surfaceID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, v13);

}

- (void)_handleFrameLatencyInterval:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SignpostCAInstrumentationProcessor curFrameSeed](self, "curFrameSeed")
    && (v5 = objc_msgSend(v4, "frameSeed"),
        v5 != -[SignpostCAInstrumentationProcessor curFrameSeed](self, "curFrameSeed")))
  {
    _signpost_debug_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[SignpostCAInstrumentationProcessor _handleFrameLatencyInterval:].cold.1(v4, (const char *)self);
  }
  else
  {
    -[SignpostCAInstrumentationProcessor _stateForFrameSeed:](self, "_stateForFrameSeed:", -[SignpostCAInstrumentationProcessor curFrameSeed](self, "curFrameSeed"));
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject setFrameLatency:](v6, "setFrameLatency:", v4);
    -[NSObject contextIDtoContextInfoDict](v6, "contextIDtoContextInfoDict");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[NSObject contextIDtoContextInfoDict](v6, "contextIDtoContextInfoDict", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectEnumerator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15), "pid"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v16);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v13);
      }

      objc_msgSend(v4, "setContributingPids:", v9);
    }
  }

}

- (void)_handleFrameLifetimeInterval:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setPreviousFrameBufferCount:", -[SignpostFrameLifetimeInterval bufferCount](self->_previousFrameLifetime, "bufferCount"));
  objc_storeStrong((id *)&self->_previousFrameLifetime, a3);
  if (objc_msgSend(v6, "lifetimeIsLong"))
  {
    -[SignpostCAInstrumentationProcessor _cleanupStateWithSeed:](self, "_cleanupStateWithSeed:", objc_msgSend(v6, "frameSeed"));
    -[SignpostCAInstrumentationProcessor setCurLongFrameLifetimeBegin:](self, "setCurLongFrameLifetimeBegin:", 0);
  }
  else
  {
    -[SignpostCAInstrumentationProcessor curLongFrameLifetimeBegin](self, "curLongFrameLifetimeBegin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[SignpostCAInstrumentationProcessor _cleanupStateWithSeed:](self, "_cleanupStateWithSeed:", objc_msgSend(v6, "frameSeed"));
      -[SignpostCAInstrumentationProcessor setCurFrameLifetimeBegin:](self, "setCurFrameLifetimeBegin:", 0);
    }
  }

}

- (void)_handleImageQueueSampleEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SignpostCAInstrumentationProcessor _renderStateForFrameSeed:](self, "_renderStateForFrameSeed:", objc_msgSend(v4, "frameSeed"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageQueueSampleEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)handleDeviceReboot
{
  NSMutableDictionary *v3;
  NSMutableDictionary *frameSeedToAccumulatedStateDict;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  frameSeedToAccumulatedStateDict = self->_frameSeedToAccumulatedStateDict;
  self->_frameSeedToAccumulatedStateDict = v3;

}

- (id)newConfiguredExtractor
{
  SignpostSupportObjectExtractor *v3;
  SignpostSupportSubsystemCategoryAllowlist *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = objc_alloc_init(SignpostSupportObjectExtractor);
  v4 = objc_alloc_init(SignpostSupportSubsystemCategoryAllowlist);
  objc_msgSend((id)objc_opt_class(), "addNeededSCToAllowlist:", v4);
  objc_msgSend((id)objc_opt_class(), "addNeededMetalSCToAllowlist:", v4);
  -[SignpostSupportObjectExtractor setSubsystemCategoryFilter:](v3, "setSubsystemCategoryFilter:", v4);
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__SignpostCAInstrumentationProcessor_newConfiguredExtractor__block_invoke;
  v10[3] = &unk_1E46010B8;
  v10[4] = self;
  -[SignpostSupportObjectExtractor setIntervalCompletionProcessingBlock:](v3, "setIntervalCompletionProcessingBlock:", v10);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __60__SignpostCAInstrumentationProcessor_newConfiguredExtractor__block_invoke_2;
  v9[3] = &unk_1E46010E0;
  v9[4] = self;
  -[SignpostSupportObjectExtractor setBeginEventProcessingBlock:](v3, "setBeginEventProcessingBlock:", v9);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __60__SignpostCAInstrumentationProcessor_newConfiguredExtractor__block_invoke_3;
  v8[3] = &unk_1E46010E0;
  v8[4] = self;
  -[SignpostSupportObjectExtractor setEmitEventProcessingBlock:](v3, "setEmitEventProcessingBlock:", v8);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __60__SignpostCAInstrumentationProcessor_newConfiguredExtractor__block_invoke_4;
  v7[3] = &unk_1E4601108;
  v7[4] = self;
  -[SignpostSupportObjectExtractor setDeviceRebootProcessingBlock:](v3, "setDeviceRebootProcessingBlock:", v7);

  return v3;
}

uint64_t __60__SignpostCAInstrumentationProcessor_newConfiguredExtractor__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "handleSignpostInterval:", a2);
  return 1;
}

uint64_t __60__SignpostCAInstrumentationProcessor_newConfiguredExtractor__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "handleSignpostIntervalBegin:", a2);
  return 1;
}

uint64_t __60__SignpostCAInstrumentationProcessor_newConfiguredExtractor__block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "handleSignpostEvent:", a2);
  return 1;
}

uint64_t __60__SignpostCAInstrumentationProcessor_newConfiguredExtractor__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "handleDeviceReboot");
  return 1;
}

- (id)clientDrawableIntervalBlock
{
  return self->_clientDrawableIntervalBlock;
}

- (id)transactionLifetimeBlock
{
  return self->_transactionLifetimeBlock;
}

- (void)setContextInfoBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)imageQueueSampleEventBlock
{
  return self->_imageQueueSampleEventBlock;
}

- (void)setImageQueueSampleEventBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSMutableDictionary)queueIDToSurfaceIDToClientDrawableIntervalDict
{
  return self->_queueIDToSurfaceIDToClientDrawableIntervalDict;
}

- (SignpostFrameLifetimeInterval)previousFrameLifetime
{
  return self->_previousFrameLifetime;
}

- (void)setPreviousFrameLifetime:(id)a3
{
  objc_storeStrong((id *)&self->_previousFrameLifetime, a3);
}

- (SignpostEvent)curFrameLifetimeBegin
{
  return self->_curFrameLifetimeBegin;
}

- (void)_handleHIDInterval:(void *)a1 .cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1A1A28000, v2, v3, "HID latency seed mismatch: %#x v. %#x", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4();
}

- (void)_handleFrameLatencyInterval:(void *)a1 .cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1A1A28000, v2, v3, "Frame latency seed mismatch: %#x v. %#x", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4();
}

- (void)_handleContextInfo:(void *)a1 .cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_8(a1, a2);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1A1A28000, v2, v3, "Context info frame seed mismatch: %#x v. %#x", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_4();
}

- (void)_handleFrameLifetimeBegin:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1A1A28000, a1, a3, "Could not find frame seed for frame lifetime begin", a5, a6, a7, a8, 0);
}

@end
