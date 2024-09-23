@implementation PKSubcredentialProvisioningSessionOperation

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  -[PKSubcredentialProvisioningOperation failWithErrorCode:description:](self, "failWithErrorCode:description:", 0, CFSTR("Unimplemented method didChangeState:"));
}

@end
