@implementation MOEventStateOfMind

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double reflectiveInterval;
  id v5;

  reflectiveInterval = self->_reflectiveInterval;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("reflectiveInterval"), reflectiveInterval);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("valence"), self->_valence);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("valenceClassification"), self->_valenceClassification);
  objc_msgSend(v5, "encodeObject:forKey:", self->_labels, CFSTR("labels"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domains, CFSTR("domains"));

}

- (MOEventStateOfMind)initWithCoder:(id)a3
{
  id v4;
  MOEventStateOfMind *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSArray *labels;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  NSArray *domains;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MOEventStateOfMind;
  v5 = -[MOEventStateOfMind init](&v26, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("reflectiveInterval"));
    v5->_reflectiveInterval = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("valence"));
    v5->_valence = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("valenceClassification"));
    v5->_valenceClassification = v8;
    v9 = objc_autoreleasePoolPush();
    v10 = objc_alloc((Class)NSSet);
    v12 = objc_opt_class(NSArray, v11);
    v14 = objc_msgSend(v10, "initWithObjects:", v12, objc_opt_class(NSNumber, v13), 0);
    objc_autoreleasePoolPop(v9);
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("labels")));
    labels = v5->_labels;
    v5->_labels = (NSArray *)v15;

    v17 = objc_autoreleasePoolPush();
    v18 = objc_alloc((Class)NSSet);
    v20 = objc_opt_class(NSArray, v19);
    v22 = objc_msgSend(v18, "initWithObjects:", v20, objc_opt_class(NSNumber, v21), 0);
    objc_autoreleasePoolPop(v17);
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("domains")));
    domains = v5->_domains;
    v5->_domains = (NSArray *)v23;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventStateOfMind *v4;

  v4 = objc_alloc_init(MOEventStateOfMind);
  v4->_reflectiveInterval = self->_reflectiveInterval;
  v4->_valenceClassification = self->_valenceClassification;
  v4->_valence = self->_valence;
  objc_storeStrong((id *)&v4->_labels, self->_labels);
  objc_storeStrong((id *)&v4->_domains, self->_domains);
  return v4;
}

- (id)description
{
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("valence, %f"), *(_QWORD *)&self->_valence);
}

- (double)reflectiveInterval
{
  return self->_reflectiveInterval;
}

- (void)setReflectiveInterval:(double)a3
{
  self->_reflectiveInterval = a3;
}

- (double)valence
{
  return self->_valence;
}

- (void)setValence:(double)a3
{
  self->_valence = a3;
}

- (double)valenceClassification
{
  return self->_valenceClassification;
}

- (void)setValenceClassification:(double)a3
{
  self->_valenceClassification = a3;
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
  objc_storeStrong((id *)&self->_labels, a3);
}

- (NSArray)domains
{
  return self->_domains;
}

- (void)setDomains:(id)a3
{
  objc_storeStrong((id *)&self->_domains, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domains, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

@end
