@implementation NSCalendar

void __52__NSCalendar_VCSUtilities__VCS_gregorianGMTCalendar__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "VCS_gregorianLocalCalendar:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)VCS_gregorianGMTCalendar_gregorianGMTCalendar;
  VCS_gregorianGMTCalendar_gregorianGMTCalendar = v2;

}

@end
