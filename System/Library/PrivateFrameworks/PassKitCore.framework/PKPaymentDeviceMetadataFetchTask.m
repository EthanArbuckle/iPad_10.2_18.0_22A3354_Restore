@implementation PKPaymentDeviceMetadataFetchTask

- (PKPaymentDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMetadata, a3);
}

- (unint64_t)remaningFields
{
  return self->_remaningFields;
}

- (void)setRemaningFields:(unint64_t)a3
{
  self->_remaningFields = a3;
}

- (unint64_t)requestedFields
{
  return self->_requestedFields;
}

- (void)setRequestedFields:(unint64_t)a3
{
  self->_requestedFields = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
}

@end
