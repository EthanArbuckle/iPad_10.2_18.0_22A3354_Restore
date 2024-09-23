@implementation SUSpace

+ (id)hasSufficientSpaceWithOptions:(id)a3 error:(id *)a4
{
  id v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  v6 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__SUSpace_hasSufficientSpaceWithOptions_error___block_invoke;
  v11[3] = &unk_24CE3BDA8;
  v13 = &v21;
  v14 = &v15;
  v7 = v6;
  v12 = v7;
  +[SUSpace hasSufficientSpaceWithOptions:withCompletion:](SUSpace, "hasSufficientSpaceWithOptions:withCompletion:", v5, v11);
  v8 = dispatch_time(0, 300000000000);
  dispatch_semaphore_wait(v7, v8);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __47__SUSpace_hasSufficientSpaceWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)hasSufficientSpaceWithOptions:(id)a3 withCompletion:(id)a4
{
  SUSpacePurgeOptions *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  SUSpaceCheckResults *v32;
  void *v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  SUSpaceCheckResults *v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  _QWORD v87[4];
  SUSpaceCheckResults *v88;
  SUSpacePurgeOptions *v89;
  id v90;
  void (**v91)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v92;
  id v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  unint64_t v98;
  _QWORD v99[4];
  id v100;

  v5 = (SUSpacePurgeOptions *)a3;
  v86 = a4;
  if (!v5)
    v5 = objc_alloc_init(SUSpacePurgeOptions);
  -[SUSpacePurgeOptions completionQueue](v5, "completionQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BEAEA28], "sharedCore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectCompletionQueue:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v99[0] = MEMORY[0x24BDAC760];
  v99[1] = 3221225472;
  v99[2] = __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke_3;
  v99[3] = &unk_24CE3BE60;
  v100 = &__block_literal_global_3;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x212BF6094](v99);
  v9 = +[SUSpace currentFreeSpaceForVolume:](SUSpace, "currentFreeSpaceForVolume:", CFSTR("/"));
  v10 = -[SUSpacePurgeOptions neededBytes](v5, "neededBytes");
  SULogInfo(CFSTR("%s: Current free space without purging: %llu"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)"+[SUSpace hasSufficientSpaceWithOptions:withCompletion:]");
  -[SUSpacePurgeOptions neededBytes](v5, "neededBytes");
  SULogInfo(CFSTR("%s: Needed bytes: %llu"), v18, v19, v20, v21, v22, v23, v24, (uint64_t)"+[SUSpace hasSufficientSpaceWithOptions:withCompletion:]");
  SULogInfo(CFSTR("%s: haveEnoughSpace: %@"), v25, v26, v27, v28, v29, v30, v31, (uint64_t)"+[SUSpace hasSufficientSpaceWithOptions:withCompletion:]");
  v32 = objc_alloc_init(SUSpaceCheckResults);
  -[SUSpaceCheckResults setHasSufficientFreeSpace:](v32, "setHasSufficientFreeSpace:", v9 >= v10);
  -[SUSpaceCheckResults setAdditionalBytesRequired:](v32, "setAdditionalBytesRequired:", 0);
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "haveEnoughSpace");

  if ((v34 & 1) != 0)
  {
    if (v9 >= v10)
    {
      SULogInfo(CFSTR("Device has sufficient free space"), v35, v36, v37, v38, v39, v40, v41, v85);
      v42 = v86;
      __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke(v43, v32, 0, v6, v86);
      goto LABEL_19;
    }
    v95 = 0;
    v96 = &v95;
    v97 = 0x2020000000;
    v98 = 0;
    v98 = -[SUSpacePurgeOptions neededBytes](v5, "neededBytes") - v9;
    -[SUSpaceCheckResults setAdditionalBytesRequired:](v32, "setAdditionalBytesRequired:", v96[3]);
    v42 = v86;
    if (-[SUSpacePurgeOptions enableCacheDelete](v5, "enableCacheDelete"))
    {
      SULogInfo(CFSTR("%s: Attempting cache delete"), v54, v55, v56, v57, v58, v59, v60, (uint64_t)"+[SUSpace hasSufficientSpaceWithOptions:withCompletion:]");
      v61 = (void *)MEMORY[0x24BEAE868];
      v62 = v96[3];
      v63 = -[SUSpacePurgeOptions cacheDeleteUrgency](v5, "cacheDeleteUrgency");
      v87[0] = MEMORY[0x24BDAC760];
      v87[1] = 3221225472;
      v87[2] = __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke_5;
      v87[3] = &unk_24CE3BE88;
      v88 = v32;
      v94 = &v95;
      v89 = v5;
      v91 = v8;
      v90 = v6;
      v92 = v86;
      v93 = &__block_literal_global_3;
      objc_msgSend(v61, "checkPurgeableSpaceCacheDelete:cacheDeleteUrgency:withCompletionQueue:completion:", v62, v63, v90, v87);

      v64 = v88;
    }
    else
    {
      if (-[SUSpacePurgeOptions enableAppOffload](v5, "enableAppOffload"))
      {
        SULogInfo(CFSTR("%s: Only attempting app offload"), v68, v69, v70, v71, v72, v73, v74, (uint64_t)"+[SUSpace hasSufficientSpaceWithOptions:withCompletion:]");
        ((void (**)(_QWORD, _QWORD, uint64_t, int64_t, SUSpaceCheckResults *, _QWORD, void *, id))v8)[2](v8, 0, v96[3], -[SUSpacePurgeOptions appOffloadUrgency](v5, "appOffloadUrgency"), v32, 0, v6, v86);
LABEL_18:
        _Block_object_dispose(&v95, 8);
        goto LABEL_19;
      }
      SULogInfo(CFSTR("%s: Cache Delete was not enabled"), v68, v69, v70, v71, v72, v73, v74, (uint64_t)"+[SUSpace hasSufficientSpaceWithOptions:withCompletion:]");
      v64 = (SUSpaceCheckResults *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SUSpaceCheckResults additionalBytesRequired](v32, "additionalBytesRequired"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUSpaceCheckResults setObject:forKeyedSubscript:](v64, "setObject:forKeyedSubscript:", v75, CFSTR("SUAdditionalSpaceRequired"));

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 6, v64);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("Insufficient free space: %@"), v77, v78, v79, v80, v81, v82, v83, (uint64_t)v76);
      __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke(v84, v32, v76, v6, v86);

    }
    goto LABEL_18;
  }
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "spacePurgeSuccessful");

  if (v45)
  {
    -[SUSpaceCheckResults setHasSufficientFreeSpace:](v32, "setHasSufficientFreeSpace:", 1);
    -[SUSpaceCheckResults setAdditionalBytesRequired:](v32, "setAdditionalBytesRequired:", 0);
    -[SUSpaceCheckResults setNeedsCacheDelete:](v32, "setNeedsCacheDelete:", -[SUSpacePurgeOptions enableCacheDelete](v5, "enableCacheDelete"));
    -[SUSpaceCheckResults setNeedsAppOffload:](v32, "setNeedsAppOffload:", -[SUSpacePurgeOptions enableAppOffload](v5, "enableAppOffload"));
    v53 = 0;
  }
  else
  {
    -[SUSpaceCheckResults setHasSufficientFreeSpace:](v32, "setHasSufficientFreeSpace:", 0);
    -[SUSpaceCheckResults setAdditionalBytesRequired:](v32, "setAdditionalBytesRequired:", 10485760);
    -[SUSpaceCheckResults setNeedsAppOffload:](v32, "setNeedsAppOffload:", 0);
    -[SUSpaceCheckResults setNeedsCacheDelete:](v32, "setNeedsCacheDelete:", 0);
    v65 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[SUSpaceCheckResults additionalBytesRequired](v32, "additionalBytesRequired"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v66, CFSTR("SUAdditionalSpaceRequired"));

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 6, v65);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v42 = v86;
  SULogInfo(CFSTR("Spoofing %s with result: %@"), v46, v47, v48, v49, v50, v51, v52, (uint64_t)"+[SUSpace hasSufficientSpaceWithOptions:withCompletion:]");
  __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke(v67, v32, v53, v6, v86);

