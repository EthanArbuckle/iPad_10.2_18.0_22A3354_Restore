@implementation SBClockIconInitialize

void ___SBClockIconInitialize_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)__tickClients;
  __tickClients = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)__calendar;
  __calendar = v2;

  v4 = (void *)__calendar;
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__handleTimeChange_, *MEMORY[0x1E0DC4838], 0);

}

@end
