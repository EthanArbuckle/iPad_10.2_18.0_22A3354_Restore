@implementation SBSFocusModesHomeScreenSnapshot

- (SBSFocusModesHomeScreenSnapshot)initWithListIdentifier:(id)a3 focusModeIdentifier:(id)a4 machPortSendRight:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBSFocusModesHomeScreenSnapshot *v11;
  uint64_t v12;
  NSString *listIdentifier;
  uint64_t v14;
  NSString *focusModeIdentifier;
  uint64_t v16;
  BSMachPortSendRight *machPortSendRight;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBSFocusModesHomeScreenSnapshot;
  v11 = -[SBSFocusModesHomeScreenSnapshot init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    listIdentifier = v11->_listIdentifier;
    v11->_listIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    focusModeIdentifier = v11->_focusModeIdentifier;
    v11->_focusModeIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    machPortSendRight = v11->_machPortSendRight;
    v11->_machPortSendRight = (BSMachPortSendRight *)v16;

  }
  return v11;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  NSString *listIdentifier;
  id v5;

  listIdentifier = self->_listIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", listIdentifier, CFSTR("listIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_focusModeIdentifier, CFSTR("focusModeIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_machPortSendRight, CFSTR("machPortSendRight"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_wantsListVisible, CFSTR("wantsListVisible"));

}

- (SBSFocusModesHomeScreenSnapshot)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  SBSFocusModesHomeScreenSnapshot *v9;
  SBSFocusModesHomeScreenSnapshot *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("listIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("focusModeIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("machPortSendRight"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = 0;
  if (v5 && v6 && v7)
  {
    v10 = -[SBSFocusModesHomeScreenSnapshot initWithListIdentifier:focusModeIdentifier:machPortSendRight:](self, "initWithListIdentifier:focusModeIdentifier:machPortSendRight:", v5, v6, v7);
    -[SBSFocusModesHomeScreenSnapshot setWantsListVisible:](v10, "setWantsListVisible:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsListVisible")));
    self = v10;
    v9 = self;
  }

  return v9;
}

- (NSString)listIdentifier
{
  return self->_listIdentifier;
}

- (void)setListIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)focusModeIdentifier
{
  return self->_focusModeIdentifier;
}

- (void)setFocusModeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BSMachPortSendRight)machPortSendRight
{
  return self->_machPortSendRight;
}

- (void)setMachPortSendRight:(id)a3
{
  objc_storeStrong((id *)&self->_machPortSendRight, a3);
}

- (BOOL)wantsListVisible
{
  return self->_wantsListVisible;
}

- (void)setWantsListVisible:(BOOL)a3
{
  self->_wantsListVisible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machPortSendRight, 0);
  objc_storeStrong((id *)&self->_focusModeIdentifier, 0);
  objc_storeStrong((id *)&self->_listIdentifier, 0);
}

@end
