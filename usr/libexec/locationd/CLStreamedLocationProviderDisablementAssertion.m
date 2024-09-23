@implementation CLStreamedLocationProviderDisablementAssertion

- (void)takeAssertion
{
  -[CLStreamedLocationProviderProtocol takeDisablementAssertion](-[CLStreamedLocationProviderAssertion proxy](self, "proxy"), "takeDisablementAssertion");
}

- (void)releaseAssertion
{
  -[CLStreamedLocationProviderProtocol releaseDisablementAssertion](-[CLStreamedLocationProviderAssertion proxy](self, "proxy"), "releaseDisablementAssertion");
}

@end