LABEL_19:
}

void __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v11)
  {
    if (v10)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke_2;
      block[3] = &unk_24CE3BE10;
      v16 = v11;
      v14 = v8;
      v15 = v9;
      dispatch_async(v10, block);

    }
    else
    {
      (*((void (**)(id, id, id))v11 + 2))(v11, v8, v9);
    }
  }

}

uint64_t __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke_3(uint64_t a1, char a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  char v32;

  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (void *)MEMORY[0x24BEAE868];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke_4;
  v25[3] = &unk_24CE3BE38;
  v31 = a3;
  v32 = a2;
  v26 = v15;
  v27 = v16;
  v20 = *(id *)(a1 + 32);
  v28 = v17;
  v29 = v20;
  v30 = v18;
  v21 = v18;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  objc_msgSend(v19, "checkPurgeableSpaceOffloadApps:cacheDeleteUrgency:withCompletionQueue:completion:", a3, a4, v22, v25);

}

void __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke_4(uint64_t a1, uint64_t a2, unint64_t a3, void *a4)
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  id v30;

  v30 = a4;
  v7 = *(_QWORD *)(a1 + 72);
  if (v7 <= a3)
    v8 = 0;
  else
    v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setAdditionalBytesRequired:", v7 - v8);
  v9 = *(void **)(a1 + 32);
  if (v9)
  {
    objc_msgSend(v9, "setHasSufficientFreeSpace:", a2);
    objc_msgSend(*(id *)(a1 + 32), "setNeedsAppOffload:", a2);
    if ((_DWORD)a2)
    {
      objc_msgSend(*(id *)(a1 + 32), "setNeedsCacheDelete:", *(unsigned __int8 *)(a1 + 80));
      v10 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setNeedsCacheDelete:", 0);
      v10 = *(_QWORD *)(a1 + 72) - a3;
    }
    objc_msgSend(*(id *)(a1 + 32), "setAdditionalBytesRequired:", v10);
  }
  if ((a2 & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    if (v30)
    {
      v12 = v30;
      if (*(_QWORD *)(a1 + 40))
      {
        v13 = objc_alloc(MEMORY[0x24BDBCED8]);
        objc_msgSend(v12, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithDictionary:", v14);

        objc_msgSend(v15, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("SUAdditionalError"));
        v16 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v12, "domain");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, objc_msgSend(v12, "code"), v15);
        v18 = objc_claimAutoreleasedReturnValue();

        v12 = (id)v18;
      }
    }
    else
    {
      v19 = *(void **)(a1 + 40);
      if (v19)
        v12 = v19;
      else
        v12 = 0;
    }
    v20 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "additionalBytesRequired"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("SUAdditionalSpaceRequired"));

    objc_msgSend(v20, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDD1398]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 6, v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 80))
      v29 = CFSTR("CacheDelete Purge and ");
    else
      v29 = &stru_24CE3EA48;
    SULogInfo(CFSTR("Insufficient space with %@app offload purge: %@"), v22, v23, v24, v25, v26, v27, v28, (uint64_t)v29);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __56__SUSpace_hasSufficientSpaceWithOptions_withCompletion___block_invoke_5(uint64_t a1, uint64_t a2, unint64_t a3, void *a4)
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;

  v33 = a4;
  objc_msgSend(*(id *)(a1 + 32), "setHasSufficientFreeSpace:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsCacheDelete:", a2);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAdditionalBytesRequired:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v8 = *(_QWORD *)(v7 + 24);
    if (v8 > a3)
    {
      *(_QWORD *)(v7 + 24) = v8 - a3;
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    }
    objc_msgSend(*(id *)(a1 + 32), "setAdditionalBytesRequired:", v8);
    SULogInfo(CFSTR("%s: Post CacheDelete neededBytes: %llu; amountPurgeable: %llu"),
      v9,
      v10,
      v11,
      v12,
      v13,
      v14,
      v15,
      (uint64_t)"+[SUSpace hasSufficientSpaceWithOptions:withCompletion:]_block_invoke_5");
    if (objc_msgSend(*(id *)(a1 + 40), "enableAppOffload"))
    {
      SULogInfo(CFSTR("%s: Attempting app offload"), v16, v17, v18, v19, v20, v21, v22, (uint64_t)"+[SUSpace hasSufficientSpaceWithOptions:withCompletion:]_block_invoke_5");
      (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t, _QWORD, id, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), objc_msgSend(*(id *)(a1 + 40), "appOffloadUrgency"), *(_QWORD *)(a1 + 32), v33, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    }
    else
    {
      v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 32), "additionalBytesRequired"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, CFSTR("SUAdditionalSpaceRequired"));

      objc_msgSend(v23, "setObject:forKeyedSubscript:", v33, *MEMORY[0x24BDD1398]);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 6, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("Insufficient space with CacheDelete purge: %@"), v26, v27, v28, v29, v30, v31, v32, (uint64_t)v25);
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

    }
  }

}

