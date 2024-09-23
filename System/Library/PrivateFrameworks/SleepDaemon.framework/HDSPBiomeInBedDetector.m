@implementation HDSPBiomeInBedDetector

+ (id)inBedDetector
{
  return objc_alloc_init((Class)a1);
}

+ (double)hoursOfSleepForResult:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "duration");
        v7 = v7 + v9 / 3600.0;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (id)detectInBedTimesDuringInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];

  v4 = a3;
  v5 = (void *)MEMORY[0x2199F56D4]();
  -[HDSPBiomeInBedDetector detectInBedTimesHelperDuringInterval:](self, "detectInBedTimesHelperDuringInterval:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v5);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__HDSPBiomeInBedDetector_detectInBedTimesDuringInterval___block_invoke;
  v9[3] = &unk_24D4E3E28;
  v9[4] = self;
  v7 = (id)objc_msgSend(v6, "addSuccessBlock:", v9);

  return v6;
}

void __57__HDSPBiomeInBedDetector_detectInBedTimesDuringInterval___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    v5 = v4;
    objc_msgSend((id)objc_opt_class(), "hoursOfSleepForResult:", v2);
    v7 = 138543618;
    v8 = v4;
    v9 = 2048;
    v10 = v6;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] calculated time in bed hours: %f", (uint8_t *)&v7, 0x16u);

  }
}

- (id)detectInBedTimesHelperDuringInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  NSObject *v49;
  _BOOL4 v50;
  void *v51;
  id v52;
  uint64_t v53;
  id v54;
  void *v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  NSObject *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  NSObject *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v85;
  id v86;
  void *v87;
  id v88;
  id v89;
  void *v90;
  id v91;
  id v92;
  void *v93;
  uint64_t v94;
  id v95;
  void *v96;
  id v97;
  void *v98;
  id v99;
  id v100;
  id v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  id v118;
  id v119[2];
  id v120;
  uint8_t buf[4];
  id v122;
  __int16 v123;
  uint64_t v124;
  __int16 v125;
  id v126;
  __int16 v127;
  id v128;
  uint64_t v129;

  v129 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v122 = (id)objc_opt_class();
    v123 = 2112;
    v124 = (uint64_t)v5;
    v125 = 2112;
    v126 = v6;
    v8 = v122;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Looking for in-bed intervals between %@ and %@", buf, 0x20u);

  }
  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v122 = v10;
    v11 = v10;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Establishing night start..", buf, 0xCu);

  }
  objc_msgSend(v5, "dateByAddingTimeInterval:", 14400.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -60.0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x24BDD1508]);
  v107 = v12;
  objc_msgSend(v12, "earlierDate:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "initWithStartDate:endDate:", v5, v15);

  v120 = 0;
  v105 = (void *)v16;
  -[HDSPBiomeInBedDetector findLatestEndOfMovementDuringInterval:error:](self, "findLatestEndOfMovementDuringInterval:error:", v16, &v120);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v120;
  if (v18)
  {
    v19 = v18;
    HKSPLogForCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v85 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v122 = v85;
      v123 = 2112;
      v124 = (uint64_t)v19;
      v86 = v85;
      _os_log_error_impl(&dword_21610C000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Error finding last end of movement: %@", buf, 0x16u);

    }
    goto LABEL_8;
  }
  HKSPLogForCategory();
  v59 = objc_claimAutoreleasedReturnValue();
  v19 = v59;
  if (v17)
  {
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      v60 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v122 = v60;
      v123 = 2112;
      v124 = (uint64_t)v17;
      v20 = v60;
      _os_log_impl(&dword_21610C000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Night start is %@", buf, 0x16u);
LABEL_8:

    }
  }
  else if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
  {
    v64 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v122 = v64;
    v123 = 2112;
    v124 = (uint64_t)v5;
    v20 = v64;
    _os_log_error_impl(&dword_21610C000, v19, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to find last end of movement. Falling back to provided start time (%@).", buf, 0x16u);
    goto LABEL_8;
  }

  if (v17)
    v21 = v17;
  else
    v21 = v5;
  v22 = v21;

  HKSPLogForCategory();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v122 = v24;
    v25 = v24;
    _os_log_impl(&dword_21610C000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Establishing final bedtime..", buf, 0xCu);

  }
  v26 = v22;
  objc_msgSend(v26, "dateByAddingTimeInterval:", 5400.0);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "earlierDate:", v13);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v119[1] = 0;
  v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v26, v111);
  -[HDSPBiomeInBedDetector findLastTimeDeviceWasLockedDuringInterval:error:](self, "findLastTimeDeviceWasLockedDuringInterval:error:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v114 = v27;
  if (v28)
  {
    v29 = v28;
    HKSPLogForCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v87 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138544130;
      v122 = v87;
      v123 = 2112;
      v124 = (uint64_t)v26;
      v125 = 2112;
      v126 = v111;
      v127 = 2112;
      v128 = v29;
      v88 = v26;
      v89 = v87;
      _os_log_error_impl(&dword_21610C000, v30, OS_LOG_TYPE_ERROR, "[%{public}@] Error finding last lock date between %@ and %@: %@", buf, 0x2Au);

      v26 = v88;
      v27 = v114;
    }

  }
  HKSPLogForCategory();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v122 = v32;
    v123 = 2112;
    v124 = (uint64_t)v27;
    v33 = v32;
    _os_log_impl(&dword_21610C000, v31, OS_LOG_TYPE_DEFAULT, "[%{public}@] Last lock was %@", buf, 0x16u);

  }
  v116 = v26;
  if (v27)
  {
    objc_msgSend(v26, "laterDate:", v27);
    v116 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v119[0] = 0;
  -[HDSPBiomeInBedDetector findLastTimeDeviceWasPluggedInDuringInterval:error:](self, "findLastTimeDeviceWasPluggedInDuringInterval:error:", v113, v119);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v119[0];
  if (v34)
  {
    v35 = v34;
    HKSPLogForCategory();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v90 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138544130;
      v122 = v90;
      v123 = 2112;
      v124 = (uint64_t)v26;
      v125 = 2112;
      v126 = v111;
      v127 = 2112;
      v128 = v35;
      v91 = v26;
      v92 = v90;
      _os_log_error_impl(&dword_21610C000, v36, OS_LOG_TYPE_ERROR, "[%{public}@] Error finding last date device was plugged in between %@ and %@: %@", buf, 0x2Au);

      v26 = v91;
      v27 = v114;
    }

  }
  HKSPLogForCategory();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v122 = v38;
    v123 = 2112;
    v124 = (uint64_t)v115;
    v39 = v38;
    _os_log_impl(&dword_21610C000, v37, OS_LOG_TYPE_DEFAULT, "[%{public}@] Last plugin was %@", buf, 0x16u);

  }
  if (v115)
  {
    objc_msgSend(v116, "laterDate:");
    v40 = objc_claimAutoreleasedReturnValue();

    v116 = (void *)v40;
  }
  HKSPLogForCategory();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v122 = v42;
    v123 = 2112;
    v124 = (uint64_t)v116;
    v43 = v42;
    _os_log_impl(&dword_21610C000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Final bedtime is %@", buf, 0x16u);

  }
  objc_msgSend(v6, "dateByAddingTimeInterval:", -3600.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "timeIntervalSinceReferenceDate");
  v46 = v45;
  objc_msgSend(v116, "timeIntervalSinceReferenceDate");
  v48 = v47;
  HKSPLogForCategory();
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
  v106 = (void *)v13;
  v112 = v44;
  if (v46 <= v48)
  {
    if (!v50)
    {
LABEL_53:
      v53 = 0;
      goto LABEL_54;
    }
    v57 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v122 = v57;
    v58 = v57;
    _os_log_impl(&dword_21610C000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] Bedtime started less than an hour before end date, not performing further movement based changes on end date.", buf, 0xCu);
LABEL_52:

    goto LABEL_53;
  }
  if (v50)
  {
    v51 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v122 = v51;
    v123 = 2112;
    v124 = (uint64_t)v44;
    v125 = 2112;
    v126 = v6;
    v52 = v51;
    _os_log_impl(&dword_21610C000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] Looking for latest end of movement between %@ and %@", buf, 0x20u);

    v44 = v112;
  }

  v49 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v44, v6);
  v118 = 0;
  -[HDSPBiomeInBedDetector findMotionTerminusDuringInterval:latest:error:](self, "findMotionTerminusDuringInterval:latest:error:", v49, 0, &v118);
  v53 = objc_claimAutoreleasedReturnValue();
  v54 = v118;
  if (v54)
  {
    v55 = v54;
    HKSPLogForCategory();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      v96 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v122 = v96;
      v123 = 2112;
      v124 = (uint64_t)v55;
      v110 = v53;
      v97 = v96;
      _os_log_error_impl(&dword_21610C000, v56, OS_LOG_TYPE_ERROR, "[%{public}@] Error finding first start of movement: %@", buf, 0x16u);

      v53 = v110;
    }

    v27 = v114;
    goto LABEL_54;
  }
  HKSPLogForCategory();
  v61 = objc_claimAutoreleasedReturnValue();
  v58 = v61;
  if (!v53)
  {
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      v98 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v122 = v98;
      v123 = 2112;
      v124 = (uint64_t)v6;
      v99 = v26;
      v100 = v98;
      _os_log_error_impl(&dword_21610C000, v58, OS_LOG_TYPE_ERROR, "[%{public}@] Unable to find first start of movement. Falling back to provided end time (%@).", buf, 0x16u);

      v26 = v99;
      v27 = v114;
    }
    goto LABEL_52;
  }
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    v62 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v122 = v62;
    v123 = 2112;
    v124 = v53;
    v63 = v62;
    _os_log_impl(&dword_21610C000, v58, OS_LOG_TYPE_DEFAULT, "[%{public}@] Night end is %@", buf, 0x16u);

    v27 = v114;
  }

