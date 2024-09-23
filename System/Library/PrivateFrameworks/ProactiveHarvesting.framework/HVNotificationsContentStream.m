@implementation HVNotificationsContentStream

- (HVNotificationsContentStream)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HVNotificationsContentStream *v7;

  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ProactiveHarvesting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Notifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HVNotificationsContentStream initWithStreamIdentifier:eventClass:](self, "initWithStreamIdentifier:eventClass:", v6, objc_opt_class());

  return v7;
}

- (HVNotificationsContentStream)initWithStreamIdentifier:(id)a3
{
  id v4;
  HVNotificationsContentStream *v5;

  v4 = a3;
  v5 = -[HVNotificationsContentStream initWithStreamIdentifier:eventClass:](self, "initWithStreamIdentifier:eventClass:", v4, objc_opt_class());

  return v5;
}

- (HVNotificationsContentStream)initWithStreamIdentifier:(id)a3 eventClass:(Class)a4
{
  HVNotificationsContentStream *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BMStream *stream;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HVNotificationsContentStream;
  v4 = -[BMContentStream initWithStreamIdentifier:eventClass:](&v10, sel_initWithStreamIdentifier_eventClass_, a3, a4);
  if (v4)
  {
    BiomeLibrary();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ProactiveHarvesting");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "Notifications");
    v7 = objc_claimAutoreleasedReturnValue();
    stream = v4->_stream;
    v4->_stream = (BMStream *)v7;

  }
  return v4;
}

- (id)source
{
  return (id)-[BMStream source](self->_stream, "source");
}

- (id)identifier
{
  return (id)-[BMStream identifier](self->_stream, "identifier");
}

- (id)publisherFromStartTime:(double)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", a3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CC98]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v4, 0, 0, 0, 0);
  -[BMStream publisherWithOptions:](self->_stream, "publisherWithOptions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    v14 = 0;
    if (v11)
      goto LABEL_3;
LABEL_5:
    v16 = 0;
    goto LABEL_6;
  }
  v13 = objc_alloc(MEMORY[0x24BDBCE60]);
  objc_msgSend(v10, "doubleValue");
  v14 = (void *)objc_msgSend(v13, "initWithTimeIntervalSinceReferenceDate:");
  if (!v11)
    goto LABEL_5;
LABEL_3:
  v15 = objc_alloc(MEMORY[0x24BDBCE60]);
  objc_msgSend(v11, "doubleValue");
  v16 = (void *)objc_msgSend(v15, "initWithTimeIntervalSinceReferenceDate:");
LABEL_6:
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CC98]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v14, v16, objc_msgSend(v12, "integerValue"), 0, v6);
  -[BMStream publisherWithOptions:](self->_stream, "publisherWithOptions:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)publisher
{
  return (id)-[BMStream DSLPublisher](self->_stream, "DSLPublisher");
}

- (void)pruneWithPredicateBlock:(id)a3
{
  BMStream *stream;
  id v4;
  id v5;

  stream = self->_stream;
  v4 = a3;
  -[BMStream pruner](stream, "pruner");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteEventsPassingTest:", v4);

}

- (BOOL)pruneEventsWithError:(id *)a3 predicateBlock:(id)a4
{
  BMStream *stream;
  id v5;
  void *v6;

  stream = self->_stream;
  v5 = a4;
  -[BMStream pruner](stream, "pruner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteEventsPassingTest:", v5);

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
