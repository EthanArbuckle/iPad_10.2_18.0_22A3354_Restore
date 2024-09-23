@implementation PLBBTelephonyRegMsg

- (NSDictionary)telRegInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setTelRegInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void)setCellID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void)setAttrOperatorName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(v8, "isEqualToString:", &stru_1E8587D00) & 1) != 0 || !objc_msgSend(v8, "length"))
  {

    v8 = 0;
  }
  -[PLBBTelephonyRegMsg operatorName](self, "operatorName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v8))
  {

LABEL_10:
    v6 = v8;
    goto LABEL_11;
  }
  -[PLBBTelephonyRegMsg operatorName](self, "operatorName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {

    v6 = v8;
LABEL_9:
    v8 = v6;
    -[PLBBTelephonyRegMsg setOperatorName:](self, "setOperatorName:", v6);
    -[PLBBTelephonyRegMsg setChanged:](self, "setChanged:", 1);
    goto LABEL_10;
  }
  v7 = objc_msgSend(v8, "length");

  v6 = v8;
  if (v7)
    goto LABEL_9;
LABEL_11:

}

- (void)setAttrLac:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[PLBBTelephonyRegMsg lac](self, "lac");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v6);

  if ((v5 & 1) == 0)
  {
    -[PLBBTelephonyRegMsg setLac:](self, "setLac:", v6);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
      -[PLBBTelephonyRegMsg setChanged:](self, "setChanged:", 1);
  }

}

- (void)processTelReg
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;

  -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("kCTRegistrationCellChangedNotification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Valid"));

  if (v5)
  {
    -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CA75D0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBTelephonyRegMsg setCellID:](self, "setCellID:", v7);

    -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CA7698];
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CA7698]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v9);
      v12 = objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_7;
      -[PLBBTelephonyRegMsg setAttrLac:](self, "setAttrLac:", v12);
      v8 = (void *)v12;
    }
    else
    {

    }
  }
LABEL_7:
  -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("kCTRegistrationStatusChangedNotification"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Valid"));

  if (v15)
  {
    -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0CA7778];
    objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0CA7778]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKey:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = 0;
    }

    -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0CA7690];
    objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0CA7690]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKey:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25 = 0;
    }

    if (v20)
    {
      -[PLBBTelephonyRegMsg humanReadableRegistrationStatus:](self, "humanReadableRegistrationStatus:", v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBTelephonyRegMsg setAttrRegistrationStatus:](self, "setAttrRegistrationStatus:", v26);

    }
    if (v25)
      -[PLBBTelephonyRegMsg setAttrHomeNetwork:](self, "setAttrHomeNetwork:", v25);

  }
  -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKey:", CFSTR("kCTRegistrationDataStatusChangedNotification"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("Valid"));

  if (v29)
  {
    -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *MEMORY[0x1E0CA7600];
    objc_msgSend(v30, "objectForKey:", *MEMORY[0x1E0CA7600]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKey:", v31);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v34 = 0;
    }

    -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *MEMORY[0x1E0CA75F8];
    objc_msgSend(v35, "objectForKey:", *MEMORY[0x1E0CA75F8]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKey:", v36);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v39 = 0;
    }

    -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = *MEMORY[0x1E0CA7620];
    objc_msgSend(v40, "objectForKey:", *MEMORY[0x1E0CA7620]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "objectForKey:", v41);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v44 = 0;
    }

    if (v34)
      -[PLBBTelephonyRegMsg setAttrDataAttached:](self, "setAttrDataAttached:", v34);
    if (v39)
      -[PLBBTelephonyRegMsg setAttrDataActive:](self, "setAttrDataActive:", v39);
    if (v44)
    {
      -[PLBBTelephonyRegMsg humanReadableDataIndicator:](self, "humanReadableDataIndicator:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBTelephonyRegMsg setAttrDataIndicator:](self, "setAttrDataIndicator:", v45);

    }
  }
  -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "objectForKey:", CFSTR("kCTRegistrationOperatorNameChangedNotification"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("Valid"));

  if (v48)
  {
    -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectForKey:", *MEMORY[0x1E0CA76A0]);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBTelephonyRegMsg setAttrOperatorName:](self, "setAttrOperatorName:", v50);

  }
  else
  {
    v49 = (void *)CTRegistrationCopyOperatorName();
    -[PLBBTelephonyRegMsg setAttrOperatorName:](self, "setAttrOperatorName:", v49);
  }

  -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "objectForKey:", CFSTR("kCTTimeUpdateNotification"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("Valid"));

  if (v53)
  {
    -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = *MEMORY[0x1E0CA7890];
    v60 = v54;
    objc_msgSend(v54, "objectForKey:", *MEMORY[0x1E0CA7890]);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v59 = v60;
      goto LABEL_45;
    }
    -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "objectForKey:", v55);
    v58 = objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      -[PLBBTelephonyRegMsg setTimeUpdate:](self, "setTimeUpdate:", v58);
      v59 = (void *)v58;
