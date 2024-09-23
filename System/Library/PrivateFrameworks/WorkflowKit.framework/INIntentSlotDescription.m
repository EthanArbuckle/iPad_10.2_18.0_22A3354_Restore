@implementation INIntentSlotDescription

void __92__INIntentSlotDescription_Workflow__wf_updatedParameterDefinition_parameterClass_localizer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v13 = v5;
    v14[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "definitionByAddingEntriesInDictionary:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

@end
