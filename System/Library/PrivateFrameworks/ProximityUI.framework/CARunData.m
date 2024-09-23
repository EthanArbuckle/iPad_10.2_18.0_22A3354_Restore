@implementation CARunData

- (CARunData)init
{
  CARunData *v2;
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
  os_log_t v14;
  OS_os_log *logger;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CARunData;
  v2 = -[CARunData init](&v17, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CARunData setNumberOfMotionEvents:](v2, "setNumberOfMotionEvents:", v3);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CARunData setNumberOfTargetFoundEvents:](v2, "setNumberOfTargetFoundEvents:", v4);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CARunData setNumberOfTargetRevokedEvents:](v2, "setNumberOfTargetRevokedEvents:", v5);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CARunData setNumberOfInvalidPoseEvents:](v2, "setNumberOfInvalidPoseEvents:", v6);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CARunData setNumberOfErrorEvents:](v2, "setNumberOfErrorEvents:", v7);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CARunData setNumberOfVIORevokes:](v2, "setNumberOfVIORevokes:", v8);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CARunData setNumberOfTargetMotionRevokes:](v2, "setNumberOfTargetMotionRevokes:", v9);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CARunData setNumberOfRangeRevokes:](v2, "setNumberOfRangeRevokes:", v10);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CARunData setNumberOfAoARevokes:](v2, "setNumberOfAoARevokes:", v11);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CARunData setNumberOfStraightPathRevokes:](v2, "setNumberOfStraightPathRevokes:", v12);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CARunData setNumberOfHighResidualRevokes:](v2, "setNumberOfHighResidualRevokes:", v13);

    -[CARunData setFirstSOIRSSI:](v2, "setFirstSOIRSSI:", 100.0);
    -[CARunData setTorchButtonPresented:](v2, "setTorchButtonPresented:", 0);
    -[CARunData setTorchTurnedOn:](v2, "setTorchTurnedOn:", 0);
    -[CARunData setTorchTurnedOff:](v2, "setTorchTurnedOff:", 0);
    v14 = os_log_create("com.apple.proximity", "itemlocalizer_CARunData");
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v14;

  }
  return v2;
}

- (void)motion:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD16E0];
  -[CARunData numberOfMotionEvents](self, "numberOfMotionEvents", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARunData setNumberOfMotionEvents:](self, "setNumberOfMotionEvents:", v5);

}

- (void)targetFound:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CARunData firstTargetFoundEvent](self, "firstTargetFoundEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[CARunData setFirstTargetFoundEvent:](self, "setFirstTargetFoundEvent:", v8);
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[CARunData numberOfTargetFoundEvents](self, "numberOfTargetFoundEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARunData setNumberOfTargetFoundEvents:](self, "setNumberOfTargetFoundEvents:", v7);

}

- (void)targetFoundFromRange:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CARunData firstTargetFoundFromRangeEvent](self, "firstTargetFoundFromRangeEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[CARunData setFirstTargetFoundFromRangeEvent:](self, "setFirstTargetFoundFromRangeEvent:", v5);

}

- (void)targetFoundFromAoA:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CARunData firstTargetFoundFromAoAEvent](self, "firstTargetFoundFromAoAEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[CARunData setFirstTargetFoundFromAoAEvent:](self, "setFirstTargetFoundFromAoAEvent:", v5);

}

- (void)targetRevoked:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD16E0];
  -[CARunData numberOfTargetRevokedEvents](self, "numberOfTargetRevokedEvents", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARunData setNumberOfTargetRevokedEvents:](self, "setNumberOfTargetRevokedEvents:", v5);

}

- (void)vioRevoke:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  OS_os_log *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[CARunData numberOfVIORevokes](self, "numberOfVIORevokes", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARunData setNumberOfVIORevokes:](self, "setNumberOfVIORevokes:", v6);

  v7 = self->_logger;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    -[CARunData numberOfVIORevokes](self, "numberOfVIORevokes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 67109120;
    v9[1] = objc_msgSend(v8, "intValue");
    _os_log_impl(&dword_2230E5000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "VIO Revoke %d", (uint8_t *)v9, 8u);

  }
}