+ (BOOL)makeRoomForUpdate:(id)a3 error:(id *)a4
{
  id v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  char v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v5 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  v6 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __35__SUSpace_makeRoomForUpdate_error___block_invoke;
  v11[3] = &unk_24CE3BEB0;
  v13 = &v21;
  v14 = &v15;
  v7 = v6;
  v12 = v7;
  +[SUSpace makeRoomForUpdate:completion:](SUSpace, "makeRoomForUpdate:completion:", v5, v11);
  v8 = dispatch_time(0, 300000000000);
  dispatch_semaphore_wait(v7, v8);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __35__SUSpace_makeRoomForUpdate_error___block_invoke(uint64_t a1, char a2, id obj)
{
  id v5;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (void)makeRoomForUpdate:(id)a3 completion:(id)a4
{
  SUSpacePurgeOptions *v5;
  id v6;
  uint64_t v7;
  void *v8;
  SUSpacePurgeOptions *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  SUSpacePurgeOptions *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  SUSpacePurgeOptions *v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;

  v5 = (SUSpacePurgeOptions *)a3;
  v6 = a4;
  if (!v5)
    v5 = objc_alloc_init(SUSpacePurgeOptions);
  v7 = MEMORY[0x24BDAC760];
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __40__SUSpace_makeRoomForUpdate_completion___block_invoke_3;
  v42[3] = &unk_24CE3BF40;
  v43 = &__block_literal_global_79;
  v8 = (void *)MEMORY[0x212BF6094](v42);
  v37[0] = v7;
  v37[1] = 3221225472;
  v37[2] = __40__SUSpace_makeRoomForUpdate_completion___block_invoke_5;
  v37[3] = &unk_24CE3BF90;
  v9 = v5;
  v38 = v9;
  v39 = &__block_literal_global_79;
  v10 = v8;
  v40 = v10;
  v11 = v6;
  v41 = v11;
  v12 = (void *)MEMORY[0x212BF6094](v37);
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "spacePurgeTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && (int)objc_msgSend(v14, "intValue") >= 1)
  {
    objc_msgSend(v14, "intValue");
    SULogDebug(CFSTR("%s: [DEFAULTS] spacePurgeTime set, sleeping %d secs"), v15, v16, v17, v18, v19, v20, v21, (uint64_t)"+[SUSpace makeRoomForUpdate:completion:]");
    objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", (double)(int)objc_msgSend(v14, "intValue"));
    if ((objc_msgSend(v14, "intValue") & 1) != 0)
    {
      SULogDebug(CFSTR("%s: [DEFAULTS] space purge failed"), v22, v23, v24, v25, v26, v27, v28, (uint64_t)"+[SUSpace makeRoomForUpdate:completion:]");
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 6, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUSpacePurgeOptions completionQueue](v9, "completionQueue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      __40__SUSpace_makeRoomForUpdate_completion___block_invoke((uint64_t)v30, 0, v29, v30, v11);

    }
    else
    {
      SULogDebug(CFSTR("%s: [DEFAULTS] space purge succeeded"), v22, v23, v24, v25, v26, v27, v28, (uint64_t)"+[SUSpace makeRoomForUpdate:completion:]");
      -[SUSpacePurgeOptions completionQueue](v9, "completionQueue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      __40__SUSpace_makeRoomForUpdate_completion___block_invoke((uint64_t)v29, 1, 0, v29, v11);
    }
  }
  else
  {
    v31[0] = v7;
    v31[1] = 3221225472;
    v31[2] = __40__SUSpace_makeRoomForUpdate_completion___block_invoke_7;
    v31[3] = &unk_24CE3BFE0;
    v33 = &__block_literal_global_79;
    v32 = v9;
    v34 = v11;
    v35 = v12;
    v36 = v10;
    +[SUSpace hasSufficientSpaceWithOptions:withCompletion:](SUSpace, "hasSufficientSpaceWithOptions:withCompletion:", v32, v31);

    v29 = v33;
  }

}

void __40__SUSpace_makeRoomForUpdate_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD block[4];
  id v12;
  id v13;
  char v14;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(a3, "copy");
  if (v9)
  {
    if (v8)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __40__SUSpace_makeRoomForUpdate_completion___block_invoke_2;
      block[3] = &unk_24CE3BC40;
      v13 = v9;
      v14 = a2;
      v12 = v10;
      dispatch_async(v8, block);

    }
    else
    {
      (*((void (**)(id, uint64_t, void *))v9 + 2))(v9, a2, v10);
    }
  }

}

uint64_t __40__SUSpace_makeRoomForUpdate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __40__SUSpace_makeRoomForUpdate_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;

  v9 = a4;
  v10 = a5;
  SULogInfo(CFSTR("Requesting AppStoreDaemon offload %llu bytes worth of apps"), v11, v12, v13, v14, v15, v16, v17, a2);
  v18 = (void *)MEMORY[0x24BEAE868];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __40__SUSpace_makeRoomForUpdate_completion___block_invoke_4;
  v22[3] = &unk_24CE3BF18;
  v19 = *(id *)(a1 + 32);
  v23 = v9;
  v24 = v19;
  v25 = v10;
  v20 = v10;
  v21 = v9;
  objc_msgSend(v18, "offloadAppsPurge:cacheDeleteUrgency:withCompletionQueue:completion:", a2, a3, 0, v22);

}

