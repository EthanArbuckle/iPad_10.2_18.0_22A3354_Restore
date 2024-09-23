@implementation NSDateFormatter

void __79__NSDateFormatter_TVPlaybackAdditions__tvp_ISO8601CombinedDateAndTimeFormatter__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss'Z'"));
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTimeZone:", v1);

  v2 = (void *)tvp_ISO8601CombinedDateAndTimeFormatter_iso8601Formatter;
  tvp_ISO8601CombinedDateAndTimeFormatter_iso8601Formatter = (uint64_t)v0;

}

void __64__NSDateFormatter_TVPlaybackAdditions__tvp_RFC1123DateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)tvp_RFC1123DateFormatter_rfc1123Formatter;
  tvp_RFC1123DateFormatter_rfc1123Formatter = (uint64_t)v0;

  objc_msgSend((id)tvp_RFC1123DateFormatter_rfc1123Formatter, "setFormatterBehavior:", 1040);
  objc_msgSend((id)tvp_RFC1123DateFormatter_rfc1123Formatter, "setDateFormat:", CFSTR("EEE, dd MMM yyyy HH:mm:ss zzz"));
  v2 = (void *)tvp_RFC1123DateFormatter_rfc1123Formatter;
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  v4 = (void *)tvp_RFC1123DateFormatter_rfc1123Formatter;
  objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCalendar:", v5);

}

void __63__NSDateFormatter_TVPlaybackAdditions__tvp_RFC850DateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)tvp_RFC850DateFormatter_rfc850Formatter;
  tvp_RFC850DateFormatter_rfc850Formatter = (uint64_t)v0;

  objc_msgSend((id)tvp_RFC850DateFormatter_rfc850Formatter, "setFormatterBehavior:", 1040);
  objc_msgSend((id)tvp_RFC850DateFormatter_rfc850Formatter, "setDateFormat:", CFSTR("EEEE, dd-MMM-yyyy HH:mm:ss zzz"));
  v2 = (void *)tvp_RFC850DateFormatter_rfc850Formatter;
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  v4 = (void *)tvp_RFC850DateFormatter_rfc850Formatter;
  objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCalendar:", v5);

}

void __64__NSDateFormatter_TVPlaybackAdditions__tvp_asctimeDateFormatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)tvp_asctimeDateFormatter_asctimeFormatter;
  tvp_asctimeDateFormatter_asctimeFormatter = (uint64_t)v0;

  objc_msgSend((id)tvp_asctimeDateFormatter_asctimeFormatter, "setFormatterBehavior:", 1040);
  objc_msgSend((id)tvp_asctimeDateFormatter_asctimeFormatter, "setDateFormat:", CFSTR("EEE MMM dd HH:mm:ss yyyy"));
  v2 = (void *)tvp_asctimeDateFormatter_asctimeFormatter;
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  v4 = (void *)tvp_asctimeDateFormatter_asctimeFormatter;
  objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCalendar:", v5);

}

@end
