@implementation PPSTimeIntervalSet

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return 0;
}

- (PPSTimeIntervalSet)initWithCoalescePolicy:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PPSTimeIntervalSet;
  return -[PPSTimeIntervalSet init](&v4, sel_init, a3);
}

- (PPSTimeIntervalSet)initWithTimeInterval:(id)a3
{
  id v4;
  void *v5;
  PPSTimeIntervalSet *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  +[PPSTimeIntervalCoalescePolicy legacyPolicy](PPSTimeIntervalCoalescePolicy, "legacyPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (PPSTimeIntervalSet *)objc_msgSend(v4, "initWithCoalescePolicy:", v5);

  return v6;
}

- (PPSTimeIntervalSet)initWithTimeInterval:(id)a3 coalescePolicy:(id)a4
{
  id v5;
  PPSTimeIntervalSet *v6;

  v5 = a4;
  v6 = (PPSTimeIntervalSet *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCoalescePolicy:", v5);

  return v6;
}

- (PPSTimeIntervalSet)initWithTimeIntervalSet:(id)a3 coalescePolicy:(id)a4
{
  id v5;
  PPSTimeIntervalSet *v6;

  v5 = a4;
  v6 = (PPSTimeIntervalSet *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCoalescePolicy:", v5);

  return v6;
}

- (unint64_t)count
{
  return 0;
}

- (NSDictionary)dictionary
{
  return 0;
}

- (double)duration
{
  return 0.0;
}

- (double)endTimestamp
{
  return 0.0;
}

- (PPSTimeInterval)firstInterval
{
  return 0;
}

- (PPSTimeInterval)lastInterval
{
  return 0;
}

- (double)startTimestamp
{
  return 0.0;
}

- (double)timeWeightedMean
{
  return 0.0;
}

- (double)timeWeightedSum
{
  return 0.0;
}

- (BOOL)isEqual:(id)a3
{
  return 0;
}

- (id)JSONRepresentation
{
  return 0;
}

- (id)differenceFromIntervalSet:(id)a3
{
  return 0;
}

- (id)filteredIntervalSetUsingPredicate:(id)a3
{
  return 0;
}

- (id)intersectingIntervalForTimeInterval:(id)a3
{
  return 0;
}

- (id)intersectingIntervalForTimestamp:(double)a3
{
  return 0;
}

- (id)intersectionFromIntervalSet:(id)a3
{
  return 0;
}

- (BOOL)intersectsIntervalSet:(id)a3
{
  return 0;
}

- (id)unionWithIntervalSet:(id)a3
{
  return 0;
}

- (PPSTimeIntervalCoalescePolicy)coalescePolicy
{
  return (PPSTimeIntervalCoalescePolicy *)objc_getProperty(self, a2, 16, 1);
}

- (double)maximumValue
{
  return self->_maximumValue;
}

- (double)mean
{
  return self->_mean;
}

- (double)minimumValue
{
  return self->_minimumValue;
}

- (double)sum
{
  return self->_sum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescePolicy, 0);
}

@end
