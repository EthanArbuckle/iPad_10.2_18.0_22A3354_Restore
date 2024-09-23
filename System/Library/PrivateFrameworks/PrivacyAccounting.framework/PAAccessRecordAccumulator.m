@implementation PAAccessRecordAccumulator

- (PAAccessRecordAccumulator)init
{
  PAAccessRecordAccumulator *v2;
  uint64_t v3;
  NSMutableDictionary *ongoingIntervals;
  uint64_t v5;
  NSMutableSet *seenEvents;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PAAccessRecordAccumulator;
  v2 = -[PAAccessRecordAccumulator init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    ongoingIntervals = v2->_ongoingIntervals;
    v2->_ongoingIntervals = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    seenEvents = v2->_seenEvents;
    v2->_seenEvents = (NSMutableSet *)v5;

  }
  return v2;
}

- (PAAccessRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (NSMutableDictionary)ongoingIntervals
{
  return self->_ongoingIntervals;
}

- (NSMutableSet)seenEvents
{
  return self->_seenEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seenEvents, 0);
  objc_storeStrong((id *)&self->_ongoingIntervals, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
