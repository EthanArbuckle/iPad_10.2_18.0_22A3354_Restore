@implementation STFormattedShortDate

uint64_t __STFormattedShortDate_block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v3 = (void *)STFormattedShortDate__formatter;
  STFormattedShortDate__formatter = (uint64_t)v2;

  objc_msgSend((id)STFormattedShortDate__formatter, "setDateStyle:", 1);
  objc_msgSend((id)STFormattedShortDate__formatter, "setTimeStyle:", *(unsigned __int8 *)(a1 + 32));
  objc_msgSend((id)STFormattedShortDate__formatter, "setDoesRelativeDateFormatting:", 1);
  return objc_msgSend((id)STFormattedShortDate__formatter, "setFormattingContext:", 2);
}

@end
