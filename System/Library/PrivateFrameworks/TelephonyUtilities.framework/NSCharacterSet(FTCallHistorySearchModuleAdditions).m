@implementation NSCharacterSet(FTCallHistorySearchModuleAdditions)

+ (uint64_t)phoneNumberSeparatorCharacterSet
{
  return objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(" –_-()+"));
}

@end
