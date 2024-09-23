@implementation TIStatisticsEngagementDescriptionToLegacyDescriptionDictionary

void __TIStatisticsEngagementDescriptionToLegacyDescriptionDictionary_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("noMatchUserInpt");
  v2[1] = CFSTR("moderatMatchUserInpt");
  v3[0] = CFSTR("noMatchUserInpt");
  v3[1] = CFSTR("moderatMatchUserInpt");
  v2[2] = CFSTR("mildMatchUserInpt");
  v2[3] = CFSTR("exactMatchUserInpt");
  v3[2] = CFSTR("mildMatchUserInpt");
  v3[3] = CFSTR("exactMatchUserInpt");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TIStatisticsEngagementDescriptionToLegacyDescriptionDictionary_dict;
  TIStatisticsEngagementDescriptionToLegacyDescriptionDictionary_dict = v0;

}

@end
