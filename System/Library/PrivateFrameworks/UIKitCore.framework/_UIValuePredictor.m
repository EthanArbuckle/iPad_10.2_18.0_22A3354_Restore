@implementation _UIValuePredictor

- (_UIValuePredictor)initWithNumPredictions:(unint64_t)a3 numDerivatives:(unint64_t)a4
{
  _UIValuePredictor *v6;
  _UIValuePredictor *v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIValuePredictor;
  v6 = -[_UIValuePredictor init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v8 = 8;
    if (a3 < 8)
      v8 = a3;
    v6->_numPredictions = v8;
    v6->_numDerivatives = a4;
    v6->_arrayCapacity = a4 + 7;
    -[_UIValuePredictor _setupDefaults](v6, "_setupDefaults");
    -[_UIValuePredictor _ensureCapacity:](v7, "_ensureCapacity:", v7->_arrayCapacity);
  }
  return v7;
}

- (_UIValuePredictor)init
{
  return -[_UIValuePredictor initWithNumPredictions:numDerivatives:](self, "initWithNumPredictions:numDerivatives:", 4, 4);
}

- (id)initFromValuePredictor:(id)a3
{
  _QWORD *v4;
  _UIValuePredictor *v5;
  size_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UIValuePredictor;
  v5 = -[_UIValuePredictor init](&v16, sel_init);
  if (v5)
  {
    v5->_numValues = objc_msgSend(v4, "numValues");
    v5->_numPredictions = objc_msgSend(v4, "numPredictions");
    v5->_numDerivatives = objc_msgSend(v4, "numDerivatives");
    v5->_arrayCapacity = v4[2];
    -[_UIValuePredictor _ensureCapacity:](v5, "_ensureCapacity:");
    v6 = 8 * v5->_numValues;
    memcpy(v5->_values, (const void *)objc_msgSend(v4, "_valuesAtIndex:", 0), v6);
    memcpy(v5->_valueWeights, (const void *)objc_msgSend(v4, "_valueWeightsAtIndex:", 0), v6);
    memcpy(v5->_predictions, (const void *)objc_msgSend(v4, "_predictionsAtIndex:", 0), v5->_numPredictions * v6);
    memcpy(v5->_confidenceFactors, (const void *)objc_msgSend(v4, "_confidenceFactorsAtIndex:", 0), v5->_numPredictions * v6);
    memcpy(v5->_confidenceFactorsForVelocity, (const void *)objc_msgSend(v4, "_confidenceFactorsForVelocityAtIndex:", 0), v5->_numPredictions * v6);
    memcpy(v5->_confidenceFactorsForHistoricalAccuracy, (const void *)objc_msgSend(v4, "_confidenceFactorsForHistoricalAccuracyAtIndex:", 0), v5->_numPredictions * v6);
    memcpy(v5->_confidenceFactorsForDerivativeStability, (const void *)objc_msgSend(v4, "_confidenceFactorsForDerivativeStabilityAtIndex:", 0), v5->_numPredictions * v6);
    if (v5->_numDerivatives)
    {
      v7 = 0;
      do
      {
        memcpy(v5->_derivatives[v7], *(const void **)(objc_msgSend(v4, "_derivatives") + 8 * v7), 8 * v5->_capacity);
        ++v7;
      }
      while (v7 < v5->_numDerivatives);
    }
    objc_msgSend(v4, "minHistoricalAccuracyThreshold");
    v5->_minHistoricalAccuracyThreshold = v8;
    objc_msgSend(v4, "maxHistoricalAccuracyThreshold");
    v5->_maxHistoricalAccuracyThreshold = v9;
    objc_msgSend(v4, "derivativeStabilityThreshold");
    v5->_derivativeStabilityThreshold = v10;
    objc_msgSend(v4, "minVelocityThreshold");
    v5->_minVelocityThreshold = v11;
    objc_msgSend(v4, "maxVelocityThreshold");
    v5->_maxVelocityThreshold = v12;
    objc_msgSend(v4, "minConstraint");
    v5->_minConstraint = v13;
    objc_msgSend(v4, "maxConstraint");
    v5->_maxConstraint = v14;
    v5->_wrapConstraint = objc_msgSend(v4, "wrapConstraint");
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initFromValuePredictor:", self);
}

- (void)dealloc
{
  unint64_t v3;
  objc_super v4;

  free(self->_values);
  self->_values = 0;
  free(self->_valueWeights);
  self->_valueWeights = 0;
  free(self->_predictions);
  self->_predictions = 0;
  free(self->_confidenceFactorsForVelocity);
  self->_confidenceFactorsForVelocity = 0;
  free(self->_confidenceFactorsForHistoricalAccuracy);
  self->_confidenceFactorsForHistoricalAccuracy = 0;
  free(self->_confidenceFactorsForDerivativeStability);
  self->_confidenceFactorsForDerivativeStability = 0;
  free(self->_confidenceFactors);
  self->_confidenceFactors = 0;
  if (self->_numDerivatives)
  {
    v3 = 0;
    do
      free(self->_derivatives[v3++]);
    while (v3 < self->_numDerivatives);
  }
  free(self->_derivatives);
  v4.receiver = self;
  v4.super_class = (Class)_UIValuePredictor;
  -[_UIValuePredictor dealloc](&v4, sel_dealloc);
}

- (double)_valuesAtIndex:(unint64_t)a3
{
  return &self->_values[a3];
}

- (double)_valueWeightsAtIndex:(unint64_t)a3
{
  return &self->_valueWeights[a3];
}

- (double)_predictionsAtIndex:(unint64_t)a3
{
  return &self->_predictions[self->_numPredictions * a3];
}

- (double)_confidenceFactorsForVelocityAtIndex:(unint64_t)a3
{
  return &self->_confidenceFactorsForVelocity[self->_numPredictions * a3];
}

- (double)_confidenceFactorsForHistoricalAccuracyAtIndex:(unint64_t)a3
{
  return &self->_confidenceFactorsForHistoricalAccuracy[self->_numPredictions * a3];
}

- (double)_confidenceFactorsForDerivativeStabilityAtIndex:(unint64_t)a3
{
  return &self->_confidenceFactorsForDerivativeStability[self->_numPredictions * a3];
}

- (double)_confidenceFactorsAtIndex:(unint64_t)a3
{
  return &self->_confidenceFactors[self->_numPredictions * a3];
}

- (double)_derivatives
{
  return self->_derivatives;
}

- (double)_constrainPrediction:(double)a3
{
  double minConstraint;
  double maxConstraint;
  double v5;
  double v6;
  double result;

  minConstraint = self->_minConstraint;
  maxConstraint = self->_maxConstraint;
  if (self->_wrapConstraint)
  {
    if (minConstraint <= maxConstraint)
      v5 = self->_maxConstraint;
    else
      v5 = self->_minConstraint;
    if (minConstraint <= maxConstraint)
      v6 = self->_minConstraint;
    else
      v6 = self->_maxConstraint;
    if (v5 - v6 == 0.0)
    {
      v6 = v5;
      goto LABEL_13;
    }
    a3 = a3 - (v5 - v6) * floor((a3 - v6) / (v5 - v6));
    if (vabdd_f64(a3, v6) < 0.001 || vabdd_f64(a3, v5) < 0.001)
      goto LABEL_13;
  }
  v6 = a3;
LABEL_13:
  if (v6 >= maxConstraint)
    result = self->_maxConstraint;
  else
    result = v6;
  if (minConstraint >= result)
    return self->_minConstraint;
  return result;
}

- (void)_setupDefaults
{
  *(_OWORD *)&self->_minHistoricalAccuracyThreshold = xmmword_18666F250;
  *(_OWORD *)&self->_derivativeStabilityThreshold = xmmword_1866800C0;
  *(_OWORD *)&self->_maxVelocityThreshold = xmmword_186682E30;
  self->_maxConstraint = NAN;
}

- (void)_ensureCapacity:(unint64_t)arrayCapacity
{
  size_t v4;
  unint64_t numDerivatives;
  unint64_t i;
  unint64_t numValues;
  unint64_t capacity;
  unint64_t numPredictions;
  double *values;
  double *valueWeights;
  unint64_t v12;
  uint64_t v13;
  double *v14;
  double *v15;
  double *v16;
  double *v17;
  double *v18;
  double **derivatives;
  unint64_t v20;
  uint64_t v21;

  if (!arrayCapacity)
    arrayCapacity = self->_arrayCapacity;
  if (arrayCapacity >= self->_capacity)
  {
    self->_capacity = arrayCapacity;
    v4 = 8 * arrayCapacity;
    self->_values = (double *)malloc_type_realloc(self->_values, 8 * arrayCapacity, 0x100004000313F17uLL);
    self->_valueWeights = (double *)malloc_type_realloc(self->_valueWeights, v4, 0x100004000313F17uLL);
    self->_predictions = (double *)malloc_type_realloc(self->_predictions, self->_numPredictions * v4, 0xE68B1D91uLL);
    self->_confidenceFactorsForVelocity = (double *)malloc_type_realloc(self->_confidenceFactorsForVelocity, self->_numPredictions * v4, 0x8A998C67uLL);
    self->_confidenceFactorsForHistoricalAccuracy = (double *)malloc_type_realloc(self->_confidenceFactorsForHistoricalAccuracy, self->_numPredictions * v4, 0x926A1593uLL);
    self->_confidenceFactorsForDerivativeStability = (double *)malloc_type_realloc(self->_confidenceFactorsForDerivativeStability, self->_numPredictions * v4, 0x3610E5C9uLL);
    self->_confidenceFactors = (double *)malloc_type_realloc(self->_confidenceFactors, self->_numPredictions * v4, 0x15A6E668uLL);
    if (!self->_derivatives)
      self->_derivatives = (double **)malloc_type_calloc(self->_numDerivatives, 8uLL, 0x80040B8603338uLL);
    numDerivatives = self->_numDerivatives;
    if (numDerivatives)
    {
      for (i = 0; i < numDerivatives; ++i)
      {
        self->_derivatives[i] = (double *)malloc_type_realloc(self->_derivatives[i], v4, 0x100004000313F17uLL);
        numDerivatives = self->_numDerivatives;
      }
    }
    numValues = self->_numValues;
    capacity = self->_capacity;
    if (numValues < capacity)
    {
      numPredictions = self->_numPredictions;
      values = self->_values;
      valueWeights = self->_valueWeights;
      v12 = numValues * numPredictions;
      do
      {
        values[numValues] = NAN;
        valueWeights[numValues] = 1.0;
        if (numPredictions)
        {
          v13 = 0;
          v14 = &self->_confidenceFactors[v12];
          v15 = &self->_confidenceFactorsForDerivativeStability[v12];
          v16 = &self->_confidenceFactorsForHistoricalAccuracy[v12];
          v17 = &self->_confidenceFactorsForVelocity[v12];
          v18 = &self->_predictions[v12];
          do
          {
            v18[v13] = NAN;
            v17[v13] = 0.0;
            v16[v13] = 0.0;
            v15[v13] = 0.0;
            v14[v13++] = 0.0;
          }
          while (numPredictions != v13);
        }
        if (numDerivatives)
        {
          derivatives = self->_derivatives;
          v20 = numDerivatives;
          do
          {
            v21 = (uint64_t)*derivatives++;
            *(_QWORD *)(v21 + 8 * numValues) = 0x7FF8000000000000;
            --v20;
          }
          while (v20);
        }
        ++numValues;
        v12 += numPredictions;
      }
      while (numValues != capacity);
    }
  }
}

- (void)_slideDataWindow
{
  unint64_t v3;
  size_t v4;
  unint64_t v5;
  double *v6;

  v3 = self->_numValues - 1;
  self->_numValues = v3;
  v4 = 8 * v3;
  memmove(-[_UIValuePredictor _valuesAtIndex:](self, "_valuesAtIndex:", 0), -[_UIValuePredictor _valuesAtIndex:](self, "_valuesAtIndex:", 1), 8 * v3);
  memmove(-[_UIValuePredictor _valueWeightsAtIndex:](self, "_valueWeightsAtIndex:", 0), -[_UIValuePredictor _valueWeightsAtIndex:](self, "_valueWeightsAtIndex:", 1), v4);
  memmove(-[_UIValuePredictor _predictionsAtIndex:](self, "_predictionsAtIndex:", 0), -[_UIValuePredictor _predictionsAtIndex:](self, "_predictionsAtIndex:", 1), self->_numPredictions * v4);
  memmove(-[_UIValuePredictor _confidenceFactorsAtIndex:](self, "_confidenceFactorsAtIndex:", 0), -[_UIValuePredictor _confidenceFactorsAtIndex:](self, "_confidenceFactorsAtIndex:", 1), self->_numPredictions * v4);
  memmove(-[_UIValuePredictor _confidenceFactorsForVelocityAtIndex:](self, "_confidenceFactorsForVelocityAtIndex:", 0), -[_UIValuePredictor _confidenceFactorsForVelocityAtIndex:](self, "_confidenceFactorsForVelocityAtIndex:", 1), self->_numPredictions * v4);
  memmove(-[_UIValuePredictor _confidenceFactorsForHistoricalAccuracyAtIndex:](self, "_confidenceFactorsForHistoricalAccuracyAtIndex:", 0), -[_UIValuePredictor _confidenceFactorsForHistoricalAccuracyAtIndex:](self, "_confidenceFactorsForHistoricalAccuracyAtIndex:", 1), self->_numPredictions * v4);
  memmove(-[_UIValuePredictor _confidenceFactorsForDerivativeStabilityAtIndex:](self, "_confidenceFactorsForDerivativeStabilityAtIndex:", 0), -[_UIValuePredictor _confidenceFactorsForDerivativeStabilityAtIndex:](self, "_confidenceFactorsForDerivativeStabilityAtIndex:", 1), self->_numPredictions * v4);
  if (self->_numDerivatives)
  {
    v5 = 0;
    do
    {
      v6 = self->_derivatives[v5];
      memmove(v6, v6 + 1, 8 * self->_arrayCapacity - 8);
      ++v5;
    }
    while (v5 < self->_numDerivatives);
  }
}

- (void)_updateDerivatives:(double *)a3 fromArray:(double *)a4 weights:(double *)a5 atIndex:(int64_t)a6 wrap:(BOOL)a7
{
  uint64_t v7;
  double v8;
  double v9;
  double *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v7 = 0;
  a3[a6] = NAN;
  v8 = 0.0;
  v9 = 0.0;
  v10 = &a4[a6];
  do
  {
    if (a6 + v7 >= 1)
    {
      v11 = (double)(v7 + 7) * (double)(v7 + 7);
      if (a5)
        v11 = v11 * a5[a6 + v7];
      v12 = *v10 - *(v10 - 1);
      if (a7)
      {
        v13 = self->_maxConstraint - self->_minConstraint;
        v14 = fabs(v12);
        v15 = v13 * 0.5;
        v16 = v12 - v13;
        v17 = v12 + v13;
        if (v12 >= 0.0)
          v17 = v16;
        if (v14 > v15)
          v12 = v17;
      }
      v9 = v9 + v11 * v12;
      v8 = v8 + v11;
    }
    --v7;
    --v10;
  }
  while (v7 != -7);
  if (v8 != 0.0)
    a3[a6] = v9 / v8;
}

- (void)_propagateDerivatives:(double *)a3 fromHigherDerivatives:(double *)a4 atIndex:(int64_t)a5
{
  int64_t v5;
  int64_t v6;
  double *v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  unint64_t v15;
  void *v16;

  v5 = a5 + 1;
  if (a5 + 1 < self->_numPredictions + a5 + 1)
  {
    v6 = a5;
    v11 = a4 + 1;
    v12 = 0x1E0CB3000uLL;
    do
    {
      v13 = v6 + 1;
      if (v6 < -1 || v13 >= self->_capacity)
      {
        objc_msgSend(*(id *)(v12 + 1160), "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIValuePredictor.m"), 316, CFSTR("Index out of bounds"));

        v12 = 0x1E0CB3000;
        if (v6 < 0)
        {
LABEL_11:
          v14 = NAN;
LABEL_12:
          a3[v6 + 1] = v14;
          goto LABEL_13;
        }
      }
      else if (v6 < 0)
      {
        goto LABEL_11;
      }
      if (v13 < self->_capacity)
      {
        if (a4)
          v14 = v11[v6] + a3[v6];
        else
          v14 = a3[v6];
        goto LABEL_12;
      }
LABEL_13:
      v15 = v6 + 2;
      ++v6;
    }
    while (v15 < self->_numPredictions + v5);
  }
}

