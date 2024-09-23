@implementation PKBridgeSetupAssistantContext

- (PKBridgeSetupAssistantContext)init
{
  return -[PKSetupAssistantContext initWithSetupAssistant:](self, "initWithSetupAssistant:", 2);
}

- (void)extendableDescription:(id)a3
{
  id v4;
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKBridgeSetupAssistantContext;
  v4 = a3;
  -[PKSetupAssistantContext extendableDescription:](&v6, sel_extendableDescription_, v4);
  objc_msgSend(v4, "appendFormat:", CFSTR("dataProvider: '%@'; "), self->_dataProvider);
  WeakRetained = objc_loadWeakRetained((id *)&self->_peerPaymentDelegate);
  objc_msgSend(v4, "appendFormat:", CFSTR("peerPaymentDelegate: '%@'; "), WeakRetained);

  objc_msgSend(v4, "appendFormat:", CFSTR("pairingFamilyMember: '%@'; "), self->_pairingFamilyMember);
  objc_msgSend(v4, "appendFormat:", CFSTR("parentFamilyMember: '%@'; "), self->_parentFamilyMember);

}

- (PKPassLibraryDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (PKSetupAssistantPeerPaymentAddAssociatedAccountDelegate)peerPaymentDelegate
{
  return (PKSetupAssistantPeerPaymentAddAssociatedAccountDelegate *)objc_loadWeakRetained((id *)&self->_peerPaymentDelegate);
}

- (void)setPeerPaymentDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_peerPaymentDelegate, a3);
}

- (FAFamilyMember)pairingFamilyMember
{
  return self->_pairingFamilyMember;
}

- (void)setPairingFamilyMember:(id)a3
{
  objc_storeStrong((id *)&self->_pairingFamilyMember, a3);
}

- (FAFamilyMember)parentFamilyMember
{
  return self->_parentFamilyMember;
}

- (void)setParentFamilyMember:(id)a3
{
  objc_storeStrong((id *)&self->_parentFamilyMember, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentFamilyMember, 0);
  objc_storeStrong((id *)&self->_pairingFamilyMember, 0);
  objc_destroyWeak((id *)&self->_peerPaymentDelegate);
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end
