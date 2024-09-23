@implementation SKAISSetupContext

- (AISSetupContext)underlyingObject
{
  id v3;

  v3 = objc_alloc_init((Class)getAISSetupContextClass[0]());
  objc_msgSend(v3, "setRequiredServiceTypes:", self->_requiredServiceTypes);
  objc_msgSend(v3, "setDesiredServiceTypes:", self->_desiredServiceTypes);
  objc_msgSend(v3, "setMessageSessionTemplate:", self->_messageSessionTemplate);
  objc_msgSend(v3, "setLocalRole:", self->_localRole);
  objc_msgSend(v3, "setRemoteRole:", self->_remoteRole);
  objc_msgSend(v3, "setShouldSkipConfirmation:", self->_shouldSkipConfirmation);
  return (AISSetupContext *)v3;
}

- (NSSet)requiredServiceTypes
{
  return self->_requiredServiceTypes;
}

- (void)setRequiredServiceTypes:(id)a3
{
  objc_storeStrong((id *)&self->_requiredServiceTypes, a3);
}

- (NSSet)desiredServiceTypes
{
  return self->_desiredServiceTypes;
}

- (void)setDesiredServiceTypes:(id)a3
{
  objc_storeStrong((id *)&self->_desiredServiceTypes, a3);
}

- (unint64_t)localRole
{
  return self->_localRole;
}

- (void)setLocalRole:(unint64_t)a3
{
  self->_localRole = a3;
}

- (unint64_t)remoteRole
{
  return self->_remoteRole;
}

- (void)setRemoteRole:(unint64_t)a3
{
  self->_remoteRole = a3;
}

- (BOOL)shouldSkipConfirmation
{
  return self->_shouldSkipConfirmation;
}

- (void)setShouldSkipConfirmation:(BOOL)a3
{
  self->_shouldSkipConfirmation = a3;
}

- (CUMessageSession)messageSessionTemplate
{
  return self->_messageSessionTemplate;
}

- (void)setMessageSessionTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_messageSessionTemplate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSessionTemplate, 0);
  objc_storeStrong((id *)&self->_desiredServiceTypes, 0);
  objc_storeStrong((id *)&self->_requiredServiceTypes, 0);
}

@end
