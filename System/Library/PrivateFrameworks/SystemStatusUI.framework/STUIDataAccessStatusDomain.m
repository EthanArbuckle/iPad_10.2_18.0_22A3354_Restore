@implementation STUIDataAccessStatusDomain

void __51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 64);
  else
    v3 = 0;
  objc_msgSend(v3, "data");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STUIDataAccessStatusDomain _internalQueue_handleLocationData:mediaData:](*(_QWORD *)(a1 + 32), v4, *(void **)(a1 + 40));

}

void __51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 72);
  else
    v3 = 0;
  objc_msgSend(v3, "data");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STUIDataAccessStatusDomain _internalQueue_handleLocationData:mediaData:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v4);

}

- (void)_internalQueue_handleLocationData:(void *)a3 mediaData:
{
  NSObject *v5;
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;

  if (a1)
  {
    v5 = *(NSObject **)(a1 + 40);
    v6 = a3;
    v7 = a2;
    dispatch_assert_queue_V2(v5);
    v9 = (unint64_t)*(id *)(a1 + 80);
    -[STUIDataAccessStatusDomain _internalQueue_updateDataForLocationData:mediaData:]((dispatch_queue_t *)a1, v7, v6);

    v8 = (unint64_t)*(id *)(a1 + 80);
    if (v9 | v8)
    {
      if ((objc_msgSend((id)v9, "isEqual:", v8) & 1) == 0)
        -[STUIDataAccessStatusDomain _internalQueue_notifyClientsOfData:](a1, (void *)v8);
    }

  }
}

- (void)_internalQueue_notifyClientsOfData:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    v4 = *(NSObject **)(a1 + 48);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __65__STUIDataAccessStatusDomain__internalQueue_notifyClientsOfData___block_invoke;
    v5[3] = &unk_1E8D62C88;
    v5[4] = a1;
    v6 = v3;
    dispatch_async(v4, v5);

  }
}

