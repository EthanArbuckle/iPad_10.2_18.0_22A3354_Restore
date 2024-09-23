@implementation CABTRunData

- (CABTRunData)init
{
  CABTRunData *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  os_log_t v8;
  OS_os_log *logger;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CABTRunData;
  v2 = -[CABTRunData init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CABTRunData setNumberOfMotionEvents:](v2, "setNumberOfMotionEvents:", v3);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CABTRunData setNumberOfProximityLevelFoundEvents:](v2, "setNumberOfProximityLevelFoundEvents:", v4);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CABTRunData setNumberOfProximityLevelRevokedEvents:](v2, "setNumberOfProximityLevelRevokedEvents:", v5);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CABTRunData setNumberOfInvalidPoseEvents:](v2, "setNumberOfInvalidPoseEvents:", v6);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CABTRunData setNumberOfErrorEvents:](v2, "setNumberOfErrorEvents:", v7);

    v8 = os_log_create("com.apple.proximity", "btlocalizer_CABTRunData");
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v8;

  }
  return v2;
}

- (void)motion:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD16E0];
  -[CABTRunData numberOfMotionEvents](self, "numberOfMotionEvents", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CABTRunData setNumberOfMotionEvents:](self, "setNumberOfMotionEvents:", v5);

}

- (void)proximityLevelFound:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CABTRunData firstProximityLevelFoundEvent](self, "firstProximityLevelFoundEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[CABTRunData setFirstProximityLevelFoundEvent:](self, "setFirstProximityLevelFoundEvent:", v8);
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[CABTRunData numberOfProximityLevelFoundEvents](self, "numberOfProximityLevelFoundEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CABTRunData setNumberOfProximityLevelFoundEvents:](self, "setNumberOfProximityLevelFoundEvents:", v7);

}

- (void)proximityLevelRevoked:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD16E0];
  -[CABTRunData numberOfProximityLevelRevokedEvents](self, "numberOfProximityLevelRevokedEvents", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CABTRunData setNumberOfProximityLevelRevokedEvents:](self, "setNumberOfProximityLevelRevokedEvents:", v5);

}

- (void)firstPose:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CABTRunData firstPoseEvent](self, "firstPoseEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[CABTRunData setFirstPoseEvent:](self, "setFirstPoseEvent:", v5);

}

- (void)firstRssiMeasurement:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CABTRunData firstRssiEvent](self, "firstRssiEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[CABTRunData setFirstRssiEvent:](self, "setFirstRssiEvent:", v5);

}