LABEL_54:
  v108 = v5;

  if (v53)
    v65 = (void *)v53;
  else
    v65 = v6;
  v66 = v65;

  HKSPLogForCategory();
  v67 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    v68 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v122 = v68;
    v123 = 2112;
    v124 = (uint64_t)v116;
    v125 = 2112;
    v126 = v66;
    v69 = v68;
    _os_log_impl(&dword_21610C000, v67, OS_LOG_TYPE_DEFAULT, "[%{public}@] Detecting in-bed intervals between %@ and %@", buf, 0x20u);

    v27 = v114;
  }

  v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v116, v66);
  v117 = 0;
  -[HDSPBiomeInBedDetector lockedTimesDuringInterval:error:](self, "lockedTimesDuringInterval:error:", v70, &v117);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v117;
  if (v72)
  {
    HKSPLogForCategory();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    {
      v93 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138544130;
      v122 = v93;
      v123 = 2112;
      v124 = (uint64_t)v116;
      v125 = 2112;
      v126 = v66;
      v127 = 2112;
      v128 = v72;
      v94 = v53;
      v95 = v93;
      _os_log_error_impl(&dword_21610C000, v73, OS_LOG_TYPE_ERROR, "[%{public}@] Error identifying locked times between %@ and %@: %@", buf, 0x2Au);

      v53 = v94;
    }

    v27 = v114;
  }
  v109 = (void *)v53;
  HKSPLogForCategory();
  v74 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
  {
    v75 = (void *)objc_opt_class();
    v76 = (void *)MEMORY[0x24BDD16E0];
    v101 = v75;
    objc_msgSend(v76, "numberWithUnsignedInteger:", objc_msgSend(v71, "count"));
    v102 = v70;
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "firstObject");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "startDate");
    v103 = v66;
    v79 = v26;
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "lastObject");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "endDate");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v122 = v75;
    v123 = 2112;
    v124 = (uint64_t)v77;
    v125 = 2112;
    v126 = v80;
    v127 = 2112;
    v128 = v82;
    _os_log_impl(&dword_21610C000, v74, OS_LOG_TYPE_DEFAULT, "[%{public}@] Found %@ in-bed intervals between %@ & %@", buf, 0x2Au);

    v26 = v79;
    v66 = v103;

    v27 = v114;
    v70 = v102;

  }
  if (v72)
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithError:", v72);
  else
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v71);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  return v83;
}

