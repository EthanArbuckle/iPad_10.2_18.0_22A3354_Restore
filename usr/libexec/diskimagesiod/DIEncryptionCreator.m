@implementation DIEncryptionCreator

- (BOOL)allowStoringInKeychain
{
  return 1;
}

- (id)GUIPassphrasePrompt
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "inputURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Enter a new password to secure “%@”"), v4));

  return v5;
}

- (id)GUIPassphraseLabel
{
  return CFSTR("New password");
}

- (id)GUIVerifyPassphraseLabel
{
  return CFSTR("Verify");
}

- (id)CLIPassphrasePrompt
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "inputURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Enter a new password to secure “%@”: "), v4));

  return v5;
}

- (id)CLIVerifyPassphrasePrompt
{
  return CFSTR("Re-enter new password: ");
}

- (BOOL)createWithXpcHandler:(id)a3 error:(id *)a4
{
  id v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  void *v10;
  unsigned __int8 v11;
  BOOL v12;

  v6 = a3;
  v7 = -[DIEncryptionFrontend flags](self, "flags");
  v8 = v7;
  if ((v7 & 8) != 0)
  {
    v9 = -[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:](self, "consoleAskForPassphraseWithUseStdin:error:", 1, a4);
LABEL_10:
    v12 = v9;
    goto LABEL_11;
  }
  if ((v7 & 2) == 0)
    goto LABEL_3;
  if (!-[DIEncryptionFrontend consoleAskForPassphraseWithUseStdin:error:](self, "consoleAskForPassphraseWithUseStdin:error:", 0, a4))
  {
    v12 = 0;
    goto LABEL_11;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIEncryptionFrontend diParams](self, "diParams"));
  v11 = objc_msgSend(v10, "hasUnlockedBackend");

  if ((v11 & 1) == 0)
  {
LABEL_3:
    if ((v8 & 4) != 0)
      v9 = objc_msgSend(v6, "GUIAskForPassphraseWithEncryptionFrontend:error:", self, a4);
    else
      v9 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 25, CFSTR("Cannot retrieve passphrase from user via TTY or GUI"), a4);
    goto LABEL_10;
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)createAndStoreInSystemKeychainWithAccount:(id)a3 error:(id *)a4
{
  return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 1, CFSTR("System keychain access is not allowed on this platform"), a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
