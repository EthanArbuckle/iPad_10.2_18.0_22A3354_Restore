@implementation MOEventAnalytics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *trends;
  void *v5;
  void *v6;
  id v7;

  trends = self->_trends;
  v7 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", trends));
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("trends"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_patterns));
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("patterns"));

  objc_msgSend(v7, "encodeInteger:forKey:", self->_timeAtHomeSubType, CFSTR("timeAtHomeSubtype"));
}

- (MOEventAnalytics)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  MOEventAnalytics *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSDictionary *trends;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSDictionary *patterns;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MOEventAnalytics;
  v6 = -[MOEventAnalytics init](&v17, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v5), CFSTR("trends"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v8));
    trends = v6->_trends;
    v6->_trends = (NSDictionary *)v9;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v11), CFSTR("patterns"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v13));
    patterns = v6->_patterns;
    v6->_patterns = (NSDictionary *)v14;

    v6->_timeAtHomeSubType = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("timeAtHomeSubtype"));
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventAnalytics *v4;

  v4 = objc_alloc_init(MOEventAnalytics);
  objc_storeStrong((id *)&v4->_trends, self->_trends);
  objc_storeStrong((id *)&v4->_patterns, self->_patterns);
  v4->_timeAtHomeSubType = self->_timeAtHomeSubType;
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc((Class)NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary description](self->_trends, "description"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary description](self->_patterns, "description"));
  v6 = objc_msgSend(v3, "initWithFormat:", CFSTR("trends data, {%@}, @patterns data, %@"), v4, v5);

  return v6;
}

- (NSDictionary)trends
{
  return self->_trends;
}

- (void)setTrends:(id)a3
{
  objc_storeStrong((id *)&self->_trends, a3);
}

- (NSDictionary)patterns
{
  return self->_patterns;
}

- (void)setPatterns:(id)a3
{
  objc_storeStrong((id *)&self->_patterns, a3);
}

- (unint64_t)timeAtHomeSubType
{
  return self->_timeAtHomeSubType;
}

- (void)setTimeAtHomeSubType:(unint64_t)a3
{
  self->_timeAtHomeSubType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patterns, 0);
  objc_storeStrong((id *)&self->_trends, 0);
}

@end
