@implementation MCSChange

- (id)applyPendingChangeToObjects:(id)a3
{
  id v5;

  v5 = a3;
  -[MCSChange doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSChange applyPendingChangeToObjects:]", "MCSChange.m", 17, "0");
}

- (BOOL)commit
{
  -[MCSChange doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSChange commit]", "MCSChange.m", 21, "0");
}

- (BOOL)allowOtherChange:(id)a3
{
  return 1;
}

- (id)stores
{
  -[MCSChange doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSChange stores]", "MCSChange.m", 29, "0");
}

- (id)accounts
{
  -[MCSChange doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSChange accounts]", "MCSChange.m", 33, "0");
}

- (id)localizedErrorDescription
{
  -[MCSChange doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSChange localizedErrorDescription]", "MCSChange.m", 37, "0");
}

- (id)localizedErrorTitle
{
  -[MCSChange doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSChange localizedErrorTitle]", "MCSChange.m", 41, "0");
}

- (NSSet)messagesSet
{
  return 0;
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

- (BOOL)isFinalized
{
  return *((_BYTE *)self + 16) & 1;
}

- (id)invocation
{
  return self->_invocation;
}

- (void)setInvocation:(id)a3
{
  objc_storeStrong((id *)&self->_invocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocation, 0);
}

@end
