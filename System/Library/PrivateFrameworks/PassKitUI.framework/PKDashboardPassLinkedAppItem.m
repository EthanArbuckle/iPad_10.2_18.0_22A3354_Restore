@implementation PKDashboardPassLinkedAppItem

+ (id)identifier
{
  return CFSTR("linkedApp");
}

- (PKLinkedApplication)linkedApplication
{
  return self->_linkedApplication;
}

- (void)setLinkedApplication:(id)a3
{
  objc_storeStrong((id *)&self->_linkedApplication, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedApplication, 0);
}

@end
