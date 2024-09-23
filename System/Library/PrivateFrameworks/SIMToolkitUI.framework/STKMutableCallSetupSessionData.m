@implementation STKMutableCallSetupSessionData

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->super._phoneNumber, a3);
}

- (void)setIsHighPriority:(BOOL)a3
{
  self->super._isHighPriority = a3;
}

@end
