@implementation PLBackgroundJobWorkerPendingWorkItems

- (PLBackgroundJobWorkerPendingWorkItems)initWithCriteria:(id)a3 workItemsNeedingProcessing:(id)a4
{
  id v6;
  id v7;
  PLBackgroundJobWorkerPendingWorkItems *v8;
  uint64_t v9;
  PLBackgroundJobCriteria *criteria;
  uint64_t v11;
  NSArray *workItemsNeedingProcessing;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLBackgroundJobWorkerPendingWorkItems;
  v8 = -[PLBackgroundJobWorkerPendingWorkItems init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    criteria = v8->_criteria;
    v8->_criteria = (PLBackgroundJobCriteria *)v9;

    v11 = objc_msgSend(v7, "copy");
    workItemsNeedingProcessing = v8->_workItemsNeedingProcessing;
    v8->_workItemsNeedingProcessing = (NSArray *)v11;

  }
  return v8;
}

- (PLBackgroundJobWorkerPendingWorkItems)initWithZeroWorkItems
{
  return -[PLBackgroundJobWorkerPendingWorkItems initWithCriteria:workItemsNeedingProcessing:](self, "initWithCriteria:workItemsNeedingProcessing:", 0, 0);
}

- (NSArray)workItemsNeedingProcessing
{
  return self->_workItemsNeedingProcessing;
}

- (PLBackgroundJobCriteria)criteria
{
  return self->_criteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_workItemsNeedingProcessing, 0);
}

@end
