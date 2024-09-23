@implementation SAHIDEventEmbedded

- (id)hidEventTypeString
{
  unsigned int v3;
  void *v4;

  v3 = -[SAHIDEvent hidEventType](self, "hidEventType");
  if (v3 > 0x27)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UNKNOWN(%d)"), -[SAHIDEvent hidEventType](self, "hidEventType"));
  else
    v4 = (void *)*((_QWORD *)&off_1E714A088 + (int)v3);
  return v4;
}

- (double)thresholdToGroupSameEventType
{
  unsigned int v2;
  double result;

  v2 = -[SAHIDEvent hidEventType](self, "hidEventType");
  result = 0.03;
  if (v2 != 11)
    return 0.0;
  return result;
}

+ (void)parseKTrace:(ktrace_session *)a3 findingHIDEvents:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  ktrace_session *v10;

  v5 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__SAHIDEventEmbedded_parseKTrace_findingHIDEvents___block_invoke;
  v8[3] = &unk_1E7149FB8;
  v9 = v5;
  v10 = a3;
  v6 = v5;
  v7 = (void *)MEMORY[0x1BCCCC450](v8);
  ktrace_events_range();

}

void __51__SAHIDEventEmbedded_parseKTrace_findingHIDEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  void *v6;
  id v7;

  v4 = HIDEventTimestampForKTraceEvent(a2);
  if (v4 && *(_DWORD *)(a2 + 48) == 730267908)
  {
    v5 = *(_DWORD *)(a2 + 16);
    if (v5)
    {
      +[SATimestamp timestampWithMachAbsTime:fromKtraceSession:]((uint64_t)SATimestamp, v4);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      +[SAHIDEvent hidEventWithHIDEventType:atTimestamp:]((uint64_t)SAHIDEventEmbedded, v5, v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAHIDEvent addKTraceEvent:fromSession:]((uint64_t)v6, a2);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }
}

@end
