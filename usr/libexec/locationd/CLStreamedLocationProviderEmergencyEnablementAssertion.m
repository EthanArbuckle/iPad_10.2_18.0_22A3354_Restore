@implementation CLStreamedLocationProviderEmergencyEnablementAssertion

- (void)takeAssertion
{
  -[CLStreamedLocationProviderProtocol takeEmergencyEnablementAssertion](-[CLStreamedLocationProviderAssertion proxy](self, "proxy"), "takeEmergencyEnablementAssertion");
}

- (void)releaseAssertion
{
  -[CLStreamedLocationProviderProtocol releaseEmergencyEnablementAssertion](-[CLStreamedLocationProviderAssertion proxy](self, "proxy"), "releaseEmergencyEnablementAssertion");
}

@end
