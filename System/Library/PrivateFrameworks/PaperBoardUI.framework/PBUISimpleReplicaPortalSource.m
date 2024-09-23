@implementation PBUISimpleReplicaPortalSource

- (PBUISimpleReplicaPortalSource)initWithTargetView:(id)a3 cacheIdentifier:(id)a4 legibilitySettings:(id)a5 effectsAreBakedIn:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  PBUISimpleReplicaPortalSource *v14;
  PBUISimpleReplicaPortalSource *v15;
  uint64_t v16;
  NSString *cacheIdentifier;
  uint64_t v18;
  _UILegibilitySettings *legibilitySettings;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = -[PBUISimpleReplicaPortalSource init](self, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_targetView, a3);
    v16 = objc_msgSend(v12, "copy");
    cacheIdentifier = v15->_cacheIdentifier;
    v15->_cacheIdentifier = (NSString *)v16;

    v18 = objc_msgSend(v13, "copy");
    legibilitySettings = v15->_legibilitySettings;
    v15->_legibilitySettings = (_UILegibilitySettings *)v18;

    v15->_effectsAreBakedIn = a6;
  }

  return v15;
}

- (NSString)cacheIdentifier
{
  return self->_cacheIdentifier;
}

- (void)setCacheIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)effectsAreBakedIn
{
  return self->_effectsAreBakedIn;
}

- (void)setEffectsAreBakedIn:(BOOL)a3
{
  self->_effectsAreBakedIn = a3;
}

- (UIView)targetView
{
  return self->_targetView;
}

- (void)setTargetView:(id)a3
{
  objc_storeStrong((id *)&self->_targetView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
}

@end