- (void)_updateConfidenceFactorsForVelocityAtIndex:(int64_t)a3
{
  double *v5;
  double *v6;
  double *v7;
  unint64_t numPredictions;
  uint64_t v9;
  double *v10;
  double *v11;
  double v12;

  v5 = -[_UIValuePredictor _confidenceFactorsForVelocityAtIndex:](self, "_confidenceFactorsForVelocityAtIndex:");
  v6 = -[_UIValuePredictor _valuesAtIndex:](self, "_valuesAtIndex:", a3);
  v7 = -[_UIValuePredictor _predictionsAtIndex:](self, "_predictionsAtIndex:", a3);
  numPredictions = self->_numPredictions;
  if (numPredictions)
  {
    v9 = 0;
    v10 = v7 - 1;
    do
    {
      if (v9)
        v11 = v10;
      else
        v11 = v6;
      v12 = (fabs(v10[1] - *v11) - self->_minVelocityThreshold)
          / (self->_maxVelocityThreshold - self->_minVelocityThreshold);
      if (v12 > 1.0)
        v12 = 1.0;
      v5[v9++] = fmax(v12, 0.0);
      ++v10;
    }
    while (numPredictions != v9);
  }
}

- (void)_getPriorPredictions:(double *)a3 forValueAtIndex:(int)a4
{
  unint64_t numPredictions;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;

  numPredictions = self->_numPredictions;
  if (numPredictions)
  {
    v7 = 0;
    v8 = a4;
    v9 = a4 - 1;
    do
    {
      a3[v7] = NAN;
      if ((uint64_t)v7 < v8)
      {
        a3[v7] = -[_UIValuePredictor _predictionsAtIndex:](self, "_predictionsAtIndex:", v9)[8 * v7];
        numPredictions = self->_numPredictions;
      }
      ++v7;
      --v9;
    }
    while (v7 < numPredictions);
  }
}

