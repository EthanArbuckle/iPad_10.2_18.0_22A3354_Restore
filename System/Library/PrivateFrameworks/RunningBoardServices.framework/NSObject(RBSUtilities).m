@implementation NSObject(RBSUtilities)

- (uint64_t)RBSIsXPCObject
{
  id v0;

  NSClassFromString(CFSTR("OS_xpc_object"));
  v0 = (id)objc_claimAutoreleasedReturnValue();
  return objc_opt_isKindOfClass() & 1;
}

- (__CFString)NSRepresentation
{
  if ((objc_msgSend(a1, "conformsToProtocol:", &unk_1EE219D78) & 1) == 0)
    -[NSObject(RBSUtilities) NSRepresentation].cold.1();
  return nsObjFromXPCObj(a1);
}

- (void)NSRepresentation
{
  _os_crash();
  __break(1u);
}

@end
