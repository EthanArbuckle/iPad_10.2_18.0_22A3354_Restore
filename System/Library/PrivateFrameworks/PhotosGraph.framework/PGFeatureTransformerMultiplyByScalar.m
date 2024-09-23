@implementation PGFeatureTransformerMultiplyByScalar

- (PGFeatureTransformerMultiplyByScalar)initWithScalarToMultiply:(float)a3
{
  return -[PGFeatureTransformerMultiplyByScalar initWithScalarToMultiply:fromIndex:toIndex:](self, "initWithScalarToMultiply:fromIndex:toIndex:", 0, 0x7FFFFFFFLL);
}

- (PGFeatureTransformerMultiplyByScalar)initWithScalarToMultiply:(float)a3 fromIndex:(int64_t)a4 toIndex:(int64_t)a5
{
  PGFeatureTransformerMultiplyByScalar *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PGFeatureTransformerMultiplyByScalar;
  result = -[PGFeatureSliceTransformer initFromIndex:toIndex:](&v7, sel_initFromIndex_toIndex_, a4, a5);
  if (result)
    result->_scalarToMultiply = a3;
  return result;
}

- (id)applyTransformationToFloatVector:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  -[PGFeatureTransformerMultiplyByScalar scalarToMultiply](self, "scalarToMultiply");
  objc_msgSend(v5, "vectorByMultiplyingByScalar:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (float)scalarToMultiply
{
  return self->_scalarToMultiply;
}

+ (id)name
{
  return CFSTR("MultiplyByScalar");
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  PGFeatureTransformerMultiplyByScalar *v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  PGFeatureTransformerMultiplyByScalar *v18;
  PGFeatureTransformerMultiplyByScalar *v19;
  void *v20;
  uint64_t v22;
  const __CFString *v23;
  _QWORD v24[3];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PGFeatureTransformerHelper validParameters:ofTypes:](PGFeatureTransformerHelper, "validParameters:ofTypes:", v5, v6))
  {

    goto LABEL_4;
  }
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v24[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[PGFeatureTransformerHelper validParameters:ofTypes:](PGFeatureTransformerHelper, "validParameters:ofTypes:", v5, v7);

  if (v8)
  {
LABEL_4:
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 3)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = [PGFeatureTransformerMultiplyByScalar alloc];
      objc_msgSend(v9, "floatValue");
      v14 = v13;
      v15 = objc_msgSend(v10, "integerValue");
      v16 = objc_msgSend(v11, "integerValue");
      LODWORD(v17) = v14;
      v18 = -[PGFeatureTransformerMultiplyByScalar initWithScalarToMultiply:fromIndex:toIndex:](v12, "initWithScalarToMultiply:fromIndex:toIndex:", v15, v16, v17);

    }
    else
    {
      v19 = [PGFeatureTransformerMultiplyByScalar alloc];
      objc_msgSend(v9, "floatValue");
      v18 = -[PGFeatureTransformerMultiplyByScalar initWithScalarToMultiply:](v19, "initWithScalarToMultiply:");
    }
    goto LABEL_9;
  }
  if (!a4)
  {
    v18 = 0;
    goto LABEL_10;
  }
  v20 = (void *)MEMORY[0x1E0CB35C8];
  v22 = *MEMORY[0x1E0CB2D50];
  v23 = CFSTR("Failed to instantiate PGFeatureTransformerMultiplyByScalar: incorrect parameters.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosGraph.PGFeatureTransformerMultiplyByScalar"), 0, v9);
  v18 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

LABEL_10:
  return v18;
}

@end
