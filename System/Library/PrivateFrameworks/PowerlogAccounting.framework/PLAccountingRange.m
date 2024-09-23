@implementation PLAccountingRange

- (id)intersect:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD block[6];

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __31__PLAccountingRange_intersect___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (intersect__defaultOnce != -1)
      dispatch_once(&intersect__defaultOnce, block);
    if (intersect__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("self=%@, otherRange=%@"), self, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingRange.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRange intersect:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 42);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingRange endDate](self, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceDate:", v13);
  v15 = v14;

  if (v15 < 0.0)
  {
    if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      goto LABEL_23;
    v16 = objc_opt_class();
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __31__PLAccountingRange_intersect___block_invoke_14;
    v49[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v49[4] = v16;
    if (intersect__defaultOnce_12 != -1)
      dispatch_once(&intersect__defaultOnce_12, v49);
    if (!intersect__classDebugEnabled_13)
      goto LABEL_23;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("self ends before otherRange"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BE74FA8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingRange.m");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastPathComponent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRange intersect:]");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 46);

    PLLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[PLAccountingDependency activate].cold.1();
LABEL_22:

LABEL_23:
    objc_msgSend((id)objc_opt_class(), "emptyRange");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  objc_msgSend(v4, "endDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingRange startDate](self, "startDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "timeIntervalSinceDate:", v24);
  v26 = v25;

  if (v26 < 0.0)
  {
    if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      goto LABEL_23;
    v27 = objc_opt_class();
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __31__PLAccountingRange_intersect___block_invoke_19;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v48[4] = v27;
    if (intersect__defaultOnce_17 != -1)
      dispatch_once(&intersect__defaultOnce_17, v48);
    if (!intersect__classDebugEnabled_18)
      goto LABEL_23;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("otherRange ends before self"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BE74FA8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingRange.m");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "lastPathComponent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRange intersect:]");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v30, v31, 52);

    PLLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[PLAccountingDependency activate].cold.1();
    goto LABEL_22;
  }
  -[PLAccountingRange startDate](self, "startDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "laterDate:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingRange endDate](self, "endDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "earlierDate:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", v36, v39);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v40 = objc_opt_class();
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __31__PLAccountingRange_intersect___block_invoke_24;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v40;
    if (intersect__defaultOnce_22 != -1)
      dispatch_once(&intersect__defaultOnce_22, v47);
    if (intersect__classDebugEnabled_23)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("intersectionRange=%@"), v32);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingRange.m");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "lastPathComponent");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRange intersect:]");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v44, v45, 59);

      PLLogCommon();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
LABEL_24:

  return v32;
}

+ (PLAccountingRange)rangeWithStartDate:(id)a3 withEndDate:(id)a4
{
  id v5;
  id v6;
  PLAccountingRange *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PLAccountingRange initWithStartDate:withEndDate:]([PLAccountingRange alloc], "initWithStartDate:withEndDate:", v6, v5);

  return v7;
}

- (PLAccountingRange)initWithStartDate:(id)a3 withEndDate:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  PLAccountingRange *v9;
  PLAccountingRange *v10;
  NSDate *v11;
  PLAccountingRange *v12;
  NSDate *endDate;
  objc_super v15;

  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  if (v7 | v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)PLAccountingRange;
    v9 = -[PLAccountingRange init](&v15, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_startDate, a3);
      if (v7)
      {
        objc_msgSend((id)v8, "laterDate:", v7);
        v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = (NSDate *)(id)v8;
      }
      endDate = v10->_endDate;
      v10->_endDate = v11;

    }
    self = v10;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSDate)endDate
{
  return self->_endDate;
}

+ (id)emptyRange
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__PLAccountingRange_emptyRange__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (emptyRange_onceToken != -1)
    dispatch_once(&emptyRange_onceToken, block);
  return (id)emptyRange_emptyRange;
}

