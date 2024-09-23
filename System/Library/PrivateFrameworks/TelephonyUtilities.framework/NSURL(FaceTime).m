@implementation NSURL(FaceTime)

+ (id)faceTimePinExchangeScheme
{
  return legacySchemeIfEnabled(CFSTR("facetime"));
}

+ (id)faceTimeScheme
{
  return legacySchemeIfEnabled(CFSTR("facetime"));
}

+ (id)faceTimeAudioScheme
{
  return legacySchemeIfEnabled(CFSTR("facetime-audio"));
}

+ (id)faceTimeSystemCallControlsScheme
{
  return legacySchemeIfEnabled(CFSTR("system-call-controls"));
}

+ (id)faceTimeOpenLinkScheme
{
  return legacySchemeIfEnabled(CFSTR("incallservice-open-link"));
}

+ (id)faceTimeMultiwayScheme
{
  return legacySchemeIfEnabled(CFSTR("facetime-group"));
}

+ (id)TUDialRequestSchemeTelephony
{
  return legacySchemeIfEnabled(CFSTR("tel"));
}

+ (id)TUDialRequestSchemeFaceTime
{
  return legacySchemeIfEnabled(CFSTR("facetime"));
}

+ (id)TUDialRequestSchemeFaceTimeAudio
{
  return legacySchemeIfEnabled(CFSTR("facetime-audio"));
}

+ (id)faceTimeVideoMessageScheme
{
  return legacySchemeIfEnabled(CFSTR("facetime-video-message"));
}

- (id)faceTimeDestinationAccount
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "resourceSpecifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByRemovingPercentEncoding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "hasPrefix:", CFSTR("//")))
  {
    objc_msgSend(v2, "substringFromIndex:", 2);
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  v4 = objc_msgSend(v2, "rangeOfString:", CFSTR("/"));
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v2, "substringToIndex:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  v6 = objc_msgSend(v2, "rangeOfString:", CFSTR("?"));
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v2, "substringToIndex:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v7;
  }
  return v2;
}

- (BOOL)_isPhoneNumberID:()FaceTime
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("\\+?[0-9]+"), 1024);
  v6 = v4 + v5;
  v7 = objc_msgSend(v3, "length");

  return v6 == v7;
}