LABEL_45:

    }
  }
}

- (NSString)operatorName
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)logEventPointTelephonyRegistration
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t block;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __57__PLBBTelephonyRegMsg_logEventPointTelephonyRegistration__block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    v17 = v3;
    if (qword_1ED885530 != -1)
      dispatch_once(&qword_1ED885530, &block);
    if (byte_1ED88550C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBTelephonyRegMsg logEventPointTelephonyRegistration]", block, v14, v15, v16, v17);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyRegMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBTelephonyRegMsg logEventPointTelephonyRegistration]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 92);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBTelephonyRegMsg telRegInfo](self, "telRegInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("TelephonyRegistration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
    -[PLBBTelephonyRegMsg processTelReg](self, "processTelReg");
    -[PLBBTelephonyRegMsg fillPLEntryAndSend:](self, "fillPLEntryAndSend:", v12);

  }
}

- (NSNumber)lac
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)fillPLEntryAndSend:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (-[PLBBTelephonyRegMsg changed](self, "changed"))
  {
    -[PLBBTelephonyRegMsg operatorName](self, "operatorName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v4, CFSTR("operator"));

    -[PLBBTelephonyRegMsg lac](self, "lac");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v5, CFSTR("lac"));

    -[PLBBTelephonyRegMsg cellID](self, "cellID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, CFSTR("cellId"));

    -[PLBBTelephonyRegMsg homeNetwork](self, "homeNetwork");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, CFSTR("home"));

    -[PLBBTelephonyRegMsg dataAttached](self, "dataAttached");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, CFSTR("dataAttached"));

    -[PLBBTelephonyRegMsg dataActive](self, "dataActive");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("dataActive"));

    -[PLBBTelephonyRegMsg dataIndicator](self, "dataIndicator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, CFSTR("dataInd"));

    -[PLBBTelephonyRegMsg registrationStatus](self, "registrationStatus");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("status"));

    -[PLBBTelephonyRegMsg sendAndLogPLEntry:withName:withType:](self, "sendAndLogPLEntry:withName:withType:", v13, CFSTR("TelephonyRegistration"), *MEMORY[0x1E0D80378]);
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
    {
      -[PLBasebandMessage agent](self, "agent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "createOOSAccountingEvent:", v13);

    }
    -[PLBBTelephonyRegMsg setChanged:](self, "setChanged:", 0);
  }

}

- (unsigned)changed
{
  return self->_changed;
}

- (PLBBTelephonyRegMsg)init
{
  PLBBTelephonyRegMsg *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLBBTelephonyRegMsg;
  result = -[PLBBTelephonyRegMsg init](&v3, sel_init);
  if (result)
    result->_changed = 0;
  return result;
}

- (void)refreshTelephonyReg
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D179C2E0](self, a2);
  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__PLBBTelephonyRegMsg_refreshTelephonyReg__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED885510 != -1)
      dispatch_once(&qword_1ED885510, block);
    if (_MergedGlobals_1_61)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBTelephonyRegMsg refreshTelephonyReg]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyRegMsg.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBTelephonyRegMsg refreshTelephonyReg]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 37);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v4 = MEMORY[0x1E0C809B0];
    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v17[0] = v4;
    v17[1] = 3221225472;
    v17[2] = __42__PLBBTelephonyRegMsg_refreshTelephonyReg__block_invoke_14;
    v17[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v17[4] = objc_opt_class();
    if (qword_1ED885518 != -1)
      dispatch_once(&qword_1ED885518, v17);
    if (byte_1ED885509)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Refresh not implemented"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyRegMsg.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBTelephonyRegMsg refreshTelephonyReg]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 38);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v11;
        _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __42__PLBBTelephonyRegMsg_refreshTelephonyReg__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_61 = result;
  return result;
}

uint64_t __42__PLBBTelephonyRegMsg_refreshTelephonyReg__block_invoke_14(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885509 = result;
  return result;
}

