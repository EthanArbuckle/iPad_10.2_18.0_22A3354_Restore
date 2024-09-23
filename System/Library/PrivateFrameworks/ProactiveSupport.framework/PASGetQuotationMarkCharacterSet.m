@implementation PASGetQuotationMarkCharacterSet

CFCharacterSetRef ___PASGetQuotationMarkCharacterSet_block_invoke()
{
  CFCharacterSetRef result;

  result = CFCharacterSetCreateWithCharactersInString(0, CFSTR("\"'«»‘’‚‛“”„‟‹›「」『』〝〞〟﹁﹂﹃﹄＂＇｢｣"));
  _PASGetQuotationMarkCharacterSet_quotationMarks = (uint64_t)result;
  return result;
}

@end
