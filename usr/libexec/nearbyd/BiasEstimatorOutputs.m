@implementation BiasEstimatorOutputs

- (BiasEstimatorOutputs)initWithOuputProbabilities:(id)a3 rawRange:(double)a4 correctedRange:(double)a5
{
  id v8;
  BiasEstimatorOutputs *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];

  v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BiasEstimatorOutputs;
  v9 = -[BiasEstimatorOutputs init](&v22, "init");
  if (v9)
  {
    v10 = objc_alloc_init((Class)NSMutableArray);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v11);
          v15 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v14);
          objc_msgSend(v15, "doubleValue", (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v10, "addObject:", v16);

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v12);
    }

    -[BiasEstimatorOutputs setOutProbabilities:](v9, "setOutProbabilities:", v10);
    -[BiasEstimatorOutputs setRawRange:](v9, "setRawRange:", a4);
    -[BiasEstimatorOutputs setCorrectedRange:](v9, "setCorrectedRange:", a5);

  }
  return v9;
}

- (BiasEstimatorOutputs)initWithBiasEstimatorOutputs:(id)a3
{
  id v5;
  BiasEstimatorOutputs *v6;
  void *v7;
  NSArray *v8;
  NSArray *outProbabilities;
  double v10;
  double v11;
  void *v13;
  objc_super v14;

  v5 = a3;
  if (!v5)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UWBSignalFeatures.mm"), 291, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputs"));

  }
  v14.receiver = self;
  v14.super_class = (Class)BiasEstimatorOutputs;
  v6 = -[BiasEstimatorOutputs init](&v14, "init");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "outProbabilities"));
    v8 = (NSArray *)objc_msgSend(v7, "copy");
    outProbabilities = v6->_outProbabilities;
    v6->_outProbabilities = v8;

    objc_msgSend(v5, "rawRange");
    v6->_rawRange = v10;
    objc_msgSend(v5, "correctedRange");
    v6->_correctedRange = v11;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "initWithBiasEstimatorOutputs:", self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_outProbabilities, CFSTR("outputProbabilities"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("rawRange"), self->_rawRange);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("correctedRange"), self->_correctedRange);

}

- (BiasEstimatorOutputs)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BiasEstimatorOutputs *v12;
  BiasEstimatorOutputs *v13;
  objc_super v15;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSNumber, v5), CFSTR("outputProbabilities"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rawRange"));
  v9 = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("correctedRange"));
  v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)BiasEstimatorOutputs;
  v12 = -[BiasEstimatorOutputs init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    -[BiasEstimatorOutputs setOutProbabilities:](v12, "setOutProbabilities:", v7);
    -[BiasEstimatorOutputs setRawRange:](v13, "setRawRange:", v9);
    -[BiasEstimatorOutputs setCorrectedRange:](v13, "setCorrectedRange:", v11);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  BiasEstimatorOutputs *v7;
  BiasEstimatorOutputs *v8;
  double rawRange;
  double v10;
  double v11;
  double correctedRange;
  double v13;
  double v14;
  NSArray *outProbabilities;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  BOOL v19;
  char v20;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (BiasEstimatorOutputs *)v4;
    v8 = v7;
    if (v7 == self)
    {
      v20 = 1;
LABEL_12:

      goto LABEL_13;
    }
    rawRange = self->_rawRange;
    -[BiasEstimatorOutputs rawRange](v7, "rawRange");
    v11 = v10;
    correctedRange = self->_correctedRange;
    -[BiasEstimatorOutputs correctedRange](v8, "correctedRange");
    v14 = v13;
    outProbabilities = self->_outProbabilities;
    if (!outProbabilities)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BiasEstimatorOutputs outProbabilities](v8, "outProbabilities"));

      if (!v16)
      {
        v18 = 1;
        goto LABEL_7;
      }
      outProbabilities = self->_outProbabilities;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BiasEstimatorOutputs outProbabilities](v8, "outProbabilities"));
    v18 = -[NSArray isEqualToArray:](outProbabilities, "isEqualToArray:", v17);

LABEL_7:
    v19 = rawRange == v11;
    if (correctedRange != v14)
      v19 = 0;
    v20 = v19 & v18;
    goto LABEL_12;
  }
  v20 = 0;
LABEL_13:

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_rawRange));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_correctedRange));
  v6 = (unint64_t)objc_msgSend(v5, "hash");
  v7 = v6 ^ v4 ^ (unint64_t)-[NSArray hash](self->_outProbabilities, "hash");

  return v7;
}

- (id)description
{
  id v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v8;
  unint64_t i;
  void *v10;
  uint64_t v11;
  double correctedRange;
  double rawRange;

  v3 = objc_alloc((Class)NSMutableString);
  v5 = (objc_class *)objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v7);

  for (i = 0; -[NSArray count](self->_outProbabilities, "count") > i; ++i)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_outProbabilities, "objectAtIndex:", i));
    objc_msgSend(v10, "doubleValue");
    objc_msgSend(v8, "appendFormat:", CFSTR(" out_prob_%d: %.6f,"), i, v11);

  }
  rawRange = self->_rawRange;
  correctedRange = self->_correctedRange;
  objc_msgSend(v8, "appendFormat:", CFSTR(" rawRange: %.3f,"), *(_QWORD *)&rawRange);
  objc_msgSend(v8, "appendFormat:", CFSTR(" bias_correction_estimate: %.3f,"), correctedRange - rawRange);
  objc_msgSend(v8, "appendFormat:", CFSTR(" correctedRange: %.3f>"), *(_QWORD *)&self->_correctedRange);
  return v8;
}

- (id)populateOrderedBiasEstimatorOutputs
{
  id v3;
  unint64_t i;
  void *v5;
  uint64_t v6;

  v3 = objc_alloc_init((Class)NSMutableString);
  for (i = 0; -[NSArray count](self->_outProbabilities, "count") > i; ++i)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndex:](self->_outProbabilities, "objectAtIndex:", i));
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v3, "appendFormat:", CFSTR(" %.6f, "), v6);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(" %.3f, %.3f, %.3f"), *(_QWORD *)&self->_rawRange, self->_correctedRange - self->_rawRange, *(_QWORD *)&self->_correctedRange);
  return v3;
}

- (NSArray)outProbabilities
{
  return self->_outProbabilities;
}

- (void)setOutProbabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)rawRange
{
  return self->_rawRange;
}

- (void)setRawRange:(double)a3
{
  self->_rawRange = a3;
}

- (double)correctedRange
{
  return self->_correctedRange;
}

- (void)setCorrectedRange:(double)a3
{
  self->_correctedRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outProbabilities, 0);
}

@end
