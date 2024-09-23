@implementation PLCMMDateStringForStartAndEndDates

void ___PLCMMDateStringForStartAndEndDates_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[PLDateRangeFormatter autoupdatingFormatterWithPreset:](PLDateRangeFormatter, "autoupdatingFormatterWithPreset:", 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_PLCMMDateStringForStartAndEndDates__dateRangeFormatter;
  _PLCMMDateStringForStartAndEndDates__dateRangeFormatter = v0;

}

@end
