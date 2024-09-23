@implementation PKSharingMessage

- (PKSharingMessage)init
{

  return 0;
}

- (PKSharingMessage)initWithContent:(id)a3 format:(unint64_t)a4 type:(unint64_t)a5 displayInformation:(id)a6
{
  id v10;
  id v11;
  void *v12;
  PKSharingMessage *v13;

  v10 = a3;
  v11 = a6;
  +[PKSharingMessage _payloadForContent:format:]((uint64_t)PKSharingMessage, v10, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PKSharingMessage _initWithPayload:format:type:displayInformation:](self, "_initWithPayload:format:type:displayInformation:", v12, a4, a5, v11);

  if (v13 && !-[PKSharingMessage configureWithContent:](v13, "configureWithContent:", v10))
  {

    v13 = 0;
  }

  return v13;
}

+ (id)_payloadForContent:(uint64_t)a3 format:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_opt_self();
  if (PKSharingSimulateCrossPlatformShare())
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("apple"));

    v4 = v5;
  }
  v17[0] = CFSTR("format");
  PKSharingMessageFormatToString(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("content");
  v18[0] = v6;
  v18[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 1, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  v10 = v9;
  if (!v8 || v9)
  {
    PKLogFacilityTypeGetObject(0x20uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "PKSharingMessage: unable to serialize json with error %@", buf, 0xCu);
    }

    v11 = 0;
  }
  else
  {
    v11 = v8;
  }

  return v11;
}

- (id)_initWithPayload:(id)a3 format:(unint64_t)a4 type:(unint64_t)a5 displayInformation:(id)a6
{
  id v11;
  id v12;
  PKSharingMessage *v13;
  PKSharingMessage *v14;
  id v15;
  uint64_t v16;
  NSString *identifier;
  PKSharingMessage *v18;
  objc_super v20;

  v11 = a3;
  v12 = a6;
  if (v11)
  {
    v20.receiver = self;
    v20.super_class = (Class)PKSharingMessage;
    v13 = -[PKSharingMessage init](&v20, sel_init);
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_payload, a3);
      v14->_type = a5;
      v14->_format = a4;
      objc_storeStrong((id *)&v14->_displayInformation, a6);
      v15 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v15, "UUIDString");
      v16 = objc_claimAutoreleasedReturnValue();
      identifier = v14->_identifier;
      v14->_identifier = (NSString *)v16;

    }
    self = v14;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)specializedMessageFromPayload:(id)a3 displayInformation:(id)a4 outError:(id *)a5
{
  id *v5;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[6];
  id v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  const __CFString *v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v5 = a5;
  v42 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v7 = (void *)MEMORY[0x1E0CB36D8];
    v35 = 0;
    v33 = a4;
    v8 = a3;
    objc_msgSend(v7, "JSONObjectWithData:options:error:", v8, 0, &v35);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v35;
    v11 = v10;
    if (v10)
      *v5 = objc_retainAutorelease(v10);
    objc_msgSend(v9, "PKDictionaryForKey:", CFSTR("content"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "PKStringForKey:", CFSTR("format"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = PKSharingMessageFormatFromString(v13);

    PKSharingMessageGenericDataKeyForFormat(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "PKDictionaryForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "PKIntegerForKey:", CFSTR("sharingDataType"));
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __78__PKSharingMessage_specializedMessageFromPayload_displayInformation_outError___block_invoke;
    v34[3] = &__block_descriptor_48_e23___PKSharingMessage_8__0l;
    v34[4] = v14;
    v34[5] = v17;
    __78__PKSharingMessage_specializedMessageFromPayload_displayInformation_outError___block_invoke((uint64_t)v34);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PKLogFacilityTypeGetObject(0x20uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (!v18)
    {
      v31 = v12;
      v32 = v11;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        PKSharingMessageFormatToString(v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v41 = v21;
        _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "PKSharingMessage: Unable to find specalized message class for format: '%@'", buf, 0xCu);

      }
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v38 = *MEMORY[0x1E0CB2D50];
      v39 = CFSTR("Message format not supported");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("PKAddSecureElementPassErrorDomain"), 0, v23);
      *v5 = (id)objc_claimAutoreleasedReturnValue();

      v12 = v31;
      v11 = v32;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v9;
      _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "PKSharingMessage: creating message from: \n %@", buf, 0xCu);
    }

    v24 = (void *)objc_msgSend(v18, "_initWithPayload:format:type:displayInformation:", v8, v14, v17, v33);
    if ((objc_msgSend(v24, "configureWithContent:", v12) & 1) != 0)
    {
      v5 = v24;
    }
    else
    {
      v25 = v11;
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB2D50];
      v37 = CFSTR("Invalid message content");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v27 = v16;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v26;
      v11 = v25;
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("PKAddSecureElementPassErrorDomain"), 0, v28);
      *v5 = (id)objc_claimAutoreleasedReturnValue();

      v16 = v27;
      v5 = 0;
    }

  }
  return v5;
}

