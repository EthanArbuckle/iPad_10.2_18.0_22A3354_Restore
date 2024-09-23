@implementation PPExtractionContext

- (PPExtractionContext)initWithProbabilities:(id)a3
{
  id v5;
  PPExtractionContext *v6;
  PPExtractionContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPExtractionContext;
  v6 = -[PPExtractionContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_probabilities, a3);

  return v7;
}

- (double)probabilityForDomain:(unsigned int)a3
{
  uint64_t v3;
  NSDictionary *probabilities;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v3 = *(_QWORD *)&a3;
  probabilities = self->_probabilities;
  v5 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v5);
  -[NSDictionary objectForKeyedSubscript:](probabilities, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probabilities, 0);
}

@end