- (void)targetMotionRevoke:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  OS_os_log *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[CARunData numberOfTargetMotionRevokes](self, "numberOfTargetMotionRevokes", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARunData setNumberOfTargetMotionRevokes:](self, "setNumberOfTargetMotionRevokes:", v6);

  v7 = self->_logger;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    -[CARunData numberOfTargetMotionRevokes](self, "numberOfTargetMotionRevokes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 67109120;
    v9[1] = objc_msgSend(v8, "intValue");
    _os_log_impl(&dword_2230E5000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Target Motion Revoke %d", (uint8_t *)v9, 8u);

  }
}

- (void)rangeRevoke:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  OS_os_log *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[CARunData numberOfRangeRevokes](self, "numberOfRangeRevokes", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARunData setNumberOfRangeRevokes:](self, "setNumberOfRangeRevokes:", v6);

  v7 = self->_logger;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    -[CARunData numberOfRangeRevokes](self, "numberOfRangeRevokes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 67109120;
    v9[1] = objc_msgSend(v8, "intValue");
    _os_log_impl(&dword_2230E5000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Range Revoke %d", (uint8_t *)v9, 8u);

  }
}

- (void)aoaRevoke:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  OS_os_log *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[CARunData numberOfAoARevokes](self, "numberOfAoARevokes", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARunData setNumberOfAoARevokes:](self, "setNumberOfAoARevokes:", v6);

  v7 = self->_logger;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    -[CARunData numberOfAoARevokes](self, "numberOfAoARevokes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 67109120;
    v9[1] = objc_msgSend(v8, "intValue");
    _os_log_impl(&dword_2230E5000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "AoA Revoke %d", (uint8_t *)v9, 8u);

  }
}

- (void)straightPathRevoke:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  OS_os_log *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[CARunData numberOfStraightPathRevokes](self, "numberOfStraightPathRevokes", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARunData setNumberOfStraightPathRevokes:](self, "setNumberOfStraightPathRevokes:", v6);

  v7 = self->_logger;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    -[CARunData numberOfStraightPathRevokes](self, "numberOfStraightPathRevokes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 67109120;
    v9[1] = objc_msgSend(v8, "intValue");
    _os_log_impl(&dword_2230E5000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "Straight Path Revoke %d", (uint8_t *)v9, 8u);

  }
}

- (void)highResidualRevoke:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  OS_os_log *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[CARunData numberOfHighResidualRevokes](self, "numberOfHighResidualRevokes", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARunData setNumberOfHighResidualRevokes:](self, "setNumberOfHighResidualRevokes:", v6);

  v7 = self->_logger;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    -[CARunData numberOfHighResidualRevokes](self, "numberOfHighResidualRevokes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 67109120;
    v9[1] = objc_msgSend(v8, "intValue");
    _os_log_impl(&dword_2230E5000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "High Residual Revoke %d", (uint8_t *)v9, 8u);

  }
}

- (void)firstPose:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CARunData firstPoseEvent](self, "firstPoseEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[CARunData setFirstPoseEvent:](self, "setFirstPoseEvent:", v5);

}

- (void)firstRange:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CARunData firstRangeEvent](self, "firstRangeEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[CARunData setFirstRangeEvent:](self, "setFirstRangeEvent:", v5);

}

- (void)invalidPose:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD16E0];
  -[CARunData numberOfInvalidPoseEvents](self, "numberOfInvalidPoseEvents", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARunData setNumberOfInvalidPoseEvents:](self, "setNumberOfInvalidPoseEvents:", v5);

}

