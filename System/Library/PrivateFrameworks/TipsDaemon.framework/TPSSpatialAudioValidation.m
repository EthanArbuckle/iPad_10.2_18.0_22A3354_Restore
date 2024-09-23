@implementation TPSSpatialAudioValidation

- (void)validateWithCompletion:(id)a3
{
  void *v4;
  void (**v5)(id, uint64_t, _QWORD);
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;

  v4 = (void *)MEMORY[0x1E0DBF3A0];
  v5 = (void (**)(id, uint64_t, _QWORD))a3;
  objc_msgSend(v4, "minVersionForSpatialAudio");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("3A1");
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  +[TPSBluetoothChecker sharedInstance](TPSBluetoothChecker, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "bluetoothPairedForProductID:minimumVersion:", 8206, v9);

  if ((v11 & 1) != 0)
    goto LABEL_6;
  +[TPSBluetoothChecker sharedInstance](TPSBluetoothChecker, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "bluetoothPairedForProductID:minimumVersion:", 8202, v9);

  if ((v13 & 1) != 0
    || (+[TPSBluetoothChecker sharedInstance](TPSBluetoothChecker, "sharedInstance"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "bluetoothPairedForProductID:minimumVersion:", 8211, 0),
        v14,
        (v15 & 1) != 0))
  {
LABEL_6:
    v16 = 1;
  }
  else
  {
    +[TPSBluetoothChecker sharedInstance](TPSBluetoothChecker, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v19, "bluetoothPairedForProductID:minimumVersion:", 8212, 0);

  }
  v17 = v16 ^ -[TPSTargetingValidation BOOLValue](self, "BOOLValue") ^ 1;
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(self, v17, v18);

  v5[2](v5, v17, 0);
}

@end