+ (id)_faceTimeURLWithDestinationID:()FaceTime addressBookUID:audioOnly:
{
  void *v8;
  void *v9;

  +[TUHandle handleWithDestinationID:](TUHandle, "handleWithDestinationID:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_faceTimeURLWithHandle:addressBookUID:audioOnly:", v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_faceTimeURLWithHandle:()FaceTime addressBookUID:audioOnly:
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a3;
  if ((a5 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeAudioScheme");
  else
    objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeScheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v9, "setScheme:", v8);
  objc_msgSend(v7, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _FormatDestinationID(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHost:", v11);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemForHandleType:", objc_msgSend(v7, "type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

  if ((_DWORD)a4 != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("uid"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v16);

  }
  if (objc_msgSend(v12, "count"))
  {
    v17 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v9, "setQueryItems:", v17);

  }
  objc_msgSend(v9, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (uint64_t)faceTimeURLWithDestinationID:()FaceTime
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "_faceTimeURLWithDestinationID:addressBookUID:audioOnly:", a3, 0xFFFFFFFFLL, 0);
}

+ (uint64_t)faceTimeURLWithDestinationID:()FaceTime addressBookUID:
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "_faceTimeURLWithDestinationID:addressBookUID:audioOnly:", a3, a4, 0);
}

+ (uint64_t)faceTimeURLWithDestinationID:()FaceTime addressBookUID:audioOnly:
{
  return objc_msgSend(MEMORY[0x1E0C99E98], "_faceTimeURLWithDestinationID:addressBookUID:audioOnly:");
}

+ (id)faceTimeURLWithDestinationID:()FaceTime addressBookUID:forceAssist:suppressAssist:wasAssisted:audioOnly:
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString **v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeURLWithDestinationID:addressBookUID:audioOnly:", a3, a4, a8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v12, "queryItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a5 & 1) != 0 || a6)
  {
    v16 = TelURLForceAssist;
    if (!a5)
      v16 = TelURLSuppressAssist;
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", *v16, CFSTR("1"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v17);

  }
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("wasAssisted"), CFSTR("1"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v18);

  }
  objc_msgSend(v12, "setQueryItems:", v15);
  objc_msgSend(v12, "URL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (uint64_t)faceTimeTelephonyURLWithPhoneNumber:()FaceTime
{
  return objc_msgSend(a1, "faceTimeTelephonyURLWithPhoneNumber:showPrompt:", a3, 0);
}

+ (id)faceTimeTelephonyURLWithPhoneNumber:()FaceTime showPrompt:
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  TUURLHostForTelephoneNumber(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "URLHostAllowedCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@"), CFSTR("tel"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((a4 & 1) == 0)
  {
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("?%@"), CFSTR("noprompt"));
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_applyFaceTimeScheme:()FaceTime toFaceTimeURL:
{
  id v5;
  id v6;
  char v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "isFaceTimeURL");
  v8 = objc_msgSend(v6, "isFaceTimeAudioURL");
  if ((v7 & 1) != 0 || v8)
  {
    objc_msgSend(v6, "resourceSpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "hasPrefix:", CFSTR("//")))
    {
      objc_msgSend(v9, "substringFromIndex:", 2);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@://%@"), v5, v9);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v12;
  }

  return v6;
}

+ (id)faceTimeURLWithURL:()FaceTime
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = a3;
  objc_msgSend(v3, "faceTimeScheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_applyFaceTimeScheme:toFaceTimeURL:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)faceTimePromptURLWithURL:()FaceTime
{
  id v3;
  int v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "isFaceTimeAudioURL");
  v5 = CFSTR("facetime-prompt");
  if (v4)
    v5 = CFSTR("facetime-audio-prompt");
  v6 = v5;
  objc_msgSend(v3, "URLByDeletingQueryParameterWithKey:", CFSTR("noprompt"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "_applyFaceTimeScheme:toFaceTimeURL:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)faceTimeLaunchForIncomingCallURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E98];
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@://"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLBySettingQueryParameterValue:forKey:", CFSTR("1"), CFSTR("launchForIncomingCall"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)faceTimeLaunchForOutgoingConversationURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E98];
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeMultiwayScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@://"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLBySettingQueryParameterValue:forKey:", CFSTR("1"), CFSTR("launchForOutgoingConversation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)faceTimeLaunchForScreeningURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E98];
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@://"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLBySettingQueryParameterValue:forKey:", CFSTR("1"), CFSTR("launchForScreening"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)faceTimeShowInCallUIURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E98];
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@://"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLBySettingQueryParameterValue:forKey:", CFSTR("1"), CFSTR("showInCallUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)faceTimeShowHandoffUIURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E98];
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@://"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLBySettingQueryParameterValue:forKey:", CFSTR("1"), CFSTR("showInCallUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)faceTimeShowInviteUIURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E98];
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@://"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLBySettingQueryParameterValue:forKey:", CFSTR("1"), CFSTR("showInCallUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)showKeypadURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E98];
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@://"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLBySettingQueryParameterValue:forKey:", CFSTR("1"), CFSTR("showKeypad"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)faceTimeShowCarPlayInCallUIURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E98];
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@://"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLBySettingQueryParameterValue:forKey:", CFSTR("1"), CFSTR("showCarPlayInCallUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)faceTimeShowSystemCallControlsURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E98];
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeSystemCallControlsScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@://"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLBySettingQueryParameterValue:forKey:", CFSTR("1"), CFSTR("showSystemCallControls"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)faceTimeShowHandoffEligibleNearbyURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E98];
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeSystemCallControlsScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@://"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLBySettingQueryParameterValue:forKey:", CFSTR("1"), CFSTR("showHandoffEligibleNearby"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)faceTimeShowLagunaPullConversationURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E98];
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeSystemCallControlsScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@://"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLBySettingQueryParameterValue:forKey:", CFSTR("1"), CFSTR("showLagunaPullConversation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)faceTimeShowIncomingTransmissionNoticeUIURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E98];
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@://"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLBySettingQueryParameterValue:forKey:", CFSTR("1"), CFSTR("showIncomingTransmissionNotice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)faceTimeShowAccessoryButtonEventsNoticeUIURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E98];
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@://"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLBySettingQueryParameterValue:forKey:", CFSTR("1"), CFSTR("showAccessoryButtonEventsNotice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)faceTimeUpdateForegroundAppURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E98];
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeSystemCallControlsScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@://"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLBySettingQueryParameterValue:forKey:", CFSTR("1"), CFSTR("updateForegroundApp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)faceTimeAppViewLinkDetailsURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://"), CFSTR("facetimeapp"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLBySettingQueryParameterValue:forKey:", CFSTR("1"), CFSTR("viewLinkDetails"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)faceTimeAppViewLinkRequesetDetailsURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://"), CFSTR("facetimeapp"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLBySettingQueryParameterValue:forKey:", CFSTR("1"), CFSTR("viewLinkRequestDetails"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)faceTimeNeedsBackgroundLaunchURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0C99E98];
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@://"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLBySettingQueryParameterValue:forKey:", CFSTR("1"), CFSTR("shouldBackgroundLaunch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)faceTimeAppJoinConversationLinkURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://"), CFSTR("facetimeapp"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLBySettingQueryParameterValue:forKey:", CFSTR("1"), CFSTR("joinConversationLink"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)faceTimeRefreshShareableContentURL
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(a1, "faceTimeSystemCallControlsScheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setScheme:", v3);

  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("refreshShareableContent"), CFSTR("1"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setQueryItems:", v5);

  objc_msgSend(v2, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)faceTimeUpdateForegroundAppURLForBundleIdentifier:()FaceTime applicationType:
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0CB3998];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(a1, "faceTimeUpdateForegroundAppURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithURL:resolvingAgainstBaseURL:", v9, 0);

  objc_msgSend(v10, "queryItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("bundleIdentifier"), v7);

  v13 = objc_alloc(MEMORY[0x1E0CB39D8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a4, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("applicationType"), v14);
  v20[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setQueryItems:", v17);

  objc_msgSend(v10, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)faceTimeAnswerURLWithSourceIdentifier:()FaceTime
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v3, "faceTimeScheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@://"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLBySettingQueryParameterValue:forKey:", v5, CFSTR("answerSourceIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)faceTimeAppViewLinkDetailsURLForPseudonym:()FaceTime
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3998];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(a1, "faceTimeAppViewLinkDetailsURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithURL:resolvingAgainstBaseURL:", v7, 0);

  objc_msgSend(v8, "queryItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("pseudonym"), v5);

  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setQueryItems:", v12);

  objc_msgSend(v8, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)facetimeAppViewLinkRequestDetailsURL
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CB3998]);
  objc_msgSend(a1, "faceTimeAppViewLinkRequesetDetailsURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithURL:resolvingAgainstBaseURL:", v3, 0);

  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)faceTimeAppJoinConversationURLForConversationLinkURL:()FaceTime
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3998];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(a1, "faceTimeAppJoinConversationLinkURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithURL:resolvingAgainstBaseURL:", v7, 0);

  objc_msgSend(v8, "queryItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0CB39D8]);
  objc_msgSend(v5, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("conversationLink"), v11);
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setQueryItems:", v14);

  objc_msgSend(v8, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)faceTimeRefreshShareableContentURLForBundleIdentifier:()FaceTime
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0CB3998];
  v5 = a3;
  objc_msgSend(a1, "faceTimeRefreshShareableContentURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsWithURL:resolvingAgainstBaseURL:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "queryItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("bundleIdentifier"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "arrayByAddingObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setQueryItems:", v10);

  objc_msgSend(v7, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)faceTimeVideoMessagePlaybackURLForUUID:()FaceTime
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB3998];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeVideoMessageScheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScheme:", v6);

  objc_msgSend(v5, "setHost:", CFSTR("player"));
  v7 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v4, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "queryItemWithName:value:", CFSTR("uuid"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQueryItems:", v10);

  objc_msgSend(v5, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)faceTimeAppVideoMessagePlaybackURLForUUID:()FaceTime
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB3998];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setScheme:", CFSTR("facetimeapp"));
  objc_msgSend(v5, "setHost:", CFSTR("player"));
  v6 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "queryItemWithName:value:", CFSTR("uuid"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQueryItems:", v9);

  objc_msgSend(v5, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)openNoteURLForRecordingSession:()FaceTime
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0CB3998];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setScheme:", CFSTR("applenotes"));
  objc_msgSend(v5, "setHost:", CFSTR("showNote"));
  v6 = (void *)MEMORY[0x1E0CB39D8];
  objc_msgSend(v4, "callUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "queryItemWithName:value:", CFSTR("identifier"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQueryItems:", v9);

  objc_msgSend(v5, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (uint64_t)isFaceTimeURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToIgnoringCase:", v2) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v1, "isEqualToIgnoringCase:", CFSTR("facetime-prompt"));

  return v3;
}

- (uint64_t)isFaceTimePromptURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToIgnoringCase:", CFSTR("facetime-prompt"));

  return v2;
}

- (uint64_t)isFaceTimeAudioURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeAudioScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToIgnoringCase:", v2) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v1, "isEqualToIgnoringCase:", CFSTR("facetime-audio-prompt"));

  return v3;
}

- (uint64_t)isFaceTimeAudioPromptURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToIgnoringCase:", CFSTR("facetime-audio-prompt"));

  return v2;
}

- (uint64_t)isFaceTimeMultiwayURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeMultiwayScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqualToString:", v2);

  return v3;
}

