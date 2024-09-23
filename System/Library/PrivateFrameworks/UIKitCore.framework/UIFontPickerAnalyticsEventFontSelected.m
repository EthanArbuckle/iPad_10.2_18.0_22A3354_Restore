@implementation UIFontPickerAnalyticsEventFontSelected

id ___UIFontPickerAnalyticsEventFontSelected_block_invoke(uint64_t a1)
{
  const __CFString *v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("selectedFont");
  v3[1] = CFSTR("selectedFontFamily");
  v1 = *(const __CFString **)(a1 + 40);
  if (!v1)
    v1 = CFSTR("unknownFamilyName");
  v4[0] = *(_QWORD *)(a1 + 32);
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
