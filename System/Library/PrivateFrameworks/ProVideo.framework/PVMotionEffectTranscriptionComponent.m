@implementation PVMotionEffectTranscriptionComponent

- (void)setupTranscriptionParameters_NoLock:(id)a3 documentInfo:(const void *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  NSString *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSString *v30;
  __CFString *v31;
  BOOL v32;
  PCString v33;
  CMTime v34;

  v6 = a3;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertDocumentStatusIsLoadedOrReady");

  if (-[PVMotionEffectTranscriptionComponent isTranscription](self, "isTranscription"))
  {
    +[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap](PVMotionEffect, "motionEffectPropertyKeyToPublishedParameterNameMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Transcription"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v34.value = 0;
      PCString::set((PCString *)&v34, CFSTR("IsRecording"));
      v11 = *(_QWORD *)a4;
      -[PVMotionEffectComponent motionEffect](self, "motionEffect");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      OZXSetPublishedCheckBox((void *)v11, (PCString *)&v34, objc_msgSend(v12, "isRecording"));

      PCString::~PCString((PCString *)&v34);
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Transcription"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      LOBYTE(v11) = objc_opt_isKindOfClass();

      if ((v11 & 1) != 0)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Transcription"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("TranscriptionArray"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("TranscriptionFormattedString"));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        memset(&v34, 0, sizeof(v34));
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("TranscriptionTime"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
          objc_msgSend(v17, "CMTimeValue");
        else
          memset(&v34, 0, sizeof(v34));

        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("TranscriptionIsFinal"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "BOOLValue");

        OZXSetTranscription(*(_QWORD *)a4, v15, v16, &v34, v20);
        if (-[PVMotionEffectTranscriptionComponent isSingleWordTranscription](self, "isSingleWordTranscription"))
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("TranscriptionWordFadeOut"));
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v33.var0 = 0;
          PCString::set(&v33, v21);

          OZXSetPublishedCheckBox(*(void **)a4, &v33, v20);
          PCString::~PCString(&v33);
        }

      }
      PCString::PCString((PCString *)&v34, "TranscriptionLineShift");
      OZXAdjustTranscriptionLineSpacingForCurrentFont(*(_QWORD **)a4, (const PCString *)&v34);
      v32 = 0;
      OZXIsUsingSubstituteFont(*(_QWORD *)a4, &v32);
      v33.var0 = 0;
      PCString::set(&v33, CFSTR("EnableDynamicLineSpacing"));
      OZXSetPublishedCheckBox(*(void **)a4, &v33, v32);
      PCString::~PCString(&v33);
      PCString::~PCString((PCString *)&v34);
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RenderStartOffset"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      memset(&v34, 0, sizeof(v34));
      objc_msgSend(v22, "CMTimeValue");
      OZXSetTranscriptionMediaOffset(*(_QWORD *)a4, &v34);
    }
    -[PVMotionEffectTranscriptionComponent disableWordFadeOutIfNecessary_NoLock:](self, "disableWordFadeOutIfNecessary_NoLock:", a4);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TranscriptionLocale"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TranscriptionLocale"));
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      OZXSetTranscriptionLocale(*(_QWORD *)a4, v25);
      v26 = objc_msgSend(MEMORY[0x1E0C99DC8], "characterDirectionForLanguage:", v25);
      -[PVMotionEffectComponent motionEffect](self, "motionEffect");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "textComponent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setIsRightToLeft_NoLock:documentInfo:", v26 == 2, a4);

    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LiveTitleFontName"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LiveTitleFontName"));
      v30 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("LiveTitleFontName"));
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v34.value = 0;
      PCString::set((PCString *)&v34, v31);

      OZXSetPublishedTextFont(*(void **)a4, (PCString *)&v34, v30);
      PCString::~PCString((PCString *)&v34);

    }
  }

}

