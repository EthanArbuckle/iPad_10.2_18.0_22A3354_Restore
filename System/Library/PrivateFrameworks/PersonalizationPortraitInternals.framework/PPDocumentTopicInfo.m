@implementation PPDocumentTopicInfo

- (PPDocumentTopicInfo)init
{
  PPDocumentTopicInfo *v2;
  uint64_t v3;
  uint64_t v4;
  NSMutableArray *topicAlgorithmCounts;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PPDocumentTopicInfo;
  v2 = -[PPDocumentTopicInfo init](&v7, sel_init);
  if (v2)
  {
    v3 = 12;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 12);
    topicAlgorithmCounts = v2->_topicAlgorithmCounts;
    v2->_topicAlgorithmCounts = (NSMutableArray *)v4;

    do
    {
      -[NSMutableArray addObject:](v2->_topicAlgorithmCounts, "addObject:", &unk_1E7E59DB0);
      --v3;
    }
    while (v3);
  }
  return v2;
}

- (void)addToCountForAlgorithm:(unint64_t)a3 value:(double)a4
{
  void *v7;
  double v8;
  void *v9;
  id v10;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[NSMutableArray objectAtIndexedSubscript:](self->_topicAlgorithmCounts, "objectAtIndexedSubscript:");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  objc_msgSend(v7, "numberWithDouble:", v8 + a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray setObject:atIndexedSubscript:](self->_topicAlgorithmCounts, "setObject:atIndexedSubscript:", v9, a3);

}

- (double)countForAlgorithm:(unint64_t)a3
{
  void *v3;
  double v4;
  double v5;

  -[NSMutableArray objectAtIndexedSubscript:](self->_topicAlgorithmCounts, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicAlgorithmCounts, 0);
}

@end
