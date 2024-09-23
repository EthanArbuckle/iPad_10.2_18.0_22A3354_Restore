@implementation TUCallModel

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  _BOOL4 v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[TUCallModel supportsHolding](self, "supportsHolding");
    if (v6 == objc_msgSend(v5, "supportsHolding")
      && (v7 = -[TUCallModel supportsGrouping](self, "supportsGrouping"),
          v7 == objc_msgSend(v5, "supportsGrouping"))
      && (v8 = -[TUCallModel supportsUngrouping](self, "supportsUngrouping"),
          v8 == objc_msgSend(v5, "supportsUngrouping"))
      && (v9 = -[TUCallModel supportsDTMF](self, "supportsDTMF"), v9 == objc_msgSend(v5, "supportsDTMF"))
      && (v10 = -[TUCallModel supportsUnambiguousMultiPartyState](self, "supportsUnambiguousMultiPartyState"),
          v10 == objc_msgSend(v5, "supportsUnambiguousMultiPartyState"))
      && (v11 = -[TUCallModel supportsAddCall](self, "supportsAddCall"),
          v11 == objc_msgSend(v5, "supportsAddCall")))
    {
      v14 = -[TUCallModel supportsSendingToVoicemail](self, "supportsSendingToVoicemail");
      v12 = v14 ^ objc_msgSend(v5, "supportsSendingToVoicemail") ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (-[TUCallModel supportsHolding](self, "supportsHolding"))
    v3 = 1231;
  else
    v3 = 1237;
  if (-[TUCallModel supportsGrouping](self, "supportsGrouping"))
    v4 = 1231;
  else
    v4 = 1237;
  v5 = v4 ^ v3;
  if (-[TUCallModel supportsUngrouping](self, "supportsUngrouping"))
    v6 = 1231;
  else
    v6 = 1237;
  if (-[TUCallModel supportsDTMF](self, "supportsDTMF"))
    v7 = 1231;
  else
    v7 = 1237;
  v8 = v5 ^ v6 ^ v7;
  if (-[TUCallModel supportsUnambiguousMultiPartyState](self, "supportsUnambiguousMultiPartyState"))
    v9 = 1231;
  else
    v9 = 1237;
  if (-[TUCallModel supportsAddCall](self, "supportsAddCall"))
    v10 = 1231;
  else
    v10 = 1237;
  v11 = v9 ^ v10;
  if (-[TUCallModel supportsSendingToVoicemail](self, "supportsSendingToVoicemail"))
    v12 = 1231;
  else
    v12 = 1237;
  return v8 ^ v11 ^ v12;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" hold=%d"), -[TUCallModel supportsHolding](self, "supportsHolding"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" grp=%d"), -[TUCallModel supportsGrouping](self, "supportsGrouping"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" ungrp=%d"), -[TUCallModel supportsUngrouping](self, "supportsUngrouping"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" DTMF=%d"), -[TUCallModel supportsDTMF](self, "supportsDTMF"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" uMPS=%d"), -[TUCallModel supportsUnambiguousMultiPartyState](self, "supportsUnambiguousMultiPartyState"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" aC=%d"), -[TUCallModel supportsAddCall](self, "supportsAddCall"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" sTV=%d"), -[TUCallModel supportsSendingToVoicemail](self, "supportsSendingToVoicemail"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSupportsHolding:", -[TUCallModel supportsHolding](self, "supportsHolding"));
  objc_msgSend(v4, "setSupportsGrouping:", -[TUCallModel supportsGrouping](self, "supportsGrouping"));
  objc_msgSend(v4, "setSupportsUngrouping:", -[TUCallModel supportsUngrouping](self, "supportsUngrouping"));
  objc_msgSend(v4, "setSupportsDTMF:", -[TUCallModel supportsDTMF](self, "supportsDTMF"));
  objc_msgSend(v4, "setSupportsUnambiguousMultiPartyState:", -[TUCallModel supportsUnambiguousMultiPartyState](self, "supportsUnambiguousMultiPartyState"));
  objc_msgSend(v4, "setSupportsAddCall:", -[TUCallModel supportsAddCall](self, "supportsAddCall"));
  objc_msgSend(v4, "setSupportsSendingToVoicemail:", -[TUCallModel supportsSendingToVoicemail](self, "supportsSendingToVoicemail"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUCallModel)initWithCoder:(id)a3
{
  id v4;
  TUCallModel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = -[TUCallModel init](self, "init");
  if (v5)
  {
    NSStringFromSelector(sel_supportsHolding);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsHolding = objc_msgSend(v4, "decodeBoolForKey:", v6);

    NSStringFromSelector(sel_supportsGrouping);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsGrouping = objc_msgSend(v4, "decodeBoolForKey:", v7);

    NSStringFromSelector(sel_supportsUngrouping);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsUngrouping = objc_msgSend(v4, "decodeBoolForKey:", v8);

    NSStringFromSelector(sel_supportsDTMF);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsDTMF = objc_msgSend(v4, "decodeBoolForKey:", v9);

    NSStringFromSelector(sel_supportsUnambiguousMultiPartyState);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsUnambiguousMultiPartyState = objc_msgSend(v4, "decodeBoolForKey:", v10);

    NSStringFromSelector(sel_supportsAddCall);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsAddCall = objc_msgSend(v4, "decodeBoolForKey:", v11);

    NSStringFromSelector(sel_supportsSendingToVoicemail);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsSendingToVoicemail = objc_msgSend(v4, "decodeBoolForKey:", v12);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  id v18;

  v4 = a3;
  v5 = -[TUCallModel supportsHolding](self, "supportsHolding");
  NSStringFromSelector(sel_supportsHolding);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v5, v6);

  v7 = -[TUCallModel supportsGrouping](self, "supportsGrouping");
  NSStringFromSelector(sel_supportsGrouping);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v7, v8);

  v9 = -[TUCallModel supportsUngrouping](self, "supportsUngrouping");
  NSStringFromSelector(sel_supportsUngrouping);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v9, v10);

  v11 = -[TUCallModel supportsDTMF](self, "supportsDTMF");
  NSStringFromSelector(sel_supportsDTMF);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v11, v12);

  v13 = -[TUCallModel supportsUnambiguousMultiPartyState](self, "supportsUnambiguousMultiPartyState");
  NSStringFromSelector(sel_supportsUnambiguousMultiPartyState);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v13, v14);

  v15 = -[TUCallModel supportsAddCall](self, "supportsAddCall");
  NSStringFromSelector(sel_supportsAddCall);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v15, v16);

  v17 = -[TUCallModel supportsSendingToVoicemail](self, "supportsSendingToVoicemail");
  NSStringFromSelector(sel_supportsSendingToVoicemail);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v17, v18);

}