- (BOOL)isTranscription
{
  NSNumber *isTranscription;
  void *v4;
  void *v5;
  NSNumber *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSNumber *v10;
  NSNumber *v11;

  isTranscription = self->_isTranscription;
  if (!isTranscription)
  {
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentRegistryPropertyForKey:", CFSTR("effectType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isEqualToString:", CFSTR("LiveTitle")));
      v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v7 = self->_isTranscription;
      self->_isTranscription = v6;
    }
    else
    {
      -[PVMotionEffectComponent motionEffect](self, "motionEffect");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "effectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("6561CB61-577E-403C-A533-81E23A1B9308")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("A0F0CBC6-16F5-4973-B45D-7F15B90F17F8")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("4D82B147-6A27-42E2-AA56-C7CBA653D5B8")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("5645A248-34A3-4654-8CEB-AEE59C6F7BCB")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("58D36D1B-D0F8-4709-BD10-4DCF2CEC9FC3")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("3485E1D8-0A05-4EAF-859B-8930899EC5A8")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("15A33011-A4E4-44E8-9127-1766525161F3")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("A6409851-8835-43BC-BC4B-39B8AC431632")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("AB4E2A80-1B3B-4492-8E66-F655E123B106")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("7CDB9627-80F6-4024-8AE9-C14AE68A42F0")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("DCB06633-5C51-422E-9A10-2C63DF1C8054")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("F8663D3B-D1D6-4DEC-BA5B-016CFD5D1E41")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("7C600E39-6465-4495-8AA4-66935176CAA2")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("CA33687A-1B4E-4519-8CB1-69A4E2E8D74A")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("ED3EDF36-B5A1-42B4-9CAB-78CDB10494CD")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("D2542CC4-A256-493C-9546-81E17145A4A1")) & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("A4C8F76A-3336-4296-9C54-CA3ACC13ED61"));
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
      v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v11 = self->_isTranscription;
      self->_isTranscription = v10;

    }
    isTranscription = self->_isTranscription;
  }
  return -[NSNumber BOOLValue](isTranscription, "BOOLValue");
}

- (BOOL)isSingleWordTranscription
{
  NSNumber *isSingleWordTranscription;
  void *v4;
  void *v5;
  NSNumber *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSNumber *v10;
  NSNumber *v11;

  isSingleWordTranscription = self->_isSingleWordTranscription;
  if (!isSingleWordTranscription)
  {
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentRegistryPropertyForKey:", CFSTR("isSingleWordTranscription"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = v5;
      v7 = self->_isSingleWordTranscription;
      self->_isSingleWordTranscription = v6;
    }
    else
    {
      -[PVMotionEffectComponent motionEffect](self, "motionEffect");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "effectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("4D82B147-6A27-42E2-AA56-C7CBA653D5B8")) & 1) != 0)
        v9 = 1;
      else
        v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("5645A248-34A3-4654-8CEB-AEE59C6F7BCB"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
      v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v11 = self->_isSingleWordTranscription;
      self->_isSingleWordTranscription = v10;

    }
    isSingleWordTranscription = self->_isSingleWordTranscription;
  }
  return -[NSNumber BOOLValue](isSingleWordTranscription, "BOOLValue");
}

- (BOOL)disableWordFadeOutForPreview
{
  NSNumber *disableWordFadeOutForPreview;
  void *v4;
  void *v5;
  NSNumber *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSNumber *v10;
  NSNumber *v11;

  disableWordFadeOutForPreview = self->_disableWordFadeOutForPreview;
  if (!disableWordFadeOutForPreview)
  {
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentRegistryPropertyForKey:", CFSTR("disableWordFadeOutForPreview"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = v5;
      v7 = self->_disableWordFadeOutForPreview;
      self->_disableWordFadeOutForPreview = v6;
    }
    else
    {
      -[PVMotionEffectComponent motionEffect](self, "motionEffect");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "effectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("15A33011-A4E4-44E8-9127-1766525161F3"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
      v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v11 = self->_disableWordFadeOutForPreview;
      self->_disableWordFadeOutForPreview = v10;

    }
    disableWordFadeOutForPreview = self->_disableWordFadeOutForPreview;
  }
  return -[NSNumber BOOLValue](disableWordFadeOutForPreview, "BOOLValue");
}

