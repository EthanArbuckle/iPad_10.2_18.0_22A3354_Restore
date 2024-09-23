@implementation PKMutablePassEntitlementCapabilitySet

- (void)setShareability:(unint64_t)a3
{
  objc_super v5;

  if (-[PKPassEntitlementCapabilitySet shareability](self, "shareability") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKMutablePassEntitlementCapabilitySet;
    -[PKPassEntitlementCapabilitySet setShareability:](&v5, sel_setShareability_, a3);
    -[PKMutablePassEntitlementCapabilitySet _updateCapabilityRoleValue](self, "_updateCapabilityRoleValue");
  }
}

- (void)setManageability:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKMutablePassEntitlementCapabilitySet;
  -[PKPassEntitlementCapabilitySet setManageability:](&v4, sel_setManageability_, a3);
  -[PKMutablePassEntitlementCapabilitySet _updateCapabilityRoleValue](self, "_updateCapabilityRoleValue");
}

- (void)setVisibility:(unint64_t)a3
{
  objc_super v5;

  if (-[PKPassEntitlementCapabilitySet visibility](self, "visibility") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKMutablePassEntitlementCapabilitySet;
    -[PKPassEntitlementCapabilitySet setVisibility:](&v5, sel_setVisibility_, a3);
    -[PKMutablePassEntitlementCapabilitySet _updateCapabilityRoleValue](self, "_updateCapabilityRoleValue");
  }
}

- (void)setIntraAccountSharingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[PKPassEntitlementCapabilitySet intraAccountSharingEnabled](self, "intraAccountSharingEnabled") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKMutablePassEntitlementCapabilitySet;
    -[PKPassEntitlementCapabilitySet setIntraAccountSharingEnabled:](&v5, sel_setIntraAccountSharingEnabled_, v3);
    -[PKMutablePassEntitlementCapabilitySet _updateCapabilityRoleValue](self, "_updateCapabilityRoleValue");
  }
}

- (void)_updateCapabilityRoleValue
{
  void *v3;
  void *v4;
  __int16 v5;
  id v6;

  -[PKPassEntitlementCapabilitySet capabilityRoleValue](self, "capabilityRoleValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKPassEntitlementCapabilitySet capabilityRoleValue](self, "capabilityRoleValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedShortValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", PKPassEntitlementCapabilityRoleValueFrom(-[PKPassEntitlementCapabilitySet shareability](self, "shareability"), -[PKPassEntitlementCapabilitySet visibility](self, "visibility"), -[PKPassEntitlementCapabilitySet manageability](self, "manageability"), -[PKPassEntitlementCapabilitySet intraAccountSharingEnabled](self, "intraAccountSharingEnabled")) | v5 & 0xF760);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PKPassEntitlementCapabilitySet setCapabilityRoleValue:](self, "setCapabilityRoleValue:", v6);

  }
}

@end
