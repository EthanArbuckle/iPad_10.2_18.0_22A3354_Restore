@implementation SCLScheduleSettings(ViewModel)

+ (id)scheduleSettingsWithViewModel:()ViewModel
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE841D0]);
  objc_msgSend(v4, "setEnabled:", objc_msgSend(v3, "isEnabled"));
  switch(objc_msgSend(v3, "scheduleType"))
  {
    case 0:
      v9 = objc_alloc(MEMORY[0x24BE841D8]);
      v8 = (void *)objc_msgSend(v9, "initWithRecurrences:", MEMORY[0x24BDBD1A8]);
      break;
    case 1:
    case 2:
      v5 = objc_alloc(MEMORY[0x24BE841D8]);
      objc_msgSend(v3, "timeIntervals");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "initWithTimeIntervals:repeatSchedule:", v6, objc_msgSend(v3, "repeatSchedule"));
      goto LABEL_6;
    case 3:
      objc_msgSend(v3, "customSchedule");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
LABEL_6:
      v8 = (void *)v7;

      break;
    default:
      v8 = 0;
      break;
  }
  objc_msgSend(v4, "setSchedule:", v8);

  return v4;
}

@end
