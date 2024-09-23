@implementation SPQueryJob

- (NSString)dataclass
{
  return self->_dataclass;
}

- (__SIJobRef)siJob
{
  return self->_siJob;
}

- (void)setResultsQueue:(id)a3
{
  objc_storeWeak((id *)&self->_resultsQueue, a3);
}

- (SPQueryJob)initWithSIJob:(__SIJobRef *)a3 dataclass:(id)a4 eventHandler:(id)a5 resultsHandler:(id)a6
{
  id v10;
  id v11;
  SPQueryJob *v12;
  SPQueryJob *v13;
  uint64_t v14;
  id resultsHandler;
  objc_super v17;

  v10 = a4;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SPQueryJob;
  v12 = -[SPQueryJob init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_siJob = a3;
    objc_storeStrong((id *)&v12->_dataclass, a4);
    v14 = MEMORY[0x2199C2F34](v11);
    resultsHandler = v13->_resultsHandler;
    v13->_resultsHandler = (id)v14;

  }
  return v13;
}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_siJob)
  {
    SICancel();
    self->_siJob = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)SPQueryJob;
  -[SPQueryJob dealloc](&v3, sel_dealloc);
}

- (void)setResultsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_destroyWeak((id *)&self->_resultsQueue);
  objc_storeStrong((id *)&self->_dataclass, 0);
}

- (void)cancel
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_resultsQueue);
  objc_msgSend(WeakRetained, "cancelJob:", self);

}

- (void)setSiJob:(__SIJobRef *)a3
{
  self->_siJob = a3;
}

- (void)setDataclass:(id)a3
{
  objc_storeStrong((id *)&self->_dataclass, a3);
}

- (SPQueryResultsQueue)resultsQueue
{
  return (SPQueryResultsQueue *)objc_loadWeakRetained((id *)&self->_resultsQueue);
}

@end