- (void)_internalQueue_updateDataForLocationData:(void *)a3 mediaData:
{
  unint64_t v5;
  const char *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  SEL v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  uint64_t v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  id v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  NSObject *v60;
  id v61;
  void *v62;
  SEL v63;
  NSObject *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  unint64_t v72;
  id obj;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  dispatch_queue_t *val;
  NSObject *v78;
  NSObject *v79;
  NSObject *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD v97[4];
  id v98;
  id v99;
  id location;
  _BYTE v101[128];
  _BYTE v102[128];
  _QWORD v103[16];
  _QWORD v104[5];
  BOOL v105;
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v72 = a2;
  v5 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[5]);
    if (v72 | v5)
    {
      val = a1;
      v71 = (void *)v5;
      objc_msgSend((id)v5, "cameraAttributions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIDataAccessStatusDomain _dataAccessAttributionsForAttributions:dataAccessType:dataAccessAttributionProvider:]((uint64_t)a1, v7, 1, &__block_literal_global_27_0);
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v71, "microphoneAttributions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUIDataAccessStatusDomain _dataAccessAttributionsForAttributions:dataAccessType:dataAccessAttributionProvider:]((uint64_t)a1, v8, 0, &__block_literal_global_9);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (id)v72;
      v10 = objc_msgSend(v9, "activeDisplayModes");
      objc_msgSend(v9, "attributions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v103[0] = MEMORY[0x1E0C809B0];
      v103[1] = 3221225472;
      v103[2] = __75__STUIDataAccessStatusDomain__filteredLocationAttributionsForLocationData___block_invoke;
      v103[3] = &__block_descriptor_40_e51_B16__0__STLocationStatusDomainLocationAttribution_8l;
      v103[4] = v10;
      objc_msgSend(v11, "bs_filter:", v103);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v104[0] = MEMORY[0x1E0C809B0];
      v104[1] = 3221225472;
      v104[2] = __75__STUIDataAccessStatusDomain__filteredLocationAttributionsForLocationData___block_invoke_2;
      v104[3] = &unk_1E8D63C90;
      v105 = (v10 & 2) != 0;
      v104[4] = val;
      objc_msgSend(v12, "bs_map:", v104);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      -[STUIDataAccessStatusDomain _dataAccessAttributionsForAttributions:dataAccessType:dataAccessAttributionProvider:]((uint64_t)val, v68, 2, &__block_literal_global_28);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v70, "mutableCopy");
      objc_msgSend(v13, "unionSet:", v69);
      objc_msgSend(v13, "unionSet:", v67);
      v14 = v13;
      dispatch_assert_queue_V2(val[5]);
      v15 = val[11];
      objc_setProperty_nonatomic_copy(val, v16, v14, 88);
      v17 = (void *)objc_msgSend(v14, "mutableCopy");
      objc_msgSend(v17, "minusSet:", v15);
      v64 = v15;
      v65 = -[NSObject mutableCopy](v15, "mutableCopy");
      v66 = v14;
      objc_msgSend(v65, "minusSet:", v14);
      v79 = val[12];
      v80 = val[13];
      v78 = val[14];
      v18 = val[15];
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      v96 = 0u;
      obj = v17;
      v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
      if (v75)
      {
        v74 = *(_QWORD *)v94;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v94 != v74)
            {
              v20 = v19;
              objc_enumerationMutation(obj);
              v19 = v20;
            }
            v76 = v19;
            v21 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * v19);
            v89 = 0u;
            v90 = 0u;
            v91 = 0u;
            v92 = 0u;
            -[NSObject allKeys](v80, "allKeys");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
            if (v23)
            {
              v24 = *(_QWORD *)v90;
              do
              {
                for (i = 0; i != v23; ++i)
                {
                  if (*(_QWORD *)v90 != v24)
                    objc_enumerationMutation(v22);
                  v26 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
                  objc_msgSend(v26, "attributedEntity");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "attributedEntity");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v27, "isEqual:", v28))
                  {
                    v29 = objc_msgSend(v26, "dataAccessType");
                    LODWORD(v29) = v29 == objc_msgSend(v21, "dataAccessType");

                    if ((_DWORD)v29)
                    {
                      -[NSObject objectForKey:](v80, "objectForKey:", v26);
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v30, "invalidate");

                      -[NSObject removeObjectForKey:](v80, "removeObjectForKey:", v26);
                      -[NSObject removeObject:](v79, "removeObject:", v26);
                    }
                  }
                  else
                  {

                  }
                }
                v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v89, v103, 16);
              }
              while (v23);
            }

            v87 = 0u;
            v88 = 0u;
            v85 = 0u;
            v86 = 0u;
            -[NSObject allKeys](v18, "allKeys");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v85, v102, 16);
            if (v32)
            {
              v33 = *(_QWORD *)v86;
              do
              {
                for (j = 0; j != v32; ++j)
                {
                  if (*(_QWORD *)v86 != v33)
                    objc_enumerationMutation(v31);
                  v35 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
                  objc_msgSend(v35, "attributedEntity");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "attributedEntity");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v36, "isEqual:", v37))
                  {
                    v38 = objc_msgSend(v35, "dataAccessType");
                    LODWORD(v38) = v38 == objc_msgSend(v21, "dataAccessType");

                    if ((_DWORD)v38)
                    {
                      -[NSObject objectForKey:](v18, "objectForKey:", v35);
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v39, "invalidate");

                      -[NSObject removeObjectForKey:](v18, "removeObjectForKey:", v35);
                      -[NSObject removeObject:](v78, "removeObject:", v35);
                    }
                  }
                  else
                  {

                  }
                }
                v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v85, v102, 16);
              }
              while (v32);
            }

            v19 = v76 + 1;
          }
          while (v76 + 1 != v75);
          v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
        }
        while (v75);
      }

      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      v40 = v65;
      v41 = 0;
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v81, v101, 16);
      if (v42)
      {
        v43 = *(_QWORD *)v82;
        do
        {
          for (k = 0; k != v42; ++k)
          {
            if (*(_QWORD *)v82 != v43)
              objc_enumerationMutation(v40);
            v45 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * k);
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "accessStartDate");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "timeIntervalSinceDate:", v47);
            v49 = v48;

            v50 = objc_msgSend(v45, "dataAccessType");
            v51 = 2.0;
            if (!v50)
            {
              objc_msgSend(v45, "microphoneRecordingAttribution", 2.0);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "maximumHistoryAccessed");
              v54 = v53;

              v51 = fmax(v54, 2.0);
            }
            v55 = v51 - v49;
            if (BSFloatGreaterThanFloat())
            {
              v56 = v45;
              objc_initWeak(&location, val);
              v57 = val[12];
              -[NSObject addObject:](v57, "addObject:", v56);

              v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01720]), "initWithIdentifier:", CFSTR("STUIDataAccessStatusDomain-MinimumDisplayTime"));
              v59 = val[13];
              -[NSObject setObject:forKey:](v59, "setObject:forKey:", v58, v56);

              v60 = val[5];
              v97[0] = MEMORY[0x1E0C809B0];
              v97[1] = 3221225472;
              v97[2] = __94__STUIDataAccessStatusDomain__internalQueue_beginWaitingForMinimumDisplayTime_forAttribution___block_invoke;
              v97[3] = &unk_1E8D63D38;
              objc_copyWeak(&v99, &location);
              v61 = v56;
              v98 = v61;
              objc_msgSend(v58, "scheduleWithFireInterval:leewayInterval:queue:handler:", v60, v97, v55, 0.5);

              objc_destroyWeak(&v99);
              objc_destroyWeak(&location);

            }
            else
            {
              -[STUIDataAccessStatusDomain _internalQueue_makeAttributionRecent:]((id *)val, v45);
              v41 = 1;
            }
          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v81, v101, 16);
        }
        while (v42);
      }

      if ((objc_msgSend(obj, "count") != 0) | v41 & 1)
      {
        -[STUIDataAccessStatusDomain _internalQueue_generatedData](val);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_setProperty_nonatomic_copy(val, v63, v62, 80);

      }
      v5 = (unint64_t)v71;
    }
    else
    {
      objc_setProperty_nonatomic_copy(a1, v6, 0, 80);
    }
  }

}