- (void)error:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[CARunData numberOfErrorEvents](self, "numberOfErrorEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARunData setNumberOfErrorEvents:](self, "setNumberOfErrorEvents:", v7);

  v19[0] = CFSTR("status");
  objc_msgSend(v4, "objectForKeyedSubscript:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("errorDescription");
  v20[0] = v8;
  objc_msgSend(v4, "objectForKeyedSubscript:");
  v9 = objc_claimAutoreleasedReturnValue();
  v20[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CARunData productUUID](self, "productUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = v12 == 0;

  if ((v9 & 1) == 0)
  {
    -[CARunData productUUID](self, "productUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("ProductUUID"));

  }
  -[CARunData isOwner](self, "isOwner");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 == 0;

  if (!v16)
  {
    -[CARunData isOwner](self, "isOwner");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("IsOwner"));

  }
  v18 = v11;
  AnalyticsSendEventLazy();

}

id __19__CARunData_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  NSObject *logger;
  void *v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  BOOL v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  double v128;
  double v129;
  double v130;
  double v131;
  void *v132;
  double v133;
  void *v134;
  double v135;
  void *v136;
  double v137;
  void *v138;
  void *v139;
  double v140;
  void *v141;
  id v142;
  _QWORD v143[31];
  _QWORD v144[31];
  uint8_t buf[4];
  double v146;
  uint64_t v147;

  v147 = *MEMORY[0x24BDAC8D0];
  -[CARunData startEvent](self, "startEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    return;
  -[CARunData stopEvent](self, "stopEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return;
  -[CARunData startEvent](self, "startEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timeElapsed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  -[CARunData stopEvent](self, "stopEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("timeElapsed"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v140 = v11;

  -[CARunData firstRangeEvent](self, "firstRangeEvent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CARunData firstRangeEvent](self, "firstRangeEvent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("rangeEstimate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v137 = v15;

    -[CARunData firstRangeEvent](self, "firstRangeEvent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("timeElapsed"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;

    -[CARunData firstRangeEvent](self, "firstRangeEvent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("traveledDistanceOfUser"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;
    -[CARunData startEvent](self, "startEvent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("traveledDistanceOfUser"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v135 = v19 - v8;
    v130 = v23 - v26;

  }
  else
  {
    v135 = -1.0;
    v137 = -1.0;
    v130 = -1.0;
  }
  -[CARunData firstPoseEvent](self, "firstPoseEvent");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[CARunData firstPoseEvent](self, "firstPoseEvent");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("timeElapsed"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValue");
    v133 = v30 - v8;

  }
  else
  {
    v133 = -1.0;
  }
  -[CARunData armsReachEvent](self, "armsReachEvent");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[CARunData armsReachEvent](self, "armsReachEvent");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("timeElapsed"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "doubleValue");
    v35 = v34;

    -[CARunData armsReachEvent](self, "armsReachEvent");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("traveledDistance"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "doubleValue");
    v39 = v38;
    -[CARunData startEvent](self, "startEvent");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("traveledDistance"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "doubleValue");
    v43 = v42;

    -[CARunData armsReachEvent](self, "armsReachEvent");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("straightLineDistance"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "doubleValue");
    v128 = v46;
    v131 = v35 - v8;
    v129 = v39 - v43;

  }
  else
  {
    v131 = -1.0;
    v128 = -1.0;
    v129 = -1.0;
  }
  -[CARunData firstTargetFoundEvent](self, "firstTargetFoundEvent");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    -[CARunData firstTargetFoundEvent](self, "firstTargetFoundEvent");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("timeElapsed"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "doubleValue");
    v51 = v50;

    -[CARunData firstTargetFoundEvent](self, "firstTargetFoundEvent");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("rangeEstimate"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "doubleValue");
    v55 = v54;

    -[CARunData firstTargetFoundEvent](self, "firstTargetFoundEvent");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("traveledDistance"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "doubleValue");
    v59 = v58;
    -[CARunData startEvent](self, "startEvent");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("traveledDistance"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "doubleValue");
    v63 = v62;

    -[CARunData firstTargetFoundEvent](self, "firstTargetFoundEvent");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("straightLineDistance"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "doubleValue");
    v67 = v66;
    v68 = v51 - v8;
    v69 = v59 - v63;

  }
  else
  {
    v68 = -1.0;
    v55 = -1.0;
    v69 = -1.0;
    v67 = -1.0;
  }
  -[CARunData firstTargetFoundFromRangeEvent](self, "firstTargetFoundFromRangeEvent");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
  {

    goto LABEL_18;
  }
  -[CARunData firstTargetFoundFromAoAEvent](self, "firstTargetFoundFromAoAEvent");
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
LABEL_18:
    -[CARunData firstTargetFoundFromRangeEvent](self, "firstTargetFoundFromRangeEvent");
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    if (v72)
    {
      -[CARunData firstTargetFoundFromAoAEvent](self, "firstTargetFoundFromAoAEvent");
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      if (v73)
      {
        -[CARunData firstTargetFoundFromRangeEvent](self, "firstTargetFoundFromRangeEvent");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("timeElapsed"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "doubleValue");
        v77 = v76;
        -[CARunData firstTargetFoundFromAoAEvent](self, "firstTargetFoundFromAoAEvent");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("timeElapsed"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "doubleValue");
        v81 = v77 - v80;

      }
      else
      {
        v81 = 1000.0;
      }
    }
    else
    {
      v81 = -1000.0;
    }
    goto LABEL_24;
  }
  v81 = -10000.0;
LABEL_24:
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v146 = v81;
    _os_log_impl(&dword_2230E5000, logger, OS_LOG_TYPE_DEFAULT, "Time between first range arrow and first aoa arrow (s) = %f", buf, 0xCu);
  }
  -[CARunData stopEvent](self, "stopEvent");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("traveledDistance"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "doubleValue");
  v86 = v85;
  -[CARunData startEvent](self, "startEvent");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("traveledDistance"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "doubleValue");
  v90 = v89;

  v91 = (void *)MEMORY[0x24BDBCED8];
  v143[0] = CFSTR("NumberOfMotionEvents");
  -[CARunData numberOfMotionEvents](self, "numberOfMotionEvents");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v144[0] = v139;
  v143[1] = CFSTR("NumberOfTargetFoundEvents");
  -[CARunData numberOfTargetFoundEvents](self, "numberOfTargetFoundEvents");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v144[1] = v120;
  v143[2] = CFSTR("NumberOfTargetRevokedEvents");
  -[CARunData numberOfTargetRevokedEvents](self, "numberOfTargetRevokedEvents");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v144[2] = v119;
  v143[3] = CFSTR("NumberOfInvalidPoseEvents");
  -[CARunData numberOfInvalidPoseEvents](self, "numberOfInvalidPoseEvents");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v144[3] = v118;
  v143[4] = CFSTR("NumberOfErrorEvents");
  -[CARunData numberOfErrorEvents](self, "numberOfErrorEvents");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v144[4] = v117;
  v143[5] = CFSTR("NumberOfVIORevokes");
  -[CARunData numberOfVIORevokes](self, "numberOfVIORevokes");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v144[5] = v122;
  v143[6] = CFSTR("NumberOfTargetMotionRevokes");
  -[CARunData numberOfTargetMotionRevokes](self, "numberOfTargetMotionRevokes");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v144[6] = v121;
  v143[7] = CFSTR("NumberOfRangeRevokes");
  -[CARunData numberOfRangeRevokes](self, "numberOfRangeRevokes");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v144[7] = v123;
  v143[8] = CFSTR("NumberOfAoARevokes");
  -[CARunData numberOfAoARevokes](self, "numberOfAoARevokes");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v144[8] = v124;
  v143[9] = CFSTR("NumberOfStraightPathRevokes");
  -[CARunData numberOfStraightPathRevokes](self, "numberOfStraightPathRevokes");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v144[9] = v126;
  v143[10] = CFSTR("NumberOfHighResidualRevokes");
  -[CARunData numberOfHighResidualRevokes](self, "numberOfHighResidualRevokes");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v144[10] = v127;
  v143[11] = CFSTR("TorchButtonPresented");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CARunData torchButtonPresented](self, "torchButtonPresented"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v144[11] = v125;
  v143[12] = CFSTR("TorchTurnedOn");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CARunData torchTurnedOn](self, "torchTurnedOn"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v144[12] = v116;
  v143[13] = CFSTR("TorchTurnedOff");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CARunData torchTurnedOff](self, "torchTurnedOff"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v144[13] = v115;
  v143[14] = CFSTR("TimeToFirstRange");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v135);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v144[14] = v114;
  v143[15] = CFSTR("TimeToFirstPose");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v133);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v144[15] = v136;
  v143[16] = CFSTR("TimeToFirstArrow");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v68);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v144[16] = v113;
  v143[17] = CFSTR("TimeToArmsReach");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v131);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v144[17] = v108;
  v143[18] = CFSTR("RunDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v140 - v8);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v144[18] = v134;
  v143[19] = CFSTR("TimeBetweenRangeAndAoAArrows");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v81);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v144[19] = v132;
  v143[20] = CFSTR("FirstRange");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v137);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v144[20] = v112;
  v143[21] = CFSTR("RangeAtFirstArrow");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v55);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v144[21] = v138;
  v143[22] = CFSTR("FinalRange");
  -[CARunData stopEvent](self, "stopEvent");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "objectForKeyedSubscript:", CFSTR("rangeEstimate"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v144[22] = v110;
  v143[23] = CFSTR("EnteredArmsReach");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v31 != 0);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v144[23] = v109;
  v143[24] = CFSTR("TotalDistanceMoved");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v86 - v90);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v144[24] = v92;
  v143[25] = CFSTR("DistanceMovedToFirstArrow");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v69);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v144[25] = v93;
  v143[26] = CFSTR("StraightLineDistanceToFirstArrow");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v67);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v144[26] = v94;
  v143[27] = CFSTR("DistanceMovedToArmsReach");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v129);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v144[27] = v95;
  v143[28] = CFSTR("DistanceMovedByUserToFirstRange");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v130);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v144[28] = v96;
  v143[29] = CFSTR("StraightLineDistanceToArmsReach");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v128);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v91;
  v144[29] = v97;
  v143[30] = CFSTR("FirstSOIRSSI");
  v99 = (void *)MEMORY[0x24BDD16E0];
  -[CARunData firstSOIRSSI](self, "firstSOIRSSI");
  objc_msgSend(v99, "numberWithDouble:");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v144[30] = v100;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v144, v143, 31);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "dictionaryWithDictionary:", v101);
  v141 = (void *)objc_claimAutoreleasedReturnValue();

  -[CARunData productUUID](self, "productUUID");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v98) = v102 == 0;

  if ((v98 & 1) == 0)
  {
    -[CARunData productUUID](self, "productUUID");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "UUIDString");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "setObject:forKeyedSubscript:", v104, CFSTR("ProductUUID"));

  }
  -[CARunData isOwner](self, "isOwner");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v105 == 0;

  if (!v106)
  {
    -[CARunData isOwner](self, "isOwner");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "setObject:forKeyedSubscript:", v107, CFSTR("IsOwner"));

  }
  v142 = v141;
  AnalyticsSendEventLazy();

}

