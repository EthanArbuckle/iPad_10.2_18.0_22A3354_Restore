@implementation PXStoryConcreteTransition

- (PXStoryConcreteTransition)initWithIdentifier:(id)a3 kind:(char)a4 duration:(id *)a5 event:(int64_t)a6
{
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  unsigned int v12;
  id v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  PXStoryConcreteTransition *v19;
  PXStoryConcreteTransition *v20;
  __int128 v21;
  objc_super v23;

  v12 = a4;
  v14 = a3;
  v15 = v14;
  if (!v14)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    if (v12 > 0xA)
      v17 = CFSTR("??");
    else
      v17 = off_1E5136018[v12];
    v6 = v17;
    v18 = CFSTR("undefined");
    if (a6 == 1)
      v18 = CFSTR("orderIn");
    if (a6 == 2)
      v18 = CFSTR("orderOut");
    v7 = v18;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("PXStoryConcreteTransition.%@.%@.%@"), v6, v7, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23.receiver = self;
  v23.super_class = (Class)PXStoryConcreteTransition;
  v19 = -[PXStoryAnimation initWithIdentifier:](&v23, sel_initWithIdentifier_, v15);
  v20 = v19;
  if (!v14)
  {

    if (!v20)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20->_kind = v12;
    v21 = *(_OWORD *)&a5->var0;
    v20->_duration.epoch = a5->var3;
    *(_OWORD *)&v20->_duration.value = v21;
    v20->_event = a6;
  }
LABEL_13:

  return v20;
}

- (PXStoryConcreteTransition)initWithKind:(char)a3 duration:(id *)a4 event:(int64_t)a5 clipLayouts:(id)a6
{
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  PXStoryConcreteTransition *v18;
  uint64_t v19;
  NSArray *clipLayouts;
  void *v21;
  float v22;
  __int128 v24;
  int64_t var3;

  v8 = a3;
  v10 = a6;
  _PXStoryIdentifierFromClipLayouts();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB3940];
  if (v8 > 0xA)
    v13 = CFSTR("??");
  else
    v13 = off_1E5136018[v8];
  v14 = v13;
  v15 = CFSTR("undefined");
  if (a5 == 1)
    v15 = CFSTR("orderIn");
  if (a5 == 2)
    v15 = CFSTR("orderOut");
  v16 = v15;
  objc_msgSend(v12, "stringWithFormat:", CFSTR("PXStoryConcreteTransition.%@.%@.%@"), v14, v16, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v18 = -[PXStoryConcreteTransition initWithIdentifier:kind:duration:event:](self, "initWithIdentifier:kind:duration:event:", v17, v8, &v24, a5);
  if (v18)
  {
    v19 = objc_msgSend(v10, "copy");
    clipLayouts = v18->_clipLayouts;
    v18->_clipLayouts = (NSArray *)v19;

    objc_msgSend(v10, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contentAlpha");
    v18->_initialClipAlpha = v22;

  }
  return v18;
}

- (PXStoryConcreteTransition)initWithKind:(char)a3 duration:(id *)a4 effect:(id)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v6 = *a4;
  return -[PXStoryConcreteTransition initWithKind:duration:effect:auxiliaryEffect:](self, "initWithKind:duration:effect:auxiliaryEffect:", a3, &v6, a5, 0);
}

- (PXStoryConcreteTransition)initWithKind:(char)a3 duration:(id *)a4 effect:(id)a5 auxiliaryEffect:(id)a6
{
  uint64_t v9;
  id v11;
  id v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  PXStoryConcreteTransition *v18;
  PXStoryConcreteTransition *v19;
  __int128 v21;
  int64_t var3;

  v9 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0CB3940];
  if (v9 > 0xA)
    v14 = CFSTR("??");
  else
    v14 = off_1E5136018[v9];
  v15 = v14;
  v16 = objc_opt_class();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("PXStoryConcreteTransition.%@.%@.%@"), v15, v16, objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v18 = -[PXStoryConcreteTransition initWithIdentifier:kind:duration:event:](self, "initWithIdentifier:kind:duration:event:", v17, v9, &v21, 0);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_effect, a5);
    objc_storeStrong((id *)&v19->_auxiliaryEffect, a6);
  }

  return v19;
}

- (BOOL)canBePaused
{
  return 0;
}

- (void)timeDidChange
{
  void *v3;
  void *v4;
  int32_t v5;
  CMTime v6;
  objc_super v7;
  CMTime time2;
  CMTime time1;

  v7.receiver = self;
  v7.super_class = (Class)PXStoryConcreteTransition;
  -[PXStoryAnimation timeDidChange](&v7, sel_timeDidChange);
  -[PXStoryAnimation time](self, "time");
  -[PXStoryConcreteTransition clipLayouts](self, "clipLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    memset(&time1, 0, sizeof(time1));
    -[PXStoryConcreteTransition _updateClipAlphaForTime:](self, "_updateClipAlphaForTime:", &time1);
  }
  else
  {
    -[PXStoryConcreteTransition effect](self, "effect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      memset(&time1, 0, sizeof(time1));
      -[PXStoryConcreteTransition configureEffectForTime:](self, "configureEffectForTime:", &time1);
    }
  }
  -[PXStoryConcreteTransition duration](self, "duration");
  memset(&time1, 0, sizeof(time1));
  time2 = v6;
  v5 = CMTimeCompare(&time1, &time2);
  if ((v5 & 0x80000000) == 0
    || (memset(&time1, 0, sizeof(time1)),
        *(_OWORD *)&time2.value = PXStoryTimeZero,
        time2.epoch = 0,
        CMTimeCompare(&time1, &time2) < 0))
  {
    -[PXStoryConcreteTransition _end:](self, "_end:", v5 >= 0);
  }
}

