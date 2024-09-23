@implementation MapsSuggestionsBasePollingFeeler

- (int64_t)disposition
{
  return 1;
}

- (double)updateSignals
{
  double result;

  -[MapsSuggestionsBasePollingFeeler doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

@end
