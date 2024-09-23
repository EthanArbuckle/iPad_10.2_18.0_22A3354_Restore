@implementation CHDValueAxis

- (CHDValueAxis)initWithResources:(id)a3
{
  CHDValueAxis *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CHDValueAxis;
  result = -[CHDAxis initWithResources:](&v4, sel_initWithResources_, a3);
  if (result)
  {
    result->mMajorUnitValue = 0.0;
    result->mMinorUnitValue = 0.0;
    result->mScalingLogBase = 0.0;
    result->super.mAxisPosition = 1;
    result->mPercentageFormattingFlag = 0;
    result->mAutoMajorUnitValue = 1;
    result->mAutoMinorUnitValue = 1;
    result->mShowBuiltInUnit = 0;
    result->mBuiltInUnit = -1;
  }
  return result;
}

- (BOOL)isPercentageFormattingFlag
{
  return self->mPercentageFormattingFlag;
}

- (void)setPercentageFormattingFlag:(BOOL)a3
{
  self->mPercentageFormattingFlag = a3;
}

- (void)setMajorUnitValue:(double)a3
{
  self->mMajorUnitValue = a3;
  self->mAutoMajorUnitValue = 0;
}

- (void)adjustAxisPositionForHorizontalChart
{
  self->super.mAxisPosition = 0;
}

- (void)setMinorUnitValue:(double)a3
{
  self->mMinorUnitValue = a3;
  self->mAutoMinorUnitValue = 0;
}

- (void)setScalingLogBase:(double)a3
{
  self->mScalingLogBase = a3;
}

- (double)majorUnitValue
{
  return self->mMajorUnitValue;
}

- (double)minorUnitValue
{
  return self->mMinorUnitValue;
}

- (double)scalingLogBase
{
  return self->mScalingLogBase;
}

- (BOOL)isAutoMajorUnitValue
{
  return self->mAutoMajorUnitValue;
}

- (BOOL)isAutoMinorUnitValue
{
  return self->mAutoMinorUnitValue;
}

- (BOOL)isShowBuiltInUnit
{
  return self->mShowBuiltInUnit;
}

- (void)setShowBuiltInUnitFlag:(BOOL)a3
{
  self->mShowBuiltInUnit = a3;
}

- (int)builtInUnit
{
  return self->mBuiltInUnit;
}

- (void)setBuiltInUnit:(int)a3
{
  self->mBuiltInUnit = a3;
}

- (id)contentFormatWithBuiltInUnit
{
  unsigned int mBuiltInUnit;
  BOOL v3;
  int v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id WeakRetained;
  void *v27;

  mBuiltInUnit = self->mBuiltInUnit;
  v3 = mBuiltInUnit > 8;
  v4 = (1 << mBuiltInUnit) & 0x192;
  if (v3 || v4 == 0)
  {
    v15 = 0;
  }
  else
  {
    -[CHDAxis contentFormat](self, "contentFormat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "formatString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "formatString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "string");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 && objc_msgSend(v10, "length") && (v11 = objc_msgSend(v10, "length"), v11 - 1 >= 0))
      {
        v12 = 0;
        while (1)
        {
          v13 = v11 - 1;
          objc_msgSend(v10, "substringWithRange:", v11 - 1, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v12 ^= objc_msgSend(v14, "isEqualToString:", CFSTR("'"));
          if ((v12 & 1) == 0
            && ((objc_msgSend(v14, "isEqualToString:", CFSTR("#")) & 1) != 0
             || (objc_msgSend(v14, "isEqualToString:", CFSTR("0")) & 1) != 0
             || (objc_msgSend(v14, "isEqualToString:", CFSTR("?")) & 1) != 0
             || objc_msgSend(v14, "isEqualToString:", CFSTR("."))))
          {
            break;
          }

          --v11;
          if (v13 <= 0)
            goto LABEL_16;
        }
        v17 = (void *)MEMORY[0x24BDD16A8];
        objc_msgSend(v10, "substringToIndex:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithString:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = self->mBuiltInUnit - 1;
        if (v20 < 8 && ((0xC9u >> v20) & 1) != 0)
        {
          objc_msgSend(v19, "appendString:", off_24F3A78C8[v20]);
          v21 = 1;
        }
        else
        {
          v21 = 0;
        }
        objc_msgSend(v10, "substringFromIndex:", v11);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "appendString:", v22);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v19);
        v23 = objc_claimAutoreleasedReturnValue();

        if ((v21 & 1) != 0)
        {
          +[EDString edStringWithString:](EDString, "edStringWithString:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[EDContentFormat contentFormatWithFormatString:](EDContentFormat, "contentFormatWithFormatString:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          WeakRetained = objc_loadWeakRetained((id *)&self->super.mResources);
          objc_msgSend(WeakRetained, "contentFormats");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "objectAtIndex:", objc_msgSend(v27, "addOrEquivalentObject:", v25));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v15 = 0;
        }
        v10 = (void *)v23;
      }
      else
      {
LABEL_16:
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  return v15;
}

@end