- (void)_updateClipAlphaForTime:(id *)a3
{
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17 = *a3;
  -[PXStoryConcreteTransition clipAlphaForTime:](self, "clipAlphaForTime:", &v17);
  v5 = v4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PXStoryConcreteTransition clipLayouts](self, "clipLayouts", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v14;
    v11 = v5;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        *(float *)&v8 = v11;
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setContentAlpha:", v8);
      }
      while (v9 != v12);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v9);
  }

}

- (void)wasStopped
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD);
  id completionHandler;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PXStoryConcreteTransition;
  -[PXStoryAnimation wasStopped](&v18, sel_wasStopped);
  -[PXStoryConcreteTransition initialClipAlpha](self, "initialClipAlpha");
  v4 = v3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PXStoryConcreteTransition clipLayouts](self, "clipLayouts", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v15;
    v10 = v4;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        *(float *)&v7 = v10;
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11++), "setContentAlpha:", v7);
      }
      while (v8 != v11);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v8);
  }

  -[PXStoryConcreteTransition completionHandler](self, "completionHandler");
  v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

    ((void (**)(_QWORD, BOOL))v12)[2](v12, -[PXStoryConcreteTransition finished](self, "finished"));
  }

}

- (void)_end:(BOOL)a3
{
  -[PXStoryConcreteTransition setFinished:](self, "setFinished:", a3);
  -[PXStoryAnimation performChanges:](self, "performChanges:", &__block_literal_global_12_36431);
}

- (double)progress
{
  double Seconds;
  double result;
  CMTime v5;
  CMTime v6;
  CMTime time;

  -[PXStoryConcreteTransition duration](self, "duration");
  time = v6;
  Seconds = CMTimeGetSeconds(&time);
  result = 1.0;
  if (Seconds > 0.0)
  {
    -[PXStoryAnimation time](self, "time", 1.0);
    time = v5;
    CMTimeGetSeconds(&time);
    PXClamp();
  }
  return result;
}

- (double)clipAlphaForTime:(id *)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransition.m"), 152, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXStoryConcreteTransition clipAlphaForTime:]", v7);

  abort();
}

- (void)configureEffectForTime:(id *)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransition.m"), 156, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXStoryConcreteTransition configureEffectForTime:]", v7);

  abort();
}

- (void)setPrimaryEffectAlpha:(double)a3 auxiliaryEffectAlpha:(double)a4
{
  void (**v6)(double, double);
  void (**v7)(double, double);

  -[PXStoryConcreteTransition effectAlphaHandler](self, "effectAlphaHandler");
  v6 = (void (**)(double, double))objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    v6[2](a3, a4);
    v6 = v7;
  }

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  id v15;
  objc_class *v16;
  void *v17;
  unsigned int v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  CMTime v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CMTime time;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[PXStoryConcreteTransition clipLayouts](self, "clipLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[PXStoryConcreteTransition clipLayouts](self, "clipLayouts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v10), "clip");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addIndex:", objc_msgSend(v11, "identifier"));

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v8);
    }

    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "px_shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR(" clips=%@"), v13);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = &stru_1E5149688;
  }
  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PXStoryConcreteTransition kind](self, "kind");
  if (v18 > 0xA)
    v19 = CFSTR("??");
  else
    v19 = off_1E5136018[v18];
  v20 = v19;
  -[PXStoryAnimation time](self, "time");
  time = v23;
  v21 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("<%@: %p; %@, t=%0.1f%@>"),
                  v17,
                  self,
                  v20,
                  CMTimeGetSeconds(&time),
                  v14);

  return (NSString *)v21;
}

- (char)kind
{
  return self->_kind;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[12];
  return self;
}

- (int64_t)event
{
  return self->_event;
}

- (id)effectAlphaHandler
{
  return self->_effectAlphaHandler;
}

- (void)setEffectAlphaHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSArray)clipLayouts
{
  return self->_clipLayouts;
}

- (PXGEffect)effect
{
  return self->_effect;
}

- (PXGEffect)auxiliaryEffect
{
  return self->_auxiliaryEffect;
}

- (double)initialClipAlpha
{
  return self->_initialClipAlpha;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryEffect, 0);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_storeStrong((id *)&self->_clipLayouts, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_effectAlphaHandler, 0);
}

uint64_t __34__PXStoryConcreteTransition__end___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stop");
}

@end
