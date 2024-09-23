@implementation UNCSettingsRemotePersistenceService

+ (id)clientInterface
{
  if (clientInterface_onceToken != -1)
    dispatch_once(&clientInterface_onceToken, &__block_literal_global_18);
  return (id)clientInterface___interface;
}

void __54__UNCSettingsRemotePersistenceService_clientInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2578DF2F0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)clientInterface___interface;
  clientInterface___interface = v0;

}

+ (id)serverInterface
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__UNCSettingsRemotePersistenceService_serverInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (serverInterface_onceToken != -1)
    dispatch_once(&serverInterface_onceToken, block);
  return (id)serverInterface___interface;
}

void __54__UNCSettingsRemotePersistenceService_serverInterface__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[2];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2578D1980);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)serverInterface___interface;
  serverInterface___interface = v2;

  v4 = (void *)serverInterface___interface;
  objc_msgSend(*(id *)(a1 + 32), "_allowedClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_sectionInfosForSectionIDs_effective_withHandler_, 0, 0);

  v6 = (void *)serverInterface___interface;
  objc_msgSend(*(id *)(a1 + 32), "_allowedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_sectionInfosForSectionIDs_effective_withHandler_, 0, 1);

  v8 = (void *)serverInterface___interface;
  objc_msgSend(*(id *)(a1 + 32), "_allowedClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_allSectionIDsWithHandler_, 0, 1);

  v10 = (void *)serverInterface___interface;
  objc_msgSend(*(id *)(a1 + 32), "_allowedClasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_allSectionInfosByIDWithHandler_, 0, 1);

  v12 = (void *)serverInterface___interface;
  objc_msgSend(*(id *)(a1 + 32), "_allowedClasses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_allSortedSectionInfos_withHandler_, 0, 1);

  v14 = (void *)serverInterface___interface;
  objc_msgSend(*(id *)(a1 + 32), "_allowedClasses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_allSortedActiveSections_withHandler_, 0, 1);

  v16 = (void *)serverInterface___interface;
  objc_msgSend(*(id *)(a1 + 32), "_allowedClasses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_setAllSectionInfoByID_withHandler_, 0, 0);

  v18 = (void *)serverInterface___interface;
  objc_msgSend(*(id *)(a1 + 32), "_allowedClasses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_clearedSectionsByIDWithHandler_, 0, 1);

  v20 = (void *)serverInterface___interface;
  objc_msgSend(*(id *)(a1 + 32), "_allowedClasses");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_setClearedSectionsByID_withHandler_, 0, 0);

  v22 = (void *)serverInterface___interface;
  objc_msgSend(*(id *)(a1 + 32), "_allowedClasses");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_readSectionInfoWithHandler_, 0, 1);

  v24 = (void *)serverInterface___interface;
  objc_msgSend(*(id *)(a1 + 32), "_allowedClasses");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_readSavedClearedSectionsWithHandler_, 0, 1);

  v26 = (void *)serverInterface___interface;
  objc_msgSend(*(id *)(a1 + 32), "_allowedClasses");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_readSectionOrderWithHandler_, 0, 1);

  v28 = (void *)serverInterface___interface;
  objc_msgSend(*(id *)(a1 + 32), "_allowedClasses");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_readSectionInfoLegacyFileWithHandler_, 0, 1);

  v30 = (void *)serverInterface___interface;
  objc_msgSend(*(id *)(a1 + 32), "_allowedClasses");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_writeClearedSections_, 0, 0);

  v32 = (void *)serverInterface___interface;
  objc_msgSend(*(id *)(a1 + 32), "_allowedClasses");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_writeSectionInfo_, 0, 0);

  v34 = (void *)serverInterface___interface;
  objc_msgSend(*(id *)(a1 + 32), "_allowedClasses");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_writeSectionOrder_, 0, 0);

  v36 = (void *)serverInterface___interface;
  v37 = (void *)MEMORY[0x24BDBCF20];
  v45[0] = objc_opt_class();
  v45[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setWithArray:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_getEffectiveGlobalScheduledDeliveryTimesWithHandler_, 0, 1);

  v40 = (void *)serverInterface___interface;
  v41 = (void *)MEMORY[0x24BDBCF20];
  v44[0] = objc_opt_class();
  v44[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setWithArray:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_setEffectiveGlobalScheduledDeliveryTimes_withHandler_, 0, 0);

}

+ (id)_allowedClasses
{
  if (_allowedClasses_onceToken != -1)
    dispatch_once(&_allowedClasses_onceToken, &__block_literal_global_135);
  return (id)_allowedClasses_allowedClasses;
}

void __54__UNCSettingsRemotePersistenceService__allowedClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[7];

  v3[6] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 6);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_allowedClasses_allowedClasses;
  _allowedClasses_allowedClasses = v1;

}

@end