- (void)_updateConfidenceFactorsForHistoricalAccuracyAtIndex:(int)a3
{
  uint64_t v3;
  unint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  unint64_t numPredictions;
  uint64_t v9;
  _BYTE *v10;
  _BYTE *v11;
  double v12;
  uint64_t i;
  uint64_t v14;
  double *v15;
  double v16;
  double *v17;
  unint64_t v18;
  double v19;
  double v20;
  long double v21;
  double *v22;
  unint64_t v23;
  double *v24;
  double v25;
  double minHistoricalAccuracyThreshold;
  double v27;
  double maxHistoricalAccuracyThreshold;
  double v29[8];
  _BYTE v30[512];
  _BYTE v31[512];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a3 >= 1)
  {
    LODWORD(v3) = a3;
    if (!self->_numPredictions)
      goto LABEL_18;
    v5 = 0;
    v6 = v31;
    v7 = *(_QWORD *)&a3;
    do
    {
      -[_UIValuePredictor _getPriorPredictions:forValueAtIndex:](self, "_getPriorPredictions:forValueAtIndex:", v6, v7);
      ++v5;
      numPredictions = self->_numPredictions;
      v7 = (v7 - 1);
      v6 += 64;
    }
    while (v5 < numPredictions);
    if (numPredictions)
    {
      v9 = 0;
      v10 = v30;
      v11 = v31;
      v3 = v3;
      do
      {
        if (v3 - v9 < 0)
          v12 = NAN;
        else
          v12 = self->_values[v3 - v9];
        for (i = 0; i != numPredictions; ++i)
          *(double *)&v10[8 * i] = vabdd_f64(v12, *(double *)&v11[8 * i]);
        ++v9;
        v10 += 64;
        v11 += 64;
      }
      while (v9 != numPredictions);
      v14 = 0;
      v15 = (double *)v30;
      do
      {
        v16 = 0.0;
        v17 = v15;
        v18 = numPredictions;
        v19 = 0.0;
        do
        {
          v20 = *v17;
          v21 = pow((double)v18, 1.1);
          v19 = v19 + v21 * v20;
          v16 = v16 + v21;
          v17 += 8;
          --v18;
        }
        while (v18);
        v29[v14++] = v19 / v16;
        ++v15;
      }
      while (v14 != numPredictions);
    }
    else
    {
LABEL_18:
      v3 = v3;
    }
    v22 = -[_UIValuePredictor _confidenceFactorsForHistoricalAccuracyAtIndex:](self, "_confidenceFactorsForHistoricalAccuracyAtIndex:", v3);
    v23 = self->_numPredictions;
    if (v23)
    {
      v24 = v29;
      do
      {
        v25 = *v24;
        minHistoricalAccuracyThreshold = self->_minHistoricalAccuracyThreshold;
        v27 = 1.0;
        if (*v24 <= minHistoricalAccuracyThreshold
          || (maxHistoricalAccuracyThreshold = self->_maxHistoricalAccuracyThreshold,
              v27 = 0.0,
              v25 >= maxHistoricalAccuracyThreshold))
        {
          *v22 = v27;
        }
        else
        {
          *v22 = 1.0
               - (v25 - minHistoricalAccuracyThreshold)
               / (maxHistoricalAccuracyThreshold - minHistoricalAccuracyThreshold);
        }
        ++v22;
        ++v24;
        --v23;
      }
      while (v23);
    }
  }
}

