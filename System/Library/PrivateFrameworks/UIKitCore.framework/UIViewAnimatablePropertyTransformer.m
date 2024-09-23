@implementation UIViewAnimatablePropertyTransformer

uint64_t __76___UIViewAnimatablePropertyTransformer_presentationValueUpdatedForProgress___block_invoke(uint64_t a1)
{
  return __UIVIEWANIMATABLEPROPERTYTRANSFORMER_IS_EXECUTING_CALLBACK__(*(_QWORD *)(a1 + 32));
}

void __107___UIViewAnimatablePropertyTransformer_initWithInputAnimatableProperties_presentationValueChangedCallback___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD block[4];
  id v4;
  id v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107___UIViewAnimatablePropertyTransformer_initWithInputAnimatableProperties_presentationValueChangedCallback___block_invoke_2;
  block[3] = &unk_1E16E24E8;
  v6 = *(_QWORD *)(a1 + 48);
  v4 = v2;
  v5 = *(id *)(a1 + 40);
  dispatch_sync((dispatch_queue_t)v4, block);

}

uint64_t __79___UIViewAnimatablePropertyTransformer_presentationValueStabilizedForProgress___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return __UIVIEWANIMATABLEPROPERTYTRANSFORMER_IS_EXECUTING_CALLBACK__(result);
  return result;
}

uint64_t __76___UIViewAnimatablePropertyTransformer_presentationValueUpdatedForProgress___block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = 0;
  return result;
}

uint64_t __107___UIViewAnimatablePropertyTransformer_initWithInputAnimatableProperties_presentationValueChangedCallback___block_invoke_4(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

void __107___UIViewAnimatablePropertyTransformer_initWithInputAnimatableProperties_presentationValueChangedCallback___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    v3 = MEMORY[0x1E0C809B0];
    *(_BYTE *)(v1 + 24) = 1;
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __107___UIViewAnimatablePropertyTransformer_initWithInputAnimatableProperties_presentationValueChangedCallback___block_invoke_3;
    v6[3] = &unk_1E16C13C0;
    v7 = *(id *)(a1 + 32);
    v5 = *(_OWORD *)(a1 + 40);
    v4 = (id)v5;
    v8 = v5;
    UIViewInProcessAnimationManagerDispatchAsyncOntoMainBeforeTickExit((uint64_t)v6);

  }
}

uint64_t __107___UIViewAnimatablePropertyTransformer_initWithInputAnimatableProperties_presentationValueChangedCallback___block_invoke_3(_QWORD *a1)
{
  NSObject *v2;
  _QWORD block[5];

  v2 = a1[4];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107___UIViewAnimatablePropertyTransformer_initWithInputAnimatableProperties_presentationValueChangedCallback___block_invoke_4;
  block[3] = &unk_1E16B14C0;
  block[4] = a1[6];
  dispatch_sync(v2, block);
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

void __69___UIViewAnimatablePropertyTransformer_modelValueUpdatedForProgress___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "modelValueChangedCallback");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = v1;
    __UIVIEWANIMATABLEPROPERTYTRANSFORMER_IS_EXECUTING_CALLBACK__((uint64_t)v1);
    v1 = v2;
  }

}

void __79___UIViewAnimatablePropertyTransformer_presentationValueStabilizedForProgress___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "capturedProperties");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    objc_msgSend(v3, "addEntriesFromCompoundObjectMap:keepingCurrentValues:", v2, 1);
  objc_msgSend(v3, "performWithEach:", &__block_literal_global_634);
  if (objc_msgSend(*(id *)(a1 + 32), "clearsCapturesPropertiesOnStabilization"))
    objc_msgSend(v3, "removeAllMappings");

}

void __69___UIViewAnimatablePropertyTransformer_modelValueUpdatedForProgress___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "capturedProperties");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromCompoundObjectMap:keepingCurrentValues:", *(_QWORD *)(a1 + 40), 0);

}

void __76___UIViewAnimatablePropertyTransformer_presentationValueUpdatedForProgress___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "capturedProperties");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromCompoundObjectMap:keepingCurrentValues:", *(_QWORD *)(a1 + 40), 1);

}

uint64_t __79___UIViewAnimatablePropertyTransformer_presentationValueStabilizedForProgress___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stopSettingPresentationValueForKey:");
}

@end
