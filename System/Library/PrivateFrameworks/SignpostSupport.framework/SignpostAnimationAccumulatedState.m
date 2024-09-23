@implementation SignpostAnimationAccumulatedState

- (void)_handleHIDLatency:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5
{
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v11 = a3;
  if (a5)
  {
    -[SignpostAnimationAccumulatedState allHIDLatencies](self, "allHIDLatencies");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

    if (!v6)
      goto LABEL_8;
  }
  else if (!v6)
  {
    -[SignpostAnimationAccumulatedState allHIDLatencies](self, "allHIDLatencies");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[SignpostAnimationAccumulatedState longHIDLatencies](self, "longHIDLatencies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v10 = v9;
  objc_msgSend(v9, "addObject:", v11);

LABEL_8:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allContributedFrameLifetimes, 0);
  objc_storeStrong((id *)&self->_allFrameLifetimes, 0);
  objc_storeStrong((id *)&self->_longContributedFrameLifetimes, 0);
  objc_storeStrong((id *)&self->_longFrameLifetimes, 0);
  objc_storeStrong((id *)&self->_allSystemwideClientDrawableIntervals, 0);
  objc_storeStrong((id *)&self->_longSystemwideClientDrawableIntervals, 0);
  objc_storeStrong((id *)&self->_allClientDrawableIntervals, 0);
  objc_storeStrong((id *)&self->_longClientDrawableIntervals, 0);
  objc_storeStrong((id *)&self->_allRenders, 0);
  objc_storeStrong((id *)&self->_longRenders, 0);
  objc_storeStrong((id *)&self->_allHIDLatencies, 0);
  objc_storeStrong((id *)&self->_longHIDLatencies, 0);
  objc_storeStrong((id *)&self->_allFrameLatencies, 0);
  objc_storeStrong((id *)&self->_longFrameLatencies, 0);
  objc_storeStrong((id *)&self->_allTransactionLifetimes, 0);
  objc_storeStrong((id *)&self->_longTransactionLifetimes, 0);
  objc_storeStrong((id *)&self->_allSystemwideCommitIntervals, 0);
  objc_storeStrong((id *)&self->_longSystemwideCommitIntervals, 0);
  objc_storeStrong((id *)&self->_allCommitIntervals, 0);
  objc_storeStrong((id *)&self->_longCommitIntervals, 0);
  objc_storeStrong((id *)&self->_compositorIntervals, 0);
  objc_storeStrong((id *)&self->_animationBeginEvent, 0);
}

- (void)_handleRenderServerRender:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5
{
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v11 = a3;
  if (a5)
  {
    -[SignpostAnimationAccumulatedState allRenders](self, "allRenders");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

    if (!v6)
      goto LABEL_8;
  }
  else if (!v6)
  {
    -[SignpostAnimationAccumulatedState allRenders](self, "allRenders");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[SignpostAnimationAccumulatedState longRenders](self, "longRenders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v10 = v9;
  objc_msgSend(v9, "addObject:", v11);

LABEL_8:
}

- (NSMutableArray)allRenders
{
  return self->_allRenders;
}

- (void)_handleFrameLifetime:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5
{
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v11 = a3;
  if (a5)
  {
    -[SignpostAnimationAccumulatedState allFrameLifetimes](self, "allFrameLifetimes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

    if (!v6)
      goto LABEL_8;
  }
  else if (!v6)
  {
    -[SignpostAnimationAccumulatedState allFrameLifetimes](self, "allFrameLifetimes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[SignpostAnimationAccumulatedState longFrameLifetimes](self, "longFrameLifetimes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v10 = v9;
  objc_msgSend(v9, "addObject:", v11);

LABEL_8:
}

- (NSMutableArray)allFrameLifetimes
{
  return self->_allFrameLifetimes;
}

- (void)_handleFrameLatency:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5
{
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v11 = a3;
  if (a5)
  {
    -[SignpostAnimationAccumulatedState allFrameLatencies](self, "allFrameLatencies");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

    if (!v6)
      goto LABEL_8;
  }
  else if (!v6)
  {
    -[SignpostAnimationAccumulatedState allFrameLatencies](self, "allFrameLatencies");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[SignpostAnimationAccumulatedState longFrameLatencies](self, "longFrameLatencies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v10 = v9;
  objc_msgSend(v9, "addObject:", v11);

LABEL_8:
}

- (NSMutableArray)allFrameLatencies
{
  return self->_allFrameLatencies;
}

- (void)_handleCommitInterval:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5
{
  _BOOL4 v6;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a4;
  v18 = a3;
  v8 = objc_msgSend(v18, "pid");
  -[SignpostAnimationAccumulatedState animationBeginEvent](self, "animationBeginEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "processID");

  if (v8 == v10)
  {
    if (a5)
    {
      -[SignpostAnimationAccumulatedState allCommitIntervals](self, "allCommitIntervals");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v18);

      if (v6)
      {
        -[SignpostAnimationAccumulatedState longCommitIntervals](self, "longCommitIntervals");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

        goto LABEL_6;
      }
      goto LABEL_13;
    }
    if (!v6)
    {
      -[SignpostAnimationAccumulatedState allCommitIntervals](self, "allCommitIntervals");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v18);

      goto LABEL_13;
    }
    -[SignpostAnimationAccumulatedState longCommitIntervals](self, "longCommitIntervals");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v18);

  }
  else
  {
    if (a5)
    {
LABEL_6:
      -[SignpostAnimationAccumulatedState allSystemwideCommitIntervals](self, "allSystemwideCommitIntervals");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v18);

      if (!v6)
        goto LABEL_15;
      goto LABEL_11;
    }
    if (!v6)
    {
LABEL_13:
      -[SignpostAnimationAccumulatedState allSystemwideCommitIntervals](self, "allSystemwideCommitIntervals");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }
LABEL_11:
  -[SignpostAnimationAccumulatedState longSystemwideCommitIntervals](self, "longSystemwideCommitIntervals");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
  v17 = v15;
  objc_msgSend(v15, "addObject:", v18);

LABEL_15:
}

- (NSMutableArray)allSystemwideCommitIntervals
{
  return self->_allSystemwideCommitIntervals;
}

- (SignpostEvent)animationBeginEvent
{
  return self->_animationBeginEvent;
}

- (NSMutableArray)allCommitIntervals
{
  return self->_allCommitIntervals;
}

- (NSMutableArray)longRenders
{
  return self->_longRenders;
}

- (NSMutableArray)longFrameLifetimes
{
  return self->_longFrameLifetimes;
}

- (NSMutableArray)longSystemwideCommitIntervals
{
  return self->_longSystemwideCommitIntervals;
}

- (NSMutableArray)allHIDLatencies
{
  return self->_allHIDLatencies;
}

- (NSMutableArray)longHIDLatencies
{
  return self->_longHIDLatencies;
}

- (NSMutableArray)longCommitIntervals
{
  return self->_longCommitIntervals;
}

- (SignpostAnimationAccumulatedState)initWithAnimationBeginEvent:(id)a3 shouldTrackComposites:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  SignpostAnimationAccumulatedState *v8;
  uint64_t v9;
  NSMutableArray *compositorIntervals;
  uint64_t v11;
  NSMutableArray *longCommitIntervals;
  uint64_t v13;
  NSMutableArray *allCommitIntervals;
  uint64_t v15;
  NSMutableArray *longSystemwideCommitIntervals;
  uint64_t v17;
  NSMutableArray *allSystemwideCommitIntervals;
  uint64_t v19;
  NSMutableArray *longClientDrawableIntervals;
  uint64_t v21;
  NSMutableArray *allClientDrawableIntervals;
  uint64_t v23;
  NSMutableArray *longSystemwideClientDrawableIntervals;
  uint64_t v25;
  NSMutableArray *allSystemwideClientDrawableIntervals;
  uint64_t v27;
  NSMutableArray *allTransactionLifetimes;
  uint64_t v29;
  NSMutableArray *longTransactionLifetimes;
  uint64_t v31;
  NSMutableArray *longFrameLatencies;
  uint64_t v33;
  NSMutableArray *allFrameLatencies;
  uint64_t v35;
  NSMutableArray *longHIDLatencies;
  uint64_t v37;
  NSMutableArray *allHIDLatencies;
  uint64_t v39;
  NSMutableArray *longRenders;
  uint64_t v41;
  NSMutableArray *allRenders;
  uint64_t v43;
  NSMutableArray *longFrameLifetimes;
  uint64_t v45;
  NSMutableArray *allFrameLifetimes;
  uint64_t v47;
  NSMutableArray *longContributedFrameLifetimes;
  uint64_t v49;
  NSMutableArray *allContributedFrameLifetimes;
  objc_super v52;

  v4 = a4;
  v7 = a3;
  v52.receiver = self;
  v52.super_class = (Class)SignpostAnimationAccumulatedState;
  v8 = -[SignpostAnimationAccumulatedState init](&v52, sel_init);
  if (v8)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = objc_claimAutoreleasedReturnValue();
      compositorIntervals = v8->_compositorIntervals;
      v8->_compositorIntervals = (NSMutableArray *)v9;

    }
    objc_storeStrong((id *)&v8->_animationBeginEvent, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    longCommitIntervals = v8->_longCommitIntervals;
    v8->_longCommitIntervals = (NSMutableArray *)v11;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    allCommitIntervals = v8->_allCommitIntervals;
    v8->_allCommitIntervals = (NSMutableArray *)v13;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    longSystemwideCommitIntervals = v8->_longSystemwideCommitIntervals;
    v8->_longSystemwideCommitIntervals = (NSMutableArray *)v15;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    allSystemwideCommitIntervals = v8->_allSystemwideCommitIntervals;
    v8->_allSystemwideCommitIntervals = (NSMutableArray *)v17;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    longClientDrawableIntervals = v8->_longClientDrawableIntervals;
    v8->_longClientDrawableIntervals = (NSMutableArray *)v19;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    allClientDrawableIntervals = v8->_allClientDrawableIntervals;
    v8->_allClientDrawableIntervals = (NSMutableArray *)v21;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v23 = objc_claimAutoreleasedReturnValue();
    longSystemwideClientDrawableIntervals = v8->_longSystemwideClientDrawableIntervals;
    v8->_longSystemwideClientDrawableIntervals = (NSMutableArray *)v23;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = objc_claimAutoreleasedReturnValue();
    allSystemwideClientDrawableIntervals = v8->_allSystemwideClientDrawableIntervals;
    v8->_allSystemwideClientDrawableIntervals = (NSMutableArray *)v25;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = objc_claimAutoreleasedReturnValue();
    allTransactionLifetimes = v8->_allTransactionLifetimes;
    v8->_allTransactionLifetimes = (NSMutableArray *)v27;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v29 = objc_claimAutoreleasedReturnValue();
    longTransactionLifetimes = v8->_longTransactionLifetimes;
    v8->_longTransactionLifetimes = (NSMutableArray *)v29;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = objc_claimAutoreleasedReturnValue();
    longFrameLatencies = v8->_longFrameLatencies;
    v8->_longFrameLatencies = (NSMutableArray *)v31;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = objc_claimAutoreleasedReturnValue();
    allFrameLatencies = v8->_allFrameLatencies;
    v8->_allFrameLatencies = (NSMutableArray *)v33;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v35 = objc_claimAutoreleasedReturnValue();
    longHIDLatencies = v8->_longHIDLatencies;
    v8->_longHIDLatencies = (NSMutableArray *)v35;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v37 = objc_claimAutoreleasedReturnValue();
    allHIDLatencies = v8->_allHIDLatencies;
    v8->_allHIDLatencies = (NSMutableArray *)v37;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v39 = objc_claimAutoreleasedReturnValue();
    longRenders = v8->_longRenders;
    v8->_longRenders = (NSMutableArray *)v39;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v41 = objc_claimAutoreleasedReturnValue();
    allRenders = v8->_allRenders;
    v8->_allRenders = (NSMutableArray *)v41;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v43 = objc_claimAutoreleasedReturnValue();
    longFrameLifetimes = v8->_longFrameLifetimes;
    v8->_longFrameLifetimes = (NSMutableArray *)v43;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v45 = objc_claimAutoreleasedReturnValue();
    allFrameLifetimes = v8->_allFrameLifetimes;
    v8->_allFrameLifetimes = (NSMutableArray *)v45;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v47 = objc_claimAutoreleasedReturnValue();
    longContributedFrameLifetimes = v8->_longContributedFrameLifetimes;
    v8->_longContributedFrameLifetimes = (NSMutableArray *)v47;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v49 = objc_claimAutoreleasedReturnValue();
    allContributedFrameLifetimes = v8->_allContributedFrameLifetimes;
    v8->_allContributedFrameLifetimes = (NSMutableArray *)v49;

  }
  return v8;
}

- (NSMutableArray)longFrameLatencies
{
  return self->_longFrameLatencies;
}

- (NSMutableArray)longTransactionLifetimes
{
  return self->_longTransactionLifetimes;
}

- (NSMutableArray)longSystemwideClientDrawableIntervals
{
  return self->_longSystemwideClientDrawableIntervals;
}

- (NSMutableArray)longClientDrawableIntervals
{
  return self->_longClientDrawableIntervals;
}

- (NSMutableArray)allTransactionLifetimes
{
  return self->_allTransactionLifetimes;
}

- (NSMutableArray)allSystemwideClientDrawableIntervals
{
  return self->_allSystemwideClientDrawableIntervals;
}

- (NSMutableArray)allClientDrawableIntervals
{
  return self->_allClientDrawableIntervals;
}

- (void)_handleClientDrawableInterval:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5
{
  _BOOL4 v6;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a4;
  v18 = a3;
  v8 = objc_msgSend(v18, "pid");
  -[SignpostAnimationAccumulatedState animationBeginEvent](self, "animationBeginEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "processID");

  if (v8 == v10)
  {
    if (a5)
    {
      -[SignpostAnimationAccumulatedState allClientDrawableIntervals](self, "allClientDrawableIntervals");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v18);

      if (v6)
      {
        -[SignpostAnimationAccumulatedState longClientDrawableIntervals](self, "longClientDrawableIntervals");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

        goto LABEL_6;
      }
      goto LABEL_13;
    }
    if (!v6)
    {
      -[SignpostAnimationAccumulatedState allClientDrawableIntervals](self, "allClientDrawableIntervals");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v18);

      goto LABEL_13;
    }
    -[SignpostAnimationAccumulatedState longClientDrawableIntervals](self, "longClientDrawableIntervals");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v18);

  }
  else
  {
    if (a5)
    {
LABEL_6:
      -[SignpostAnimationAccumulatedState allSystemwideClientDrawableIntervals](self, "allSystemwideClientDrawableIntervals");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v18);

      if (!v6)
        goto LABEL_15;
      goto LABEL_11;
    }
    if (!v6)
    {
LABEL_13:
      -[SignpostAnimationAccumulatedState allSystemwideClientDrawableIntervals](self, "allSystemwideClientDrawableIntervals");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
  }
LABEL_11:
  -[SignpostAnimationAccumulatedState longSystemwideClientDrawableIntervals](self, "longSystemwideClientDrawableIntervals");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
  v17 = v15;
  objc_msgSend(v15, "addObject:", v18);

LABEL_15:
}

- (void)_handleTransactionLifetimeInterval:(id)a3 isLong:(BOOL)a4 isConcise:(BOOL)a5
{
  _BOOL4 v6;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v14 = a3;
  v8 = objc_msgSend(v14, "pid");
  -[SignpostAnimationAccumulatedState animationBeginEvent](self, "animationBeginEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "processID");

  if (v8 == v10)
  {
    if (a5)
    {
      -[SignpostAnimationAccumulatedState allTransactionLifetimes](self, "allTransactionLifetimes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v14);

      if (!v6)
        goto LABEL_9;
    }
    else if (!v6)
    {
      -[SignpostAnimationAccumulatedState allTransactionLifetimes](self, "allTransactionLifetimes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    -[SignpostAnimationAccumulatedState longTransactionLifetimes](self, "longTransactionLifetimes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v13 = v12;
    objc_msgSend(v12, "addObject:", v14);

  }
LABEL_9:

}

- (void)addCompositorInterval:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SignpostAnimationAccumulatedState compositorIntervals](self, "compositorIntervals");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSMutableArray)compositorIntervals
{
  return self->_compositorIntervals;
}

- (NSMutableArray)longContributedFrameLifetimes
{
  return self->_longContributedFrameLifetimes;
}

- (NSMutableArray)allContributedFrameLifetimes
{
  return self->_allContributedFrameLifetimes;
}

@end
