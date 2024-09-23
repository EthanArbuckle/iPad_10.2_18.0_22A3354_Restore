@implementation PGFeatureTransformerToUnitNorm

- (id)applyTransformationToFloatVector:(id)a3 error:(id *)a4
{
  id v6;
  double v7;
  void *v8;
  float v9;
  void *v10;

  v6 = a3;
  LODWORD(v7) = 2.0;
  objc_msgSend(v6, "vectorByElementwiseRaisingToExponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sum");
  if (sqrtf(v9) == 0.0)
  {
    -[PGFeatureTransformerToUnitNorm _generateError:withCode:andMessage:](self, "_generateError:withCode:andMessage:", a4, 0, CFSTR("Divide by 0 is not valid operation."));
    v10 = 0;
  }
  else
  {
    objc_msgSend(v6, "vectorByDividingByScalar:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (BOOL)_generateError:(id *)a3 withCode:(int64_t)a4 andMessage:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v13 = CFSTR("message");
    v14[0] = a5;
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = a5;
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosGraph.PGFeatureTransformerToUnitNorm"), a4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    *a3 = v11;
  }
  return 1;
}

+ (id)name
{
  return CFSTR("ToUnitNorm");
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
      a4 = -[PGFeatureSliceTransformer initFromIndex:toIndex:]([PGFeatureTransformerToUnitNorm alloc], "initFromIndex:toIndex:", objc_msgSend(v8, "integerValue"), objc_msgSend(v9, "integerValue"));

    }
    else if (a4)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2D50];
      v14 = CFSTR("Failed to instantiate PGFeatureTransformerToUnitNorm: incorrect parameters.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosGraph.PGFeatureTransformerToUnitNorm"), 1, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    a4 = objc_alloc_init(PGFeatureTransformerToUnitNorm);
  }

  return a4;
}

@end
