@implementation _HKSPTimeIntervalProperty

- (void)copyValueFromObject:(id)a3 toObject:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  -[_HKSPTimeIntervalProperty timeIntervalValueForObject:](self, "timeIntervalValueForObject:", a3);
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hksp_setValue:forProperty:", v8, self);

}

- (void)decodeValueForObject:(id)a3 fromCoder:(id)a4
{
  void *v6;
  id v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  v8 = a3;
  -[HKSPProperty identifier](self, "identifier");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decodeDoubleForKey:", v12);
  v10 = v9;

  objc_msgSend(v6, "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hksp_setValue:forProperty:", v11, self);

}

- (void)encodeValueForObject:(id)a3 fromCoder:(id)a4
{
  id v6;
  double v7;
  double v8;
  id v9;

  v6 = a4;
  -[_HKSPTimeIntervalProperty timeIntervalValueForObject:](self, "timeIntervalValueForObject:", a3);
  v8 = v7;
  -[HKSPProperty identifier](self, "identifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeDouble:forKey:", v9, v8);

}

- (double)timeIntervalValueForObject:(id)a3
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a3, "hksp_valueForProperty:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

@end
