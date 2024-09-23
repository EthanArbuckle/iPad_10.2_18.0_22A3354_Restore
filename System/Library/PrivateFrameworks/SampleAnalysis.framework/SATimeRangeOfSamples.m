@implementation SATimeRangeOfSamples

- (SATimeRangeOfSamples)initWithStartTime:(id)a3 endTime:(id)a4 startSampleIndex:(unint64_t)a5 endSampleIndex:(unint64_t)a6
{
  id v11;
  id v12;
  SATimeRangeOfSamples *v13;
  SATimeRangeOfSamples *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SATimeRangeOfSamples;
  v13 = -[SATimeRangeOfSamples init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_startTime, a3);
    objc_storeStrong((id *)&v14->_endTime, a4);
    v14->_startSampleIndex = a5;
    v14->_endSampleIndex = a6;
  }

  return v14;
}

- (id)debugDescription
{
  id v3;
  unint64_t startSampleIndex;
  unint64_t endSampleIndex;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  startSampleIndex = self->_startSampleIndex;
  endSampleIndex = self->_endSampleIndex;
  -[SATimestamp debugDescription](self->_startTime, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SATimestamp debugDescription](self->_endTime, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%lu-%lu %@-%@"), startSampleIndex, endSampleIndex, v6, v7);

  return v8;
}

- (SATimestamp)startTime
{
  return (SATimestamp *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (SATimestamp)endTime
{
  return (SATimestamp *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEndTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)startSampleIndex
{
  return self->_startSampleIndex;
}

- (void)setStartSampleIndex:(unint64_t)a3
{
  self->_startSampleIndex = a3;
}

- (unint64_t)endSampleIndex
{
  return self->_endSampleIndex;
}

- (void)setEndSampleIndex:(unint64_t)a3
{
  self->_endSampleIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
