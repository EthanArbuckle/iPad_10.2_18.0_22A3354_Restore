@implementation SBSAppSwitcherServiceRegistrationGetTypeID

uint64_t __SBSAppSwitcherServiceRegistrationGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  SBSAppSwitcherServiceRegistrationGetTypeID_typeID = result;
  return result;
}

@end
