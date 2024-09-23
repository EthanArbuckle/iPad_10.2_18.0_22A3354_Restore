@implementation PKPeerPaymentConnectToIMDaemonController

void ___PKPeerPaymentConnectToIMDaemonController_block_invoke()
{
  NSObject *v0;
  void *v1;
  void *v2;
  void *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  PKLogFacilityTypeGetObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v0, OS_LOG_TYPE_DEFAULT, "Connecting to IMDaemonController", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addListenerID:capabilities:", CFSTR("PKPeerPaymentUIUtilities"), (*MEMORY[0x1E0D36CF8] | *MEMORY[0x1E0D36CD0]) | *MEMORY[0x1E0D36CE0]);

  objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blockUntilConnected");

  objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setBlocksConnectionAtResume:", 1);

  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v0, OS_LOG_TYPE_DEFAULT, "Connected to IMDaemonController", v4, 2u);
  }

}

@end