- (id)lockedTimesDuringInterval:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  unint64_t v37;
  void *v38;
  double v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  NSObject *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  id obj;
  id v64;
  uint64_t v65;
  HDSPBiomeInBedDetector *v66;
  uint64_t v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id v73;
  id v74;
  _BYTE v75[128];
  void *v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = 0;
  v66 = self;
  -[HDSPBiomeInBedDetector findTimesDeviceWasUnlockedDuringInterval:error:](self, "findTimesDeviceWasUnlockedDuringInterval:error:", v6, &v74);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v74;
  v11 = v10;
  if (a4 && v10)
  {
    v12 = objc_retainAutorelease(v10);
    v62 = 0;
    *a4 = v12;
  }
  else
  {
    v73 = v10;
    -[HDSPBiomeInBedDetector findLastTimeDeviceWasUnlockedDuringInterval:error:](v66, "findLastTimeDeviceWasUnlockedDuringInterval:error:", v6, &v73);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v73;

    if (a4 && v12)
    {
      v62 = 0;
      *a4 = objc_retainAutorelease(v12);
    }
    else
    {
      if (v13)
      {
        if (!objc_msgSend(v9, "count")
          || (objc_msgSend(v9, "lastObject"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v14, "endDate"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v16 = objc_msgSend(v15, "compare:", v13),
              v15,
              v14,
              v16 == -1))
        {
          v17 = v13;

          v8 = v17;
        }
      }
      if (objc_msgSend(v9, "count"))
      {
        v58 = v6;
        v59 = v12;
        v56 = v8;
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v62 = (id)objc_claimAutoreleasedReturnValue();
        v57 = v7;
        v18 = v7;
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        v60 = v9;
        obj = v9;
        v19 = 0x24BDD1000uLL;
        v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
        v55 = v13;
        if (v67)
        {
          v65 = *(_QWORD *)v70;
          v20 = v18;
          do
          {
            v21 = 0;
            v22 = v20;
            do
            {
              if (*(_QWORD *)v70 != v65)
                objc_enumerationMutation(obj);
              v23 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v21);
              HKSPLogForCategory();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                v25 = (void *)objc_opt_class();
                v26 = v25;
                objc_msgSend(v23, "startDate");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "endDate");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v78 = v25;
                v79 = 2112;
                v80 = v27;
                v81 = 2112;
                v82 = v28;
                _os_log_impl(&dword_21610C000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] found not locked event between %@ and %@", buf, 0x20u);

              }
              v29 = objc_alloc(*(Class *)(v19 + 1288));
              objc_msgSend(v23, "startDate");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "laterDate:", v18);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = (void *)objc_msgSend(v29, "initWithStartDate:endDate:", v22, v31);

              HKSPLogForCategory();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                v34 = (void *)objc_opt_class();
                v64 = v34;
                objc_msgSend(v32, "startDate");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "endDate");
                v36 = v18;
                v37 = v19;
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v78 = v34;
                v79 = 2112;
                v80 = v35;
                v81 = 2112;
                v82 = v38;
                _os_log_impl(&dword_21610C000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] inferring locked event between %@ and %@", buf, 0x20u);

                v19 = v37;
                v18 = v36;

              }
              objc_msgSend(v32, "duration");
              if (v39 > 0.0)
                objc_msgSend(v62, "addObject:", v32);
              objc_msgSend(v23, "endDate");
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              ++v21;
              v22 = v20;
            }
            while (v67 != v21);
            v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
          }
          while (v67);
        }
        else
        {
          v20 = v18;
        }

        v8 = v56;
        objc_msgSend(v20, "earlierDate:", v56);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "isEqualToDate:", v20);

        v6 = v58;
        v12 = v59;
        if (v47)
        {
          v48 = (void *)objc_msgSend(objc_alloc(*(Class *)(v19 + 1288)), "initWithStartDate:endDate:", v20, v56);
          HKSPLogForCategory();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            v50 = (void *)objc_opt_class();
            v51 = v50;
            objc_msgSend(v48, "startDate");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "endDate");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v78 = v50;
            v79 = 2112;
            v80 = v52;
            v81 = 2112;
            v82 = v53;
            _os_log_impl(&dword_21610C000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] adding last locked event between %@ and %@", buf, 0x20u);

            v12 = v59;
          }

          objc_msgSend(v62, "addObject:", v48);
        }

        v7 = v57;
        v9 = v60;
        v13 = v55;
      }
      else
      {
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v7, v8);
        HKSPLogForCategory();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          v42 = (void *)objc_opt_class();
          v68 = v42;
          objc_msgSend(v40, "startDate");
          v61 = v9;
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "endDate");
          v44 = v12;
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v78 = v42;
          v79 = 2112;
          v80 = v43;
          v81 = 2112;
          v82 = v45;
          _os_log_impl(&dword_21610C000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] no unlocked events, device was locked between %@ and %@", buf, 0x20u);

          v12 = v44;
          v9 = v61;

        }
        v76 = v40;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v76, 1);
        v62 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  return v62;
}

