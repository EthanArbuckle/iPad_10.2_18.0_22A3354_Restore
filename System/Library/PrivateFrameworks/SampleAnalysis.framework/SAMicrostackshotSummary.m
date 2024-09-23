@implementation SAMicrostackshotSummary

- (SAMicrostackshotSummary)init
{
  SAMicrostackshotSummary *v2;
  uint64_t v3;
  NSMutableDictionary *microstackshotStateCounts;
  uint64_t v5;
  NSMutableDictionary *stateCounts;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SAMicrostackshotSummary;
  v2 = -[SAMicrostackshotSummary init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 16);
    microstackshotStateCounts = v2->_microstackshotStateCounts;
    v2->_microstackshotStateCounts = (NSMutableDictionary *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 16);
    stateCounts = v2->_stateCounts;
    v2->_stateCounts = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCounts, 0);
  objc_storeStrong((id *)&self->_microstackshotStateCounts, 0);
}

@end