- (void)invalidPose:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD16E0];
  -[CABTRunData numberOfInvalidPoseEvents](self, "numberOfInvalidPoseEvents", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CABTRunData setNumberOfInvalidPoseEvents:](self, "setNumberOfInvalidPoseEvents:", v5);

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
  id v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[CABTRunData numberOfErrorEvents](self, "numberOfErrorEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CABTRunData setNumberOfErrorEvents:](self, "setNumberOfErrorEvents:", v7);

  v16[0] = CFSTR("status");
  objc_msgSend(v4, "objectForKeyedSubscript:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("errorDescription");
  v17[0] = v8;
  objc_msgSend(v4, "objectForKeyedSubscript:");
  v9 = objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CABTRunData productUUID](self, "productUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = v12 == 0;

  if ((v9 & 1) == 0)
  {
    -[CABTRunData productUUID](self, "productUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("ProductUUID"));

  }
  v15 = v11;
  AnalyticsSendEventLazy();

}

id __21__CABTRunData_error___block_invoke(uint64_t a1)
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
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  uint64_t v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  id v79;
  _QWORD v80[15];
  _QWORD v81[17];

  v81[15] = *MEMORY[0x24BDAC8D0];
  -[CABTRunData startEvent](self, "startEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CABTRunData stopEvent](self, "stopEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CABTRunData startEvent](self, "startEvent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timeElapsed"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "doubleValue");
      v8 = v7;

      -[CABTRunData stopEvent](self, "stopEvent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("timeElapsed"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v76 = v11;

      -[CABTRunData firstRssiEvent](self, "firstRssiEvent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[CABTRunData firstRssiEvent](self, "firstRssiEvent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("btRssiEstimate"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "doubleValue");
        v75 = v15;

        -[CABTRunData firstRssiEvent](self, "firstRssiEvent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("timeElapsed"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v19 = v18 - v8;

      }
      else
      {
        v19 = -1.0;
        v75 = -200.0;
      }
      -[CABTRunData firstPoseEvent](self, "firstPoseEvent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[CABTRunData firstPoseEvent](self, "firstPoseEvent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("timeElapsed"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "doubleValue");
        v24 = v23 - v8;

      }
      else
      {
        v24 = -1.0;
      }
      -[CABTRunData armsReachEvent](self, "armsReachEvent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        -[CABTRunData armsReachEvent](self, "armsReachEvent");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("timeElapsed"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "doubleValue");
        v29 = v28;

        -[CABTRunData armsReachEvent](self, "armsReachEvent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("traveledDistance"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "doubleValue");
        v33 = v32;
        -[CABTRunData startEvent](self, "startEvent");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("traveledDistance"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "doubleValue");
        v37 = v36;

        -[CABTRunData armsReachEvent](self, "armsReachEvent");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("straightLineDistance"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "doubleValue");
        v41 = v40;
        v42 = v29 - v8;
        v43 = v33 - v37;

      }
      else
      {
        v42 = -1.0;
        v43 = -1.0;
        v41 = -1.0;
      }
      -[CABTRunData stopEvent](self, "stopEvent");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("traveledDistance"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "doubleValue");
      v47 = v46;
      -[CABTRunData startEvent](self, "startEvent");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("traveledDistance"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "doubleValue");
      v51 = v50;

      v52 = (void *)MEMORY[0x24BDBCED8];
      v80[0] = CFSTR("NumberOfMotionEvents");
      -[CABTRunData numberOfMotionEvents](self, "numberOfMotionEvents");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v81[0] = v78;
      v80[1] = CFSTR("NumberOfLevelFoundEvents");
      -[CABTRunData numberOfProximityLevelFoundEvents](self, "numberOfProximityLevelFoundEvents");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v81[1] = v73;
      v80[2] = CFSTR("NumberOfRevokes");
      -[CABTRunData numberOfProximityLevelRevokedEvents](self, "numberOfProximityLevelRevokedEvents");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v81[2] = v72;
      v80[3] = CFSTR("NumberOfInvalidPoseEvents");
      -[CABTRunData numberOfInvalidPoseEvents](self, "numberOfInvalidPoseEvents");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v81[3] = v71;
      v80[4] = CFSTR("NumberOfErrorEvents");
      -[CABTRunData numberOfErrorEvents](self, "numberOfErrorEvents");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v81[4] = v70;
      v80[5] = CFSTR("TimeToFirstMeasurement");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v19);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v81[5] = v69;
      v80[6] = CFSTR("TimeToFirstPose");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v24);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v81[6] = v74;
      v80[7] = CFSTR("TimeToArmsReach");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v42);
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = v76 - v8;
      v77 = (void *)v53;
      v81[7] = v53;
      v80[8] = CFSTR("RunDuration");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v54);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v81[8] = v68;
      v80[9] = CFSTR("FirstRSSI");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v75);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v81[9] = v55;
      v80[10] = CFSTR("FinalRSSI");
      -[CABTRunData stopEvent](self, "stopEvent");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("btRssiEstimate"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v81[10] = v57;
      v80[11] = CFSTR("EnteredArmsReach");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v25 != 0);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v81[11] = v58;
      v80[12] = CFSTR("TotalDistanceMoved");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v47 - v51);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v52;
      v81[12] = v59;
      v80[13] = CFSTR("DistanceMovedToArmsReach");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v43);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v81[13] = v61;
      v80[14] = CFSTR("StraightLineDistanceToArmsReach");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v41);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v81[14] = v62;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v81, v80, 15);
      v63 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "dictionaryWithDictionary:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      -[CABTRunData productUUID](self, "productUUID");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v63) = v65 == 0;

      if ((v63 & 1) == 0)
      {
        -[CABTRunData productUUID](self, "productUUID");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "UUIDString");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setObject:forKeyedSubscript:", v67, CFSTR("ProductUUID"));

      }
      v79 = v64;
      AnalyticsSendEventLazy();

    }
  }
}

id __22__CABTRunData_logData__block_invoke(uint64_t a1)
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

- (NSDictionary)startEvent
{
  return self->_startEvent;
}

- (void)setStartEvent:(id)a3
{
  objc_storeStrong((id *)&self->_startEvent, a3);
}

- (NSDictionary)firstProximityLevelFoundEvent
{
  return self->_firstProximityLevelFoundEvent;
}

- (void)setFirstProximityLevelFoundEvent:(id)a3
{
  objc_storeStrong((id *)&self->_firstProximityLevelFoundEvent, a3);
}

- (NSDictionary)firstRssiEvent
{
  return self->_firstRssiEvent;
}

- (void)setFirstRssiEvent:(id)a3
{
  objc_storeStrong((id *)&self->_firstRssiEvent, a3);
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

- (NSNumber)numberOfMotionEvents
{
  return self->_numberOfMotionEvents;
}

- (void)setNumberOfMotionEvents:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfMotionEvents, a3);
}

- (NSNumber)numberOfProximityLevelFoundEvents
{
  return self->_numberOfProximityLevelFoundEvents;
}

- (void)setNumberOfProximityLevelFoundEvents:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfProximityLevelFoundEvents, a3);
}

- (NSNumber)numberOfProximityLevelRevokedEvents
{
  return self->_numberOfProximityLevelRevokedEvents;
}

- (void)setNumberOfProximityLevelRevokedEvents:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfProximityLevelRevokedEvents, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfInvalidPoseEvents, 0);
  objc_storeStrong((id *)&self->_numberOfErrorEvents, 0);
  objc_storeStrong((id *)&self->_numberOfProximityLevelRevokedEvents, 0);
  objc_storeStrong((id *)&self->_numberOfProximityLevelFoundEvents, 0);
  objc_storeStrong((id *)&self->_numberOfMotionEvents, 0);
  objc_storeStrong((id *)&self->_armsReachEvent, 0);
  objc_storeStrong((id *)&self->_stopEvent, 0);
  objc_storeStrong((id *)&self->_firstPoseEvent, 0);
  objc_storeStrong((id *)&self->_firstRssiEvent, 0);
  objc_storeStrong((id *)&self->_firstProximityLevelFoundEvent, 0);
  objc_storeStrong((id *)&self->_startEvent, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