- (id)findLatestEndOfMovementDuringInterval:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    objc_msgSend(v6, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v8;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Looking for latest end of movement between %@ and %@", (uint8_t *)&v14, 0x20u);

  }
  -[HDSPBiomeInBedDetector findMotionTerminusDuringInterval:latest:error:](self, "findMotionTerminusDuringInterval:latest:error:", v6, 1, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)findMotionTerminusDuringInterval:(id)a3 latest:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v5;
  id v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  dispatch_semaphore_t v11;
  void *v12;
  void *v13;
  dispatch_time_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *i;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  id v34;
  void *v35;
  id v36;
  dispatch_semaphore_t dsema;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  dispatch_semaphore_t v50;
  __int128 *p_buf;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint8_t v59[4];
  void *v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  uint8_t v64[128];
  __int128 buf;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;

  v5 = a4;
  v70 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_msgSend(MEMORY[0x24BDC13F8], "isActivityAvailable");
  HKSPLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
      v10 = *(id *)((char *)&buf + 4);
      _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Querying CoreMotion..", (uint8_t *)&buf, 0xCu);

    }
    v9 = objc_alloc_init(MEMORY[0x24BDC13F8]);
    v40 = objc_alloc_init(MEMORY[0x24BDD1710]);
    objc_msgSend(v40, "setName:", CFSTR("com.apple.coreduet.inbed.coremotion"));
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__10;
    v68 = __Block_byref_object_dispose__10;
    v69 = 0;
    v53 = 0;
    v54 = &v53;
    v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__10;
    v57 = __Block_byref_object_dispose__10;
    v58 = 0;
    v11 = dispatch_semaphore_create(0);
    objc_msgSend(v6, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __72__HDSPBiomeInBedDetector_findMotionTerminusDuringInterval_latest_error___block_invoke;
    v49[3] = &unk_24D4E4C98;
    v49[4] = self;
    p_buf = &buf;
    v52 = &v53;
    dsema = v11;
    v50 = dsema;
    -[NSObject queryActivityStartingFromDate:toDate:toQueue:withHandler:](v9, "queryActivityStartingFromDate:toDate:toQueue:withHandler:", v12, v13, v40, v49);

    v14 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(dsema, v14))
    {
      HKSPLogForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v35 = (void *)objc_opt_class();
        *(_DWORD *)v59 = 138543362;
        v60 = v35;
        v36 = v35;
        _os_log_error_impl(&dword_21610C000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Timeout during queryActivityStartingFromDate.", v59, 0xCu);

      }
      objc_msgSend(v40, "cancelAllOperations");
    }
    objc_msgSend(v6, "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v47 = 0uLL;
      v48 = 0uLL;
      v45 = 0uLL;
      v46 = 0uLL;
      objc_msgSend((id)v54[5], "reverseObjectEnumerator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v64, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v46;
        while (2)
        {
          v21 = 0;
          v22 = v16;
          v23 = v17;
          do
          {
            if (*(_QWORD *)v46 != v20)
              objc_enumerationMutation(v18);
            v24 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)v21);
            if ((objc_msgSend(v24, "stationary") & 1) == 0 && objc_msgSend(v24, "confidence") == 1)
            {
              v28 = v23;
              v17 = v28;
              v16 = v22;
              goto LABEL_34;
            }
            objc_msgSend(v24, "startDate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v24, "startDate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = (char *)v21 + 1;
            v22 = v16;
            v23 = v17;
          }
          while (v19 != v21);
          v19 = (void *)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v64, 16);
          if (v19)
            continue;
          break;
        }
      }
    }
    else
    {
      v43 = 0uLL;
      v44 = 0uLL;
      v41 = 0uLL;
      v42 = 0uLL;
      objc_msgSend((id)v54[5], "objectEnumerator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v63, 16);
      if (v19)
      {
        v25 = *(_QWORD *)v42;
        while (2)
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(_QWORD *)v42 != v25)
              objc_enumerationMutation(v18);
            v27 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
            if ((objc_msgSend(v27, "stationary") & 1) == 0 && objc_msgSend(v27, "confidence") == 1)
            {
              objc_msgSend(v27, "startDate");
              v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:
              v19 = v28;
              goto LABEL_35;
            }
          }
          v19 = (void *)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v63, 16);
          if (v19)
            continue;
          break;
        }
      }
    }
