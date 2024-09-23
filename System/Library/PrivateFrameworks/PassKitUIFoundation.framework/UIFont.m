@implementation UIFont

uint64_t __60__UIFont_PKPeerPaymentAdditions__pk_loadPeerPaymentCashFont__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "pk_loadFontWithFileName:", CFSTR("SFCash-Plain"));
  pk_loadPeerPaymentCashFont_result = result;
  return result;
}

uint64_t __69__UIFont_PKPeerPaymentAdditions__pk_loadTextCondensedRegularCashFont__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "pk_loadFontWithFileName:", CFSTR("SF-Cash-Text-Condensed-Regular"));
  pk_loadTextCondensedRegularCashFont_result = result;
  return result;
}

uint64_t __70__UIFont_PKPeerPaymentAdditions__pk_loadTextCondensedSemiboldCashFont__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "pk_loadFontWithFileName:", CFSTR("SF-Cash-Text-Condensed-Semibold"));
  pk_loadTextCondensedSemiboldCashFont_result = result;
  return result;
}

uint64_t __68__UIFont_PKPeerPaymentAdditions__pk_loadTextCondensedMediumCashFont__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_opt_class(), "pk_loadFontWithFileName:", CFSTR("SF-Cash-Text-Condensed-Medium"));
  pk_loadTextCondensedMediumCashFont_result = result;
  return result;
}

@end
