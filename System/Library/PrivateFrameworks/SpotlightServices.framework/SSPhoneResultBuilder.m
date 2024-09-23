@implementation SSPhoneResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.mobilephone");
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSPhoneResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSPhoneResultBuilder *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SSPhoneResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v23, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA67C8], objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
    -[SSPhoneResultBuilder setRecipientContactIdentifiers:](v5, "setRecipientContactIdentifiers:", v8);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6028], objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v9;
    else
      v11 = 0;
    -[SSPhoneResultBuilder setSenderContactIdentifiers:](v5, "setSenderContactIdentifiers:", v11);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6558], objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSPhoneResultBuilder setCallbackURL:](v5, "setCallbackURL:", v13);

    }
    else
    {
      -[SSPhoneResultBuilder setCallbackURL:](v5, "setCallbackURL:", 0);
    }
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA67F0], objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPhoneResultBuilder setCallSourceApplicationBundleIdentifier:](v5, "setCallSourceApplicationBundleIdentifier:", v14);

    -[SSResultBuilder result](v5, "result");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPhoneResultBuilder setIsVoicemail:](v5, "setIsVoicemail:", objc_msgSend(v16, "isEqualToString:", CFSTR("kSpotlightItemTypeVoicemail")));

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA68B8], objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPhoneResultBuilder setVoicemailTranscription:](v5, "setVoicemailTranscription:", v17);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA60D0], objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPhoneResultBuilder setCallDate:](v5, "setCallDate:", v18);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6560], objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPhoneResultBuilder setIsMissedCall:](v5, "setIsMissedCall:", objc_msgSend(v19, "containsString:", CFSTR("Missed")));
    -[SSPhoneResultBuilder setIsOutgoingCall:](v5, "setIsOutgoingCall:", objc_msgSend(v19, "containsString:", CFSTR("Outgoing")));
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6568], objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPhoneResultBuilder setIsVideoCall:](v5, "setIsVideoCall:", objc_msgSend(v20, "isEqualToString:", CFSTR("Video")));

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6150], objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSPhoneResultBuilder setCallOrigin:](v5, "setCallOrigin:", v21);

  }
  return v5;
}

- (id)buildTitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[SSPhoneResultBuilder voicemailTranscription](self, "voicemailTranscription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[SSPhoneResultBuilder voicemailTranscription](self, "voicemailTranscription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder buildHighlightedTextWithString:includeQuotes:](self, "buildHighlightedTextWithString:includeQuotes:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setMaxLines:", 2);
    return v6;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SSPhoneResultBuilder;
    -[SSResultBuilder buildTitle](&v13, sel_buildTitle);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SSPhoneResultBuilder isMissedCall](self, "isMissedCall"))
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(v8, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v10);

      objc_msgSend(v9, "setTextColor:", 1);
      v11 = (void *)objc_opt_new();

      v14[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFormattedTextPieces:", v12);

      v8 = v11;
    }
    return v8;
  }
}

