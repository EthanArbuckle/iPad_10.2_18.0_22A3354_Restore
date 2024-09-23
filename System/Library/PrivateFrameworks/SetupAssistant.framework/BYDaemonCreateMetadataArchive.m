@implementation BYDaemonCreateMetadataArchive

void __BYDaemonCreateMetadataArchive_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a2;
  if (v5)
  {
    _BYLoggingFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __57__BYSiriUtilities_requiresAcknowledgementForDataSharing___block_invoke_cold_1((uint64_t)v5, v6);

  }
  if (a3 == 1)
  {
    v7 = 1;
    goto LABEL_9;
  }
  if (a3 == 2)
  {
    v7 = 0;
LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "setSiriDataSharingOptIn:", v7);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __BYDaemonCreateMetadataArchive_block_invoke_198(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getSUManagerClientClass_softClass;
  v9 = getSUManagerClientClass_softClass;
  if (!getSUManagerClientClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getSUManagerClientClass_block_invoke;
    v5[3] = &unk_1E4E26900;
    v5[4] = &v6;
    __getSUManagerClientClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  v4 = (void *)objc_msgSend([v3 alloc], "initWithDelegate:queue:clientType:", 0, *(_QWORD *)(a1 + 32), 0);
  objc_msgSend(*(id *)(a1 + 40), "setAutoUpdateEnabled:", objc_msgSend(v4, "isAutomaticUpdateV2Enabled"));
  objc_msgSend(*(id *)(a1 + 40), "setAutoDownloadEnabled:", objc_msgSend(v4, "isAutomaticDownloadEnabled"));

}

void __BYDaemonCreateMetadataArchive_block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  +[BYExpressCloudSettings createExpressSettingsWithQueue:](BYExpressCloudSettings, "createExpressSettingsWithQueue:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setUniversalData:", v2);

}

@end