- (void)_updateConfidenceFactorsForDerivativeStabilityAtIndex:(int)a3
{
  uint64_t v4;
  double *v5;
  unint64_t numPredictions;
  double v7;
  double *v8;
  double v9;
  double derivativeStabilityThreshold;
  double v11;

  v4 = a3;
  v5 = -[_UIValuePredictor _confidenceFactorsForDerivativeStabilityAtIndex:](self, "_confidenceFactorsForDerivativeStabilityAtIndex:", a3);
  numPredictions = self->_numPredictions;
  if (numPredictions)
  {
    v7 = 1.0;
    do
    {
      if (v4 >= 1)
      {
        v8 = &self->_derivatives[self->_numDerivatives - 1][v4];
        v9 = vabdd_f64(*v8, *(v8 - 1));
        derivativeStabilityThreshold = self->_derivativeStabilityThreshold;
        v11 = 0.0;
        if (v9 < derivativeStabilityThreshold)
        {
          v11 = v7 * ((derivativeStabilityThreshold - v9) / derivativeStabilityThreshold);
          v7 = v11;
        }
        *v5 = v11;
      }
      ++v5;
      --v4;
      --numPredictions;
    }
    while (numPredictions);
  }
}

- (void)_updateConfidenceFactorsAtIndex:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  double *v6;
  double *v7;
  double *v8;
  unint64_t i;

  v3 = *(_QWORD *)&a3;
  v5 = a3;
  -[_UIValuePredictor _updateConfidenceFactorsForVelocityAtIndex:](self, "_updateConfidenceFactorsForVelocityAtIndex:", a3);
  -[_UIValuePredictor _updateConfidenceFactorsForHistoricalAccuracyAtIndex:](self, "_updateConfidenceFactorsForHistoricalAccuracyAtIndex:", v3);
  -[_UIValuePredictor _updateConfidenceFactorsForDerivativeStabilityAtIndex:](self, "_updateConfidenceFactorsForDerivativeStabilityAtIndex:", v3);
  v6 = -[_UIValuePredictor _confidenceFactorsForHistoricalAccuracyAtIndex:](self, "_confidenceFactorsForHistoricalAccuracyAtIndex:", v5);
  v7 = -[_UIValuePredictor _confidenceFactorsForDerivativeStabilityAtIndex:](self, "_confidenceFactorsForDerivativeStabilityAtIndex:", v5);
  v8 = -[_UIValuePredictor _confidenceFactorsAtIndex:](self, "_confidenceFactorsAtIndex:", v5);
  for (i = self->_numPredictions; i; --i)
  {
    *v8 = 0.0;
    *v8 = (*v6 + *v6 + *v7++) / 3.0;
    ++v6;
    ++v8;
  }
}