- (uint64_t)isSystemCallControlsURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeSystemCallControlsScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqualToString:", v2);

  return v3;
}

- (uint64_t)isFaceTimeAppViewLinkDetailsURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("viewLinkDetails"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("1"));

  return v3;
}

- (uint64_t)isFaceTimeAppViewLinkRequestDetailsURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("viewLinkRequestDetails"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("1"));

  return v3;
}

- (id)pseudonymForLinkDetailsView
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "isFaceTimeAppViewLinkDetailsURL"))
    return 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", a1, 0);
  objc_msgSend(v2, "queryItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = v3;
  v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "name", (_QWORD)v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("pseudonym"));

        if ((v11 & 1) != 0)
        {
          objc_msgSend(v9, "value");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v4;
          goto LABEL_15;
        }
      }
      v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v6)
        continue;
      break;
    }
  }

  TUDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[NSURL(FaceTime) pseudonymForLinkDetailsView].cold.1((uint64_t)a1, v12, v13, v14, v15, v16, v17, v18);
  v19 = 0;
LABEL_15:

  return v19;
}

- (uint64_t)isFaceTimeOpenLinkURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "faceTimeOpenLinkScheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqualToString:", v2);

  return v3;
}

- (id)conversationLinkURLForOpenLinkURL
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "isFaceTimeOpenLinkURL"))
    return 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", a1, 0);
  objc_msgSend(v2, "queryItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = v3;
  v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v9, "name", (_QWORD)v23);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("link"));

        if ((v11 & 1) != 0)
        {
          v21 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v9, "value");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "URLWithString:", v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = v4;
          goto LABEL_15;
        }
      }
      v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v6)
        continue;
      break;
    }
  }

  TUDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[NSURL(FaceTime) conversationLinkURLForOpenLinkURL].cold.1((uint64_t)a1, v12, v13, v14, v15, v16, v17, v18);
  v19 = 0;
