@implementation WiFi3BarsResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WiFi3BarsResponse)initWithCoder:(id)a3
{
  id v3;
  WiFi3BarsResponse *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSDictionary *results;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WiFi3BarsResponse;
  v3 = a3;
  v4 = -[WiFi3BarsResponse init](&v12, sel_init);
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v8, CFSTR("results"));
  v9 = objc_claimAutoreleasedReturnValue();

  results = v4->_results;
  v4->_results = (NSDictionary *)v9;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_results, CFSTR("results"));
}

- (NSDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
}

@end
