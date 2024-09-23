@implementation PPConnectionsMetricsTracker

- (PPConnectionsMetricsTracker)init
{
  PPConnectionsMetricsTracker *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  NSObject *v28;
  NSObject *v29;
  dispatch_queue_t v30;
  OS_dispatch_queue *queue;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;
  _QWORD v41[3];
  _QWORD v42[4];
  uint64_t v43;
  _QWORD v44[3];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[6];

  v48[4] = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)PPConnectionsMetricsTracker;
  v2 = -[PPConnectionsMetricsTracker init](&v40, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D80F20];
    v48[0] = CFSTR("springboard");
    v48[1] = CFSTR("quicktype");
    v48[2] = CFSTR("maps");
    v48[3] = CFSTR("mapsWidget");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "propertyWithName:possibleValues:", CFSTR("consumer"), v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0D80F20];
    v47[0] = CFSTR("donation");
    v47[1] = CFSTR("schemaorg");
    v47[2] = CFSTR("pasteboard");
    v47[3] = CFSTR("siri");
    v47[4] = CFSTR("calendar");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "propertyWithName:possibleValues:", CFSTR("source"), v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0D80F20];
    v46[0] = CFSTR("semantic");
    v46[1] = CFSTR("ling_location");
    v46[2] = CFSTR("ling_address");
    v46[3] = CFSTR("ling_phone");
    v46[4] = CFSTR("na");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertyWithName:possibleValues:", CFSTR("trigger"), v10);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("originating_app"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("target_app"));
    v12 = objc_claimAutoreleasedReturnValue();
    v45[0] = v5;
    v45[1] = v8;
    v34 = (void *)v8;
    v45[2] = v11;
    v45[3] = v33;
    v13 = v11;
    v37 = (void *)v12;
    v38 = (void *)v11;
    v45[4] = v12;
    v14 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 5);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80F30]), "initWithFeatureId:opportunityEvent:conversionEvent:registerProperties:", CFSTR("PEXConnections"), CFSTR("shown"), CFSTR("engaged"), v39);
    -[PPConnectionsMetricsTracker setConversionTracker:](v2, "setConversionTracker:", v15);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80F38]), "initWithFeatureId:event:registerProperties:", CFSTR("PEXConnections"), CFSTR("dismissed"), v39);
    -[PPConnectionsMetricsTracker setDismissalTracker:](v2, "setDismissalTracker:", v16);

    v44[0] = v5;
    v44[1] = v13;
    v36 = (void *)v5;
    v44[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80F38]), "initWithFeatureId:event:registerProperties:", CFSTR("PEXConnections"), CFSTR("opportunity"), v35);
    -[PPConnectionsMetricsTracker setOpportunityTracker:](v2, "setOpportunityTracker:", v17);

    v43 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80F18]), "initWithFeatureId:event:registerProperties:", CFSTR("PEXConnections"), CFSTR("timing"), v18);
    -[PPConnectionsMetricsTracker setTimingTracker:](v2, "setTimingTracker:", v19);

    v42[0] = v8;
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:possibleValues:", CFSTR("has_latlon"), &unk_1E7E5BD28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v20;
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:possibleValues:", CFSTR("eligible"), &unk_1E7E5BD40);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v21;
    v42[3] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80F38]), "initWithFeatureId:event:registerProperties:", CFSTR("PEXConnections"), CFSTR("donation"), v22);
    -[PPConnectionsMetricsTracker setDonationTracker:](v2, "setDonationTracker:", v23);

    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:possibleValues:", CFSTR("has_address"), &unk_1E7E5BD58);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v24;
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:possibleValues:", CFSTR("eligible"), &unk_1E7E5BD70);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v25;
    v41[2] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80F38]), "initWithFeatureId:event:registerProperties:", CFSTR("PEXConnections"), CFSTR("pasteboard"), v26);
    -[PPConnectionsMetricsTracker setPasteboardTracker:](v2, "setPasteboardTracker:", v27);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v28, QOS_CLASS_UTILITY, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = dispatch_queue_create("com.apple.PPConnections.metrics", v29);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v30;

  }
  return v2;
}

- (void)trackConversionGoalForConsumer:(id)a3 source:(id)a4 trigger:(id)a5 originatingApp:(id)a6 targetApp:(id)a7 converted:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *queue;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[4];
  id v26;
  PPConnectionsMetricsTracker *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  BOOL v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__PPConnectionsMetricsTracker_trackConversionGoalForConsumer_source_trigger_originatingApp_targetApp_converted___block_invoke;
  block[3] = &unk_1E7E1ED38;
  v32 = a8;
  v26 = v14;
  v27 = self;
  v28 = v17;
  v29 = v18;
  v30 = v15;
  v31 = v16;
  v20 = v16;
  v21 = v15;
  v22 = v18;
  v23 = v17;
  v24 = v14;
  dispatch_async(queue, block);

}

- (void)trackOpportunityForConsumer:(id)a3 trigger:(id)a4 targetApp:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  PPConnectionsMetricsTracker *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__PPConnectionsMetricsTracker_trackOpportunityForConsumer_trigger_targetApp___block_invoke;
  v15[3] = &unk_1E7E1FFF8;
  v16 = v8;
  v17 = self;
  v18 = v10;
  v19 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(queue, v15);

}

