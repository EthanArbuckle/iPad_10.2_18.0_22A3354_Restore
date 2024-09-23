@implementation PKSecureElementIsAvailable

void __PKSecureElementIsAvailable_block_invoke()
{
  id v0;
  int v1;
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v0 = PKGetClassNFHardwareManager();
  v1 = MGGetBoolAnswer();
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEphemeralMultiUser");

  if (v0)
  {
    byte_1ECF21C7E = v1 & (v3 ^ 1);
    if ((v1 & 1) != 0)
    {
      if ((v1 & (v3 ^ 1)) == 0)
        return;
      goto LABEL_9;
    }
  }
  else
  {
    byte_1ECF21C7E = 0;
    if ((v1 & 1) == 0)
      return;
  }
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18FC92000, v4, OS_LOG_TYPE_ERROR, "ERROR: Inconsistency between NearField Framework's existence and Mobile Gestalt's Secure Element availability.", buf, 2u);
  }

  if (byte_1ECF21C7E)
  {
LABEL_9:
    if (qword_1ECF21DF0 != -1)
      dispatch_once(&qword_1ECF21DF0, &__block_literal_global_603);
    if (byte_1ECF21C87)
    {
      objc_msgSend(PKGetClassNFSecureElement(), "embeddedSecureElementSerialNumber");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "length");

      if (!v6)
      {
        PKLogFacilityTypeGetObject(6uLL);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "+[NFSecureElement() embeddedSecureElementSerialNumber] not available. Please file a radar.", v8, 2u);
        }

        byte_1ECF21C7E = 0;
      }
    }
  }
}

@end
