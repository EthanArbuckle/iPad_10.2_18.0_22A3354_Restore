@implementation WFSoundRecognitionTrigger

id __100__WFSoundRecognitionTrigger_BiomeContext__shouldFireInResponseToEvent_triggerIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0DD9C10];
  v4 = a2;
  if (objc_msgSend(v3, "isApplianceSoundDetectionType:", v4))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  objc_msgSend(MEMORY[0x1E0DD9C10], "bmTypeForAXSDSoundDetectionType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
