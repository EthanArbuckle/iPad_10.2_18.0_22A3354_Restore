@implementation SOClockTimerCreateFromMTTimer

void __SOClockTimerCreateFromMTTimer_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "setTimerID:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "timerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTimerURL:", v3);

  objc_msgSend(v14, "setIsFiring:", objc_msgSend(*(id *)(a1 + 40), "isFiring"));
  objc_msgSend(*(id *)(a1 + 40), "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:", v4);

  if ((unint64_t)(*(_QWORD *)(a1 + 48) - 1) >= 3)
    v5 = 0;
  else
    v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v14, "setState:", v5);
  objc_msgSend(*(id *)(a1 + 40), "duration");
  objc_msgSend(v14, "setDuration:");
  v6 = *(_QWORD *)(a1 + 48);
  if ((unint64_t)(v6 - 1) <= 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "remainingTime");
    objc_msgSend(v14, "setFireTimeInterval:");
    v6 = *(_QWORD *)(a1 + 48);
  }
  if (v6 == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "fireDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFireDate:", v7);

  }
  objc_msgSend(*(id *)(a1 + 40), "siriContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MTTimerIntentSupportSiriContextTimerTypeKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v10 = objc_msgSend(v9, "integerValue");
  else
    v10 = 1;

  objc_msgSend(v14, "setType:", v10);
  objc_msgSend(*(id *)(a1 + 40), "firedDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFiredDate:", v11);

  objc_msgSend(*(id *)(a1 + 40), "dismissedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDismissedDate:", v12);

  objc_msgSend(*(id *)(a1 + 40), "lastModifiedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLastModifiedDate:", v13);

}

@end