- (id)_dataAccessAttributionsForAttributions:(uint64_t)a3 dataAccessType:(void *)a4 dataAccessAttributionProvider:
{
  id v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  id obj;
  void (**v26)(id, _QWORD);
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v26 = a4;
  v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v29 = (void *)objc_msgSend(*(id *)(a1 + 88), "mutableCopy");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v7;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v30)
  {
    v28 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v36 != v28)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v10 = v29;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v32;
LABEL_8:
          v14 = 0;
LABEL_9:
          if (*(_QWORD *)v32 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v14);
          if (objc_msgSend(v15, "dataAccessType") != a3)
            goto LABEL_20;
          v16 = v15;
          v17 = objc_msgSend(v16, "dataAccessType");
          switch(v17)
          {
            case 2:
              objc_msgSend(v16, "locationAttribution");
              v18 = objc_claimAutoreleasedReturnValue();
              break;
            case 1:
              objc_msgSend(v16, "cameraCaptureAttribution");
              v18 = objc_claimAutoreleasedReturnValue();
              break;
            case 0:
              objc_msgSend(v16, "microphoneRecordingAttribution");
              v18 = objc_claimAutoreleasedReturnValue();
              break;
            default:
LABEL_19:

              v19 = objc_msgSend(v15, "isEqual:", v9);
              if ((v19 & 1) != 0)
              {
                v20 = v16;

                if (!v20)
                  goto LABEL_25;
                v21 = v20;
                objc_msgSend(v10, "removeObject:", v21);
                v22 = v21;
LABEL_27:
                objc_msgSend(v27, "addObject:", v21);

                continue;
              }
LABEL_20:
              if (v12 == ++v14)
              {
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
                if (v12)
                  goto LABEL_8;
                goto LABEL_22;
              }
              goto LABEL_9;
          }
          v15 = (void *)v18;
          goto LABEL_19;
        }
