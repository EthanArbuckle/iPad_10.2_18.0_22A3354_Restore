@implementation UIFeedbackCoreHapticsPlayer

void __76___UIFeedbackCoreHapticsPlayer__internal_createEventsForLegacyFeedbackData___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "audioParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_internal_createFixedParameterForParameters:withKey:forEventType:", v4, v9, *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v5);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "hapticParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_internal_createFixedParameterForParameters:withKey:forEventType:", v7, v9, *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v8);

}

void __108___UIFeedbackCoreHapticsPlayer__internal_createEventsForFileFeedbackData_engine_parameters_parameterCurves___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)qword_1ECD7AA30;
  qword_1ECD7AA30 = (uint64_t)v0;

}

void __108___UIFeedbackCoreHapticsPlayer__internal_createEventsForFileFeedbackData_engine_parameters_parameterCurves___block_invoke_98(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "audioParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  getCHHapticEventTypeAudioCustom();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_internal_createFixedParameterForParameters:withKey:forEventType:", v6, v5, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
    v8 = v9;
  }

}

uint64_t __66___UIFeedbackCoreHapticsPlayer__updateValueForParameters_withKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_updateValueForParameters:withKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __53___UIFeedbackCoreHapticsPlayer__playFeedback_atTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_playFeedbackData:forFeedback:atTime:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

uint64_t __46___UIFeedbackCoreHapticsPlayer__stopFeedback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_stopFeedbackData:forFeedback:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
