@implementation TIStatisticsCategoryToLegacyCategoryDictionary

void __TIStatisticsCategoryToLegacyCategoryDictionary_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[21];
  _QWORD v3[22];

  v3[21] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("1stPerson");
  v2[1] = CFSTR("3rdPerson");
  v3[0] = CFSTR("1stPersonCategory");
  v3[1] = CFSTR("3rdPersonCategory");
  v2[2] = CFSTR("contactAnyPhone");
  v2[3] = CFSTR("contactSpecificPhone");
  v3[2] = CFSTR("contactCategory.anyPhone");
  v3[3] = CFSTR("contactCategory.specificPhone");
  v2[4] = CFSTR("contactAddressWork");
  v2[5] = CFSTR("contactAddressHome");
  v3[4] = CFSTR("contactCategory.addressWork");
  v3[5] = CFSTR("contactCategory.addressHome");
  v2[6] = CFSTR("contactAnyAddress");
  v2[7] = CFSTR("contactFax");
  v3[6] = CFSTR("contactCategory.anyAddress");
  v3[7] = CFSTR("contactCategory.fax");
  v2[8] = CFSTR("contactEmail");
  v2[9] = CFSTR("contactFaceTime");
  v3[8] = CFSTR("contactCategory.email");
  v3[9] = CFSTR("contactCategory.facetime");
  v2[10] = CFSTR("contactBio");
  v2[11] = CFSTR("locationAutocompleteSendCurrentButton");
  v3[10] = CFSTR("contactCategory.bio");
  v3[11] = CFSTR("locationAutocomplete.sendCurrentButton");
  v2[12] = CFSTR("recentGenericAddress");
  v2[13] = CFSTR("recentAddress");
  v3[12] = CFSTR("recentCategory.genericAddress");
  v3[13] = CFSTR("recentCategory.address");
  v2[14] = CFSTR("recentPhone");
  v2[15] = CFSTR("eventAvailability");
  v3[14] = CFSTR("recentCategory.phone");
  v3[15] = CFSTR("eventCategory.availability");
  v2[16] = CFSTR("eventNext");
  v2[17] = CFSTR("money");
  v3[16] = CFSTR("eventCategory.next");
  v3[17] = CFSTR("moneyCategory");
  v2[18] = CFSTR("socialMedia");
  v2[19] = CFSTR("health");
  v3[18] = CFSTR("socialMediaCategory");
  v3[19] = CFSTR("healthCategory");
  v2[20] = CFSTR("navigation");
  v3[20] = CFSTR("navigationCategory");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 21);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TIStatisticsCategoryToLegacyCategoryDictionary_dict;
  TIStatisticsCategoryToLegacyCategoryDictionary_dict = v0;

}

@end
