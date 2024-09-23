@implementation HVQueuesGuardedData

- (HVQueuesGuardedData)init
{
  HVQueuesGuardedData *v2;
  uint64_t v3;
  NSMapTable *observers;
  uint64_t v5;
  NSMutableDictionary *queues;
  OS_os_transaction *contentAvailableNotificationInProgress;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HVQueuesGuardedData;
  v2 = -[HVQueuesGuardedData init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 5, 5);
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSMapTable *)v3;

    v5 = objc_opt_new();
    queues = v2->_queues;
    v2->_queues = (NSMutableDictionary *)v5;

    contentAvailableNotificationInProgress = v2->_contentAvailableNotificationInProgress;
    v2->_contentAvailableNotificationInProgress = 0;

    v2->_dataSourcesWithContentAvailable = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentAvailableNotificationInProgress, 0);
  objc_storeStrong((id *)&self->_queues, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
