@implementation PFStringFromDateTimeZoneFormat

void __PFStringFromDateTimeZoneFormat_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  PFDateFormatterForTimeZoneAndFormat(*(void **)(a1 + 32), *(void **)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __PFStringFromDateTimeZoneFormat_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("DateFormattersPropertyQueue", 0);
  v1 = (void *)dateQueue;
  dateQueue = (uint64_t)v0;

}

@end
