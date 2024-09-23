@implementation TITypologyStatistic

+ (id)statistic
{
  return objc_alloc_init((Class)a1);
}

- (void)visitTypologyLog:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[TITypologyStatistic prepareForComputation](self, "prepareForComputation");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__TITypologyStatistic_visitTypologyLog___block_invoke;
  v5[3] = &unk_1E2439CC0;
  v5[4] = self;
  objc_msgSend(v4, "enumerateRecordsWithBlock:", v5);

  -[TITypologyStatistic finalizeComputation](self, "finalizeComputation");
}

- (NSDictionary)structuredReport
{
  return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

- (NSDictionary)aggregateReport
{
  return (NSDictionary *)MEMORY[0x1E0C9AA70];
}

uint64_t __40__TITypologyStatistic_visitTypologyLog___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "applyToStatistic:", *(_QWORD *)(a1 + 32));
}

@end