id __20__CARunData_logData__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (NSUUID)productUUID
{
  return self->_productUUID;
}

- (void)setProductUUID:(id)a3
{
  objc_storeStrong((id *)&self->_productUUID, a3);
}

- (NSNumber)isOwner
{
  return self->_isOwner;
}

- (void)setIsOwner:(id)a3
{
  objc_storeStrong((id *)&self->_isOwner, a3);
}

- (NSDictionary)startEvent
{
  return self->_startEvent;
}

- (void)setStartEvent:(id)a3
{
  objc_storeStrong((id *)&self->_startEvent, a3);
}

- (NSDictionary)firstTargetFoundEvent
{
  return self->_firstTargetFoundEvent;
}

- (void)setFirstTargetFoundEvent:(id)a3
{
  objc_storeStrong((id *)&self->_firstTargetFoundEvent, a3);
}

- (NSDictionary)firstRangeEvent
{
  return self->_firstRangeEvent;
}

- (void)setFirstRangeEvent:(id)a3
{
  objc_storeStrong((id *)&self->_firstRangeEvent, a3);
}

- (NSDictionary)firstPoseEvent
{
  return self->_firstPoseEvent;
}

- (void)setFirstPoseEvent:(id)a3
{
  objc_storeStrong((id *)&self->_firstPoseEvent, a3);
}