+ (id)bbEuLogMsgNameTelephonyReg
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
  _QWORD v27[10];
  _QWORD v28[10];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[2];
  _QWORD v32[4];

  v32[2] = *MEMORY[0x1E0C80C00];
  v31[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v29[0] = *MEMORY[0x1E0D80318];
  v29[1] = v2;
  v30[0] = &unk_1E8653940;
  v30[1] = MEMORY[0x1E0C9AAA0];
  v29[2] = *MEMORY[0x1E0D802F8];
  v30[2] = CFSTR("refreshRequestHandler");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v26;
  v31[1] = *MEMORY[0x1E0D802F0];
  v27[0] = CFSTR("operator");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_StringFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v24;
  v27[1] = CFSTR("lac");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v22;
  v27[2] = CFSTR("cellId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v20;
  v27[3] = CFSTR("home");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_BoolFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v18;
  v27[4] = CFSTR("dataAttached");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_BoolFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v16;
  v27[5] = CFSTR("dataActive");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_BoolFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v14;
  v27[6] = CFSTR("dataInd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[6] = v4;
  v27[7] = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[7] = v6;
  v27[8] = CFSTR("serviceOpt");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[8] = v8;
  v27[9] = CFSTR("subsId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)logEventPointTelephonyRegistrationAtInit
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
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
  NSObject *v23;
  _QWORD v24[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__PLBBTelephonyRegMsg_logEventPointTelephonyRegistrationAtInit__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED885520 != -1)
      dispatch_once(&qword_1ED885520, block);
    if (byte_1ED88550A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBTelephonyRegMsg logEventPointTelephonyRegistrationAtInit]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyRegMsg.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBTelephonyRegMsg logEventPointTelephonyRegistrationAtInit]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 69);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBTelephonyRegMsg setAttrCellID:](self, "setAttrCellID:", 0);
  -[PLBBTelephonyRegMsg setAttrLac:](self, "setAttrLac:", 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", CTRegistrationGetDataAttached() != 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBTelephonyRegMsg setAttrDataAttached:](self, "setAttrDataAttached:", v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", CTRegistrationGetDataContextActive() != 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBTelephonyRegMsg setAttrDataActive:](self, "setAttrDataActive:", v12);

  -[PLBBTelephonyRegMsg humanReadableDataIndicator:](self, "humanReadableDataIndicator:", CTRegistrationGetDataIndicator());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBTelephonyRegMsg setAttrDataIndicator:](self, "setAttrDataIndicator:", v13);

  -[PLBBTelephonyRegMsg setAttrHomeNetwork:](self, "setAttrHomeNetwork:", 0);
  -[PLBBTelephonyRegMsg humanReadableRegistrationStatus:](self, "humanReadableRegistrationStatus:", CTRegistrationGetStatus());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBTelephonyRegMsg setAttrRegistrationStatus:](self, "setAttrRegistrationStatus:", v14);

  v15 = (void *)CTRegistrationCopyOperatorName();
  -[PLBBTelephonyRegMsg setAttrOperatorName:](self, "setAttrOperatorName:", v15);
  -[PLBBTelephonyRegMsg setChanged:](self, "setChanged:", 1);
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("TelephonyRegistration"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v16);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v24[0] = v4;
    v24[1] = 3221225472;
    v24[2] = __63__PLBBTelephonyRegMsg_logEventPointTelephonyRegistrationAtInit__block_invoke_45;
    v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v24[4] = objc_opt_class();
    if (qword_1ED885528 != -1)
      dispatch_once(&qword_1ED885528, v24);
    if (byte_1ED88550B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Send Telephony Registration msgs at Init"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyRegMsg.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBTelephonyRegMsg logEventPointTelephonyRegistrationAtInit]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 85);

      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v18;
        _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBTelephonyRegMsg fillPLEntryAndSend:](self, "fillPLEntryAndSend:", v17);

}

uint64_t __63__PLBBTelephonyRegMsg_logEventPointTelephonyRegistrationAtInit__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88550A = result;
  return result;
}

uint64_t __63__PLBBTelephonyRegMsg_logEventPointTelephonyRegistrationAtInit__block_invoke_45(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88550B = result;
  return result;
}

uint64_t __57__PLBBTelephonyRegMsg_logEventPointTelephonyRegistration__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88550C = result;
  return result;
}

- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D7FFA0];
  v11 = a3;
  v12 = objc_msgSend(v10, "debugEnabled");
  v13 = MEMORY[0x1E0C809B0];
  if (v12)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__PLBBTelephonyRegMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED885538 != -1)
      dispatch_once(&qword_1ED885538, block);
    if (byte_1ED88550D)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBTelephonyRegMsg sendAndLogPLEntry:withName:withType:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyRegMsg.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBTelephonyRegMsg sendAndLogPLEntry:withName:withType:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 192);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v14;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v13 = MEMORY[0x1E0C809B0];
    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v27[0] = v13;
    v27[1] = 3221225472;
    v27[2] = __59__PLBBTelephonyRegMsg_sendAndLogPLEntry_withName_withType___block_invoke_64;
    v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v27[4] = objc_opt_class();
    if (qword_1ED885540 != -1)
      dispatch_once(&qword_1ED885540, v27);
    if (byte_1ED88550E)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sending PLEntry: name=%@ type=%@"), v8, v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyRegMsg.m");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastPathComponent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBTelephonyRegMsg sendAndLogPLEntry:withName:withType:]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 193);

      PLLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v20;
        _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBasebandMessage agent](self, "agent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "logEntry:", v11);

}

uint64_t __59__PLBBTelephonyRegMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88550D = result;
  return result;
}

uint64_t __59__PLBBTelephonyRegMsg_sendAndLogPLEntry_withName_withType___block_invoke_64(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88550E = result;
  return result;
}

- (void)setAttrCellID:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[PLBBTelephonyRegMsg cellID](self, "cellID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v6);

  if ((v5 & 1) == 0)
  {
    -[PLBBTelephonyRegMsg setCellID:](self, "setCellID:", v6);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
      -[PLBBTelephonyRegMsg setChanged:](self, "setChanged:", 1);
  }

}

- (void)setAttrDataAttached:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[PLBBTelephonyRegMsg dataAttached](self, "dataAttached");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v6);

  if ((v5 & 1) == 0)
  {
    -[PLBBTelephonyRegMsg setDataAttached:](self, "setDataAttached:", v6);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
      -[PLBBTelephonyRegMsg setChanged:](self, "setChanged:", 1);
  }

}

- (void)setAttrDataActive:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[PLBBTelephonyRegMsg dataActive](self, "dataActive");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v6);

  if ((v5 & 1) == 0)
  {
    -[PLBBTelephonyRegMsg setDataActive:](self, "setDataActive:", v6);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
      -[PLBBTelephonyRegMsg setChanged:](self, "setChanged:", 1);
  }

}

- (void)setAttrDataIndicator:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[PLBBTelephonyRegMsg dataIndicator](self, "dataIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v6);

  if ((v5 & 1) == 0)
  {
    -[PLBBTelephonyRegMsg setDataIndicator:](self, "setDataIndicator:", v6);
    -[PLBBTelephonyRegMsg setChanged:](self, "setChanged:", 1);
  }

}

- (void)setAttrHomeNetwork:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[PLBBTelephonyRegMsg homeNetwork](self, "homeNetwork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v6);

  if ((v5 & 1) == 0)
  {
    -[PLBBTelephonyRegMsg setHomeNetwork:](self, "setHomeNetwork:", v6);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
      -[PLBBTelephonyRegMsg setChanged:](self, "setChanged:", 1);
  }

}

- (void)setAttrRegistrationStatus:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  if (!v6)
  {
    CTRegistrationGetStatus();
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[PLBBTelephonyRegMsg registrationStatus](self, "registrationStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v6);

  if ((v5 & 1) == 0)
  {
    -[PLBBTelephonyRegMsg setRegistrationStatus:](self, "setRegistrationStatus:", v6);
    -[PLBBTelephonyRegMsg setChanged:](self, "setChanged:", 1);
  }

}

- (id)humanReadableRegistrationStatus:(id)a3
{
  id v3;
  void *v4;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("kCTRegistrationStatus"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)humanReadableDataIndicator:(id)a3
{
  id v3;
  void *v4;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("kCTRegistrationDataIndicator"), "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSNumber)cellID
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLac:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSNumber)dataAttached
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDataAttached:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSNumber)dataActive
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDataActive:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSString)dataIndicator
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDataIndicator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSNumber)homeNetwork
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setHomeNetwork:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSString)registrationStatus
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setRegistrationStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void)setOperatorName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSDate)timeUpdate
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTimeUpdate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void)setChanged:(unsigned __int8)a3
{
  self->_changed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telRegInfo, 0);
  objc_storeStrong((id *)&self->_timeUpdate, 0);
  objc_storeStrong((id *)&self->_operatorName, 0);
  objc_storeStrong((id *)&self->_registrationStatus, 0);
  objc_storeStrong((id *)&self->_homeNetwork, 0);
  objc_storeStrong((id *)&self->_dataIndicator, 0);
  objc_storeStrong((id *)&self->_dataActive, 0);
  objc_storeStrong((id *)&self->_dataAttached, 0);
  objc_storeStrong((id *)&self->_lac, 0);
  objc_storeStrong((id *)&self->_cellID, 0);
}

@end
