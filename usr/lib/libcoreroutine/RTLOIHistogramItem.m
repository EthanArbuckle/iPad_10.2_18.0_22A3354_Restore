@implementation RTLOIHistogramItem

- (RTLOIHistogramItem)initWithLocationOfInterest:(id)a3 timeOfStay:(double)a4 andNumOfEvents:(int64_t)a5
{
  id v9;
  RTLOIHistogramItem *v10;
  RTLOIHistogramItem *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RTLOIHistogramItem;
  v10 = -[RTLOIHistogramItem init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_locationOfInterest, a3);
    v11->_timeOfStay = a4;
    v11->_probability = 0.0;
    v11->_numOfEvents = a5;
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[RTLOIHistogramItem locationOfInterest](self, "locationOfInterest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLOIHistogramItem timeOfStay](self, "timeOfStay");
  v6 = v5;
  v7 = -[RTLOIHistogramItem numOfEvents](self, "numOfEvents");
  -[RTLOIHistogramItem probability](self, "probability");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("loi, %@, timeOfStay, %f, numberOfEvents, %ld, probability, %f"), v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (RTLocationOfInterest)locationOfInterest
{
  return self->_locationOfInterest;
}

- (void)setLocationOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_locationOfInterest, a3);
}

- (double)timeOfStay
{
  return self->_timeOfStay;
}

- (void)setTimeOfStay:(double)a3
{
  self->_timeOfStay = a3;
}

- (double)probability
{
  return self->_probability;
}

- (void)setProbability:(double)a3
{
  self->_probability = a3;
}

- (int64_t)numOfEvents
{
  return self->_numOfEvents;
}

- (void)setNumOfEvents:(int64_t)a3
{
  self->_numOfEvents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationOfInterest, 0);
}

@end
