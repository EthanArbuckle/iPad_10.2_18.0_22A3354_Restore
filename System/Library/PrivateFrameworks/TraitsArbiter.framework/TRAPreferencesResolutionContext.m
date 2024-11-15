@implementation TRAPreferencesResolutionContext

- (TRAArbitrationInputs)validatedInputs
{
  return self->_validatedInputs;
}

- (TRAArbitrationInputs)rawInputs
{
  return self->_rawInputs;
}

- (TRAPreferencesResolutionContext)initWithAcquiredParticipants:(id)a3 stageParticipantsRoles:(id)a4 validatedInputs:(id)a5 rawInputs:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TRAPreferencesResolutionContext *v15;
  TRAPreferencesResolutionContext *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TRAPreferencesResolutionContext;
  v15 = -[TRAPreferencesResolutionContext init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_acquiredParticipants, a3);
    objc_storeStrong((id *)&v16->_stageParticipantsRoles, a4);
    objc_storeStrong((id *)&v16->_validatedInputs, a5);
    objc_storeStrong((id *)&v16->_rawInputs, a6);
  }

  return v16;
}

- (NSArray)acquiredParticipants
{
  return self->_acquiredParticipants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawInputs, 0);
  objc_storeStrong((id *)&self->_validatedInputs, 0);
  objc_storeStrong((id *)&self->_stageParticipantsRoles, 0);
  objc_storeStrong((id *)&self->_acquiredParticipants, 0);
}

- (NSArray)stageParticipantsRoles
{
  return self->_stageParticipantsRoles;
}

@end
