@implementation MCSOperation

- (id)applyPendingChangeToObjects:(id)a3
{
  id v5;

  v5 = a3;
  -[MCSOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MCSOperation applyPendingChangeToObjects:]", "MCSOperation.m", 16, "0");
}

- (BOOL)isFinalized
{
  return *((_BYTE *)self + 8) & 1;
}

@end
