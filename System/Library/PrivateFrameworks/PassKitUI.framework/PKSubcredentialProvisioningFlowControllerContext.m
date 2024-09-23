@implementation PKSubcredentialProvisioningFlowControllerContext

- (PKSubcredentialProvisioningFlowControllerContext)initWithFlowType:(int64_t)a3
{
  PKSubcredentialProvisioningFlowControllerContext *result;

  result = -[PKSubcredentialProvisioningFlowControllerContext init](self, "init");
  if (result)
    result->_flowType = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFlowType:", self->_flowType);
  objc_msgSend(v4, "setLocalDeviceWebService:", self->_localDeviceWebService);
  objc_msgSend(v4, "setRemoteDeviceWebService:", self->_remoteDeviceWebService);
  objc_msgSend(v4, "setProvisionedPass:", self->_provisionedPass);
  objc_msgSend(v4, "setProvisionedRemotePass:", self->_provisionedRemotePass);
  objc_msgSend(v4, "setError:", self->_error);
  objc_msgSend(v4, "setShouldExitFlowOnError:", self->_shouldExitFlowOnError);
  return v4;
}

- (int64_t)setupContext
{
  int64_t flowType;

  flowType = self->_flowType;
  if (flowType == 4)
    return 5;
  else
    return 4 * (flowType == 3);
}

- (int64_t)flowType
{
  return self->_flowType;
}

- (PKPaymentWebService)localDeviceWebService
{
  return self->_localDeviceWebService;
}

- (void)setLocalDeviceWebService:(id)a3
{
  objc_storeStrong((id *)&self->_localDeviceWebService, a3);
}

- (PKPaymentWebService)remoteDeviceWebService
{
  return self->_remoteDeviceWebService;
}

- (void)setRemoteDeviceWebService:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDeviceWebService, a3);
}

- (PKPaymentPass)provisionedPass
{
  return self->_provisionedPass;
}

- (void)setProvisionedPass:(id)a3
{
  objc_storeStrong((id *)&self->_provisionedPass, a3);
}

- (PKPaymentPass)provisionedRemotePass
{
  return self->_provisionedRemotePass;
}

- (void)setProvisionedRemotePass:(id)a3
{
  objc_storeStrong((id *)&self->_provisionedRemotePass, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)shouldExitFlowOnError
{
  return self->_shouldExitFlowOnError;
}

- (void)setShouldExitFlowOnError:(BOOL)a3
{
  self->_shouldExitFlowOnError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_provisionedRemotePass, 0);
  objc_storeStrong((id *)&self->_provisionedPass, 0);
  objc_storeStrong((id *)&self->_remoteDeviceWebService, 0);
  objc_storeStrong((id *)&self->_localDeviceWebService, 0);
}

@end
