@implementation WBSTranslationScrollInteractionAnalyticsHelper

- (WBSTranslationScrollInteractionAnalyticsHelper)init
{
  WBSTranslationScrollInteractionAnalyticsHelper *v2;
  WBSTranslationScrollInteractionAnalyticsHelper *v3;
  id submissionHandler;
  uint64_t v5;
  NSDate *translationStartTime;
  WBSTranslationScrollInteractionAnalyticsHelper *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBSTranslationScrollInteractionAnalyticsHelper;
  v2 = -[WBSTranslationScrollInteractionAnalyticsHelper init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_synchronousIvarLock._os_unfair_lock_opaque = 0;
    submissionHandler = v2->_submissionHandler;
    v2->_submissionHandler = &__block_literal_global_57;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = objc_claimAutoreleasedReturnValue();
    translationStartTime = v3->_translationStartTime;
    v3->_translationStartTime = (NSDate *)v5;

    v7 = v3;
  }

  return v3;
}

void __54__WBSTranslationScrollInteractionAnalyticsHelper_init__block_invoke(float a1, uint64_t a2, uint64_t a3)
{
  double v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D8A0A8], "sharedLogger");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a1;
  objc_msgSend(v6, "reportFirstInteractionAfterTranslation:maxVisibleHeightPercentage:", a3, v5);

}

- (void)recordFirstInteractionIfNeeded
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __80__WBSTranslationScrollInteractionAnalyticsHelper_recordFirstInteractionIfNeeded__block_invoke;
  v2[3] = &unk_1E5441CB8;
  v2[4] = self;
  performWithLock(&self->_synchronousIvarLock, v2);
}

double __80__WBSTranslationScrollInteractionAnalyticsHelper_recordFirstInteractionIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v3;
  double result;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 32))
  {
    objc_msgSend(*(id *)(v1 + 16), "timeIntervalSinceNow");
    result = -v3;
    *(double *)(*(_QWORD *)(a1 + 32) + 24) = result;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  }
  return result;
}

- (void)updateMaxVisibleHeightPercentage:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__WBSTranslationScrollInteractionAnalyticsHelper_updateMaxVisibleHeightPercentage___block_invoke;
  v3[3] = &unk_1E5443130;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  performWithLock(&self->_synchronousIvarLock, v3);
}

uint64_t __83__WBSTranslationScrollInteractionAnalyticsHelper_updateMaxVisibleHeightPercentage___block_invoke(uint64_t result)
{
  uint64_t v1;
  double v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(double *)(result + 40);
  if (*(_BYTE *)(v1 + 32))
    v2 = fmax(v2, *(double *)(v1 + 40));
  *(double *)(v1 + 40) = v2;
  return result;
}

- (void)_calculateFirstInteractionDelayAndMaxPercentageWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, float);
  _QWORD v5[7];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = (void (**)(id, _QWORD, float))a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __112__WBSTranslationScrollInteractionAnalyticsHelper__calculateFirstInteractionDelayAndMaxPercentageWithCompletion___block_invoke;
  v5[3] = &unk_1E5446FB0;
  v5[4] = self;
  v5[5] = &v10;
  v5[6] = &v6;
  performWithLock(&self->_synchronousIvarLock, v5);
  v4[2](v4, v11[3], v7[6]);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);

}

float __112__WBSTranslationScrollInteractionAnalyticsHelper__calculateFirstInteractionDelayAndMaxPercentageWithCompletion___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  unint64_t v2;
  double v3;
  float result;

  v1 = a1[4];
  if (*(_BYTE *)(v1 + 32))
    v2 = llround(*(double *)(v1 + 24) * 1000.0);
  else
    v2 = -1;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v2;
  v3 = *(double *)(a1[4] + 40);
  if (v3 >= 1.0)
    v3 = 1.0;
  result = v3;
  *(float *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[WBSTranslationScrollInteractionAnalyticsHelper _calculateFirstInteractionDelayAndMaxPercentageWithCompletion:](self, "_calculateFirstInteractionDelayAndMaxPercentageWithCompletion:", self->_submissionHandler);
  v3.receiver = self;
  v3.super_class = (Class)WBSTranslationScrollInteractionAnalyticsHelper;
  -[WBSTranslationScrollInteractionAnalyticsHelper dealloc](&v3, sel_dealloc);
}

- (id)submissionHandler
{
  return self->_submissionHandler;
}

- (void)setSubmissionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_submissionHandler, 0);
  objc_storeStrong((id *)&self->_translationStartTime, 0);
}

@end