- (void)_updatePredictionsAtIndex:(int64_t)a3
{
  unint64_t numDerivatives;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t numPredictions;
  uint64_t v10;
  int64_t v11;
  double v12;
  unint64_t v13;

  -[_UIValuePredictor _updateDerivatives:fromArray:weights:atIndex:wrap:](self, "_updateDerivatives:fromArray:weights:atIndex:wrap:", *self->_derivatives, self->_values, self->_valueWeights, a3, self->_wrapConstraint);
  numDerivatives = self->_numDerivatives;
  if (numDerivatives >= 2)
  {
    v6 = 0;
    do
    {
      -[_UIValuePredictor _updateDerivatives:fromArray:weights:atIndex:wrap:](self, "_updateDerivatives:fromArray:weights:atIndex:wrap:", self->_derivatives[v6 + 1], self->_derivatives[v6], 0, a3, 0);
      numDerivatives = self->_numDerivatives;
      v7 = v6 + 2;
      ++v6;
    }
    while (v7 < numDerivatives);
  }
  -[_UIValuePredictor _propagateDerivatives:fromHigherDerivatives:atIndex:](self, "_propagateDerivatives:fromHigherDerivatives:atIndex:", self->_derivatives[numDerivatives - 1], 0, a3);
  v8 = self->_numDerivatives;
  if ((uint64_t)(v8 - 2) >= 0)
  {
    do
    {
      -[_UIValuePredictor _propagateDerivatives:fromHigherDerivatives:atIndex:](self, "_propagateDerivatives:fromHigherDerivatives:atIndex:", self->_derivatives[v8 - 2], self->_derivatives[v8 - 1], a3);
      --v8;
    }
    while (v8 != 1);
  }
  numPredictions = self->_numPredictions;
  if (numPredictions)
  {
    v10 = -1;
    v11 = a3;
    do
    {
      if (a3 <= 0)
      {
        self->_predictions[v11 * numPredictions] = NAN;
      }
      else
      {
        -[_UIValuePredictor _constrainPrediction:](self, "_constrainPrediction:", (*self->_derivatives)[v11 + 1] + self->_values[v11]);
        numPredictions = self->_numPredictions;
        self->_predictions[v10 + 1 + numPredictions * a3] = v12;
      }
      v13 = v10 + 2;
      ++v10;
      ++v11;
    }
    while (v13 < numPredictions);
  }
  -[_UIValuePredictor _updateConfidenceFactorsAtIndex:](self, "_updateConfidenceFactorsAtIndex:", a3);
}