- (void)trackDismissalForConsumer:(id)a3 source:(id)a4 trigger:(id)a5 originatingApp:(id)a6 targetApp:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *queue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  PPConnectionsMetricsTracker *v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  queue = self->_queue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __97__PPConnectionsMetricsTracker_trackDismissalForConsumer_source_trigger_originatingApp_targetApp___block_invoke;
  v23[3] = &unk_1E7E1ED60;
  v24 = v12;
  v25 = self;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  v29 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(queue, v23);

}

- (void)trackTimingForConsumer:(id)a3 time:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PPConnectionsMetricsTracker_trackTimingForConsumer_time___block_invoke;
  block[3] = &unk_1E7E1ED88;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)trackDonationFromBundleId:(id)a3 source:(id)a4 hasLatLon:(BOOL)a5 isEligible:(BOOL)a6
{
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;
  BOOL v19;

  v10 = a3;
  v11 = a4;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__PPConnectionsMetricsTracker_trackDonationFromBundleId_source_hasLatLon_isEligible___block_invoke;
  v15[3] = &unk_1E7E1EDB0;
  v15[4] = self;
  v16 = v10;
  v17 = v11;
  v18 = a5;
  v19 = a6;
  v13 = v11;
  v14 = v10;
  dispatch_async(queue, v15);

}

- (void)trackPasteboardItemFromBundleId:(id)a3 hasAddress:(BOOL)a4 isEligible:(BOOL)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD block[5];
  id v12;
  BOOL v13;
  BOOL v14;

  v8 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PPConnectionsMetricsTracker_trackPasteboardItemFromBundleId_hasAddress_isEligible___block_invoke;
  block[3] = &unk_1E7E1EDD8;
  block[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_async(queue, block);

}

- (PETScalarEventTracker)opportunityTracker
{
  return self->_opportunityTracker;
}

- (void)setOpportunityTracker:(id)a3
{
  objc_storeStrong((id *)&self->_opportunityTracker, a3);
}

- (PETGoalConversionEventTracker)conversionTracker
{
  return self->_conversionTracker;
}

- (void)setConversionTracker:(id)a3
{
  objc_storeStrong((id *)&self->_conversionTracker, a3);
}

- (PETScalarEventTracker)dismissalTracker
{
  return self->_dismissalTracker;
}

- (void)setDismissalTracker:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalTracker, a3);
}

- (PETDistributionEventTracker)timingTracker
{
  return self->_timingTracker;
}

- (void)setTimingTracker:(id)a3
{
  objc_storeStrong((id *)&self->_timingTracker, a3);
}

- (PETScalarEventTracker)donationTracker
{
  return self->_donationTracker;
}

- (void)setDonationTracker:(id)a3
{
  objc_storeStrong((id *)&self->_donationTracker, a3);
}

- (PETScalarEventTracker)pasteboardTracker
{
  return self->_pasteboardTracker;
}

- (void)setPasteboardTracker:(id)a3
{
  objc_storeStrong((id *)&self->_pasteboardTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteboardTracker, 0);
  objc_storeStrong((id *)&self->_donationTracker, 0);
  objc_storeStrong((id *)&self->_timingTracker, 0);
  objc_storeStrong((id *)&self->_dismissalTracker, 0);
  objc_storeStrong((id *)&self->_conversionTracker, 0);
  objc_storeStrong((id *)&self->_opportunityTracker, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __85__PPConnectionsMetricsTracker_trackPasteboardItemFromBundleId_hasAddress_isEligible___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  uint8_t v8[16];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  pp_quicktype_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_debug_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEBUG, "[PPConnectionsMetricsTracker] Tracking pasteboard item addition", v8, 2u);
  }

  -[PPConnectionsMetricsTracker privacyFriendlyBundleIdentifierWith:](*(__CFString **)(a1 + 32), *(__CFString **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pasteboardTracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("1");
  if (*(_BYTE *)(a1 + 48))
    v6 = CFSTR("1");
  else
    v6 = CFSTR("0");
  if (!*(_BYTE *)(a1 + 49))
    v5 = CFSTR("0");
  v9[0] = v6;
  v9[1] = v5;
  v9[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackEventWithPropertyValues:", v7);

}

- (__CFString)privacyFriendlyBundleIdentifierWith:(__CFString *)a1
{
  __CFString *v2;

  if (a1)
  {
    v2 = CFSTR("unknown");
    if (a2)
      v2 = a2;
    a1 = v2;
  }
  return a1;
}

void __85__PPConnectionsMetricsTracker_trackDonationFromBundleId_source_hasLatLon_isEligible___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  uint8_t v8[8];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  pp_quicktype_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_debug_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEBUG, "[PPConnectionsMetricsTracker] Tracking donation", v8, 2u);
  }

  -[PPConnectionsMetricsTracker privacyFriendlyBundleIdentifierWith:](*(__CFString **)(a1 + 32), *(__CFString **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "donationTracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 56))
    v5 = CFSTR("1");
  else
    v5 = CFSTR("0");
  v9[0] = *(_QWORD *)(a1 + 48);
  v9[1] = v5;
  if (*(_BYTE *)(a1 + 57))
    v6 = CFSTR("1");
  else
    v6 = CFSTR("0");
  v9[2] = v6;
  v9[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackEventWithPropertyValues:", v7);

}

void __59__PPConnectionsMetricsTracker_trackTimingForConsumer_time___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  pp_quicktype_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEBUG, "[PPConnectionsMetricsTracker] Tracking timing", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "timingTracker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trackEventWithPropertyValues:value:", v4, (double)*(unint64_t *)(a1 + 48));

}

