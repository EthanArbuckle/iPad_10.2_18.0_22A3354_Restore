@implementation WBSAccountManagerDateFormatter

+ (NSDateFormatter)dateFormatterWithDynamicContext
{
  if (dateFormatterWithDynamicContext_onceToken != -1)
    dispatch_once(&dateFormatterWithDynamicContext_onceToken, &__block_literal_global);
  return (NSDateFormatter *)(id)dateFormatterWithDynamicContext_dateFormatter;
}

uint64_t __65__WBSAccountManagerDateFormatter_dateFormatterWithDynamicContext__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)dateFormatterWithDynamicContext_dateFormatter;
  dateFormatterWithDynamicContext_dateFormatter = (uint64_t)v0;

  objc_msgSend((id)dateFormatterWithDynamicContext_dateFormatter, "setTimeStyle:", 0);
  objc_msgSend((id)dateFormatterWithDynamicContext_dateFormatter, "setDateStyle:", 1);
  objc_msgSend((id)dateFormatterWithDynamicContext_dateFormatter, "setDoesRelativeDateFormatting:", 1);
  return objc_msgSend((id)dateFormatterWithDynamicContext_dateFormatter, "setFormattingContext:", 1);
}

+ (NSDateFormatter)dateFormatterWithStandaloneContext
{
  if (dateFormatterWithStandaloneContext_onceToken != -1)
    dispatch_once(&dateFormatterWithStandaloneContext_onceToken, &__block_literal_global_1);
  return (NSDateFormatter *)(id)dateFormatterWithStandaloneContext_dateFormatter;
}

uint64_t __68__WBSAccountManagerDateFormatter_dateFormatterWithStandaloneContext__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)dateFormatterWithStandaloneContext_dateFormatter;
  dateFormatterWithStandaloneContext_dateFormatter = (uint64_t)v0;

  objc_msgSend((id)dateFormatterWithStandaloneContext_dateFormatter, "setTimeStyle:", 0);
  objc_msgSend((id)dateFormatterWithStandaloneContext_dateFormatter, "setDateStyle:", 1);
  objc_msgSend((id)dateFormatterWithStandaloneContext_dateFormatter, "setDoesRelativeDateFormatting:", 1);
  return objc_msgSend((id)dateFormatterWithStandaloneContext_dateFormatter, "setFormattingContext:", 2);
}

@end