- (NSDictionary)stopEvent
{
  return self->_stopEvent;
}

- (void)setStopEvent:(id)a3
{
  objc_storeStrong((id *)&self->_stopEvent, a3);
}

- (NSDictionary)armsReachEvent
{
  return self->_armsReachEvent;
}

- (void)setArmsReachEvent:(id)a3
{
  objc_storeStrong((id *)&self->_armsReachEvent, a3);
}

- (NSDictionary)firstTargetFoundFromRangeEvent
{
  return self->_firstTargetFoundFromRangeEvent;
}

- (void)setFirstTargetFoundFromRangeEvent:(id)a3
{
  objc_storeStrong((id *)&self->_firstTargetFoundFromRangeEvent, a3);
}

- (NSDictionary)firstTargetFoundFromAoAEvent
{
  return self->_firstTargetFoundFromAoAEvent;
}

- (void)setFirstTargetFoundFromAoAEvent:(id)a3
{
  objc_storeStrong((id *)&self->_firstTargetFoundFromAoAEvent, a3);
}

- (NSNumber)numberOfMotionEvents
{
  return self->_numberOfMotionEvents;
}

- (void)setNumberOfMotionEvents:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfMotionEvents, a3);
}

- (NSNumber)numberOfTargetFoundEvents
{
  return self->_numberOfTargetFoundEvents;
}

