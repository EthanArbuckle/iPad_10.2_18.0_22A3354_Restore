@implementation PGFeatureTransformerToLog

- (id)applyTransformationToFloatVector:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a3, "vectorByElementwiseNaturalLogarithmIfPositive");
}

+ (id)name
{
  return CFSTR("ToLog");
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  const __CFString *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[PGFeatureTransformerHelper validParameters:ofTypes:](PGFeatureTransformerHelper, "validParameters:ofTypes:", v5, v6);

    if (v7)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      a4 = -[PGFeatureSliceTransformer initFromIndex:toIndex:]([PGFeatureTransformerToLog alloc], "initFromIndex:toIndex:", objc_msgSend(v8, "integerValue"), objc_msgSend(v9, "integerValue"));

    }
    else if (a4)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2D50];
      v14 = CFSTR("Failed to instantiate PGFeatureTransformerToLog: incorrect parameters.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosGraph.PGFeatureTransformerToLog"), 0, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    a4 = objc_alloc_init(PGFeatureTransformerToLog);
  }

  return a4;
}

@end
