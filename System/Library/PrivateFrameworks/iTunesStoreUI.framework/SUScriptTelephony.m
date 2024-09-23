@implementation SUScriptTelephony

- (SUScriptTelephony)init
{
  SUScriptTelephony *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScriptTelephony;
  v2 = -[SUScriptObject init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEB2090], "sharedController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__handleOperatorNameChangedNotification_, *MEMORY[0x24BEB2B88], v3);
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__handlePhoneNumberChangedNotification_, *MEMORY[0x24BEB2B90], v3);
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel__handleRegistrationChangedNotification_, *MEMORY[0x24BEB2B98], v3);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BEB2090], "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEB2B88], v3);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEB2B90], v3);
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEB2B98], v3);

  v5.receiver = self;
  v5.super_class = (Class)SUScriptTelephony;
  -[SUScriptObject dealloc](&v5, sel_dealloc);
}

- (id)_className
{
  return CFSTR("iTunesTelephony");
}

- (NSString)countryCode
{
  void *active;

  if (-[SUScriptTelephony _checkIfIsAllowed](self, "_checkIfIsAllowed"))
    active = (void *)CPPhoneNumberCopyActiveCountryCode();
  else
    active = 0;
  return (NSString *)active;
}

- (id)isCellularRoaming
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  const void *Value;
  int v5;
  id *v6;

  if (!-[SUScriptTelephony _checkIfIsAllowed](self, "_checkIfIsAllowed"))
    goto LABEL_8;
  v2 = (const __CFDictionary *)CTRegistrationCopyDataStatus();
  if (!v2)
    goto LABEL_8;
  v3 = v2;
  Value = CFDictionaryGetValue(v2, (const void *)*MEMORY[0x24BDC2C38]);
  if (!Value)
  {
    CFRelease(v3);
LABEL_8:
    v6 = (id *)MEMORY[0x24BDBD268];
    return *v6;
  }
  v5 = CFEqual(Value, (CFTypeRef)*MEMORY[0x24BDC2C68]);
  CFRelease(v3);
  v6 = (id *)MEMORY[0x24BDBD270];
  if (!v5)
    v6 = (id *)MEMORY[0x24BDBD268];
  return *v6;
}

- (id)isGreenTea
{
  int v2;
  id *v3;

  v2 = MGGetBoolAnswer();
  v3 = (id *)MEMORY[0x24BDBD270];
  if (!v2)
    v3 = (id *)MEMORY[0x24BDBD268];
  return *v3;
}

- (NSString)mobileCountryCode
{
  void *v2;
  void *v3;

  if (-[SUScriptTelephony _checkIfIsAllowed](self, "_checkIfIsAllowed"))
  {
    objc_msgSend(MEMORY[0x24BEB2090], "sharedController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "mobileSubscriberCountryCode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)mobileNetworkCode
{
  void *v2;
  void *v3;

  if (-[SUScriptTelephony _checkIfIsAllowed](self, "_checkIfIsAllowed"))
  {
    objc_msgSend(MEMORY[0x24BEB2090], "sharedController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "mobileSubscriberNetworkCode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)operatorName
{
  void *v2;
  void *v3;

  if (-[SUScriptTelephony _checkIfIsAllowed](self, "_checkIfIsAllowed"))
  {
    objc_msgSend(MEMORY[0x24BEB2090], "sharedController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "operatorName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)phoneNumber
{
  void *v2;
  void *v3;

  if (-[SUScriptTelephony _checkIfIsAllowed](self, "_checkIfIsAllowed"))
  {
    objc_msgSend(MEMORY[0x24BEB2090], "sharedController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "phoneNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)providerName
{
  void *v2;
  void *v3;

  if (-[SUScriptTelephony _checkIfIsAllowed](self, "_checkIfIsAllowed"))
  {
    objc_msgSend(MEMORY[0x24BEB2090], "sharedController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "providerName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (id)formattedPhoneNumber:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[SUScriptTelephony _checkIfIsAllowed](self, "_checkIfIsAllowed"))
    v5 = (void *)CPPhoneNumberCopyFormattedStringForTextMessage();
  else
    v5 = 0;

  return v5;
}

- (id)sendSMSWithBodyText:(id)a3 digits:(id)a4 countryCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  id *v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[SUScriptTelephony _checkIfIsAllowed](self, "_checkIfIsAllowed"))
    goto LABEL_13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

    v10 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"));
LABEL_13:
    v13 = (id *)MEMORY[0x24BDBD268];
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BEB2090], "sharedController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "sendSMSWithText:toPhoneNumber:countryCode:error:", v8, v9, v10, 0);

  v13 = (id *)MEMORY[0x24BDBD270];
  if (!v12)
    v13 = (id *)MEMORY[0x24BDBD268];
LABEL_14:
  v14 = *v13;

  return v14;
}

- (void)_handleOperatorNameChangedNotification:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](self, "dispatchEvent:forName:", 0, CFSTR("operatorchange"));
}

- (void)_handlePhoneNumberChangedNotification:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](self, "dispatchEvent:forName:", 0, CFSTR("phonenumberchange"));
}

- (void)_handleRegistrationChangedNotification:(id)a3
{
  -[SUScriptObject dispatchEvent:forName:](self, "dispatchEvent:forName:", 0, CFSTR("registrationchange"));
}

- (BOOL)_checkIfIsAllowed
{
  SUScriptAccessSecurity *v3;
  void *v4;
  BOOL v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;
  id v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(SUScriptAccessSecurity);
  -[SUScriptObject webFrame](self, "webFrame");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v5 = -[SUScriptAccessSecurity canAccessTelephonyInFrame:error:](v3, "canAccessTelephonyInFrame:error:", v4, &v16);
  v6 = v16;

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      v9 &= 2u;
    if (v9)
    {
      v11 = (void *)objc_opt_class();
      v17 = 138412546;
      v18 = v11;
      v19 = 2112;
      v20 = v6;
      v12 = v11;
      LODWORD(v15) = 22;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, &v17, v15);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog();
    }

    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  objc_msgSend((id)__KeyMapping_55, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptTelephony;
    objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  void *v5;
  objc_super v7;

  SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_40, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptTelephony;
    objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)scriptAttributeKeys
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUScriptTelephony;
  -[SUScriptObject scriptAttributeKeys](&v5, sel_scriptAttributeKeys);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__KeyMapping_55, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  return v2;
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_40 = (uint64_t)sel_formattedPhoneNumber_;
    unk_255186CD0 = CFSTR("formattedPhoneNumber");
    qword_255186CD8 = (uint64_t)sel_sendSMSWithBodyText_digits_countryCode_;
    unk_255186CE0 = CFSTR("sendSMS");
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("countryCode"), CFSTR("isCellularRoaming"), CFSTR("isCellularRoaming"), CFSTR("isGreenTea"), CFSTR("isGreenTea"), CFSTR("mobileCountryCode"), CFSTR("mobileCountryCode"), CFSTR("mobileNetworkCode"), CFSTR("mobileNetworkCode"), CFSTR("operatorName"), CFSTR("operatorName"), CFSTR("phoneNumber"), CFSTR("phoneNumber"), CFSTR("providerName"), CFSTR("providerName"), 0);
    v3 = (void *)__KeyMapping_55;
    __KeyMapping_55 = v2;

  }
}

@end
