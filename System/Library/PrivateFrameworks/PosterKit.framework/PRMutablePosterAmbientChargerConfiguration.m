@implementation PRMutablePosterAmbientChargerConfiguration

- (void)associateWithChargerIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[PRPosterAmbientChargerConfiguration associatedChargerIdentifiers](self, "associatedChargerIdentifiers");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setByAddingObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PRPosterAmbientChargerConfiguration setAssociatedChargerIdentifiers:](self, "setAssociatedChargerIdentifiers:", v5);
  }
}

- (void)disassociateFromChargerIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[PRPosterAmbientChargerConfiguration associatedChargerIdentifiers](self, "associatedChargerIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "removeObject:", v4);
    -[PRPosterAmbientChargerConfiguration setAssociatedChargerIdentifiers:](self, "setAssociatedChargerIdentifiers:", v6);

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  PRPosterAmbientChargerConfiguration *v4;
  void *v5;
  PRPosterAmbientChargerConfiguration *v6;

  v4 = +[PRPosterAmbientChargerConfiguration allocWithZone:](PRPosterAmbientChargerConfiguration, "allocWithZone:", a3);
  -[PRPosterAmbientChargerConfiguration associatedChargerIdentifiers](self, "associatedChargerIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PRPosterAmbientChargerConfiguration initWithAssociatedChargerIdentifiers:](v4, "initWithAssociatedChargerIdentifiers:", v5);

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[PRPosterAmbientChargerConfiguration associatedChargerIdentifiers](self, "associatedChargerIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAssociatedChargerIdentifiers:", v5);

  return v6;
}

@end
