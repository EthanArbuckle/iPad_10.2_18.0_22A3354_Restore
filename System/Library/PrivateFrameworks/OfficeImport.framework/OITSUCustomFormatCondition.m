@implementation OITSUCustomFormatCondition

- (OITSUCustomFormatCondition)init
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUCustomFormatCondition init]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormat.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 526, 0, "Do not call init for TSUCustomFormatCondition");

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  return 0;
}

- (OITSUCustomFormatCondition)initWithType:(int)a3 value:(double)a4 data:(id)a5
{
  id v8;
  OITSUCustomFormatCondition *v9;
  OITSUCustomFormatCondition *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  OITSUCustomFormatData *data;
  objc_super v16;

  v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)OITSUCustomFormatCondition;
  v9 = -[OITSUCustomFormatCondition init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_conditionType = a3;
    v9->_conditionValue = a4;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUCustomFormatCondition initWithType:value:data:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUCustomFormat.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 537, 0, "invalid nil value for '%{public}s'", "data");

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
    v13 = objc_msgSend(v8, "copy");
    data = v10->_data;
    v10->_data = (OITSUCustomFormatData *)v13;

    -[OITSUCustomFormatData setIsConditional:](v10->_data, "setIsConditional:", 1);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  OITSUCustomFormatCondition *v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  OITSUCustomFormatCondition *v9;

  v4 = +[OITSUCustomFormatCondition allocWithZone:](OITSUCustomFormatCondition, "allocWithZone:", a3);
  v5 = -[OITSUCustomFormatCondition conditionType](self, "conditionType");
  -[OITSUCustomFormatCondition conditionValue](self, "conditionValue");
  v7 = v6;
  -[OITSUCustomFormatCondition data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[OITSUCustomFormatCondition initWithType:value:data:](v4, "initWithType:value:data:", v5, v8, v7);

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  int v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  v5 = objc_opt_class();
  TSUDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (-[OITSUCustomFormatCondition conditionValue](self, "conditionValue"),
        v8 = v7,
        objc_msgSend(v6, "conditionValue"),
        v8 == v9)
    && (v10 = -[OITSUCustomFormatCondition conditionType](self, "conditionType"),
        v10 == objc_msgSend(v6, "conditionType")))
  {
    -[OITSUCustomFormatCondition data](self, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  return -[OITSUCustomFormatCondition conditionType](self, "conditionType");
}

- (int)conditionType
{
  return self->_conditionType;
}

- (double)conditionValue
{
  return self->_conditionValue;
}

- (OITSUCustomFormatData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