LABEL_15:

  return v19;
}

- (uint64_t)isFaceTimeAppJoinConversationLinkURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("joinConversationLink"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("1"));

  return v3;
}

- (id)conversationLinkURLForJoinConversation
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "isFaceTimeAppJoinConversationLinkURL"))
    return 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", a1, 0);
  objc_msgSend(v2, "queryItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = v3;
  v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v9, "name", (_QWORD)v23);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("conversationLink"));

        if ((v11 & 1) != 0)
        {
          v21 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v9, "value");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "URLWithString:", v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = v4;
          goto LABEL_15;
        }
      }
      v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v6)
        continue;
      break;
    }
  }

  TUDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[NSURL(FaceTime) conversationLinkURLForOpenLinkURL].cold.1((uint64_t)a1, v12, v13, v14, v15, v16, v17, v18);
  v19 = 0;
LABEL_15:

  return v19;
}

- (BOOL)hasNoPromptOption
{
  _BOOL8 v2;
  void *v3;

  if ((objc_msgSend(a1, "isFaceTimePromptURL") & 1) != 0 || (objc_msgSend(a1, "isFaceTimeAudioPromptURL") & 1) != 0)
    return 0;
  objc_msgSend(a1, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("telprompt")) != 0;

  return v2;
}

- (uint64_t)isDialCallURL
{
  if ((objc_msgSend(a1, "isLaunchForIncomingCallURL") & 1) != 0)
    return 0;
  else
    return objc_msgSend(a1, "isShowInCallUIURL") ^ 1;
}

- (uint64_t)isLaunchForIncomingCallURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("launchForIncomingCall"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("1"));

  return v3;
}

- (uint64_t)isLaunchForOutgoingConversationURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("launchForOutgoingConversation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("1"));

  return v3;
}

- (uint64_t)isLaunchForScreeningURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("launchForScreening"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("1"));

  return v3;
}

- (uint64_t)isShowInCallUIURL
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("showInCallUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("1")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v1, "objectForKey:", CFSTR("showCarPlayInCallUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isEqualToString:", CFSTR("1"));

  }
  return v3;
}

- (uint64_t)isShowKeypadURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("showKeypad"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("1"));

  return v3;
}

- (uint64_t)isShowIncomingTransmissionNoticeURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("showIncomingTransmissionNotice"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("1"));

  return v3;
}

- (uint64_t)isShowAccessoryButtonEventsNoticeURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("showAccessoryButtonEventsNotice"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("1"));

  return v3;
}

- (uint64_t)isShowCarPlayInCallUIURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("showCarPlayInCallUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("1"));

  return v3;
}

- (uint64_t)isShowSystemCallControlsURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("showSystemCallControls"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("1"));

  return v3;
}

- (uint64_t)isShowHandoffEligibleNearbyURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("showHandoffEligibleNearby"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("1"));

  return v3;
}

- (uint64_t)isShowLagunaPullConversationURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("showLagunaPullConversation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("1"));

  return v3;
}

- (uint64_t)isShowScreenSharingURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("system-screen-sharing"));

  return v2;
}

- (uint64_t)isUpdateForegroundAppURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("updateForegroundApp"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("1"));

  return v3;
}

- (uint64_t)isRefreshShareableContentURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("refreshShareableContent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("1"));

  return v3;
}

- (uint64_t)isVideoMessagePlaybackURL
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("facetime-video-message")))
  {
    objc_msgSend(a1, "host");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("player"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)isFaceTimeAppVideoMessagePlaybackURL
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("facetimeapp")))
  {
    objc_msgSend(a1, "host");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("player"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)videoMessageUUID
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;

  if ((objc_msgSend(a1, "isVideoMessagePlaybackURL") & 1) != 0
    || objc_msgSend(a1, "isFaceTimeAppVideoMessagePlaybackURL"))
  {
    v2 = objc_alloc(MEMORY[0x1E0CB3998]);
    objc_msgSend(a1, "absoluteString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithString:", v3);

    objc_msgSend(v4, "queryItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("uuid"));

    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v6, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (BOOL)isFaceTimeRecentsDetailsViewURL
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("facetime-recents")))
  {
    objc_msgSend(a1, "recentsUniqueID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length") != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)recentsUniqueID
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = objc_alloc(MEMORY[0x1E0CB3998]);
  objc_msgSend(a1, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithString:", v3);

  objc_msgSend(v4, "queryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("uniqueId")) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(v6, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v6, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v9;
}

- (id)foregroundAppBundleIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("bundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)foregroundAppApplicationType
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("applicationType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (uint64_t)isFaceTimeNeedsBackgroundLaunchURL
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("shouldBackgroundLaunch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("1"));

  return v3;
}

- (BOOL)isAnswerRequestURL
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("answerSourceIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)answerRequestSourceIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("answerSourceIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)screenSharingAppURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://"), CFSTR("system-screen-sharing"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("updateForegroundApp"), CFSTR("1"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v2, 0);
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryItems:", v5);

  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)pseudonymForLinkDetailsView
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "Unable to extract pseudonym from URL: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)conversationLinkURLForOpenLinkURL
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "Unable to extract conversationLink from URL: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
