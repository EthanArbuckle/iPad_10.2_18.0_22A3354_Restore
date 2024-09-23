@implementation SUSUIFakeSUOperationProgress

- (id)phase
{
  return CFSTR("Blah");
}

- (float)percentComplete
{
  return 1.0;
}

- (float)normalizedPercentComplete
{
  return 1.0;
}

- (double)timeRemaining
{
  return -1.0;
}

- (BOOL)isDone
{
  return 1;
}

@end
