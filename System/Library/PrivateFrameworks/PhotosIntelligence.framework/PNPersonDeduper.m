@implementation PNPersonDeduper

- (PNPersonDeduper)initWithPersonClusterManager:(id)a3 andInvalidCandidatesMapping:(id)a4 profile:(id)a5
{
  id v9;
  id v10;
  id v11;
  PNPersonDeduper *v12;
  PNPersonDeduper *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PNPersonDeduper;
  v12 = -[PNPersonDeduper init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_personClusterManager, a3);
    objc_storeStrong((id *)&v13->_invalidCandidatesMapping, a4);
    objc_storeStrong((id *)&v13->_profile, a5);
  }

  return v13;
}

- (void)_executeStepsInSequences:(id)a3 forPersons:(id)a4 andOtherPersons:(id)a5 updateBlock:(id)a6 resultBlock:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, _BYTE *, float);
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void (**v25)(id, uint64_t, uint64_t);
  id v26;
  uint64_t v27;
  signed __int16 v28;
  _QWORD v30[6];
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  signed __int16 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  unsigned __int8 v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v26 = a5;
  v13 = (void (**)(id, _BYTE *, float))a6;
  v25 = (void (**)(id, uint64_t, uint64_t))a7;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__3102;
  v50 = __Block_byref_object_dispose__3103;
  v24 = v12;
  v51 = (id)objc_msgSend(v12, "mutableCopy");
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__3102;
  v44 = __Block_byref_object_dispose__3103;
  v45 = (id)objc_msgSend(v26, "mutableCopy");
  v28 = -[PNPersonClusterManager detectionType](self->_personClusterManager, "detectionType");
  v39 = 0;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
  if (v15)
  {
    v16 = 0;
    v27 = *(_QWORD *)v36;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v17);
        v19 = (void *)MEMORY[0x249506444]();
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v47[5];
        v22 = v41[5];
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __95__PNPersonDeduper__executeStepsInSequences_forPersons_andOtherPersons_updateBlock_resultBlock___block_invoke;
        v30[3] = &unk_251480408;
        v32 = &v46;
        v33 = &v40;
        v34 = v28;
        v30[4] = self;
        v30[5] = v18;
        v23 = v20;
        v31 = v23;
        objc_msgSend(v18, "dedupePersons:withOtherPersons:updateBlock:resultBlock:", v21, v22, v13, v30);
        v13[2](v13, &v39, (float)(unint64_t)(v16 + v17) / (float)(unint64_t)objc_msgSend(v14, "count"));
        LODWORD(v18) = v39;

        objc_autoreleasePoolPop(v19);
        if ((_DWORD)v18)
        {

          goto LABEL_11;
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
      v16 += v17;
      if (v15)
        continue;
      break;
    }
  }

  v25[2](v25, v47[5], v41[5]);
LABEL_11:
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
}

