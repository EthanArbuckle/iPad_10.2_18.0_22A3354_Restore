@implementation RERemoteTrainingContext

- (RERemoteTrainingContext)initWithProcessName:(id)a3
{
  id v4;
  RERemoteTrainingContext *v5;
  RERemoteTrainingContext *v6;
  uint64_t v7;
  NSMutableArray *trainingElements;
  uint64_t v9;
  NSMutableArray *trainingEvents;
  uint64_t v11;
  NSMutableArray *trainingInteractions;
  RERemoteTrainingServer *v13;
  RERemoteTrainingServer *trainingServer;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RERemoteTrainingContext;
  v5 = -[RETrainingContext init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    -[RETrainingContext _configureForRelevanceEngine:](v5, "_configureForRelevanceEngine:", 0);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    trainingElements = v6->_trainingElements;
    v6->_trainingElements = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    trainingEvents = v6->_trainingEvents;
    v6->_trainingEvents = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    trainingInteractions = v6->_trainingInteractions;
    v6->_trainingInteractions = (NSMutableArray *)v11;

    v13 = -[RERemoteTrainingServer initWithTargetProcessName:]([RERemoteTrainingServer alloc], "initWithTargetProcessName:", v4);
    trainingServer = v6->_trainingServer;
    v6->_trainingServer = v13;

  }
  return v6;
}

- (void)setAttribute:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  -[RETrainingContext attributeForKey:](self, "attributeForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6)
  {

  }
  else
  {
    v9 = v8;
    v10 = objc_msgSend(v6, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
      -[RERemoteTrainingContext _willSetAttributeForRemoteTraining](self, "_willSetAttributeForRemoteTraining");
      v11.receiver = self;
      v11.super_class = (Class)RERemoteTrainingContext;
      -[RETrainingContext setAttribute:forKey:](&v11, sel_setAttribute_forKey_, v6, v7);
      -[RERemoteTrainingContext _queue_setRemoteAttribute:forKey:](self, "_queue_setRemoteAttribute:forKey:", v6, v7);
    }
  }

}

- (BOOL)isCurrent
{
  return 0;
}

- (void)_queue_enqueueRemoteTrainingForElement:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5
{
  _BOOL8 v5;
  NSMutableArray *trainingElements;
  NSMutableArray *trainingEvents;
  void *v10;
  id v11;

  v5 = a4;
  trainingElements = self->_trainingElements;
  v11 = a5;
  -[NSMutableArray addObject:](trainingElements, "addObject:", a3);
  trainingEvents = self->_trainingEvents;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](trainingEvents, "addObject:", v10);

  -[NSMutableArray addObject:](self->_trainingInteractions, "addObject:", v11);
}

- (void)_queue_performRemoteTraining
{
  RERemoteTrainingServer *trainingServer;
  NSMutableArray *trainingElements;
  NSMutableArray *trainingEvents;
  NSMutableArray *trainingInteractions;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  -[RERemoteTrainingContext _willPerformRemoteTraining](self, "_willPerformRemoteTraining");
  if (-[NSMutableArray count](self->_trainingElements, "count"))
  {
    objc_initWeak(&location, self);
    trainingServer = self->_trainingServer;
    trainingElements = self->_trainingElements;
    trainingEvents = self->_trainingEvents;
    trainingInteractions = self->_trainingInteractions;
    v13 = MEMORY[0x24BDAC760];
    v15 = __55__RERemoteTrainingContext__queue_performRemoteTraining__block_invoke;
    v16 = &unk_24CF8AAC8;
    v14 = 3221225472;
    objc_copyWeak(&v17, &location);
    -[RERemoteTrainingServer performTrainingWithElements:events:interactions:completion:](trainingServer, "performTrainingWithElements:events:interactions:completion:", trainingElements, trainingEvents, trainingInteractions, &v13);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array", v13, v14, v15, v16);
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_trainingElements;
    self->_trainingElements = v7;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_trainingEvents;
    self->_trainingEvents = v9;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v12 = self->_trainingInteractions;
    self->_trainingInteractions = v11;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    -[RERemoteTrainingContext _didPerformRemoteTraining](self, "_didPerformRemoteTraining");
  }
}

void __55__RERemoteTrainingContext__queue_performRemoteTraining__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didPerformRemoteTraining");

}

- (void)_queue_setRemoteAttribute:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  RERemoteTrainingServer *trainingServer;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  trainingServer = self->_trainingServer;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__RERemoteTrainingContext__queue_setRemoteAttribute_forKey___block_invoke;
  v9[3] = &unk_24CF8AAC8;
  objc_copyWeak(&v10, &location);
  -[RERemoteTrainingServer updateRemoteAttribute:forKey:completion:](trainingServer, "updateRemoteAttribute:forKey:completion:", v6, v7, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __60__RERemoteTrainingContext__queue_setRemoteAttribute_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didSetAttributeForRemoteTraining");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingServer, 0);
  objc_storeStrong((id *)&self->_trainingInteractions, 0);
  objc_storeStrong((id *)&self->_trainingEvents, 0);
  objc_storeStrong((id *)&self->_trainingElements, 0);
}

- (void)trainWithPredictionElement:(id)a3 isPositiveEvent:(BOOL)a4 interaction:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  v8 = a5;
  if (v10)
  {
    v9 = (void *)MEMORY[0x2199B223C]();
    -[RERemoteTrainingContext _queue_enqueueRemoteTrainingForElement:isPositiveEvent:interaction:](self, "_queue_enqueueRemoteTrainingForElement:isPositiveEvent:interaction:", v10, v6, v8);
    -[RERemoteTrainingContext _queue_performRemoteTraining](self, "_queue_performRemoteTraining");
    objc_autoreleasePoolPop(v9);
  }

}

@end