- (void)addValue:(double)a3 weight:(double)a4
{
  unint64_t numValues;
  double *values;

  -[_UIValuePredictor _ensureCapacity:](self, "_ensureCapacity:", self->_capacity);
  numValues = self->_numValues;
  if (numValues >= self->_arrayCapacity - self->_numDerivatives)
  {
    -[_UIValuePredictor _slideDataWindow](self, "_slideDataWindow");
    numValues = self->_numValues;
  }
  values = self->_values;
  self->_valueWeights[numValues] = a4;
  self->_numValues = numValues + 1;
  values[numValues] = a3;
  -[_UIValuePredictor _updatePredictionsAtIndex:](self, "_updatePredictionsAtIndex:");
}

- (double)predictions
{
  return &self->_predictions[self->_numPredictions * self->_numValues];
}

- (double)confidenceFactors
{
  return &self->_confidenceFactors[self->_numPredictions * self->_numValues];
}

- (id)descriptionFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4 includeHeader:(BOOL)a5 includeDetailedConfidence:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  double *v15;
  double *v16;
  double *v17;
  double *v18;
  double *v19;
  double *v20;
  unint64_t v21;
  double v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;

  v6 = a6;
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v7)
  {
    objc_msgSend(v11, "appendString:", CFSTR("  #"));
    objc_msgSend(v12, "appendString:", CFSTR("        v"));
    if (self->_numPredictions)
    {
      v13 = 0;
      do
      {
        if (v6)
          objc_msgSend(v12, "appendFormat:", CFSTR("       p%d   c%d  cv%d  ch%d  cd%d"), v13, v13, v13, v13, v13);
        else
          objc_msgSend(v12, "appendFormat:", CFSTR("       p%d   c%d"), v13, v13, v25, v26, v27);
        ++v13;
      }
      while (self->_numPredictions > v13);
    }
    if (self->_numDerivatives)
    {
      v14 = 0;
      do
        objc_msgSend(v12, "appendFormat:", CFSTR("        d%d"), ++v14);
      while (self->_numDerivatives > v14);
    }
    objc_msgSend(v12, "appendString:", CFSTR("\n"));
  }
  if (a3 <= a4)
  {
    v28 = a4;
    do
    {
      if ((a3 & 0x8000000000000000) == 0 && a3 < self->_numValues + self->_numDerivatives - 1)
      {
        objc_msgSend(v12, "appendFormat:", CFSTR("%3ld "), a3);
        objc_msgSend(v12, "appendFormat:", CFSTR("%8.2f "), *(_QWORD *)&self->_values[a3]);
        v15 = -[_UIValuePredictor _predictionsAtIndex:](self, "_predictionsAtIndex:", a3);
        v16 = -[_UIValuePredictor _confidenceFactorsAtIndex:](self, "_confidenceFactorsAtIndex:", a3);
        v17 = -[_UIValuePredictor _confidenceFactorsForVelocityAtIndex:](self, "_confidenceFactorsForVelocityAtIndex:", a3);
        v18 = -[_UIValuePredictor _confidenceFactorsForHistoricalAccuracyAtIndex:](self, "_confidenceFactorsForHistoricalAccuracyAtIndex:", a3);
        v19 = -[_UIValuePredictor _confidenceFactorsForDerivativeStabilityAtIndex:](self, "_confidenceFactorsForDerivativeStabilityAtIndex:", a3);
        if (self->_numPredictions)
        {
          v20 = v19;
          v21 = 0;
          do
          {
            v22 = v16[v21];
            if (v6)
              objc_msgSend(v12, "appendFormat:", CFSTR("%8.2f(%4.2f,%4.2f,%4.2f,%4.2f)"), *(_QWORD *)&v15[v21], *(_QWORD *)&v22, *(_QWORD *)&v17[v21], *(_QWORD *)&v18[v21], *(_QWORD *)&v20[v21]);
            else
              objc_msgSend(v12, "appendFormat:", CFSTR("%8.2f(%4.2f)"), *(_QWORD *)&v15[v21], *(_QWORD *)&v22, v25, v26, v27);
            ++v21;
          }
          while (v21 < self->_numPredictions);
        }
        a4 = v28;
        if (self->_numDerivatives)
        {
          v23 = 0;
          do
            objc_msgSend(v12, "appendFormat:", CFSTR("%9.3f "), *(_QWORD *)&self->_derivatives[v23++][a3]);
          while (v23 < self->_numDerivatives);
        }
      }
      objc_msgSend(v12, "appendString:", CFSTR("\n"));
      ++a3;
    }
    while (a3 <= a4);
  }
  return v12;
}

