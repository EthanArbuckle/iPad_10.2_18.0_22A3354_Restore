@implementation PDScheduledActivityRegister

void ___PDScheduledActivityRegister_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  PDScheduledActivityRegistration *v5;
  void *v6;
  id v7;

  _RegisteredClients();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "activityRegistrations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PDScheduledActivityRegistration initWithActivityCriteria:activityContext:]([PDScheduledActivityRegistration alloc], "initWithActivityCriteria:activityContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if ((objc_msgSend(v4, "isEqual:", v5) & 1) == 0)
  {
    objc_msgSend(v7, "activityRegistrations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 40));

    _RegisterXPCActivity(*(void **)(a1 + 32), *(void **)(a1 + 40));
    _ArchiveRegisteredClients();
  }

}

@end