- (id)basicSequence
{
  PNPersonDeduperTimeStep *v3;
  PNPersonDeduperLocationStep *v4;
  PNPersonDeduperSocialGroupComplementStep *v5;
  PNPersonDeduperSocialGroupOverlaps *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v3 = -[PNPersonDeduperStep initWithPersonClusterManager:invalidCandidatesMapping:profile:]([PNPersonDeduperTimeStep alloc], "initWithPersonClusterManager:invalidCandidatesMapping:profile:", self->_personClusterManager, self->_invalidCandidatesMapping, self->_profile);
  v4 = -[PNPersonDeduperStep initWithPersonClusterManager:invalidCandidatesMapping:profile:]([PNPersonDeduperLocationStep alloc], "initWithPersonClusterManager:invalidCandidatesMapping:profile:", self->_personClusterManager, self->_invalidCandidatesMapping, self->_profile);
  v5 = -[PNPersonDeduperStep initWithPersonClusterManager:invalidCandidatesMapping:profile:]([PNPersonDeduperSocialGroupComplementStep alloc], "initWithPersonClusterManager:invalidCandidatesMapping:profile:", self->_personClusterManager, self->_invalidCandidatesMapping, self->_profile);
  v6 = -[PNPersonDeduperStep initWithPersonClusterManager:invalidCandidatesMapping:profile:]([PNPersonDeduperSocialGroupOverlaps alloc], "initWithPersonClusterManager:invalidCandidatesMapping:profile:", self->_personClusterManager, self->_invalidCandidatesMapping, self->_profile);
  -[PNPersonDeduper delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPersonDeduperStep setDelegate:](v4, "setDelegate:", v7);
  -[PNPersonDeduperStep setDelegate:](v5, "setDelegate:", v7);
  -[PNPersonDeduperStep setDelegate:](v6, "setDelegate:", v7);
  v10[0] = v3;
  v10[1] = v4;
  v10[2] = v5;
  v10[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dedupeUnverifiedPersons:(id)a3 withVerifiedPersons:(id)a4 updateBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduper.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("verifiedPersons"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduper.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("unverifiedPersons"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduper.m"), 189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateBlock"));

LABEL_4:
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3102;
  v23 = __Block_byref_object_dispose__3103;
  v24 = (id)objc_msgSend(v9, "mutableCopy");
  if (objc_msgSend(v10, "count"))
  {
    -[PNPersonDeduper basicSequence](self, "basicSequence");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __75__PNPersonDeduper_dedupeUnverifiedPersons_withVerifiedPersons_updateBlock___block_invoke;
    v18[3] = &unk_251480430;
    v18[4] = &v19;
    -[PNPersonDeduper _executeStepsInSequences:forPersons:andOtherPersons:updateBlock:resultBlock:](self, "_executeStepsInSequences:forPersons:andOtherPersons:updateBlock:resultBlock:", v12, v10, v9, v11, v18);

  }
  v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (id)dedupeUnverifiedPersons:(id)a3 updateBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduper.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("unverifiedPersons"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduper.m"), 205, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateBlock"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3102;
  v20 = __Block_byref_object_dispose__3103;
  v21 = (id)objc_msgSend(v7, "mutableCopy");
  -[PNPersonDeduper basicSequence](self, "basicSequence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __55__PNPersonDeduper_dedupeUnverifiedPersons_updateBlock___block_invoke;
  v15[3] = &unk_251480430;
  v15[4] = &v16;
  -[PNPersonDeduper _executeStepsInSequences:forPersons:andOtherPersons:updateBlock:resultBlock:](self, "_executeStepsInSequences:forPersons:andOtherPersons:updateBlock:resultBlock:", v10, v7, v7, v9, v15);

  v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

- (id)dedupeNewVerifiedPersons:(id)a3 withExistingVerifiedPersons:(id)a4 updateBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  PNPersonDeduperSocialGroupTimeWarpingStep *v14;
  void *v15;
  PNPersonDeduperTimeStep *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  PNPersonDeduperTimeStep *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  PNPersonDeduperTimeStep *v38;
  _QWORD v39[4];

  v39[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduper.m"), 218, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("existingVerifiedPersons"));

  }
  v12 = v9;
  if (v9)
  {
    if (v11)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduper.m"), 219, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newVerifiedPersons"));

    v12 = 0;
    if (v11)
      goto LABEL_5;
  }
  v27 = v12;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PNPersonDeduper.m"), 220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateBlock"));

  v12 = v27;