void __97__PPConnectionsMetricsTracker_trackDismissalForConsumer_source_trigger_originatingApp_targetApp___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];
  __int128 v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  pp_quicktype_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_debug_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEBUG, "[PPConnectionsMetricsTracker] Tracking dismissal for consumer = %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "dismissalTracker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v7[0] = *(_QWORD *)(a1 + 32);
  v7[1] = v4;
  v8 = *(_OWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 72);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trackEventWithPropertyValues:", v5);

}

void __77__PPConnectionsMetricsTracker_trackOpportunityForConsumer_trigger_targetApp___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[3];
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  pp_quicktype_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v10 = v7;
    _os_log_debug_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEBUG, "[PPConnectionsMetricsTracker] Tracking opportunity for consumer = %@", buf, 0xCu);
  }

  -[PPConnectionsMetricsTracker privacyFriendlyBundleIdentifierWith:](*(__CFString **)(a1 + 40), *(__CFString **)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "opportunityTracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 56);
  v8[0] = *(_QWORD *)(a1 + 32);
  v8[1] = v5;
  v8[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackEventWithPropertyValues:", v6);

}

void __112__PPConnectionsMetricsTracker_trackConversionGoalForConsumer_source_trigger_originatingApp_targetApp_converted___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  _QWORD v13[5];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  pp_quicktype_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(unsigned __int8 *)(a1 + 80);
    *(_DWORD *)buf = 138412546;
    v15 = v11;
    v16 = 1024;
    v17 = v12;
    _os_log_debug_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEBUG, "[PPConnectionsMetricsTracker] Tracking conversion for consumer = %@, converted = %d", buf, 0x12u);
  }

  -[PPConnectionsMetricsTracker privacyFriendlyBundleIdentifierWith:](*(__CFString **)(a1 + 40), *(__CFString **)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPConnectionsMetricsTracker privacyFriendlyBundleIdentifierWith:](*(__CFString **)(a1 + 40), *(__CFString **)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v13[0] = *(_QWORD *)(a1 + 32);
  v13[1] = v5;
  v13[2] = v6;
  v13[3] = v3;
  v13[4] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(unsigned __int8 *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 40), "conversionTracker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "trackGoalConversionEventWithPropertyValues:", v7);
  else
    objc_msgSend(v9, "trackGoalOpportunityEventWithPropertyValues:", v7);

}

+ (PPConnectionsMetricsTracker)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PPConnectionsMetricsTracker_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (PPConnectionsMetricsTracker *)(id)sharedInstance_shared_21057;
}

+ (id)consumerStringForConsumerType:(unint64_t)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = CFSTR("maps");
  v4 = CFSTR("mapsWidget");
  v5 = CFSTR("quicktype");
  if ((a3 & 1) == 0)
    v5 = CFSTR("unknown");
  if ((a3 & 4) == 0)
    v4 = v5;
  if ((a3 & 2) == 0)
    v3 = v4;
  if ((a3 & 8) != 0)
    return CFSTR("springboard");
  else
    return (id)v3;
}

+ (id)donationSourceFromBundleID:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D70E70]) & 1) != 0)
  {
    v4 = CFSTR("siri");
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D70E68]))
  {
    v4 = CFSTR("schemaorg");
  }
  else
  {
    v4 = CFSTR("donation");
  }

  return (id)v4;
}

+ (id)triggerFromCriteria:(id)a3
{
  id v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  int v7;

  v3 = a3;
  if (+[PPConnectionsUtils isValidLinguisticQuery:](PPConnectionsUtils, "isValidLinguisticQuery:", v3))
  {
    if ((objc_msgSend(v3, "fields") & 1) != 0)
    {
      v4 = CFSTR("ling_phone");
    }
    else if (objc_msgSend(v3, "subtype") == 6)
    {
      v4 = CFSTR("ling_location");
    }
    else if (objc_msgSend(v3, "subtype") == 7)
    {
      v4 = CFSTR("ling_address");
    }
    else
    {
      v4 = CFSTR("na");
    }
  }
  else
  {
    +[PPConnectionsUtils supportedLocationSemanticTypes](PPConnectionsUtils, "supportedLocationSemanticTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v3, "semanticTag"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

    if (v7)
      v4 = CFSTR("semantic");
    else
      v4 = CFSTR("na");
  }

  return (id)v4;
}

void __45__PPConnectionsMetricsTracker_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_opt_class();
  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_shared_21057;
  sharedInstance_shared_21057 = v0;

}

@end
