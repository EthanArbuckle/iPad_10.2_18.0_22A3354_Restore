@implementation PLManagedObjectValidationResult

- (BOOL)status
{
  return self->_status;
}

- (void)setStatus:(BOOL)a3
{
  self->_status = a3;
}

- (PLValidatedManagedObject)validatedObject
{
  return self->_validatedObject;
}

- (void)setValidatedObject:(id)a3
{
  objc_storeStrong((id *)&self->_validatedObject, a3);
}

- (NSArray)errorMessages
{
  return self->_errorMessages;
}

- (void)setErrorMessages:(id)a3
{
  objc_storeStrong((id *)&self->_errorMessages, a3);
}

- (NSArray)infoMessages
{
  return self->_infoMessages;
}

- (void)setInfoMessages:(id)a3
{
  objc_storeStrong((id *)&self->_infoMessages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoMessages, 0);
  objc_storeStrong((id *)&self->_errorMessages, 0);
  objc_storeStrong((id *)&self->_validatedObject, 0);
}

@end