- (id)buildDescriptions
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[SSPhoneResultBuilder voicemailTranscription](self, "voicemailTranscription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v18.receiver = self;
    v18.super_class = (Class)SSPhoneResultBuilder;
    -[SSResultBuilder buildTitle](&v18, sel_buildTitle);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v7, "length"))
      goto LABEL_7;
  }
  else
  {
    -[SSPhoneResultBuilder callOrigin](self, "callOrigin");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (!v9)
      goto LABEL_8;
    -[SSPhoneResultBuilder callOrigin](self, "callOrigin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "addObject:", v7);
LABEL_7:

LABEL_8:
  -[SSPhoneResultBuilder callDate](self, "callDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SSPhoneResultBuilder callDate](self, "callDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSDateFormatManager dynamicCompactStringFromDate:](SSDateFormatManager, "dynamicCompactStringFromDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  if (objc_msgSend(v3, "count"))
  {
    v13 = (void *)MEMORY[0x1E0D8C660];
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" · "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textWithString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)numberOfLinesForDescriptions
{
  return 1;
}

- (id)buildThumbnail
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[SSPhoneResultBuilder contactIdentifiers](self, "contactIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContactIdentifiers:", v4);

  objc_msgSend(v3, "setThreeDTouchEnabled:", 1);
  return v3;
}

- (id)contactIdentifiers
{
  if (-[SSPhoneResultBuilder isOutgoingCall](self, "isOutgoingCall"))
    -[SSPhoneResultBuilder recipientContactIdentifiers](self, "recipientContactIdentifiers");
  else
    -[SSPhoneResultBuilder senderContactIdentifiers](self, "senderContactIdentifiers");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bundleIdentifierForAppIconBadgeImage
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[SSPhoneResultBuilder callSourceApplicationBundleIdentifier](self, "callSourceApplicationBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "bundleId");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)buildAction
{
  return 0;
}

- (id)buildButtonItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = (void *)objc_opt_new();
  if (-[SSPhoneResultBuilder isVoicemail](self, "isVoicemail"))
  {
    v4 = (void *)objc_opt_new();
    -[SSResultBuilder result](self, "result");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMediaIdentifier:", v6);

    objc_msgSend(v4, "setMediaType:", 100);
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setMediaMetadata:", v4);
    objc_msgSend(v3, "addObject:", v7);

  }
  -[SSPhoneResultBuilder callbackURL](self, "callbackURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)objc_opt_new();
    v10 = (void *)MEMORY[0x1E0D8C5E0];
    -[SSPhoneResultBuilder callbackURL](self, "callbackURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "punchoutWithURL:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPunchout:", v12);

    v13 = (void *)objc_opt_new();
    if (-[SSPhoneResultBuilder isVideoCall](self, "isVideoCall"))
      v14 = CFSTR("video");
    else
      v14 = CFSTR("phone");
    objc_msgSend(v13, "setSymbolName:", v14);
    objc_msgSend(v13, "setIsTemplate:", 1);
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setCommand:", v9);
    objc_msgSend(v15, "setImage:", v13);
    objc_msgSend(v3, "addObject:", v15);

  }
  if (objc_msgSend(v3, "count"))
    v16 = v3;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

- (id)buildCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[SSResultBuilder coreSpotlightId](self, "coreSpotlightId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCoreSpotlightIdentifier:", v4);

  -[SSResultBuilder result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setApplicationBundleIdentifier:", v6);

  return v3;
}

- (BOOL)buildButtonItemsAreTrailing
{
  return 1;
}

- (id)buildPreviewButtonItems
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[SSPhoneResultBuilder contactIdentifiers](self, "contactIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count")
    && (-[SSPhoneResultBuilder voicemailTranscription](self, "voicemailTranscription"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "length"),
        v4,
        !v5))
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v3, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContactIdentifier:", v8);

    v9 = (void *)MEMORY[0x1E0CB37E8];
    if (-[SSPhoneResultBuilder isVideoCall](self, "isVideoCall"))
      v10 = 3;
    else
      v10 = 4;
    objc_msgSend(v9, "numberWithInt:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActionTypesToShow:", v12);

    v15 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SSPhoneResultBuilder;
    -[SSResultBuilder buildPreviewButtonItems](&v14, sel_buildPreviewButtonItems);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (NSArray)recipientContactIdentifiers
{
  return self->_recipientContactIdentifiers;
}

- (void)setRecipientContactIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_recipientContactIdentifiers, a3);
}

- (NSArray)senderContactIdentifiers
{
  return self->_senderContactIdentifiers;
}

- (void)setSenderContactIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_senderContactIdentifiers, a3);
}

- (NSURL)callbackURL
{
  return self->_callbackURL;
}

- (void)setCallbackURL:(id)a3
{
  objc_storeStrong((id *)&self->_callbackURL, a3);
}

- (NSString)callSourceApplicationBundleIdentifier
{
  return self->_callSourceApplicationBundleIdentifier;
}

- (void)setCallSourceApplicationBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_callSourceApplicationBundleIdentifier, a3);
}

- (NSDate)callDate
{
  return self->_callDate;
}

- (void)setCallDate:(id)a3
{
  objc_storeStrong((id *)&self->_callDate, a3);
}

- (NSString)voicemailTranscription
{
  return self->_voicemailTranscription;
}

- (void)setVoicemailTranscription:(id)a3
{
  objc_storeStrong((id *)&self->_voicemailTranscription, a3);
}

- (NSString)callOrigin
{
  return self->_callOrigin;
}

- (void)setCallOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_callOrigin, a3);
}

- (BOOL)isMissedCall
{
  return self->_isMissedCall;
}

- (void)setIsMissedCall:(BOOL)a3
{
  self->_isMissedCall = a3;
}

- (BOOL)isOutgoingCall
{
  return self->_isOutgoingCall;
}

- (void)setIsOutgoingCall:(BOOL)a3
{
  self->_isOutgoingCall = a3;
}

- (BOOL)isVideoCall
{
  return self->_isVideoCall;
}

- (void)setIsVideoCall:(BOOL)a3
{
  self->_isVideoCall = a3;
}

- (BOOL)isVoicemail
{
  return self->_isVoicemail;
}

- (void)setIsVoicemail:(BOOL)a3
{
  self->_isVoicemail = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callOrigin, 0);
  objc_storeStrong((id *)&self->_voicemailTranscription, 0);
  objc_storeStrong((id *)&self->_callDate, 0);
  objc_storeStrong((id *)&self->_callSourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_callbackURL, 0);
  objc_storeStrong((id *)&self->_senderContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_recipientContactIdentifiers, 0);
}

@end