- (id)description
{
  return -[_UIValuePredictor descriptionFromIndex:toIndex:includeHeader:includeDetailedConfidence:](self, "descriptionFromIndex:toIndex:includeHeader:includeDetailedConfidence:", 0, self->_numValues + self->_numDerivatives - 1, 1, 1);
}

- (double)minHistoricalAccuracyThreshold
{
  return self->_minHistoricalAccuracyThreshold;
}

- (void)setMinHistoricalAccuracyThreshold:(double)a3
{
  self->_minHistoricalAccuracyThreshold = a3;
}

- (double)maxHistoricalAccuracyThreshold
{
  return self->_maxHistoricalAccuracyThreshold;
}

- (void)setMaxHistoricalAccuracyThreshold:(double)a3
{
  self->_maxHistoricalAccuracyThreshold = a3;
}

- (double)derivativeStabilityThreshold
{
  return self->_derivativeStabilityThreshold;
}

- (void)setDerivativeStabilityThreshold:(double)a3
{
  self->_derivativeStabilityThreshold = a3;
}

- (double)minVelocityThreshold
{
  return self->_minVelocityThreshold;
}

- (void)setMinVelocityThreshold:(double)a3
{
  self->_minVelocityThreshold = a3;
}

- (double)maxVelocityThreshold
{
  return self->_maxVelocityThreshold;
}

- (void)setMaxVelocityThreshold:(double)a3
{
  self->_maxVelocityThreshold = a3;
}

- (double)minConstraint
{
  return self->_minConstraint;
}

- (void)setMinConstraint:(double)a3
{
  self->_minConstraint = a3;
}

- (double)maxConstraint
{
  return self->_maxConstraint;
}

- (void)setMaxConstraint:(double)a3
{
  self->_maxConstraint = a3;
}

- (BOOL)wrapConstraint
{
  return self->_wrapConstraint;
}

- (void)setWrapConstraint:(BOOL)a3
{
  self->_wrapConstraint = a3;
}

- (unint64_t)numValues
{
  return self->_numValues;
}

- (unint64_t)numPredictions
{
  return self->_numPredictions;
}

- (unint64_t)numDerivatives
{
  return self->_numDerivatives;
}

@end
