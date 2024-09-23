@implementation SXEventStoreProvider

- (EKEventStore)eventStore
{
  EKEventStore *eventStore;
  EKEventStore *v4;
  EKEventStore *v5;

  eventStore = self->_eventStore;
  if (!eventStore)
  {
    v4 = (EKEventStore *)objc_alloc_init(MEMORY[0x24BDC74E8]);
    v5 = self->_eventStore;
    self->_eventStore = v4;

    eventStore = self->_eventStore;
  }
  return eventStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end