- (void)clearTranscription
{
  id v3;

  if (-[PVMotionEffectTranscriptionComponent isTranscription](self, "isTranscription"))
  {
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "runEnsuringDocumentReadyAndLockingDocument:", &__block_literal_global_12);

  }
}

uint64_t __58__PVMotionEffectTranscriptionComponent_clearTranscription__block_invoke(uint64_t a1, uint64_t *a2)
{
  return OZXClearTranscription(*a2);
}

- (void)resetToDefaultTranscriptionForLocaleID:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  PVMotionEffectTranscriptionComponent *v8;

  v4 = a3;
  if (-[PVMotionEffectTranscriptionComponent isTranscription](self, "isTranscription"))
  {
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __79__PVMotionEffectTranscriptionComponent_resetToDefaultTranscriptionForLocaleID___block_invoke;
    v6[3] = &unk_1E64D5D28;
    v7 = v4;
    v8 = self;
    objc_msgSend(v5, "runEnsuringDocumentReadyAndLockingDocument:", v6);

  }
}

void __79__PVMotionEffectTranscriptionComponent_resetToDefaultTranscriptionForLocaleID___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  id v6;

  OZXSetTranscriptionLocale(*a2, *(NSString **)(a1 + 32));
  OZXResetToDefaultTranscription(*a2);
  v4 = objc_msgSend(MEMORY[0x1E0C99DC8], "characterDirectionForLanguage:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "motionEffect");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsRightToLeft_NoLock:documentInfo:", v4 == 2, a2);

}

- (void)setTranscriptionText:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (-[PVMotionEffectTranscriptionComponent isTranscription](self, "isTranscription"))
  {
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__PVMotionEffectTranscriptionComponent_setTranscriptionText___block_invoke;
    v6[3] = &unk_1E64D4B58;
    v7 = v4;
    objc_msgSend(v5, "runEnsuringDocumentReadyAndLockingDocument:", v6);

  }
}

uint64_t __61__PVMotionEffectTranscriptionComponent_setTranscriptionText___block_invoke(uint64_t a1, uint64_t *a2)
{
  return OZXSetTranscriptionText(*a2, *(NSString **)(a1 + 32));
}

