@implementation PPQuickTypeMetrics

- (PPQuickTypeMetrics)init
{
  PPQuickTypeMetrics *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __CFString *v12;
  uint64_t v13;
  PETScalarEventTracker *frameworkErrors;
  uint64_t v15;
  PETDistributionEventTracker *contactsMatches;
  uint64_t v17;
  PETDistributionEventTracker *foundInAppsMatches;
  uint64_t v19;
  PETDistributionEventTracker *eventsMatches;
  objc_super v22;
  _QWORD v23[2];
  _QWORD v24[13];

  v24[12] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)PPQuickTypeMetrics;
  v2 = -[PPQuickTypeMetrics init](&v22, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, (dispatch_qos_class_t)5u, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.proactive.PersonalizationPortrait.PPQuickTypeMetrics", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (void *)MEMORY[0x1E0D80F20];
    v24[0] = CFSTR("SG");
    v24[1] = CFSTR("CD");
    v24[2] = CFSTR("EK");
    v24[3] = CFSTR("CN_PS");
    v24[4] = CFSTR("CN_DS");
    v24[5] = CFSTR("CN_AD");
    v24[6] = CFSTR("CN_CS");
    v24[7] = CFSTR("CNAC");
    v24[8] = CFSTR("GEONoData");
    v24[9] = CFSTR("GEOTimeout");
    v24[10] = CFSTR("MK");
    v24[11] = CFSTR("PB");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "propertyWithName:possibleValues:", CFSTR("framework"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:range:", CFSTR("errorCode"), 0, 0x7FFFFFFFFFFFFFFFLL);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v9;
    v23[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("frameworkErrors");
    objc_opt_self();
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F38]), "initWithFeatureId:event:registerProperties:", CFSTR("ProactiveExperts"), CFSTR("frameworkErrors"), v11);

    frameworkErrors = v2->_frameworkErrors;
    v2->_frameworkErrors = (PETScalarEventTracker *)v13;

    +[PPQuickTypeMetrics trackerForDistribution:withProperties:]((uint64_t)PPQuickTypeMetrics, CFSTR("contactsMatches"));
    v15 = objc_claimAutoreleasedReturnValue();
    contactsMatches = v2->_contactsMatches;
    v2->_contactsMatches = (PETDistributionEventTracker *)v15;

    +[PPQuickTypeMetrics trackerForDistribution:withProperties:]((uint64_t)PPQuickTypeMetrics, CFSTR("foundInAppsMatches"));
    v17 = objc_claimAutoreleasedReturnValue();
    foundInAppsMatches = v2->_foundInAppsMatches;
    v2->_foundInAppsMatches = (PETDistributionEventTracker *)v17;

    +[PPQuickTypeMetrics trackerForDistribution:withProperties:]((uint64_t)PPQuickTypeMetrics, CFSTR("eventsMatches"));
    v19 = objc_claimAutoreleasedReturnValue();
    eventsMatches = v2->_eventsMatches;
    v2->_eventsMatches = (PETDistributionEventTracker *)v19;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventsMatches, 0);
  objc_storeStrong((id *)&self->_foundInAppsMatches, 0);
  objc_storeStrong((id *)&self->_contactsMatches, 0);
  objc_storeStrong((id *)&self->_frameworkErrors, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (id)trackerForDistribution:(uint64_t)a1 withProperties:(void *)a2
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C9AA60];
  v4 = MEMORY[0x1E0C9AA60];
  v5 = a2;
  objc_opt_self();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80F18]), "initWithFeatureId:event:registerProperties:", CFSTR("ProactiveExperts"), v5, v3);

  return v6;
}

+ (void)frameworkError:(id)a3 errorCode:(int64_t)a4
{
  id v5;
  _QWORD *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  int64_t v14;

  v5 = a3;
  +[PPQuickTypeMetrics instance]();
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = v6[1];
  else
    v8 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PPQuickTypeMetrics_frameworkError_errorCode___block_invoke;
  block[3] = &unk_1E7E1ED88;
  v12 = v6;
  v13 = v5;
  v14 = a4;
  v9 = v5;
  v10 = v7;
  dispatch_async(v8, block);

}

+ (void)contactMatchesWithContactsCount:(unint64_t)a3 foundInAppsCount:(unint64_t)a4
{
  _QWORD *v6;
  NSObject *v7;
  _QWORD *v8;
  _QWORD block[4];
  id v10;
  unint64_t v11;
  unint64_t v12;

  +[PPQuickTypeMetrics instance]();
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = v6[1];
  else
    v7 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PPQuickTypeMetrics_contactMatchesWithContactsCount_foundInAppsCount___block_invoke;
  block[3] = &unk_1E7E18978;
  v10 = v6;
  v11 = a3;
  v12 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

+ (void)eventsMatches:(unint64_t)a3
{
  _QWORD *v4;
  NSObject *v5;
  _QWORD *v6;
  _QWORD v7[4];
  id v8;
  unint64_t v9;

  +[PPQuickTypeMetrics instance]();
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = v4[1];
  else
    v5 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__PPQuickTypeMetrics_eventsMatches___block_invoke;
  v7[3] = &unk_1E7E1DAD0;
  v8 = v4;
  v9 = a3;
  v6 = v4;
  dispatch_async(v5, v7);

}

+ (id)instance
{
  objc_opt_self();
  if (instance_onceToken != -1)
    dispatch_once(&instance_onceToken, &__block_literal_global_9045);
  return (id)instance__instance;
}

uint64_t __36__PPQuickTypeMetrics_eventsMatches___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[5];
  return objc_msgSend(v1, "trackEventWithPropertyValues:value:", MEMORY[0x1E0C9AA60], (double)*(unint64_t *)(a1 + 40));
}

void __30__PPQuickTypeMetrics_instance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)instance__instance;
  instance__instance = v0;

}

uint64_t __71__PPQuickTypeMetrics_contactMatchesWithContactsCount_foundInAppsCount___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a1[4];
  if (v2)
    v3 = *(void **)(v2 + 24);
  else
    v3 = 0;
  objc_msgSend(v3, "trackEventWithPropertyValues:value:", MEMORY[0x1E0C9AA60], (double)(unint64_t)a1[5]);
  v4 = a1[4];
  if (v4)
    v5 = *(void **)(v4 + 32);
  else
    v5 = 0;
  return objc_msgSend(v5, "trackEventWithPropertyValues:value:", MEMORY[0x1E0C9AA60], (double)(unint64_t)a1[6]);
}

void __47__PPQuickTypeMetrics_frameworkError_errorCode___block_invoke(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v1 = (_QWORD *)a1[4];
  if (v1)
    v1 = (_QWORD *)v1[2];
  v2 = a1[6];
  v7[0] = a1[5];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = v1;
  objc_msgSend(v3, "numberWithInteger:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackEventWithPropertyValues:", v6);

}

@end
