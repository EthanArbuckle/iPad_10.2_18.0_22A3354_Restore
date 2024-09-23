@implementation NSCalendar(VCSUtilities)

+ (id)VCS_gregorianGMTCalendar
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__NSCalendar_VCSUtilities__VCS_gregorianGMTCalendar__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (VCS_gregorianGMTCalendar_onceToken != -1)
    dispatch_once(&VCS_gregorianGMTCalendar_onceToken, block);
  return (id)VCS_gregorianGMTCalendar_gregorianGMTCalendar;
}

+ (id)VCS_gregorianLocalCalendar:()VCSUtilities
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0C99D48];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v6, "setTimeZone:", v4);

  return v6;
}

@end
