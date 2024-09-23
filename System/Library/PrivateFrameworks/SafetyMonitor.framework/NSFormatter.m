@implementation NSFormatter

void __42__NSFormatter_SMExtensions__dateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_14;
  _MergedGlobals_14 = v0;

  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_14, "setLocale:", v2);

}

uint64_t __50__NSFormatter_SMExtensions__relativeDateFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = objc_opt_new();
  v1 = (void *)qword_254415D00;
  qword_254415D00 = v0;

  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_254415D00, "setLocale:", v2);

  objc_msgSend((id)qword_254415D00, "setUnitsStyle:", 0);
  objc_msgSend((id)qword_254415D00, "setDateTimeStyle:", 1);
  return objc_msgSend((id)qword_254415D00, "setFormattingContext:", 1);
}

uint64_t __46__NSFormatter_SMExtensions__dateTimeFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = objc_opt_new();
  v1 = (void *)qword_254415D10;
  qword_254415D10 = v0;

  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_254415D10, "setLocale:", v2);

  objc_msgSend((id)qword_254415D10, "setDateStyle:", 0);
  return objc_msgSend((id)qword_254415D10, "setTimeStyle:", 1);
}

void __60__NSFormatter_SMExtensions__transcriptTimeIntervalFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v0 = objc_opt_new();
  v1 = (void *)qword_254415D20;
  qword_254415D20 = v0;

  objc_msgSend((id)qword_254415D20, "setUnitsStyle:", 3);
  objc_msgSend((id)qword_254415D20, "setAllowedUnits:", 96);
  objc_msgSend((id)qword_254415D20, "setIncludesApproximationPhrase:", 1);
  objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_254415D20, "setCalendar:", v2);

}

void __60__NSFormatter_SMExtensions__hourMinuteTimeIntervalFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v0 = objc_opt_new();
  v1 = (void *)qword_254415D30;
  qword_254415D30 = v0;

  objc_msgSend((id)qword_254415D30, "setUnitsStyle:", 3);
  objc_msgSend((id)qword_254415D30, "setAllowedUnits:", 96);
  objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_254415D30, "setCalendar:", v2);

}

void __65__NSFormatter_SMExtensions__hourMinuteShortTimeIntervalFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v0 = objc_opt_new();
  v1 = (void *)qword_254415D40;
  qword_254415D40 = v0;

  objc_msgSend((id)qword_254415D40, "setUnitsStyle:", 5);
  objc_msgSend((id)qword_254415D40, "setAllowedUnits:", 96);
  objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_254415D40, "setCalendar:", v2);

}

@end