LABEL_35:

    if (a5)
    {
      v29 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v29)
        *a5 = objc_retainAutorelease(v29);
    }
    HKSPLogForCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (void *)objc_opt_class();
      *(_DWORD *)v59 = 138543618;
      v60 = v31;
      v61 = 2112;
      v62 = v19;
      v32 = v31;
      _os_log_impl(&dword_21610C000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] Last motion was %@", v59, 0x16u);

    }
    _Block_object_dispose(&v53, 8);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
      v34 = *(id *)((char *)&buf + 4);
      _os_log_error_impl(&dword_21610C000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Motion activity is not available for in bed detection", (uint8_t *)&buf, 0xCu);

    }
    v19 = 0;
  }

  return v19;
}

void __72__HDSPBiomeInBedDetector_findMotionTerminusDuringInterval_latest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v17 = 138543618;
      *(_QWORD *)&v17[4] = objc_opt_class();
      *(_WORD *)&v17[12] = 2112;
      *(_QWORD *)&v17[14] = v6;
      v16 = *(id *)&v17[4];
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Querying CoreMotion failed with error: %@", v17, 0x16u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }
  v8 = objc_msgSend(v5, "copy", *(_OWORD *)v17, *(_QWORD *)&v17[16], v18);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  HKSPLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class();
    v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v14 = v12;
    v15 = objc_msgSend(v13, "count");
    *(_DWORD *)v17 = 138543618;
    *(_QWORD *)&v17[4] = v12;
    *(_WORD *)&v17[12] = 2048;
    *(_QWORD *)&v17[14] = v15;
    _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Found %ld activities", v17, 0x16u);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (id)findLastTimeDeviceWasUnlockedDuringInterval:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    objc_msgSend(v6, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v8;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Looking for last time device was unlocked between %@ and %@", (uint8_t *)&v14, 0x20u);

  }
  -[HDSPBiomeInBedDetector _findLastTimeDeviceLockChangedDuringInterval:isLocked:error:](self, "_findLastTimeDeviceLockChangedDuringInterval:isLocked:error:", v6, 0, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)findLastTimeDeviceWasLockedDuringInterval:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    objc_msgSend(v6, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v8;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Looking for last time device was locked between %@ and %@", (uint8_t *)&v14, 0x20u);

  }
  -[HDSPBiomeInBedDetector _findLastTimeDeviceLockChangedDuringInterval:isLocked:error:](self, "_findLastTimeDeviceLockChangedDuringInterval:isLocked:error:", v6, 1, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_findLastTimeDeviceLockChangedDuringInterval:(id)a3 isLocked:(BOOL)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[4];
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v7 = a3;
  BiomeLibrary();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "Device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ScreenLocked");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__10;
  v33 = __Block_byref_object_dispose__10;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__10;
  v27 = __Block_byref_object_dispose__10;
  v28 = 0;
  objc_msgSend(MEMORY[0x24BE0CC98], "hdsp_optionsForDateInterval:reversed:", v7, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "publisherWithUseCase:options:", CFSTR("com.apple.sleepd.inBedDetection"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __86__HDSPBiomeInBedDetector__findLastTimeDeviceLockChangedDuringInterval_isLocked_error___block_invoke;
  v21[3] = &__block_descriptor_33_e22_B16__0__BMStoreEvent_8l;
  v22 = a4;
  objc_msgSend(v12, "filterWithIsIncluded:", v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = 3221225472;
  v20[2] = __86__HDSPBiomeInBedDetector__findLastTimeDeviceLockChangedDuringInterval_isLocked_error___block_invoke_2;
  v20[3] = &unk_24D4E4CE0;
  v20[4] = &v23;
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __86__HDSPBiomeInBedDetector__findLastTimeDeviceLockChangedDuringInterval_isLocked_error___block_invoke_3;
  v19[3] = &unk_24D4E4D08;
  v19[4] = &v29;
  v20[0] = v13;
  v15 = (id)objc_msgSend(v14, "sinkWithCompletion:shouldContinue:", v20, v19);

  v16 = (void *)v24[5];
  if (v16)
  {
    v17 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v16);
  }
  else
  {
    v17 = (id)v30[5];
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v17;
}

BOOL __86__HDSPBiomeInBedDetector__findLastTimeDeviceLockChangedDuringInterval_isLocked_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(unsigned __int8 *)(a1 + 32) == objc_msgSend(v3, "starting");

  return v4;
}

void __86__HDSPBiomeInBedDetector__findLastTimeDeviceLockChangedDuringInterval_isLocked_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __86__HDSPBiomeInBedDetector__findLastTimeDeviceLockChangedDuringInterval_isLocked_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 0;
}

