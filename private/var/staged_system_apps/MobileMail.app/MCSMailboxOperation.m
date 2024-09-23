@implementation MCSMailboxOperation

- (id)applyPendingChangeToObjects:(id)a3
{
  return 0;
}

- (BOOL)commit
{
  -[MCSMailboxOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSMailboxOperation commit]", "MCSMailboxOperation.m", 21, "0");
}

- (BOOL)revert
{
  -[MCSMailboxOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSMailboxOperation revert]", "MCSMailboxOperation.m", 25, "0");
}

- (id)mailboxToRemove
{
  return 0;
}

- (id)modifiedMailboxName
{
  return 0;
}

- (id)mailboxToMoveOrRename
{
  return 0;
}

- (id)mailboxParentForMove
{
  return 0;
}

- (id)accountForErrorHandling
{
  return 0;
}

- (id)localizedErrorDescription
{
  -[MCSMailboxOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSMailboxOperation localizedErrorDescription]", "MCSMailboxOperation.m", 49, "0");
}

- (id)localizedErrorTitle
{
  -[MCSMailboxOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSMailboxOperation localizedErrorTitle]", "MCSMailboxOperation.m", 53, "0");
}

- (BOOL)allowOtherMailboxOperation:(id)a3
{
  return 1;
}

@end