LABEL_5:
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__3102;
  v36 = __Block_byref_object_dispose__3103;
  v29 = v12;
  v37 = (id)objc_msgSend(v12, "mutableCopy");
  v13 = (void *)-[PNPersonDeduperProfile copy](self->_profile, "copy");
  objc_msgSend(v13, "setShouldRelaxThreshold:", 1);
  v14 = -[PNPersonDeduperStep initWithPersonClusterManager:invalidCandidatesMapping:profile:]([PNPersonDeduperSocialGroupTimeWarpingStep alloc], "initWithPersonClusterManager:invalidCandidatesMapping:profile:", self->_personClusterManager, self->_invalidCandidatesMapping, v13);
  -[PNPersonDeduper delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPersonDeduperStep setDelegate:](v14, "setDelegate:", v15);

  v39[0] = v14;
  v16 = -[PNPersonDeduperStep initWithPersonClusterManager:invalidCandidatesMapping:profile:]([PNPersonDeduperTimeStep alloc], "initWithPersonClusterManager:invalidCandidatesMapping:profile:", self->_personClusterManager, self->_invalidCandidatesMapping, v13);
  v39[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v33[5];
  v19 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __84__PNPersonDeduper_dedupeNewVerifiedPersons_withExistingVerifiedPersons_updateBlock___block_invoke;
  v31[3] = &unk_251480430;
  v31[4] = &v32;
  -[PNPersonDeduper _executeStepsInSequences:forPersons:andOtherPersons:updateBlock:resultBlock:](self, "_executeStepsInSequences:forPersons:andOtherPersons:updateBlock:resultBlock:", v17, v10, v18, v11, v31);
  if ((unint64_t)objc_msgSend((id)v33[5], "count") >= 2)
  {
    v20 = -[PNPersonDeduperStep initWithPersonClusterManager:invalidCandidatesMapping:profile:]([PNPersonDeduperTimeStep alloc], "initWithPersonClusterManager:invalidCandidatesMapping:profile:", self->_personClusterManager, self->_invalidCandidatesMapping, v13);
    v38 = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v33[5];
    v30[0] = v19;
    v30[1] = 3221225472;
    v30[2] = __84__PNPersonDeduper_dedupeNewVerifiedPersons_withExistingVerifiedPersons_updateBlock___block_invoke_2;
    v30[3] = &unk_251480430;
    v30[4] = &v32;
    -[PNPersonDeduper _executeStepsInSequences:forPersons:andOtherPersons:updateBlock:resultBlock:](self, "_executeStepsInSequences:forPersons:andOtherPersons:updateBlock:resultBlock:", v21, v22, v22, v11, v30);

  }
  v23 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  return v23;
}

- (PNPersonPromoterDelegate)delegate
{
  return (PNPersonPromoterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PNPetPromoter)petPromoter
{
  return (PNPetPromoter *)objc_loadWeakRetained((id *)&self->_petPromoter);
}

- (void)setPetPromoter:(id)a3
{
  objc_storeWeak((id *)&self->_petPromoter, a3);
}

- (PNPersonPromoter)personPromoter
{
  return (PNPersonPromoter *)objc_loadWeakRetained((id *)&self->_personPromoter);
}

- (void)setPersonPromoter:(id)a3
{
  objc_storeWeak((id *)&self->_personPromoter, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_personPromoter);
  objc_destroyWeak((id *)&self->_petPromoter);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_invalidCandidatesMapping, 0);
  objc_storeStrong((id *)&self->_personClusterManager, 0);
}

void __84__PNPersonDeduper_dedupeNewVerifiedPersons_withExistingVerifiedPersons_updateBlock___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

void __84__PNPersonDeduper_dedupeNewVerifiedPersons_withExistingVerifiedPersons_updateBlock___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __55__PNPersonDeduper_dedupeUnverifiedPersons_updateBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __75__PNPersonDeduper_dedupeUnverifiedPersons_withVerifiedPersons_updateBlock___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

void __95__PNPersonDeduper__executeStepsInSequences_forPersons_andOtherPersons_updateBlock_resultBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v6);
  v9 = objc_msgSend(v7, "count");
  v10 = v9 - objc_msgSend(v8, "count");
  v11 = *(void **)(a1 + 32);
  if (*(_WORD *)(a1 + 72) == 1)
  {
    objc_msgSend(v11, "personPromoter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "metricsKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "incrementMetricForKey:withValue:", v13, v10);

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      v27 = 138412802;
      v28 = v14;
      v29 = 2048;
      v30 = v16;
      v31 = 2048;
      v32 = v10;
      v17 = MEMORY[0x24BDACB70];
      v18 = "[PersonPromoter] [Step: %@] (%.4fs) - %ld persons merged";
LABEL_6:
      _os_log_impl(&dword_243C3E000, v17, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v27, 0x20u);

    }
  }
  else
  {
    objc_msgSend(v11, "petPromoter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "metricsKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "incrementMetricForKey:withValue:", v20, v10);

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      v27 = 138412802;
      v28 = v14;
      v29 = 2048;
      v30 = v21;
      v31 = 2048;
      v32 = v10;
      v17 = MEMORY[0x24BDACB70];
      v18 = "[PersonPromoter] [Step: %@] (%.4fs) - %ld pets merged";
      goto LABEL_6;
    }
  }
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v5;
  v24 = v5;

  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v26 = *(void **)(v25 + 40);
  *(_QWORD *)(v25 + 40) = v6;

}

@end