- (BOOL)transcriptionHitTest:(CGPoint)a3 time:(id *)a4
{
  CGFloat y;
  CGFloat x;
  void *v8;
  BOOL v9;
  _QWORD v11[9];
  __int128 v12;
  int64_t var3;
  _QWORD v14[3];
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  y = a3.y;
  x = a3.x;
  if (!-[PVMotionEffectTranscriptionComponent isTranscription](self, "isTranscription"))
    return 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 11;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__PVMotionEffectTranscriptionComponent_transcriptionHitTest_time___block_invoke;
  v11[3] = &unk_1E64D69E0;
  v12 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  v11[4] = self;
  v11[5] = v14;
  *(CGFloat *)&v11[7] = x;
  *(CGFloat *)&v11[8] = y;
  v11[6] = &v16;
  objc_msgSend(v8, "runEnsuringDocumentReadyAndLockingDocument:", v11);

  v9 = *((_BYTE *)v17 + 24) != 0;
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __66__PVMotionEffectTranscriptionComponent_transcriptionHitTest_time___block_invoke(uint64_t a1, void **a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t result;
  __int128 v11;
  uint64_t v12;
  CMTime v13;

  objc_msgSend(*(id *)(a1 + 32), "motionEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timelineComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isForceRenderAtPosterFrameEnabled");

  memset(&v13, 0, sizeof(v13));
  objc_msgSend(*(id *)(a1 + 32), "motionEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timelineComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v11 = *(_OWORD *)(a1 + 72);
  v12 = *(_QWORD *)(a1 + 88);
  if (v8)
    objc_msgSend(v8, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v11, v6, a2);
  else
    memset(&v13, 0, sizeof(v13));

  result = OZXTranscriptionHitTest(*a2, *(CGPoint *)(a1 + 56), &v13, (BOOL *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)computeLoopMarkerBasedOnTranscription_NoLock:(const void *)a3
{
  void *v5;
  void *v6;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoaded");

  if (-[PVMotionEffectTranscriptionComponent isTranscription](self, "isTranscription"))
  {
    if (OZXSetLoopMarkerFromTranscription(*(void **)a3))
      NSLog(CFSTR("%s : could not set loop marker end for transcription"), "-[PVMotionEffectTranscriptionComponent computeLoopMarkerBasedOnTranscription_NoLock:]");
  }
}

- (void)disableWordFadeOutIfNecessary_NoLock:(const void *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  __CFString *v9;
  void *v10;
  void *v11;
  PCString v12;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoadedOrReady");

  if (-[PVMotionEffectTranscriptionComponent isTranscription](self, "isTranscription"))
  {
    +[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap](PVMotionEffect, "motionEffectPropertyKeyToPublishedParameterNameMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PVMotionEffectTranscriptionComponent shouldDisableWordFadeOut_NoLock:](self, "shouldDisableWordFadeOut_NoLock:", a3);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TranscriptionWordFadeOut"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12.var0 = 0;
    PCString::set(&v12, v9);

    OZXDisableElementWithPublishedParam(*(void **)a3, &v12, v8);
    v10 = *(void **)a3;
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    OZXTranscriptionSetShouldDisableFadeOut((uint64_t)v10, objc_msgSend(v11, "shouldDisableFadeOut"));

    PCString::~PCString(&v12);
  }
}

- (BOOL)shouldDisableWordFadeOut_NoLock:(const void *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  unsigned int v10;

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertDocumentIsLocked");

  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assertDocumentStatusIsLoadedOrReady");

  if (!-[PVMotionEffectTranscriptionComponent isTranscription](self, "isTranscription"))
    return 0;
  -[PVMotionEffectComponent motionEffect](self, "motionEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldDisableFadeOut");

  if (!v8)
    return 0;
  if (!-[PVMotionEffectTranscriptionComponent disableWordFadeOutForPreview](self, "disableWordFadeOutForPreview"))
    return 1;
  v10 = 0;
  OZXTranscriptionGetLineCount(*(_QWORD *)a3, &v10);
  return v10 < 3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transcriptionDuration
{
  void *v5;
  uint64_t *v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  __n128 (*v12)(__n128 *, __n128 *);
  uint64_t (*v13)();
  void *v14;
  __int128 v15;
  uint64_t v16;

  v9 = 0;
  v10 = &v9;
  v11 = 0x4812000000;
  v12 = __Block_byref_object_copy__6;
  v13 = __Block_byref_object_dispose__6;
  v14 = &unk_1B3948866;
  v15 = *MEMORY[0x1E0CA2E68];
  v16 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  if (-[PVMotionEffectTranscriptionComponent isTranscription](self, "isTranscription"))
  {
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__PVMotionEffectTranscriptionComponent_transcriptionDuration__block_invoke;
    v8[3] = &unk_1E64D6360;
    v8[4] = self;
    v8[5] = &v9;
    objc_msgSend(v5, "runEnsuringDocumentReadyAndLockingDocument:", v8);

  }
  v6 = v10;
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v10 + 3);
  retstr->var3 = v6[8];
  _Block_object_dispose(&v9, 8);
  return result;
}

double __61__PVMotionEffectTranscriptionComponent_transcriptionDuration__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  double result;
  __int128 v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "transcriptionDuration_NoLock:", a2);
  }
  else
  {
    v6 = 0uLL;
    v7 = 0;
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = *(double *)&v6;
  *(_OWORD *)(v4 + 48) = v6;
  *(_QWORD *)(v4 + 64) = v7;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transcriptionDuration_NoLock:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[PVMotionEffectTranscriptionComponent isTranscription](self, "isTranscription");
  if ((_DWORD)result)
    OZXGetTranscriptionDuration(*(_QWORD *)a4, (CMTime *)retstr);
  return result;
}

- (void)effect:(id)a3 updateProperties:(id)a4 allProperties:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PVMotionEffectTranscriptionComponent;
  -[PVMotionEffectComponent effect:updateProperties:allProperties:](&v14, sel_effect_updateProperties_allProperties_, v8, v9, v10);
  if (-[PVMotionEffectTranscriptionComponent isTranscription](self, "isTranscription"))
  {
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __78__PVMotionEffectTranscriptionComponent_effect_updateProperties_allProperties___block_invoke;
    v12[3] = &unk_1E64D5D28;
    v12[4] = self;
    v13 = v9;
    objc_msgSend(v11, "runWithDocument_NoLock:", v12);

  }
}

uint64_t __78__PVMotionEffectTranscriptionComponent_effect_updateProperties_allProperties___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setupTranscriptionParameters_NoLock:documentInfo:", *(_QWORD *)(a1 + 40), a2);
}

- (void)motionEffect:(id)a3 didLoad:(const void *)a4
{
  id v6;
  void *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PVMotionEffectTranscriptionComponent;
  -[PVMotionEffectComponent motionEffect:didLoad:](&v13, sel_motionEffect_didLoad_, v6, a4);
  if (-[PVMotionEffectTranscriptionComponent isTranscription](self, "isTranscription"))
  {
    OZXSetDuration(*(void **)a4, MEMORY[0x1E0CA2E10]);
    -[PVMotionEffectTranscriptionComponent computeLoopMarkerBasedOnTranscription_NoLock:](self, "computeLoopMarkerBasedOnTranscription_NoLock:", a4);
    v11 = 0uLL;
    v12 = 0;
    -[PVMotionEffectTranscriptionComponent transcriptionDuration_NoLock:](self, "transcriptionDuration_NoLock:", a4);
    -[PVMotionEffectComponent motionEffect](self, "motionEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timelineComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    v10 = v12;
    objc_msgSend(v8, "setLoopTimeOverride_NoLock:", &v9);

  }
}

- (void)motionEffect:(id)a3 didBecomeReady:(const void *)a4 properties:(id)a5
{
  id v8;
  id v9;
  objc_super v10;

  v8 = a3;
  v9 = a5;
  v10.receiver = self;
  v10.super_class = (Class)PVMotionEffectTranscriptionComponent;
  -[PVMotionEffectComponent motionEffect:didBecomeReady:properties:](&v10, sel_motionEffect_didBecomeReady_properties_, v8, a4, v9);
  if (-[PVMotionEffectTranscriptionComponent isTranscription](self, "isTranscription"))
    -[PVMotionEffectTranscriptionComponent setupTranscriptionParameters_NoLock:documentInfo:](self, "setupTranscriptionParameters_NoLock:documentInfo:", v9, a4);

}

+ (id)motionEffectPropertyKeyToPublishedParameterNameMap
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  objc_super v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PVMotionEffectTranscriptionComponent;
  objc_msgSendSuper2(&v7, sel_motionEffectPropertyKeyToPublishedParameterNameMap);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v8[0] = CFSTR("TranscriptionWordFadeOut");
  v8[1] = CFSTR("LiveTitleFontName");
  v9[0] = CFSTR("WordFadeOut");
  v9[1] = CFSTR("Font");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);
    v5 = v3;

    v4 = v5;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableWordFadeOutForPreview, 0);
  objc_storeStrong((id *)&self->_isSingleWordTranscription, 0);
  objc_storeStrong((id *)&self->_isTranscription, 0);
}

@end