LABEL_22:

LABEL_25:
        v26[2](v26, v9);
        v23 = objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v21 = (id)v23;
          v22 = 0;
          goto LABEL_27;
        }
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v30);
  }

  return v27;
}

- (STUIMutableDataAccessStatusDomainData)_internalQueue_generatedData
{
  STUIMutableDataAccessStatusDomainData *v1;
  void *v2;

  v1 = (STUIMutableDataAccessStatusDomainData *)a1;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[5]);
    v2 = (void *)-[STListData mutableCopy](v1[3].super._attributionListData, "mutableCopy");
    objc_msgSend(v2, "addObjectsFromArray:", v1[4].super.super.isa);
    objc_msgSend(v2, "addObjectsFromArray:", v1[4].super._attributionListData);
    v1 = objc_alloc_init(STUIMutableDataAccessStatusDomainData);
    -[STUIMutableDataAccessStatusDomainData setDataAccessAttributions:](v1, "setDataAccessAttributions:", v2);

  }
  return v1;
}

STUIDataAccessAttribution *__77__STUIDataAccessStatusDomain__dataAccessAttributionsForLocationAttributions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  STUIDataAccessAttribution *v3;
  void *v4;
  STUIDataAccessAttribution *v5;

  v2 = a2;
  v3 = [STUIDataAccessAttribution alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[STUIDataAccessAttribution initWithLocationAttribution:recent:startDate:endDate:](v3, "initWithLocationAttribution:recent:startDate:endDate:", v2, 0, v4, 0);

  return v5;
}

STUIDataAccessAttribution *__82__STUIDataAccessStatusDomain__dataAccessAttributionsForCameraCaptureAttributions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  STUIDataAccessAttribution *v3;
  void *v4;
  STUIDataAccessAttribution *v5;

  v2 = a2;
  v3 = [STUIDataAccessAttribution alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[STUIDataAccessAttribution initWithCameraCaptureAttribution:recent:startDate:endDate:](v3, "initWithCameraCaptureAttribution:recent:startDate:endDate:", v2, 0, v4, 0);

  return v5;
}

STUIDataAccessAttribution *__88__STUIDataAccessStatusDomain__dataAccessAttributionsForMicrophoneRecordingAttributions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  STUIDataAccessAttribution *v3;
  void *v4;
  STUIDataAccessAttribution *v5;

  v2 = a2;
  v3 = [STUIDataAccessAttribution alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[STUIDataAccessAttribution initWithMicrophoneRecordingAttribution:recent:startDate:endDate:](v3, "initWithMicrophoneRecordingAttribution:recent:startDate:endDate:", v2, 0, v4, 0);

  return v5;
}

+ (unint64_t)statusDomainName
{
  return 9000;
}

uint64_t __65__STUIDataAccessStatusDomain__internalQueue_notifyClientsOfData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "observeData:forDomain:withChangeContext:", *(_QWORD *)(a1 + 40), 9000, 0);
}