id __78__PKSharingMessage_specializedMessageFromPayload_displayInformation_outError___block_invoke(uint64_t a1)
{
  __objc2_class **v1;
  uint64_t v2;
  id v5;

  v1 = off_1E2AA07C0;
  switch(*(_QWORD *)(a1 + 32))
  {
    case 1:
      goto LABEL_30;
    case 2:
      v2 = *(_QWORD *)(a1 + 40);
      if (v2 <= 1000)
      {
        if ((unint64_t)(v2 - 2) < 6 || v2 == 0)
        {
          v1 = off_1E2AA0738;
          goto LABEL_30;
        }
        if (v2 == 1)
        {
          v1 = off_1E2AA0730;
          goto LABEL_30;
        }
        goto LABEL_19;
      }
      if (v2 == 1001)
        goto LABEL_28;
      if (v2 == 1002)
      {
LABEL_26:
        v1 = off_1E2AA0770;
        goto LABEL_30;
      }
      if (v2 != 1003)
      {
LABEL_19:
        v5 = 0;
        if (v2 > 1002)
        {
          if (v2 != 1003)
          {
            if (v2 == 2001)
            {
              v1 = off_1E2AA0410;
            }
            else
            {
              if (v2 != 2002)
                return v5;
              v1 = off_1E2AA0418;
            }
            goto LABEL_30;
          }
          goto LABEL_27;
        }
        if (v2 != 1001)
        {
          if (v2 != 1002)
            return v5;
          goto LABEL_26;
        }
LABEL_28:
        v1 = off_1E2AA0798;
        goto LABEL_30;
      }
LABEL_27:
      v1 = off_1E2AA07D8;
LABEL_30:
      v5 = objc_alloc(*v1);
      return v5;
    case 3:
      v2 = *(_QWORD *)(a1 + 40);
      goto LABEL_19;
    case 4:
      v2 = *(_QWORD *)(a1 + 40);
      if (v2 != 1)
        goto LABEL_19;
      v1 = off_1E2AA0780;
      goto LABEL_30;
    default:
      return 0;
  }
}

- (BOOL)configureWithContent:(id)a3
{
  return 1;
}

- (void)updateMessageContentTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[PKSharingMessage _payloadForContent:format:]((uint64_t)PKSharingMessage, v5, self->_format);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_storeStrong((id *)&self->_payload, v4);
    -[PKSharingMessage configureWithContent:](self, "configureWithContent:", v5);
  }

}

- (id)typeDescription
{
  void *v3;
  void *v4;
  void *v5;

  PKSharingMessageFormatToString(self->_format);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKSharingMessageTypeToString(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@-%@>"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingMessage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  PKSharingMessage *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v27);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v27;
  objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("content"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
    v10 = 1;
  else
    v10 = v8 == 0;
  if (v10)
  {
    PKLogFacilityTypeGetObject(0x20uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v7;
      _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "PKSharingMessage: unable to decode json during NSCoding. %@", buf, 0xCu);
    }

    v12 = 0;
  }
  else
  {
    v26 = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("format"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = PKSharingMessageFormatFromString(v13);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = PKSharingMessageTypeFromString(v15);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayInformation"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PKSharingMessage _initWithPayload:format:type:displayInformation:](self, "_initWithPayload:format:type:displayInformation:", v5, v14, v16, v17);

    if (v18)
    {
      objc_storeStrong(v18 + 4, v5);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayInformation"));
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v18[5];
      v18[5] = (id)v19;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v18[1];
      v18[1] = (id)v21;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = (id)PKSharingMessageTypeFromString(v23);

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("format"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v18[3] = (id)PKSharingMessageFormatFromString(v24);

      if ((objc_msgSend(v18, "configureWithContent:", v9) & 1) == 0)
      {

        v18 = 0;
      }
    }
    v6 = v26;
    self = v18;
    v12 = self;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *payload;
  id v5;
  void *v6;
  id v7;

  payload = self->_payload;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", payload, CFSTR("payload"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayInformation, CFSTR("displayInformation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  PKSharingMessageTypeToString(self->_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("type"));

  PKSharingMessageFormatToString(self->_format);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("format"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  PKSharingMessageTypeToString(self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("payload: '%@'; "), self->_payload);
  objc_msgSend(v3, "appendFormat:", CFSTR("displayInformation: '%@'; "), self->_displayInformation);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

+ (id)embeddedMessageDictionaryForShareURL:(id)a3 targetDevice:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("address");
  objc_msgSend(a3, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v9[1] = CFSTR("targetDeviceType");
  PKPassCredentialShareTargetDeviceToString(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)embeddedMessageURLs
{
  return 0;
}

- (id)embeddedAddressForDeviceType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKSharingMessage embeddedMessageURLs](self, "embeddedMessageURLs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)format
{
  return self->_format;
}

- (void)setFormat:(unint64_t)a3
{
  self->_format = a3;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (PKSharingMessageDisplayInformation)displayInformation
{
  return self->_displayInformation;
}

- (void)setDisplayInformation:(id)a3
{
  objc_storeStrong((id *)&self->_displayInformation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayInformation, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
