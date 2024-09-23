@implementation TRIClient(Telemetry)

- (BOOL)shouldLogAtLevel:()Telemetry
{
  return a3 > 19;
}

- (uint64_t)shouldLogAtLevel:()Telemetry withPrivacyRadar:
{
  uint64_t result;

  LODWORD(result) = objc_msgSend(a1, "shouldLogAtLevel:");
  if (a4 == 54260918)
    return result;
  else
    return 0;
}

@end