id __75__STUIDataAccessStatusDomain__filteredLocationAttributionsForLocationData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v22;

  v3 = a2;
  if ((objc_msgSend(v3, "eligibleDisplayModes") & 1) != 0
    || *(_BYTE *)(a1 + 40)
    || (objc_msgSend(v3, "activityAttribution"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "attributedEntity"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isSystemService"),
        v5,
        v4,
        !v6))
  {
    v20 = v3;
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = v3;
    v9 = v8;
    if (v7)
    {
      objc_msgSend(v8, "activityAttribution");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "attributedEntity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isSystemService"))
      {
        v12 = objc_alloc(MEMORY[0x1E0DB0860]);
        objc_msgSend(v11, "executableIdentity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "website");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedExecutableDisplayName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedExecutableDisplayName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v12, "initWithExecutableIdentity:website:systemService:localizedDisplayName:localizedExecutableDisplayName:", v13, v14, 0, v15, v16);

        objc_msgSend(v10, "activeEntity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v18, "isEqual:", v11) & 1) != 0)
          v19 = 0;
        else
          v19 = v18;
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0858]), "initWithAttributedEntity:activeEntity:", v17, v19);
        v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0908]), "initWithLocationState:activityAttribution:eligibleDisplayModes:", objc_msgSend(v9, "locationState"), v22, objc_msgSend(v9, "eligibleDisplayModes"));

      }
      else
      {
        v20 = v9;
      }

    }
    else
    {
      v20 = 0;
    }

  }
  return v20;
}

BOOL __75__STUIDataAccessStatusDomain__filteredLocationAttributionsForLocationData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _BOOL8 v5;

  v3 = a2;
  if (objc_msgSend(v3, "locationState") == 1)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = (objc_msgSend(v3, "eligibleDisplayModes") & v4) != 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke_3;
    v7[3] = &unk_1E8D62C88;
    v8 = WeakRetained;
    v9 = v3;
    dispatch_async(v6, v7);

  }
}

void __51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  _QWORD *v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[5];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke_5;
    v7[3] = &unk_1E8D62C88;
    v8 = WeakRetained;
    v9 = v3;
    dispatch_async(v6, v7);

  }
}

- (STUIDataAccessStatusDomain)initWithServerHandle:(id)a3
{
  id v4;
  STUIDataAccessStatusDomain *v5;
  uint64_t Serial;
  OS_dispatch_queue *internalQueue;
  uint64_t v8;
  OS_dispatch_queue *clientQueue;
  uint64_t v10;
  NSSet *activeAttributions;
  uint64_t v12;
  NSMutableArray *attributionsWaitingForMinimumDisplayTime;
  uint64_t v14;
  NSMutableDictionary *activeAttributionMinimumDisplayTimers;
  uint64_t v16;
  NSMutableArray *recentAttributions;
  uint64_t v18;
  NSMutableDictionary *recentAttributionExpirationTimers;
  uint64_t v20;
  STLocationStatusDomain *locationDomain;
  uint64_t v22;
  STMediaStatusDomain *mediaDomain;
  NSObject *v24;
  STUIDataAccessStatusDomain *v25;
  id v26;
  uint64_t v27;
  BSInvalidatable *stateCaptureHandle;
  id v30;
  _QWORD block[4];
  STUIDataAccessStatusDomain *v32;
  id v33;
  id location;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)STUIDataAccessStatusDomain;
  v5 = -[STStatusDomain initWithServerHandle:](&v35, sel_initWithServerHandle_, v4);
  if (v5)
  {
    Serial = BSDispatchQueueCreateSerial();
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)Serial;

    v8 = BSDispatchQueueCreateSerial();
    clientQueue = v5->_clientQueue;
    v5->_clientQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    activeAttributions = v5->_activeAttributions;
    v5->_activeAttributions = (NSSet *)v10;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    attributionsWaitingForMinimumDisplayTime = v5->_attributionsWaitingForMinimumDisplayTime;
    v5->_attributionsWaitingForMinimumDisplayTime = (NSMutableArray *)v12;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    activeAttributionMinimumDisplayTimers = v5->_activeAttributionMinimumDisplayTimers;
    v5->_activeAttributionMinimumDisplayTimers = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    recentAttributions = v5->_recentAttributions;
    v5->_recentAttributions = (NSMutableArray *)v16;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    recentAttributionExpirationTimers = v5->_recentAttributionExpirationTimers;
    v5->_recentAttributionExpirationTimers = (NSMutableDictionary *)v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB08F8]), "initWithServerHandle:", v4);
    locationDomain = v5->_locationDomain;
    v5->_locationDomain = (STLocationStatusDomain *)v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0910]), "initWithServerHandle:", v4);
    mediaDomain = v5->_mediaDomain;
    v5->_mediaDomain = (STMediaStatusDomain *)v22;

    objc_initWeak(&location, v5);
    v24 = v5->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke;
    block[3] = &unk_1E8D63C20;
    v25 = v5;
    v32 = v25;
    objc_copyWeak(&v33, &location);
    dispatch_sync(v24, block);
    v26 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v30, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v27 = objc_claimAutoreleasedReturnValue();
    stateCaptureHandle = v25->_stateCaptureHandle;
    v25->_stateCaptureHandle = (BSInvalidatable *)v27;

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v33);

    objc_destroyWeak(&location);
  }

  return v5;
}

