@implementation VUIUpdateMPMediaEntityPropertyDescriptors

uint64_t __VUIUpdateMPMediaEntityPropertyDescriptors_block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = objc_msgSend(v3, "unsignedIntegerValue");

  return objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v4, "vui_MPMediaItemColorCapabilityFromVUIMediaEntityColorCapability:", v5));
}

uint64_t __VUIUpdateMPMediaEntityPropertyDescriptors_block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = objc_msgSend(v3, "unsignedIntegerValue");

  return objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v4, "vui_MPMediaItemColorCapabilityFromVUIMediaEntityColorCapability:", v5));
}

uint64_t __VUIUpdateMPMediaEntityPropertyDescriptors_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "persistentID");
}

id __VUIUpdateMPMediaEntityPropertyDescriptors_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CC2428];
  v6 = (void *)MEMORY[0x1E0CC2430];
  v7 = a4;
  objc_msgSend(v5, "vui_mediaEntityTypePredicate:comparison:", v7, objc_msgSend(v6, "vui_mediaPropertyPredicateComparisonWithPredicateOperatorType:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __VUIUpdateMPMediaEntityPropertyDescriptors_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  uint64_t v6;

  v5 = (void *)MEMORY[0x1E0CC2428];
  v6 = objc_msgSend(a4, "BOOLValue");
  return objc_msgSend(v5, "vui_isLocalPredicate:comparison:", v6, objc_msgSend(MEMORY[0x1E0CC2430], "vui_mediaPropertyPredicateComparisonWithPredicateOperatorType:", a3));
}

uint64_t __VUIUpdateMPMediaEntityPropertyDescriptors_block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = objc_msgSend(v3, "unsignedIntegerValue");

  return objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v4, "vui_MPMediaItemColorCapabilityFromVUIMediaEntityColorCapability:", v5));
}

uint64_t __VUIUpdateMPMediaEntityPropertyDescriptors_block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = objc_msgSend(v3, "unsignedIntegerValue");

  return objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v4, "vui_MPMediaItemAudioCapabilityFromVUIMediaEntityAudioCapability:", v5));
}

uint64_t __VUIUpdateMPMediaEntityPropertyDescriptors_block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = objc_msgSend(v3, "unsignedIntegerValue");

  return objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v4, "vui_MPMediaItemColorCapabilityFromVUIMediaEntityColorCapability:", v5));
}

uint64_t __VUIUpdateMPMediaEntityPropertyDescriptors_block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = objc_msgSend(v3, "unsignedIntegerValue");

  return objc_msgSend(v2, "numberWithInteger:", objc_msgSend(v4, "vui_MPMediaItemAudioCapabilityFromVUIMediaEntityAudioCapability:", v5));
}

uint64_t __VUIUpdateMPMediaEntityPropertyDescriptors_block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "persistentID");
}

@end