- (id)findLastTimeDeviceWasPluggedInDuringInterval:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    objc_msgSend(v5, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v10 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v31 = v10;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Looking for last time device was plugged in between %@ and %@", buf, 0x20u);

  }
  BiomeLibrary();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "Device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "Power");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "PluggedIn");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v31 = __Block_byref_object_copy__10;
  v32 = __Block_byref_object_dispose__10;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__10;
  v28 = __Block_byref_object_dispose__10;
  v29 = 0;
  objc_msgSend(MEMORY[0x24BE0CC98], "hdsp_optionsForDateInterval:reversed:", v5, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "publisherWithUseCase:options:", CFSTR("com.apple.sleepd.inBedDetection"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filterWithIsIncluded:", &__block_literal_global_10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __77__HDSPBiomeInBedDetector_findLastTimeDeviceWasPluggedInDuringInterval_error___block_invoke_2;
  v23[3] = &unk_24D4E4CE0;
  v23[4] = &v24;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __77__HDSPBiomeInBedDetector_findLastTimeDeviceWasPluggedInDuringInterval_error___block_invoke_3;
  v22[3] = &unk_24D4E4D08;
  v22[4] = buf;
  v18 = (id)objc_msgSend(v17, "sinkWithCompletion:shouldContinue:", v23, v22);

  v19 = (void *)v25[5];
  if (v19)
  {
    v20 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v19);
  }
  else
  {
    v20 = *(id *)(*(_QWORD *)&buf[8] + 40);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(buf, 8);

  return v20;
}

uint64_t __77__HDSPBiomeInBedDetector_findLastTimeDeviceWasPluggedInDuringInterval_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "starting");

  return v3;
}

void __77__HDSPBiomeInBedDetector_findLastTimeDeviceWasPluggedInDuringInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __77__HDSPBiomeInBedDetector_findLastTimeDeviceWasPluggedInDuringInterval_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 0;
}

- (id)findTimesDeviceWasUnlockedDuringInterval:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v7;
    objc_msgSend(v5, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v10 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    v31 = v10;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Looking for times device was unlocked in between %@ and %@", buf, 0x20u);

  }
  BiomeLibrary();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "Device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ScreenLocked");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v31 = __Block_byref_object_copy__10;
  v32 = __Block_byref_object_dispose__10;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__10;
  v28 = __Block_byref_object_dispose__10;
  v29 = 0;
  objc_msgSend(MEMORY[0x24BE0CC98], "hdsp_optionsForDateInterval:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "publisherWithUseCase:options:", CFSTR("com.apple.sleepd.inBedDetection"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  objc_msgSend(v15, "reduceWithInitial:nextPartialResult:", v16, &__block_literal_global_200_0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __73__HDSPBiomeInBedDetector_findTimesDeviceWasUnlockedDuringInterval_error___block_invoke_2;
  v23[3] = &unk_24D4E4CE0;
  v23[4] = &v24;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __73__HDSPBiomeInBedDetector_findTimesDeviceWasUnlockedDuringInterval_error___block_invoke_3;
  v22[3] = &unk_24D4E4DB0;
  v22[4] = buf;
  v18 = (id)objc_msgSend(v17, "sinkWithCompletion:receiveInput:", v23, v22);

  v19 = (void *)v25[5];
  if (v19)
  {
    v20 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v19);
  }
  else
  {
    v20 = *(id *)(*(_QWORD *)&buf[8] + 40);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(buf, 8);

  return v20;
}

id __73__HDSPBiomeInBedDetector_findTimesDeviceWasUnlockedDuringInterval_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "starting");

  if (!v7)
  {
    v14 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v5, "timestamp");
    objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v8, 0.0);
    objc_msgSend(v4, "addObject:", v10);
    goto LABEL_5;
  }
  objc_msgSend(v4, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v4, "removeLastObject");
    v9 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v5, "timestamp");
    objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x24BDD1508]);
    objc_msgSend(v8, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v12, v10);

    objc_msgSend(v4, "addObject:", v13);
LABEL_5:

  }
  return v4;
}

void __73__HDSPBiomeInBedDetector_findTimesDeviceWasUnlockedDuringInterval_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __73__HDSPBiomeInBedDetector_findTimesDeviceWasUnlockedDuringInterval_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

@end