void __51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke_2;
  v13[3] = &unk_1E8D63BD0;
  v4 = (id *)(a1 + 40);
  objc_copyWeak(&v14, (id *)(a1 + 40));
  objc_msgSend(v2, "observeData:", v13);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  v8 = v3;
  v9 = 3221225472;
  v10 = __51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke_4;
  v11 = &unk_1E8D63BF8;
  objc_copyWeak(&v12, v4);
  objc_msgSend(v5, "observeData:", &v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "data", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIDataAccessStatusDomain _internalQueue_updateDataForLocationData:mediaData:](*(dispatch_queue_t **)(a1 + 32), v6, v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
}

__CFString *__51__STUIDataAccessStatusDomain_initWithServerHandle___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("(empty)");
  v5 = v3;

  return v5;
}

- (void)dealloc
{
  NSMutableDictionary *activeAttributionMinimumDisplayTimers;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSMutableDictionary *recentAttributionExpirationTimers;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    -[BSInvalidatable invalidate](self->_stateCaptureHandle, "invalidate");
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    activeAttributionMinimumDisplayTimers = self->_activeAttributionMinimumDisplayTimers;
  }
  else
  {
    objc_msgSend(0, "invalidate");
    activeAttributionMinimumDisplayTimers = 0;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
  }
  -[NSMutableDictionary allValues](activeAttributionMinimumDisplayTimers, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "invalidate");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  if (self)
    recentAttributionExpirationTimers = self->_recentAttributionExpirationTimers;
  else
    recentAttributionExpirationTimers = 0;
  -[NSMutableDictionary allValues](recentAttributionExpirationTimers, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "invalidate");
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  v15.receiver = self;
  v15.super_class = (Class)STUIDataAccessStatusDomain;
  -[STStatusDomain dealloc](&v15, sel_dealloc);
}

- (id)data
{
  NSObject *internalQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__STUIDataAccessStatusDomain_data__block_invoke;
  v5[3] = &unk_1E8D62AF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__STUIDataAccessStatusDomain_data__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "isInvalidated") & 1) == 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
      v3 = *(void **)(v2 + 80);
    else
      v3 = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
  }
}

- (void)invalidate
{
  NSObject *internalQueue;
  _QWORD block[5];

  if (self)
    internalQueue = self->_internalQueue;
  else
    internalQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__STUIDataAccessStatusDomain_invalidate__block_invoke;
  block[3] = &unk_1E8D62A38;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

id __40__STUIDataAccessStatusDomain_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 64);
  else
    v3 = 0;
  objc_msgSend(v3, "invalidate");
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 72);
  else
    v5 = 0;
  objc_msgSend(v5, "invalidate");
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)STUIDataAccessStatusDomain;
  return objc_msgSendSuper2(&v7, sel_invalidate);
}

