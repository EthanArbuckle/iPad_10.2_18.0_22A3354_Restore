@implementation PGFeatureAugmenterMixUp

- (PGFeatureAugmenterMixUp)initWithCount:(unint64_t)a3 alpha:(float)a4 error:(id *)a5
{
  PGFeatureAugmenterMixUp *v8;
  PGFeatureAugmenterMixUp *v9;
  PGFeatureAugmenterMixUp *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PGFeatureAugmenterMixUp;
  v8 = -[PGFeatureAugmenterMixUp init](&v12, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_5;
  if (a4 != 0.0)
  {
    v8->_count = a3;
    v8->_alpha = a4;
LABEL_5:
    v10 = v8;
    goto LABEL_6;
  }
  +[PGFeatureAugmenterMixUp _generateError:withCode:andMessage:](PGFeatureAugmenterMixUp, "_generateError:withCode:andMessage:", a5, 1, CFSTR("MixUp can not be initialized with alpha = 0."));
  v10 = 0;
LABEL_6:

  return v10;
}

- (id)floatVectorWithFloatVector:(id)a3 error:(id *)a4
{
  return a3;
}

- (id)floatVectorsWithFloatVectors:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  unint64_t i;
  void *v9;
  uint32_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  id v16;

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; ; ++i)
  {
    if (i >= -[PGFeatureAugmenterMixUp count](self, "count"))
    {
      v16 = v7;
      goto LABEL_7;
    }
    -[PGFeatureAugmenterMixUp _randomIndicesWithUpperBound:count:](self, "_randomIndicesWithUpperBound:count:", v6, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      break;
    -[PGFeatureAugmenterMixUp alpha](self, "alpha");
    -[PGFeatureAugmenterMixUp alpha](self, "alpha");
    v10 = arc4random();
    objc_msgSend(v5, "objectsAtIndexes:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (double)v10 / 4294967300.0;
    *(float *)&v14 = v14;
    +[PGFeatureAugmenterMixUp mixupOfFloatVector:withFloatVector:lambda:](PGFeatureAugmenterMixUp, "mixupOfFloatVector:withFloatVector:lambda:", v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v15);

  }
  +[PGFeatureAugmenterMixUp _generateError:withCode:andMessage:](PGFeatureAugmenterMixUp, "_generateError:withCode:andMessage:", a4, 0, CFSTR("MixUp requires at least 2 original samples."));
  v16 = 0;
LABEL_7:

  return v16;
}

- (id)_randomIndicesWithUpperBound:(unint64_t)a3 count:(unint64_t)a4
{
  void *v4;
  uint32_t v6;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v4 = 0;
  if (a3)
  {
    v6 = a3;
    if (a3 >= a4)
    {
      if (a3 == a4)
        return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, a3);
      v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v4 = v8;
      if (a4)
      {
        v9 = 0;
        do
        {
          do
            v10 = arc4random_uniform(v6);
          while (objc_msgSend(v4, "containsIndex:", v10));
          objc_msgSend(v4, "addIndex:", v10);
          ++v9;
        }
        while (v9 != a4);
      }
    }
  }
  return v4;
}

- (unint64_t)count
{
  return self->_count;
}

- (float)alpha
{
  return self->_alpha;
}

+ (id)name
{
  return CFSTR("MixUp");
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;
  unsigned int v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[PGFeatureTransformerHelper validParameters:ofTypes:](PGFeatureTransformerHelper, "validParameters:ofTypes:", v5, v6);

  if (v7)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc((Class)objc_opt_class());
    v11 = objc_msgSend(v8, "unsignedIntValue");
    objc_msgSend(v9, "floatValue");
    v12 = (void *)objc_msgSend(v10, "initWithCount:alpha:error:", v11, a4);

  }
  else
  {
    +[PGFeatureAugmenterMixUp _generateError:withCode:andMessage:](PGFeatureAugmenterMixUp, "_generateError:withCode:andMessage:", a4, 2, CFSTR("Failed to instantiate PGFeatureAugmenterMixUp: incorrect parameters."));
    v12 = 0;
  }

  return v12;
}

+ (id)mixupOfFloatVector:(id)a3 withFloatVector:(id)a4 lambda:(float)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  float v13;
  float v14;
  float v15;
  double v16;

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0D42A48]);
  v10 = objc_msgSend(v7, "count");
  if (v10 >= 1)
  {
    v12 = 0;
    LODWORD(v11) = 1.0;
    do
    {
      objc_msgSend(v7, "floatAtIndex:", v12, v11);
      v14 = v13;
      objc_msgSend(v8, "floatAtIndex:", v12);
      *(float *)&v16 = (float)((float)(1.0 - a5) * v15) + (float)(a5 * v14);
      objc_msgSend(v9, "appendFloat:", v16);
      ++v12;
    }
    while (v10 != v12);
  }

  return v9;
}

+ (BOOL)_generateError:(id *)a3 withCode:(int64_t)a4 andMessage:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = v7;
  if (a3)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosGraph.PGFeatureAugmenterMixUp"), a4, v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 1;
}

@end