void __40__SUSpace_makeRoomForUpdate_completion___block_invoke_4(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;

  v7 = a4;
  v17 = v7;
  if (a2)
  {
    SULogInfo(CFSTR("Device has sufficient free space after AppStoreDaemon offloaded %llu bytes worth of apps"), v8, v9, v10, v11, v12, v13, v14, a3);
    v15 = 0;
  }
  else
  {
    SULogInfo(CFSTR("AppStoreDaemon was unable to offload requested space: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);
    v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BDD1398]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 6, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __40__SUSpace_makeRoomForUpdate_completion___block_invoke_5(id *a1, uint64_t a2, uint64_t a3, char a4, void *a5, void *a6)
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD *v30;
  char v31;
  _QWORD v32[4];

  v10 = a5;
  v11 = a6;
  SULogInfo(CFSTR("Requesting CacheDelete purge %llu bytes"), v12, v13, v14, v15, v16, v17, v18, a2);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v32[3] = a2;
  v19 = (void *)MEMORY[0x24BEAE868];
  v20 = objc_msgSend(a1[4], "cacheDeleteUrgency");
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __40__SUSpace_makeRoomForUpdate_completion___block_invoke_6;
  v23[3] = &unk_24CE3BF68;
  v26 = a1[5];
  v21 = v10;
  v24 = v21;
  v22 = v11;
  v31 = a4;
  v27 = v22;
  v30 = v32;
  v28 = a1[6];
  v25 = a1[4];
  v29 = a1[7];
  objc_msgSend(v19, "cacheDeletePurge:cacheDeleteUrgency:withCompletionQueue:completion:", a2, v20, 0, v23);

  _Block_object_dispose(v32, 8);
}

void __40__SUSpace_makeRoomForUpdate_completion___block_invoke_6(uint64_t a1, int a2, unint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  unint64_t v17;
  id v18;
  void *v19;
  id v20;

  v20 = a4;
  if (a2)
  {
    SULogInfo(CFSTR("Device has sufficient free space after CacheDelete purged %llu bytes"), v7, v8, v9, v10, v11, v12, v13, a3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else if (*(_BYTE *)(a1 + 88))
  {
    SULogInfo(CFSTR("CacheDelete purged %llu bytes. Originally requested %llu bytes"), v7, v8, v9, v10, v11, v12, v13, a3);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v15 = *(_QWORD *)(v14 + 24);
    v16 = v15 > a3;
    v17 = v15 - a3;
    if (v16)
    {
      *(_QWORD *)(v14 + 24) = v17;
      (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), objc_msgSend(*(id *)(a1 + 40), "appOffloadUrgency"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));
    }
  }
  else
  {
    SULogInfo(CFSTR("Device has insufficient free space after CacheDelete purged %llu bytes"), v7, v8, v9, v10, v11, v12, v13, a3);
    if (*(_QWORD *)(a1 + 56))
    {
      v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BDD1398]);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 6, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }

}

void __40__SUSpace_makeRoomForUpdate_completion___block_invoke_7(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  SUAppPurgingAlertItem *v57;
  SUAppPurgingAlertItem *v58;
  void *v59;
  void (**v60)(id, _QWORD, void *, void *, id);
  void *v61;
  void *v62;
  void (**v63)(id, uint64_t, void *, void *, id);
  uint64_t v64;
  void *v65;
  void (**v66)(id, uint64_t, uint64_t, _QWORD, void *, id);
  uint64_t v67;
  uint64_t v68;
  void (**v69)(id, uint64_t, _QWORD, void *, id);
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  unint64_t v83;

  v5 = a2;
  v6 = a3;
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "haveEnoughSpace");

  if ((v8 & 1) != 0)
  {
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "fakeAppOffload");

    if (v17)
    {
      objc_msgSend(v5, "setHasSufficientFreeSpace:", 1);
      objc_msgSend(v5, "setNeedsAppOffload:", 1);
      objc_msgSend(v5, "setNeedsCacheDelete:", 1);
      objc_msgSend(v5, "setAdditionalBytesRequired:", 1000000);
      SULogInfo(CFSTR("Faking an app offload with %@"), v18, v19, v20, v21, v22, v23, v24, (uint64_t)v5);
    }
    if (objc_msgSend(v5, "hasSufficientFreeSpace"))
    {
      if ((objc_msgSend(v5, "needsCacheDelete") & 1) != 0 || (objc_msgSend(v5, "needsAppOffload") & 1) != 0)
      {
        v39 = +[SUSpace currentFreeSpaceForVolume:](SUSpace, "currentFreeSpaceForVolume:", CFSTR("/"));
        v80 = 0;
        v81 = &v80;
        v82 = 0x2020000000;
        v83 = 0;
        v40 = objc_msgSend(a1[4], "neededBytes");
        v48 = 0;
        if (v40 > v39)
          v48 = objc_msgSend(a1[4], "neededBytes") - v39;
        v83 = v48;
        SULogInfo(CFSTR("neededSpace = %llu"), v41, v42, v43, v44, v45, v46, v47, v81[3]);
        if (objc_msgSend(v5, "needsAppOffload"))
        {
          SULogInfo(CFSTR("Device needs to offload apps to make suffience space for download"), v49, v50, v51, v52, v53, v54, v55, v71);
          +[SUAlertPresentationManager sharedInstance](SUAlertPresentationManager, "sharedInstance");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "dismissAlertsOfClass:animated:", objc_opt_class(), 1);
          v57 = [SUAppPurgingAlertItem alloc];
          v72[0] = MEMORY[0x24BDAC760];
          v72[1] = 3221225472;
          v72[2] = __40__SUSpace_makeRoomForUpdate_completion___block_invoke_8;
          v72[3] = &unk_24CE3BFB8;
          v73 = v5;
          v75 = a1[7];
          v79 = &v80;
          v74 = a1[4];
          v76 = a1[6];
          v77 = a1[8];
          v78 = a1[5];
          v58 = -[SUAppPurgingAlertItem initWithHandler:bytesNeeded:](v57, "initWithHandler:bytesNeeded:", v72, v81[3]);
          objc_msgSend(v56, "presentAlert:animated:", v58, 1);

        }
        else
        {
          if (!objc_msgSend(v5, "needsCacheDelete"))
          {
LABEL_20:
            _Block_object_dispose(&v80, 8);
            goto LABEL_21;
          }
          v66 = (void (**)(id, uint64_t, uint64_t, _QWORD, void *, id))a1[7];
          v67 = v81[3];
          v68 = objc_msgSend(a1[4], "cacheDeleteUrgency");
          objc_msgSend(a1[4], "completionQueue");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v66[2](v66, v67, v68, 0, v56, a1[6]);
        }

        goto LABEL_20;
      }
      SULogInfo(CFSTR("Device has sufficient free space. No cleanup needed"), v32, v33, v34, v35, v36, v37, v38, v70);
      v69 = (void (**)(id, uint64_t, _QWORD, void *, id))a1[5];
      objc_msgSend(a1[4], "completionQueue");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v69[2](v69, 1, 0, v61, a1[6]);
    }
    else
    {
      SULogInfo(CFSTR("Unable to make sufficient room for download"), v25, v26, v27, v28, v29, v30, v31, v70);
      v60 = (void (**)(id, _QWORD, void *, void *, id))a1[5];
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 6, 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "completionQueue");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v60[2](v60, 0, v61, v62, a1[6]);

    }
  }
  else
  {
    SULogInfo(CFSTR("Spoofing %s with %@, the space purge will directly end and no further actions"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)"+[SUSpace makeRoomForUpdate:completion:]_block_invoke_7");
    if ((objc_msgSend(v5, "hasSufficientFreeSpace") & 1) != 0)
    {
      v59 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 6, 0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v63 = (void (**)(id, uint64_t, void *, void *, id))a1[5];
    v64 = objc_msgSend(v5, "hasSufficientFreeSpace");
    objc_msgSend(a1[4], "completionQueue");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v63[2](v63, v64, v59, v65, a1[6]);

  }
LABEL_21:

}