- (void)_internalQueue_makeAttributionRecent:(id *)a1
{
  void *v2;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  STUIDataAccessAttribution *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  STUIDataAccessAttribution *v12;
  STUIDataAccessAttribution *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v4 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "dataAccessType");
    if (v7 == 2)
    {
      v12 = [STUIDataAccessAttribution alloc];
      objc_msgSend(v5, "locationAttribution");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessStartDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[STUIDataAccessAttribution initWithLocationAttribution:recent:startDate:endDate:](v12, "initWithLocationAttribution:recent:startDate:endDate:", v9, 1, v10, v6);
    }
    else if (v7 == 1)
    {
      v13 = [STUIDataAccessAttribution alloc];
      objc_msgSend(v5, "cameraCaptureAttribution");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessStartDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[STUIDataAccessAttribution initWithCameraCaptureAttribution:recent:startDate:endDate:](v13, "initWithCameraCaptureAttribution:recent:startDate:endDate:", v9, 1, v10, v6);
    }
    else
    {
      if (v7)
      {
LABEL_9:

        v14 = a1[14];
        objc_msgSend(v14, "addObject:", v2);

        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01720]), "initWithIdentifier:", CFSTR("STUIDataAccessStatusDomain-RecentAttributionExpiration"));
        v16 = a1[15];
        objc_msgSend(v16, "setObject:forKey:", v15, v2);

        v17 = a1[5];
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __67__STUIDataAccessStatusDomain__internalQueue_makeAttributionRecent___block_invoke;
        v19[3] = &unk_1E8D63D38;
        objc_copyWeak(&v21, &location);
        v18 = v2;
        v20 = v18;
        objc_msgSend(v15, "scheduleWithFireInterval:leewayInterval:queue:handler:", v17, v19, 15.0, 0.5);

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
        goto LABEL_10;
      }
      v8 = [STUIDataAccessAttribution alloc];
      objc_msgSend(v5, "audioRecordingActivityAttribution");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessStartDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[STUIDataAccessAttribution initWithAudioRecordingActivityAttribution:recent:startDate:endDate:](v8, "initWithAudioRecordingActivityAttribution:recent:startDate:endDate:", v9, 1, v10, v6);
    }
    v2 = (void *)v11;

    goto LABEL_9;
  }
LABEL_10:

}

void __94__STUIDataAccessStatusDomain__internalQueue_beginWaitingForMinimumDisplayTime_forAttribution___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  id self;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  self = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "invalidate");

  v5 = self;
  if (self)
    v5 = (void *)*((_QWORD *)self + 13);
  objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  v6 = self;
  if (self)
    v6 = (void *)*((_QWORD *)self + 12);
  objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 32));
  -[STUIDataAccessStatusDomain _internalQueue_makeAttributionRecent:]((id *)self, *(void **)(a1 + 32));
  -[STUIDataAccessStatusDomain _internalQueue_generatedData]((dispatch_queue_t *)self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (uint64_t)self;
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v7, v8, 80);
    v9 = (uint64_t)self;
  }
  -[STUIDataAccessStatusDomain _internalQueue_notifyClientsOfData:](v9, v8);

}

void __67__STUIDataAccessStatusDomain__internalQueue_makeAttributionRecent___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  id self;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  self = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "invalidate");

  v5 = self;
  if (self)
    v5 = (void *)*((_QWORD *)self + 15);
  objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  v6 = self;
  if (self)
    v6 = (void *)*((_QWORD *)self + 14);
  objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 32));
  -[STUIDataAccessStatusDomain _internalQueue_generatedData]((dispatch_queue_t *)self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (uint64_t)self;
  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v7, v8, 80);
    v9 = (uint64_t)self;
  }
  -[STUIDataAccessStatusDomain _internalQueue_notifyClientsOfData:](v9, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentAttributionExpirationTimers, 0);
  objc_storeStrong((id *)&self->_recentAttributions, 0);
  objc_storeStrong((id *)&self->_activeAttributionMinimumDisplayTimers, 0);
  objc_storeStrong((id *)&self->_attributionsWaitingForMinimumDisplayTime, 0);
  objc_storeStrong((id *)&self->_activeAttributions, 0);
  objc_storeStrong((id *)&self->_currentData, 0);
  objc_storeStrong((id *)&self->_mediaDomain, 0);
  objc_storeStrong((id *)&self->_locationDomain, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