- (void)setNumberOfTargetFoundEvents:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfTargetFoundEvents, a3);
}

- (NSNumber)numberOfTargetRevokedEvents
{
  return self->_numberOfTargetRevokedEvents;
}

- (void)setNumberOfTargetRevokedEvents:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfTargetRevokedEvents, a3);
}

- (NSNumber)numberOfErrorEvents
{
  return self->_numberOfErrorEvents;
}

- (void)setNumberOfErrorEvents:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfErrorEvents, a3);
}

- (NSNumber)numberOfInvalidPoseEvents
{
  return self->_numberOfInvalidPoseEvents;
}

- (void)setNumberOfInvalidPoseEvents:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfInvalidPoseEvents, a3);
}

- (NSNumber)numberOfVIORevokes
{
  return self->_numberOfVIORevokes;
}

- (void)setNumberOfVIORevokes:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfVIORevokes, a3);
}

- (NSNumber)numberOfTargetMotionRevokes
{
  return self->_numberOfTargetMotionRevokes;
}

- (void)setNumberOfTargetMotionRevokes:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfTargetMotionRevokes, a3);
}

- (NSNumber)numberOfRangeRevokes
{
  return self->_numberOfRangeRevokes;
}

- (void)setNumberOfRangeRevokes:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfRangeRevokes, a3);
}

- (NSNumber)numberOfAoARevokes
{
  return self->_numberOfAoARevokes;
}

- (void)setNumberOfAoARevokes:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfAoARevokes, a3);
}

- (NSNumber)numberOfStraightPathRevokes
{
  return self->_numberOfStraightPathRevokes;
}

- (void)setNumberOfStraightPathRevokes:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfStraightPathRevokes, a3);
}

- (NSNumber)numberOfHighResidualRevokes
{
  return self->_numberOfHighResidualRevokes;
}

- (void)setNumberOfHighResidualRevokes:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfHighResidualRevokes, a3);
}

- (double)firstSOIRSSI
{
  return self->_firstSOIRSSI;
}

- (void)setFirstSOIRSSI:(double)a3
{
  self->_firstSOIRSSI = a3;
}

- (BOOL)torchButtonPresented
{
  return self->_torchButtonPresented;
}

- (void)setTorchButtonPresented:(BOOL)a3
{
  self->_torchButtonPresented = a3;
}

- (BOOL)torchTurnedOn
{
  return self->_torchTurnedOn;
}

- (void)setTorchTurnedOn:(BOOL)a3
{
  self->_torchTurnedOn = a3;
}

- (BOOL)torchTurnedOff
{
  return self->_torchTurnedOff;
}

- (void)setTorchTurnedOff:(BOOL)a3
{
  self->_torchTurnedOff = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfHighResidualRevokes, 0);
  objc_storeStrong((id *)&self->_numberOfStraightPathRevokes, 0);
  objc_storeStrong((id *)&self->_numberOfAoARevokes, 0);
  objc_storeStrong((id *)&self->_numberOfRangeRevokes, 0);
  objc_storeStrong((id *)&self->_numberOfTargetMotionRevokes, 0);
  objc_storeStrong((id *)&self->_numberOfVIORevokes, 0);
  objc_storeStrong((id *)&self->_numberOfInvalidPoseEvents, 0);
  objc_storeStrong((id *)&self->_numberOfErrorEvents, 0);
  objc_storeStrong((id *)&self->_numberOfTargetRevokedEvents, 0);
  objc_storeStrong((id *)&self->_numberOfTargetFoundEvents, 0);
  objc_storeStrong((id *)&self->_numberOfMotionEvents, 0);
  objc_storeStrong((id *)&self->_firstTargetFoundFromAoAEvent, 0);
  objc_storeStrong((id *)&self->_firstTargetFoundFromRangeEvent, 0);
  objc_storeStrong((id *)&self->_armsReachEvent, 0);
  objc_storeStrong((id *)&self->_stopEvent, 0);
  objc_storeStrong((id *)&self->_firstPoseEvent, 0);
  objc_storeStrong((id *)&self->_firstRangeEvent, 0);
  objc_storeStrong((id *)&self->_firstTargetFoundEvent, 0);
  objc_storeStrong((id *)&self->_startEvent, 0);
  objc_storeStrong((id *)&self->_isOwner, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
