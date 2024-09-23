@implementation KmlEndpointManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ppidTlvData, 0);
  objc_storeStrong((id *)&self->_versionInformation, 0);
  objc_storeStrong((id *)&self->_additionalAttestationsDict, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_slotIdentifier, 0);
  objc_storeStrong((id *)&self->_bleOobKey, 0);
  objc_storeStrong((id *)&self->_bleIntroKey, 0);
  objc_storeStrong((id *)&self->_productPlanIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceConfigData, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_immoTokenData, 0);
  objc_storeStrong((id *)&self->_attestationPackage, 0);
  objc_storeStrong((id *)&self->_trackingReceipt, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifierStr, 0);
}

@end
