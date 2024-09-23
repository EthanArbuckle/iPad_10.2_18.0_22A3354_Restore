@implementation SBHIconImageCacheRequest

- (SBHIconImageCacheRequest)init
{
  void *v3;
  SBHIconImageCacheRequest *v4;

  +[SBHIconImageAppearance defaultAppearance](SBHIconImageAppearance, "defaultAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (SBHIconImageCacheRequest *)-[SBHIconImageCacheRequest initWithIcon:imageAppearance:priority:reason:imageGeneration:masked:options:sharedCancellation:completionHandler:]((id *)&self->super.isa, 0, v3, (void *)2, 0, 0, 0, 0, 0, 0);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_imageAppearance, 0);
  objc_storeStrong((id *)&self->_cancellation, 0);
  objc_storeStrong((id *)&self->_sharedCancellation, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)initWithIcon:(void *)a3 imageAppearance:(void *)a4 priority:(void *)a5 reason:(void *)a6 imageGeneration:(char)a7 masked:(void *)a8 options:(void *)a9 sharedCancellation:(void *)a10 completionHandler:
{
  id v17;
  id v18;
  id v19;
  id v20;
  id *v21;
  id v22;
  id v23;
  SBHIconImageCacheCancellation *v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  id v34;
  objc_super v35;

  v34 = a2;
  v17 = a3;
  v18 = a5;
  v19 = a9;
  v20 = a10;
  if (a1)
  {
    v35.receiver = a1;
    v35.super_class = (Class)SBHIconImageCacheRequest;
    v21 = (id *)objc_msgSendSuper2(&v35, sel_init);
    a1 = v21;
    if (v21)
    {
      objc_storeStrong(v21 + 4, a2);
      v22 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
      v23 = a1[3];
      a1[3] = v22;

      objc_storeStrong(a1 + 5, a9);
      v24 = objc_alloc_init(SBHIconImageCacheCancellation);
      v25 = a1[6];
      a1[6] = v24;

      v26 = objc_msgSend(v17, "copy");
      v27 = a1[7];
      a1[7] = (id)v26;

      a1[9] = a4;
      v28 = objc_msgSend(v18, "copy");
      v29 = a1[10];
      a1[10] = (id)v28;

      a1[8] = a6;
      *((_BYTE *)a1 + 16) = a7;
      a1[11] = a8;
      v30 = objc_msgSend(v20, "copy");
      v31 = a1[12];
      a1[12] = (id)v30;

      a1[13] = (id)mach_continuous_time();
    }
  }

  return a1;
}

- (uint64_t)isCancelled
{
  uint64_t v1;
  _BYTE *v2;

  if (!a1)
    return 0;
  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(id *)(a1 + 48);
  if (v2 && (v2[8] & 1) != 0)
  {
    v1 = 1;
  }
  else if (v1)
  {
    v1 = *(_BYTE *)(v1 + 8) & 1;
  }

  return v1;
}

- (uint64_t)callCompletionHandlersWithResult:(uint64_t)result
{
  uint64_t v2;
  double v4;

  if (result)
  {
    v2 = result;
    if ((*(_BYTE *)(result + 21) & 1) == 0)
    {
      *(_QWORD *)(result + 8) = mach_continuous_time();
      *(_BYTE *)(v2 + 21) = 1;
      v4 = -[SBHIconImageCacheRequest elapsedTime](v2);
      result = *(_QWORD *)(v2 + 96);
      if (result)
        return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, double))(result + 16))(result, a2, *(_QWORD *)(v2 + 104), v4);
    }
  }
  return result;
}

- (uint64_t)matchesIcon:(uint64_t)result
{
  if (result)
    return BSEqualObjects();
  return result;
}

- (double)elapsedTime
{
  double result;

  if (!a1)
    return 0.0;
  if (!*(_QWORD *)(a1 + 8))
    mach_continuous_time();
  BSTimeDifferenceFromMachTimeToMachTime();
  return result;
}

- (void)cancel
{
  if (self)
    self = (SBHIconImageCacheRequest *)self->_cancellation;
  -[SBHIconImageCacheRequest cancel](self, "cancel");
}

- (NSString)description
{
  return (NSString *)-[SBHIconImageCacheRequest descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHIconImageCacheRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHIconImageCacheRequest descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  SBIcon *icon;
  id v8;
  id v9;
  unint64_t priority;
  const __CFString *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _BOOL8 completedBackgroundFileWork;
  id v19;
  id v20;
  _BOOL8 finished;
  id v22;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  -[SBHIconImageCacheRequest succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self)
  {
    v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
    icon = self->_icon;
  }
  else
  {
    v24 = (id)objc_msgSend(v4, "appendObject:withName:", 0, CFSTR("identifier"));
    icon = 0;
  }
  v8 = (id)objc_msgSend(v5, "appendObject:withName:", icon, CFSTR("identifier"));
  if (self)
  {
    v9 = (id)objc_msgSend(v5, "appendObject:withName:", self->_imageAppearance, CFSTR("imageAppearance"));
    priority = self->_priority;
    if (priority >= 5)
      v11 = 0;
    else
      v11 = off_1E8D85040[priority];
  }
  else
  {
    v25 = (id)objc_msgSend(v5, "appendObject:withName:", 0, CFSTR("imageAppearance"));
    v11 = CFSTR("background");
  }
  v12 = (id)objc_msgSend(v5, "appendObject:withName:", v11, CFSTR("priority"));
  if (self)
  {
    v13 = (id)objc_msgSend(v5, "appendObject:withName:", self->_reason, CFSTR("reason"));
    v14 = (id)objc_msgSend(v5, "appendUnsignedInteger:withName:", self->_imageGeneration, CFSTR("imageGeneration"));
    v15 = (id)objc_msgSend(v5, "appendBool:withName:", self->_masked, CFSTR("isMasked"));
    v16 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", self->_completedBackgroundFetch, CFSTR("hasCompletedBackgroundFetch"), 1);
    v17 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", self->_completedInitialBackgroundCacheWork, CFSTR("hasCompletedInitialBackgroundCacheWork"), 1);
    completedBackgroundFileWork = self->_completedBackgroundFileWork;
  }
  else
  {
    v26 = (id)objc_msgSend(v5, "appendObject:withName:", 0, CFSTR("reason"));
    v27 = (id)objc_msgSend(v5, "appendUnsignedInteger:withName:", 0, CFSTR("imageGeneration"));
    v28 = (id)objc_msgSend(v5, "appendBool:withName:", 0, CFSTR("isMasked"));
    v29 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", 0, CFSTR("hasCompletedBackgroundFetch"), 1);
    v30 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", 0, CFSTR("hasCompletedInitialBackgroundCacheWork"), 1);
    completedBackgroundFileWork = 0;
  }
  v19 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", completedBackgroundFileWork, CFSTR("hasCompletedBackgroundFileWork"), 1);
  v20 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", -[SBHIconImageCacheRequest isCancelled]((uint64_t)self), CFSTR("isCancelled"), 1);
  if (self)
    finished = self->_finished;
  else
    finished = 0;
  v22 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", finished, CFSTR("isFinished"), 1);
  return v5;
}

@end
