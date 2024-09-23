@implementation PKSharingHomeInvitation

- (PKSharingHomeInvitation)initWithDisplayInformation:(id)a3 appleSharingDict:(id)a4
{
  PKSharingHomeInvitation *v4;

  v4 = 0;
  if (a3 && a4)
  {
    self = -[PKSharingGenericMessage initWithFormat:type:genericSharingDict:appleSharingDict:displayInformation:](self, "initWithFormat:type:genericSharingDict:appleSharingDict:displayInformation:", 4, 1, MEMORY[0x1E0C9AA70], a4, a3);
    v4 = self;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
