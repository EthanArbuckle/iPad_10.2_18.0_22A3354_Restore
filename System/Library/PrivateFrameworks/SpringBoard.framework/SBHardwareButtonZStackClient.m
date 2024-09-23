@implementation SBHardwareButtonZStackClient

- (void)_updateZStackParticipant
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  -[SBHardwareButtonZStackClient zStackParticipant](self, "zStackParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHardwareButtonZStackClient hardwareButtonService](self, "hardwareButtonService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasConsumersForHomeButtonSinglePress");

  if (!v3 || (v5 & 1) != 0)
  {
    if (v3)
      v7 = 0;
    else
      v7 = v5;
    if (v7 == 1)
    {
      -[SBHardwareButtonZStackClient zStackResolver](self, "zStackResolver");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v10 = v8;
        objc_msgSend(v8, "acquireParticipantWithIdentifier:delegate:", 5, self);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHardwareButtonZStackClient setZStackParticipant:](self, "setZStackParticipant:", v9);

        v8 = v10;
      }

    }
  }
  else
  {
    -[SBHardwareButtonZStackClient zStackParticipant](self, "zStackParticipant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    -[SBHardwareButtonZStackClient setZStackParticipant:](self, "setZStackParticipant:", 0);
  }
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (SBHardwareButtonService)hardwareButtonService
{
  return (SBHardwareButtonService *)objc_loadWeakRetained((id *)&self->_hardwareButtonService);
}

- (SBHardwareButtonZStackClient)initWithZStackResolver:(id)a3 hardwareButtonService:(id)a4
{
  id v6;
  id v7;
  SBHardwareButtonZStackClient *v8;
  SBHardwareButtonZStackClient *v9;
  uint64_t v10;
  BSInvalidatable *hardwareButtonObserverAssertion;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBHardwareButtonZStackClient;
  v8 = -[SBHardwareButtonZStackClient init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_zStackResolver, v6);
    objc_storeWeak((id *)&v9->_hardwareButtonService, v7);
    -[SBHardwareButtonZStackClient _updateZStackParticipant](v9, "_updateZStackParticipant");
    objc_msgSend(v7, "addObserver:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    hardwareButtonObserverAssertion = v9->_hardwareButtonObserverAssertion;
    v9->_hardwareButtonObserverAssertion = (BSInvalidatable *)v10;

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_hardwareButtonObserverAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBHardwareButtonZStackClient;
  -[SBHardwareButtonZStackClient dealloc](&v3, sel_dealloc);
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v4;

  v4 = a4;
  objc_msgSend(v4, "setActivationPolicyForParticipantsBelow:", 0);
  objc_msgSend(v4, "setHomeGestureConsumption:", 1);

}

- (SBFZStackResolver)zStackResolver
{
  return (SBFZStackResolver *)objc_loadWeakRetained((id *)&self->_zStackResolver);
}

- (void)setZStackParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_zStackParticipant, a3);
}

- (BSInvalidatable)hardwareButtonObserverAssertion
{
  return self->_hardwareButtonObserverAssertion;
}

- (void)setHardwareButtonObserverAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareButtonObserverAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareButtonObserverAssertion, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_destroyWeak((id *)&self->_hardwareButtonService);
  objc_destroyWeak((id *)&self->_zStackResolver);
}

@end
