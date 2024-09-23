@implementation PXConcreteAudioAssetEntryPoint

- (PXConcreteAudioAssetEntryPoint)initWithTime:(double)a3 fadeInKeyTimeOffsets:(id)a4 fadeInKeyGainValues:(id)a5
{
  id v8;
  id v9;
  PXConcreteAudioAssetEntryPoint *v10;
  PXConcreteAudioAssetEntryPoint *v11;
  uint64_t v12;
  NSArray *fadeInKeyTimeOffsets;
  uint64_t v14;
  NSArray *fadeInKeyGainValues;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXConcreteAudioAssetEntryPoint;
  v10 = -[PXConcreteAudioAssetEntryPoint init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_time = a3;
    v12 = objc_msgSend(v8, "copy");
    fadeInKeyTimeOffsets = v11->_fadeInKeyTimeOffsets;
    v11->_fadeInKeyTimeOffsets = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    fadeInKeyGainValues = v11->_fadeInKeyGainValues;
    v11->_fadeInKeyGainValues = (NSArray *)v14;

  }
  return v11;
}

- (NSString)description
{
  id v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXConcreteAudioAssetEntryPoint time](self, "time");
  v7 = v6;
  -[PXConcreteAudioAssetEntryPoint fadeInKeyTimeOffsets](self, "fadeInKeyTimeOffsets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXConcreteAudioAssetEntryPoint fadeInKeyGainValues](self, "fadeInKeyGainValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; Time: %.2f; Gain Curve Offsets: %@; Gain Curve Values: %@>"),
                  v5,
                  self,
                  v7,
                  v8,
                  v9);

  return (NSString *)v10;
}

- (float)fadeInGainAtOffset:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  float v13;
  unint64_t v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  unint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  uint64_t v28;
  void *v29;

  -[PXConcreteAudioAssetEntryPoint fadeInKeyGainValues](self, "fadeInKeyGainValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[PXConcreteAudioAssetEntryPoint fadeInKeyTimeOffsets](self, "fadeInKeyTimeOffsets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXConcreteAudioAssetEntryPoint fadeInKeyGainValues](self, "fadeInKeyGainValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

    objc_msgSend(v6, "count");
    v28 = MEMORY[0x1E0C809B0];
    v11 = v6;
    v29 = v11;
    v12 = PXLastIndexInSortedRangePassingTest();
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = v10;
    }
    else
    {
      v14 = v12;
      objc_msgSend(v5, "objectAtIndexedSubscript:", v12, v28, 3221225472, __53__PXConcreteAudioAssetEntryPoint_fadeInGainAtOffset___block_invoke, &unk_1E5135DA0, v11, *(_QWORD *)&a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v13 = v16;

      objc_msgSend(v11, "objectAtIndexedSubscript:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      v19 = v18;

      if (v14 < objc_msgSend(v11, "count") - 1)
      {
        v20 = v14 + 1;
        objc_msgSend(v5, "objectAtIndexedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValue");
        v22 = v13;
        v24 = (a3 - v19) * (v23 - v22);
        objc_msgSend(v11, "objectAtIndexedSubscript:", v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "doubleValue");
        v13 = v24 / (v26 - v19) + v22;

      }
    }

  }
  else
  {
    v13 = 1.0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  PXConcreteAudioAssetEntryPoint *v4;
  PXConcreteAudioAssetEntryPoint *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (PXConcreteAudioAssetEntryPoint *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXConcreteAudioAssetEntryPoint time](self, "time");
      v7 = v6;
      -[PXConcreteAudioAssetEntryPoint time](v5, "time");
      if (v7 == v8)
      {
        -[PXConcreteAudioAssetEntryPoint fadeInKeyTimeOffsets](self, "fadeInKeyTimeOffsets");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXConcreteAudioAssetEntryPoint fadeInKeyTimeOffsets](v5, "fadeInKeyTimeOffsets");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqual:", v10))
        {
          -[PXConcreteAudioAssetEntryPoint fadeInKeyGainValues](self, "fadeInKeyGainValues");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXConcreteAudioAssetEntryPoint fadeInKeyGainValues](v5, "fadeInKeyGainValues");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  double v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[PXConcreteAudioAssetEntryPoint time](self, "time");
  v4 = (unint64_t)(v3 * 100.0);
  -[PXConcreteAudioAssetEntryPoint fadeInKeyGainValues](self, "fadeInKeyGainValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[PXConcreteAudioAssetEntryPoint fadeInKeyTimeOffsets](self, "fadeInKeyTimeOffsets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash") ^ v4;

  return v8;
}

- (double)time
{
  return self->_time;
}

- (NSArray)fadeInKeyTimeOffsets
{
  return self->_fadeInKeyTimeOffsets;
}

- (NSArray)fadeInKeyGainValues
{
  return self->_fadeInKeyGainValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeInKeyGainValues, 0);
  objc_storeStrong((id *)&self->_fadeInKeyTimeOffsets, 0);
}

BOOL __53__PXConcreteAudioAssetEntryPoint_fadeInGainAtOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  _BOOL8 v5;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4 <= *(double *)(a1 + 40);

  return v5;
}

@end