void __40__SUSpace_makeRoomForUpdate_completion___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  if ((_DWORD)a2 == 1)
  {
    SULogInfo(CFSTR("App offload accepted by user"), a2, a3, a4, a5, a6, a7, a8, v18);
    v9 = objc_msgSend(*(id *)(a1 + 32), "needsCacheDelete");
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v11 = *(void **)(a1 + 40);
    if (v9)
    {
      v12 = *(_QWORD *)(a1 + 48);
      v13 = objc_msgSend(v11, "cacheDeleteUrgency");
      objc_msgSend(*(id *)(a1 + 40), "completionQueue");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 16))(v12, v10, v13, 1);
    }
    else
    {
      v16 = *(_QWORD *)(a1 + 64);
      v17 = objc_msgSend(v11, "appOffloadUrgency");
      objc_msgSend(*(id *)(a1 + 40), "completionQueue");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v16, v10, v17);
    }
  }
  else
  {
    SULogInfo(CFSTR("App offload declined by user"), a2, a3, a4, a5, a6, a7, a8, v18);
    v14 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 44, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "completionQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id, void *, _QWORD))(v14 + 16))(v14, 0, v19, v15, *(_QWORD *)(a1 + 56));

  }
}

+ (unint64_t)currentFreeSpaceForVolume:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  unint64_t v5;
  statfs v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (__CFString *)a3;
  memset(&v7.f_mntonname[392], 0, 32);
  if (!v3)
    v3 = CFSTR("/");
  memset(&v7, 0, 480);
  v4 = objc_retainAutorelease(v3);
  if (statfs((const char *)-[__CFString fileSystemRepresentation](v4, "fileSystemRepresentation"), &v7))
    v5 = 0;
  else
    v5 = v7.f_bavail * v7.f_bsize;

  return v5;
}

@end
