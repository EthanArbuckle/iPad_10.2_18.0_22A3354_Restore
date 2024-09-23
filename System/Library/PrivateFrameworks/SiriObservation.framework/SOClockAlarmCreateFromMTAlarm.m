@implementation SOClockAlarmCreateFromMTAlarm

void __SOClockAlarmCreateFromMTAlarm_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAlarmID:", v3);
  objc_msgSend(*(id *)(a1 + 40), "alarmURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlarmURL:", v5);

  objc_msgSend(v4, "setIsFiring:", objc_msgSend(*(id *)(a1 + 40), "isFiring"));
  objc_msgSend(*(id *)(a1 + 40), "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v6);

  objc_msgSend(v4, "setType:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setHour:", objc_msgSend(*(id *)(a1 + 40), "hour"));
  objc_msgSend(v4, "setMinute:", objc_msgSend(*(id *)(a1 + 40), "minute"));
  objc_msgSend(v4, "setRepeatOptions:", objc_msgSend(*(id *)(a1 + 40), "repeatSchedule") & 0x7F);
  objc_msgSend(v4, "setIsEnabled:", objc_msgSend(*(id *)(a1 + 40), "isEnabled"));
  objc_msgSend(v4, "setIsSnoozed:", objc_msgSend(*(id *)(a1 + 40), "isSnoozed"));
  objc_msgSend(*(id *)(a1 + 40), "firedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFiredDate:", v7);

  objc_msgSend(*(id *)(a1 + 40), "dismissedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDismissedDate:", v8);

  objc_msgSend(*(id *)(a1 + 40), "lastModifiedDate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastModifiedDate:", v9);

}

@end