- (double)length
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[PLAccountingRange startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLAccountingRange endDate](self, "endDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[PLAccountingRange endDate](self, "endDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAccountingRange startDate](self, "startDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSinceDate:", v6);
      v8 = v7;

    }
    else
    {
      v8 = 1.79769313e308;
    }

  }
  else
  {
    v8 = 1.79769313e308;
  }

  return v8;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (BOOL)overlaps:(id)a3
{
  PLAccountingRange *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  PLAccountingRange *v21;
  double v22;
  double v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  BOOL v32;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  double v41;
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD block[5];

  v4 = (PLAccountingRange *)a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __30__PLAccountingRange_overlaps___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (overlaps__defaultOnce != -1)
      dispatch_once(&overlaps__defaultOnce, block);
    if (overlaps__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("self=%@, otherRange=%@"), self, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingRange.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRange overlaps:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 64);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingRange length](self, "length");
  if (v12 == 0.0)
  {
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v13 = objc_opt_class();
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __30__PLAccountingRange_overlaps___block_invoke_29;
      v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v44[4] = v13;
      if (overlaps__defaultOnce_27 != -1)
        dispatch_once(&overlaps__defaultOnce_27, v44);
      if (overlaps__classDebugEnabled_28)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("self is an EventPoint"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingRange.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRange overlaps:]");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 67);

        PLLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    -[PLAccountingRange startDate](self, "startDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v4;
LABEL_26:
    v32 = -[PLAccountingRange containsDate:](v21, "containsDate:", v20);
    goto LABEL_27;
  }
  -[PLAccountingRange length](v4, "length");
  v23 = v22;
  v24 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  if (v23 == 0.0)
  {
    if (v24)
    {
      v25 = objc_opt_class();
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __30__PLAccountingRange_overlaps___block_invoke_34;
      v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v43[4] = v25;
      if (overlaps__defaultOnce_32 != -1)
        dispatch_once(&overlaps__defaultOnce_32, v43);
      if (overlaps__classDebugEnabled_33)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("otherRange is an EventPoint"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingRange.m");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "lastPathComponent");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRange overlaps:]");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v29, v30, 71);

        PLLogCommon();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    -[PLAccountingRange startDate](v4, "startDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = self;
    goto LABEL_26;
  }
  if (v24)
  {
    v34 = objc_opt_class();
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __30__PLAccountingRange_overlaps___block_invoke_39;
    v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v42[4] = v34;
    if (overlaps__defaultOnce_37 != -1)
      dispatch_once(&overlaps__defaultOnce_37, v42);
    if (overlaps__classDebugEnabled_38)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("both are EventIntervals"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingRange.m");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "lastPathComponent");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRange overlaps:]");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 75);

      PLLogCommon();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingRange intersect:](self, "intersect:", v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "length");
  v32 = v41 >= 1.0;
LABEL_27:

  return v32;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v5 = a3;
  -[PLAccountingRange startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "startDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v9 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingRange startDate](self, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToDate:", v8);

  if (!v6)
    goto LABEL_6;
LABEL_7:

  -[PLAccountingRange endDate](self, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v5, "endDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v13 = 1;
LABEL_12:

      goto LABEL_13;
    }
  }
  objc_msgSend(v5, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingRange endDate](self, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToDate:", v12);

  if (!v10)
    goto LABEL_12;
LABEL_13:

  return v9 & v13;
}

uint64_t __31__PLAccountingRange_intersect___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  intersect__classDebugEnabled = result;
  return result;
}

uint64_t __31__PLAccountingRange_intersect___block_invoke_14(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  intersect__classDebugEnabled_13 = result;
  return result;
}

uint64_t __31__PLAccountingRange_intersect___block_invoke_19(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  intersect__classDebugEnabled_18 = result;
  return result;
}

uint64_t __31__PLAccountingRange_intersect___block_invoke_24(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  intersect__classDebugEnabled_23 = result;
  return result;
}

uint64_t __30__PLAccountingRange_overlaps___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  overlaps__classDebugEnabled = result;
  return result;
}

uint64_t __30__PLAccountingRange_overlaps___block_invoke_29(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  overlaps__classDebugEnabled_28 = result;
  return result;
}

uint64_t __30__PLAccountingRange_overlaps___block_invoke_34(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  overlaps__classDebugEnabled_33 = result;
  return result;
}

uint64_t __30__PLAccountingRange_overlaps___block_invoke_39(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  overlaps__classDebugEnabled_38 = result;
  return result;
}

void __31__PLAccountingRange_emptyRange__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "rangeWithStartDate:withEndDate:", v4, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)emptyRange_emptyRange;
  emptyRange_emptyRange = v2;

}

- (BOOL)containsDate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  double v13;
  BOOL v14;
  void *v15;
  double v16;
  _QWORD block[5];

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__PLAccountingRange_containsDate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (containsDate__defaultOnce != -1)
      dispatch_once(&containsDate__defaultOnce, block);
    if (containsDate__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("self=%@, date=%@"), self, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/PLAccountingRange.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRange containsDate:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 99);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingRange startDate](self, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v12);
  if (v13 >= -1.0)
  {
    -[PLAccountingRange endDate](self, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v15);
    v14 = v16 <= 1.0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __34__PLAccountingRange_containsDate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  containsDate__classDebugEnabled = result;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PLAccountingRange startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;
  -[PLAccountingRange endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%f->%f)"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
