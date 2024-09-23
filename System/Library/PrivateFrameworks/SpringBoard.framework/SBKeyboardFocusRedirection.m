@implementation SBKeyboardFocusRedirection

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%d, %@) -> (%d, %@) because %@"), self->_fromProcessIdentifier, self->_fromToken, self->_toProcessIdentifier, self->_toToken, self->_reason);
}

- (id)focusTarget
{
  if (a1)
  {
    +[SBKeyboardFocusTarget targetForSceneIdentityToken:pid:](SBKeyboardFocusTarget, "targetForSceneIdentityToken:pid:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 12));
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)fromProcessIdentifier
{
  return self->_fromProcessIdentifier;
}

- (void)setFromProcessIdentifier:(int)a3
{
  self->_fromProcessIdentifier = a3;
}

- (FBSSceneIdentityToken)fromToken
{
  return self->_fromToken;
}

- (void)setFromToken:(id)a3
{
  objc_storeStrong((id *)&self->_fromToken, a3);
}

- (int)toProcessIdentifier
{
  return self->_toProcessIdentifier;
}

- (void)setToProcessIdentifier:(int)a3
{
  self->_toProcessIdentifier = a3;
}

- (FBSSceneIdentityToken)toToken
{
  return self->_toToken;
}

- (void)setToToken:(id)a3
{
  objc_storeStrong((id *)&self->_toToken, a3);
}

- (BKSHIDEventDeferringTarget)deferringTarget
{
  return self->_deferringTarget;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferringTarget, 0);
  objc_storeStrong((id *)&self->_toToken, 0);
  objc_storeStrong((id *)&self->_fromToken, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
