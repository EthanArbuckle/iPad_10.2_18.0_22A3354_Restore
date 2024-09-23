@implementation SBMedusaDragWindowContext

- (SBMedusaDragWindowContext)initWithDragWindow:(id)a3 traitsParticipant:(id)a4 traitsParticipantDelegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBMedusaDragWindowContext *v12;
  SBMedusaDragWindowContext *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBMedusaDragWindowContext;
  v12 = -[SBMedusaDragWindowContext init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dragWindow, a3);
    objc_storeStrong((id *)&v13->_traitsParticipant, a4);
    objc_storeStrong((id *)&v13->_traitsParticipantDelegate, a5);
  }

  return v13;
}

- (SBIconDragPreviewContaining)dragWindow
{
  return self->_dragWindow;
}

- (TRAParticipant)traitsParticipant
{
  return self->_traitsParticipant;
}

- (SBTraitsWindowParticipantDelegate)traitsParticipantDelegate
{
  return self->_traitsParticipantDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitsParticipantDelegate, 0);
  objc_storeStrong((id *)&self->_traitsParticipant, 0);
  objc_storeStrong((id *)&self->_dragWindow, 0);
}

@end