- (BOOL)supportsHolding
{
  return self->_supportsHolding;
}

- (void)setSupportsHolding:(BOOL)a3
{
  self->_supportsHolding = a3;
}

- (BOOL)supportsGrouping
{
  return self->_supportsGrouping;
}

- (void)setSupportsGrouping:(BOOL)a3
{
  self->_supportsGrouping = a3;
}

- (BOOL)supportsUngrouping
{
  return self->_supportsUngrouping;
}

- (void)setSupportsUngrouping:(BOOL)a3
{
  self->_supportsUngrouping = a3;
}

- (BOOL)supportsDTMF
{
  return self->_supportsDTMF;
}

- (void)setSupportsDTMF:(BOOL)a3
{
  self->_supportsDTMF = a3;
}

- (BOOL)supportsUnambiguousMultiPartyState
{
  return self->_supportsUnambiguousMultiPartyState;
}

- (void)setSupportsUnambiguousMultiPartyState:(BOOL)a3
{
  self->_supportsUnambiguousMultiPartyState = a3;
}

- (BOOL)supportsAddCall
{
  return self->_supportsAddCall;
}

- (void)setSupportsAddCall:(BOOL)a3
{
  self->_supportsAddCall = a3;
}

- (BOOL)supportsSendingToVoicemail
{
  return self->_supportsSendingToVoicemail;
}

- (void)setSupportsSendingToVoicemail:(BOOL)a3
{
  self->_supportsSendingToVoicemail = a3;
}

@end
