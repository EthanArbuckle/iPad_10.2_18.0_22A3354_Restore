@implementation VMVoicemail

- (void)setRemoteUID:(unint64_t)a3
{
  self->_remoteUID = a3;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uuid;
  id v5;
  void *v6;
  NSString *callbackDestinationID;
  void *v8;
  NSString *callbackISOCountryCode;
  void *v10;
  NSURL *dataURL;
  void *v12;
  NSDate *date;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSString *senderDestinationID;
  void *v24;
  NSString *senderISOCountryCode;
  void *v26;
  NSString *receiverDestinationID;
  void *v28;
  NSString *receiverLabelID;
  void *v30;
  NSString *receiverISOCountryCode;
  void *v32;
  NSURL *transcriptionURL;
  void *v34;
  NSDictionary *summarizationMetaData;
  void *v36;
  NSURL *summarizationMetaDataURL;
  id v38;

  uuid = self->_uuid;
  v5 = a3;
  NSStringFromSelector(sel_uuid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", uuid, v6);

  callbackDestinationID = self->_callbackDestinationID;
  NSStringFromSelector(sel_callbackDestinationID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", callbackDestinationID, v8);

  callbackISOCountryCode = self->_callbackISOCountryCode;
  NSStringFromSelector(sel_callbackISOCountryCode);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", callbackISOCountryCode, v10);

  dataURL = self->_dataURL;
  NSStringFromSelector(sel_dataURL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", dataURL, v12);

  date = self->_date;
  NSStringFromSelector(sel_date);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", date, v14);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_duration);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_duration);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v15, v16);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_flags);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_flags);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v17, v18);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_identifier);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_identifier);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v19, v20);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_remoteUID);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_remoteUID);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v21, v22);

  senderDestinationID = self->_senderDestinationID;
  NSStringFromSelector(sel_sender);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", senderDestinationID, v24);

  senderISOCountryCode = self->_senderISOCountryCode;
  NSStringFromSelector(sel_senderISOCountryCode);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", senderISOCountryCode, v26);

  receiverDestinationID = self->_receiverDestinationID;
  NSStringFromSelector(sel_receiverDestinationID);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", receiverDestinationID, v28);

  receiverLabelID = self->_receiverLabelID;
  NSStringFromSelector(sel_receiverLabelID);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", receiverLabelID, v30);

  receiverISOCountryCode = self->_receiverISOCountryCode;
  NSStringFromSelector(sel_receiverISOCountryCode);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", receiverISOCountryCode, v32);

  transcriptionURL = self->_transcriptionURL;
  NSStringFromSelector(sel_transcriptionURL);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", transcriptionURL, v34);

  summarizationMetaData = self->_summarizationMetaData;
  NSStringFromSelector(sel_summarizationMetaData);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", summarizationMetaData, v36);

  summarizationMetaDataURL = self->_summarizationMetaDataURL;
  NSStringFromSelector(sel_summarizationMetaDataURL);
  v38 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", summarizationMetaDataURL, v38);

}

- (VMVoicemail)initWithCoder:(id)a3
{
  id v4;
  VMVoicemail *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSUUID *uuid;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSString *callbackDestinationID;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *callbackISOCountryCode;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSURL *dataURL;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSDate *date;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSString *senderDestinationID;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSString *senderISOCountryCode;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSString *receiverDestinationID;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSString *receiverLabelID;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  NSString *receiverISOCountryCode;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  NSURL *transcriptionURL;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  NSDictionary *summarizationMetaData;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  NSURL *summarizationMetaDataURL;
  objc_super v78;

  v4 = a3;
  v78.receiver = self;
  v78.super_class = (Class)VMVoicemail;
  v5 = -[VMVoicemail init](&v78, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_uuid);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_callbackDestinationID);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    callbackDestinationID = v5->_callbackDestinationID;
    v5->_callbackDestinationID = (NSString *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_callbackISOCountryCode);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    callbackISOCountryCode = v5->_callbackISOCountryCode;
    v5->_callbackISOCountryCode = (NSString *)v16;

    v18 = objc_opt_class();
    NSStringFromSelector(sel_dataURL);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    dataURL = v5->_dataURL;
    v5->_dataURL = (NSURL *)v20;

    v22 = objc_opt_class();
    NSStringFromSelector(sel_date);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v24;

    v26 = objc_opt_class();
    NSStringFromSelector(sel_duration);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v5->_duration = v29;

    v30 = objc_opt_class();
    NSStringFromSelector(sel_flags);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_flags = objc_msgSend(v32, "unsignedIntegerValue");

    v33 = objc_opt_class();
    NSStringFromSelector(sel_identifier);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_identifier = objc_msgSend(v35, "unsignedIntegerValue");

    v36 = objc_opt_class();
    NSStringFromSelector(sel_remoteUID);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_remoteUID = objc_msgSend(v38, "unsignedIntegerValue");

    v39 = objc_opt_class();
    NSStringFromSelector(sel_sender);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v39, v40);
    v41 = objc_claimAutoreleasedReturnValue();
    senderDestinationID = v5->_senderDestinationID;
    v5->_senderDestinationID = (NSString *)v41;

    v43 = objc_opt_class();
    NSStringFromSelector(sel_senderISOCountryCode);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v43, v44);
    v45 = objc_claimAutoreleasedReturnValue();
    senderISOCountryCode = v5->_senderISOCountryCode;
    v5->_senderISOCountryCode = (NSString *)v45;

    v47 = objc_opt_class();
    NSStringFromSelector(sel_receiverDestinationID);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v47, v48);
    v49 = objc_claimAutoreleasedReturnValue();
    receiverDestinationID = v5->_receiverDestinationID;
    v5->_receiverDestinationID = (NSString *)v49;

    v51 = objc_opt_class();
    NSStringFromSelector(sel_receiverLabelID);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v51, v52);
    v53 = objc_claimAutoreleasedReturnValue();
    receiverLabelID = v5->_receiverLabelID;
    v5->_receiverLabelID = (NSString *)v53;

    v55 = objc_opt_class();
    NSStringFromSelector(sel_receiverISOCountryCode);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v55, v56);
    v57 = objc_claimAutoreleasedReturnValue();
    receiverISOCountryCode = v5->_receiverISOCountryCode;
    v5->_receiverISOCountryCode = (NSString *)v57;

    v59 = objc_opt_class();
    NSStringFromSelector(sel_transcriptionURL);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v59, v60);
    v61 = objc_claimAutoreleasedReturnValue();
    transcriptionURL = v5->_transcriptionURL;
    v5->_transcriptionURL = (NSURL *)v61;

    v63 = (void *)MEMORY[0x24BDBCF20];
    v64 = objc_opt_class();
    v65 = objc_opt_class();
    v66 = objc_opt_class();
    v67 = objc_opt_class();
    v68 = objc_opt_class();
    objc_msgSend(v63, "setWithObjects:", v64, v65, v66, v67, v68, objc_opt_class(), 0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_summarizationMetaData);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v69, v70);
    v71 = objc_claimAutoreleasedReturnValue();
    summarizationMetaData = v5->_summarizationMetaData;
    v5->_summarizationMetaData = (NSDictionary *)v71;

    v73 = objc_opt_class();
    NSStringFromSelector(sel_summarizationMetaDataURL);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v73, v74);
    v75 = objc_claimAutoreleasedReturnValue();
    summarizationMetaDataURL = v5->_summarizationMetaDataURL;
    v5->_summarizationMetaDataURL = (NSURL *)v75;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VMVoicemail *v4;
  BOOL v5;

  v4 = (VMVoicemail *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[VMVoicemail isSameMessage:](self, "isSameMessage:", v4);
  }

  return v5;
}

- (BOOL)isSameMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (self == a3)
    return 1;
  v4 = a3;
  -[VMVoicemail uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;

  -[VMVoicemail uuid](self, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[VMVoicemail remoteUID](self, "remoteUID") ^ v4;
  -[VMVoicemail date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[VMVoicemail senderDestinationID](self, "senderDestinationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  -[VMVoicemail receiverDestinationID](self, "receiverDestinationID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[VMVoicemail receiverLabelID](self, "receiverLabelID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");
  -[VMVoicemail callbackDestinationID](self, "callbackDestinationID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v9 ^ v13 ^ objc_msgSend(v14, "hash");

  return v15;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)senderDestinationID
{
  return self->_senderDestinationID;
}

- (unint64_t)remoteUID
{
  return self->_remoteUID;
}

- (NSString)receiverLabelID
{
  return self->_receiverLabelID;
}

- (NSString)receiverDestinationID
{
  return self->_receiverDestinationID;
}

- (NSString)callbackDestinationID
{
  return self->_callbackDestinationID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summarizationMetaDataURL, 0);
  objc_storeStrong((id *)&self->_summarizationMetaData, 0);
  objc_storeStrong((id *)&self->_transcriptionURL, 0);
  objc_storeStrong((id *)&self->_receiverLabelID, 0);
  objc_storeStrong((id *)&self->_receiverISOCountryCode, 0);
  objc_storeStrong((id *)&self->_receiverDestinationID, 0);
  objc_storeStrong((id *)&self->_dataURL, 0);
  objc_storeStrong((id *)&self->_callbackISOCountryCode, 0);
  objc_storeStrong((id *)&self->_callbackDestinationID, 0);
  objc_storeStrong((id *)&self->_senderISOCountryCode, 0);
  objc_storeStrong((id *)&self->_senderDestinationID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void)setTranscriptionURL:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptionURL, a3);
}

- (void)setSenderISOCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_senderISOCountryCode, a3);
}

- (void)setSenderDestinationID:(id)a3
{
  objc_storeStrong((id *)&self->_senderDestinationID, a3);
}

- (void)setReceiverLabelID:(id)a3
{
  objc_storeStrong((id *)&self->_receiverLabelID, a3);
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void)setDataURL:(id)a3
{
  objc_storeStrong((id *)&self->_dataURL, a3);
}

- (void)setCallbackISOCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_callbackISOCountryCode, a3);
}

- (void)setCallbackDestinationID:(id)a3
{
  objc_storeStrong((id *)&self->_callbackDestinationID, a3);
}

- (BOOL)isTemporary
{
  return (LOBYTE(self->_flags) >> 4) & 1;
}

- (BOOL)isDeleted
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (BOOL)isDataAvailable
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)mailboxTypeForFlags:(unint64_t)a3
{
  int64_t v3;

  v3 = (a3 & 0x9E) == 2;
  if ((a3 & 0x9E) == 0x82)
    v3 = 2;
  if ((a3 & 0x9E) == 0xA)
    return 3;
  else
    return v3;
}

+ (unint64_t)flagsByApplyingMailboxType:(int64_t)a3 toFlags:(unint64_t)a4
{
  unint64_t v4;
  unint64_t v5;

  v4 = a4 & 0xFFFFFFFFFFFFFF72 | 0x81;
  v5 = a4 & 0xFFFFFFFFFFFFFF73;
  if (a3 != 1)
    v5 = a4;
  if (a3 != 2)
    v4 = v5;
  if (a3 == 3)
    return a4 & 0xFFFFFFFFFFFFFF72 | 9;
  else
    return v4;
}

- (BOOL)isContactSuggested:(id)a3
{
  return objc_msgSend(a3, "isSuggested");
}

- (id)displayNameUsingContactStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[VMVoicemail senderDestinationID](self, "senderDestinationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMVoicemail contactUsingContactStore:withKeysToFetch:](self, "contactUsingContactStore:withKeysToFetch:", v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9
      || -[VMVoicemail isContactSuggested:](self, "isContactSuggested:", v9)
      || (objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", v9, 0),
          (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[VMVoicemail senderDestinationID](self, "senderDestinationID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VMVoicemail receiverISOCountryCode](self, "receiverISOCountryCode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      xx_TUFormattedPhoneNumber(v10, v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

- (id)displayLabelUsingContactStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[VMVoicemail senderDestinationID](self, "senderDestinationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "length");

  if (v6)
  {
    v25[0] = *MEMORY[0x24BDBA348];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMVoicemail contactUsingContactStore:withKeysToFetch:](self, "contactUsingContactStore:withKeysToFetch:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 && !-[VMVoicemail isContactSuggested:](self, "isContactSuggested:", v8))
    {
      v9 = (void *)MEMORY[0x24BDBAD88];
      -[VMVoicemail senderDestinationID](self, "senderDestinationID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VMVoicemail receiverISOCountryCode](self, "receiverISOCountryCode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "phoneNumberWithDigits:countryCode:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "phoneNumbers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __45__VMVoicemail_displayLabelUsingContactStore___block_invoke;
      v23[3] = &unk_24CC5B288;
      v14 = v12;
      v24 = v14;
      v15 = objc_msgSend(v13, "indexOfObjectPassingTest:", v23);

      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v6 = 0;
      }
      else
      {
        objc_msgSend(v8, "phoneNumbers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndex:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "label");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        v20 = (void *)*MEMORY[0x24BDBAB70];
        if (v18)
          v20 = (void *)v18;
        v21 = v20;

        objc_msgSend(MEMORY[0x24BDBAD38], "localizedStringForLabel:", v21);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

uint64_t __45__VMVoicemail_displayLabelUsingContactStore___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLikePhoneNumber:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)contactUsingContactStore:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = *MEMORY[0x24BDBA2E0];
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMVoicemail contactUsingContactStore:withKeysToFetch:](self, "contactUsingContactStore:withKeysToFetch:", v5, v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)contactUsingContactStore:(id)a3 withKeysToFetch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  _QWORD v23[5];
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1;
  v29 = __Block_byref_object_dispose__1;
  v30 = 0;
  -[VMVoicemail senderDestinationID](self, "senderDestinationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BDBAD88];
    -[VMVoicemail senderDestinationID](self, "senderDestinationID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMVoicemail receiverISOCountryCode](self, "receiverISOCountryCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "phoneNumberWithDigits:countryCode:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBACB8]), "initWithKeysToFetch:", v7);
    objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactMatchingPhoneNumber:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPredicate:", v15);

    objc_msgSend(v14, "setOnlyMainStore:", 1);
    v24 = 0;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __56__VMVoicemail_contactUsingContactStore_withKeysToFetch___block_invoke;
    v23[3] = &unk_24CC5B2B0;
    v23[4] = &v25;
    objc_msgSend(v6, "enumerateContactsWithFetchRequest:error:usingBlock:", v14, &v24, v23);
    v16 = v24;
    v17 = v16;
    if (v26[5])
    {
      if (-[VMVoicemail isContactSuggested:](self, "isContactSuggested:"))
      {
        vm_framework_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = v26[5];
          *(_DWORD *)buf = 138412290;
          v32 = v19;
          _os_log_impl(&dword_2116D5000, v18, OS_LOG_TYPE_DEFAULT, "VMVoicemail asked for a contact from only the main store, but it got back a suggestion (%@). We will ignore it.", buf, 0xCu);
        }

        v20 = v26[5];
        v26[5] = 0;
LABEL_10:

      }
    }
    else if (v16)
    {
      vm_framework_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[VMVoicemail contactUsingContactStore:withKeysToFetch:].cold.1();
      goto LABEL_10;
    }

  }
  v21 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v21;
}

void __56__VMVoicemail_contactUsingContactStore_withKeysToFetch___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (BOOL)hasCallbackNumber
{
  void *v2;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[VMVoicemail callbackDestinationID](self, "callbackDestinationID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[VMVoicemail callbackDestinationID](self, "callbackDestinationID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "length"))
    {
      v5 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  -[VMVoicemail senderDestinationID](self, "senderDestinationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[VMVoicemail senderDestinationID](self, "senderDestinationID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  if (v4)
    goto LABEL_8;
LABEL_9:

  return v5;
}

- (VMVoicemail)initWithMessage:(id)a3
{
  id v4;
  VMVoicemail *v5;
  uint64_t v6;
  NSUUID *uuid;
  void *v8;
  uint64_t v9;
  NSString *callbackDestinationID;
  void *v11;
  uint64_t v12;
  NSString *callbackISOCountryCode;
  uint64_t v14;
  NSURL *dataURL;
  uint64_t v16;
  NSDate *date;
  double v18;
  void *v19;
  uint64_t v20;
  NSString *senderDestinationID;
  void *v22;
  uint64_t v23;
  NSString *senderISOCountryCode;
  uint64_t v25;
  NSURL *transcriptionURL;
  void *v27;
  uint64_t v28;
  NSString *receiverDestinationID;
  void *v30;
  uint64_t v31;
  NSString *receiverLabelID;
  void *v33;
  uint64_t v34;
  NSString *receiverISOCountryCode;
  uint64_t v36;
  NSURL *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSDictionary *summarizationMetaData;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)VMVoicemail;
  v5 = -[VMVoicemail init](&v44, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "uuid");
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    objc_msgSend(v4, "callbackDestinationID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    callbackDestinationID = v5->_callbackDestinationID;
    v5->_callbackDestinationID = (NSString *)v9;

    objc_msgSend(v4, "callbackISOCountryCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    callbackISOCountryCode = v5->_callbackISOCountryCode;
    v5->_callbackISOCountryCode = (NSString *)v12;

    objc_msgSend(v4, "dataURL");
    v14 = objc_claimAutoreleasedReturnValue();
    dataURL = v5->_dataURL;
    v5->_dataURL = (NSURL *)v14;

    objc_msgSend(v4, "date");
    v16 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v16;

    objc_msgSend(v4, "duration");
    v5->_duration = v18;
    v5->_flags = objc_msgSend(v4, "flags");
    v5->_identifier = objc_msgSend(v4, "identifier");
    v5->_remoteUID = objc_msgSend(v4, "remoteUID");
    objc_msgSend(v4, "senderDestinationID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    senderDestinationID = v5->_senderDestinationID;
    v5->_senderDestinationID = (NSString *)v20;

    objc_msgSend(v4, "senderISOCountryCode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    senderISOCountryCode = v5->_senderISOCountryCode;
    v5->_senderISOCountryCode = (NSString *)v23;

    objc_msgSend(v4, "transcriptionURL");
    v25 = objc_claimAutoreleasedReturnValue();
    transcriptionURL = v5->_transcriptionURL;
    v5->_transcriptionURL = (NSURL *)v25;

    objc_msgSend(v4, "receiverDestinationID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    receiverDestinationID = v5->_receiverDestinationID;
    v5->_receiverDestinationID = (NSString *)v28;

    objc_msgSend(v4, "receiverLabelID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    receiverLabelID = v5->_receiverLabelID;
    v5->_receiverLabelID = (NSString *)v31;

    objc_msgSend(v4, "receiverISOCountryCode");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "copy");
    receiverISOCountryCode = v5->_receiverISOCountryCode;
    v5->_receiverISOCountryCode = (NSString *)v34;

    objc_msgSend(v4, "summarizationMetaDataURL");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v5->_transcriptionURL;
    v5->_transcriptionURL = (NSURL *)v36;

    v38 = (void *)MEMORY[0x24BDD1618];
    objc_msgSend(v4, "summarizationMetaData");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "archivedDataWithRootObject:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1620], "unarchiveObjectWithData:", v40);
    v41 = objc_claimAutoreleasedReturnValue();
    summarizationMetaData = v5->_summarizationMetaData;
    v5->_summarizationMetaData = (NSDictionary *)v41;

  }
  return v5;
}

- (BOOL)isBlocked
{
  return LOBYTE(self->_flags) >> 7;
}

- (void)setBlocked:(BOOL)a3
{
  -[VMVoicemail setFlag:enabled:](self, "setFlag:enabled:", 128, a3);
}

- (void)setDataAvailable:(BOOL)a3
{
  -[VMVoicemail setFlag:enabled:](self, "setFlag:enabled:", 2, a3);
}

- (void)setDeleted:(BOOL)a3
{
  -[VMVoicemail setFlag:enabled:](self, "setFlag:enabled:", 4, a3);
}

- (BOOL)isDetached
{
  return (LOBYTE(self->_flags) >> 6) & 1;
}

- (void)setDetached:(BOOL)a3
{
  -[VMVoicemail setFlag:enabled:](self, "setFlag:enabled:", 64, a3);
}

- (BOOL)isDownloading
{
  return (BYTE1(self->_flags) >> 2) & 1;
}

- (void)setDownloading:(BOOL)a3
{
  -[VMVoicemail setFlag:enabled:](self, "setFlag:enabled:", 1024, a3);
}

- (int64_t)mailboxType
{
  return objc_msgSend((id)objc_opt_class(), "mailboxTypeForFlags:", -[VMVoicemail flags](self, "flags"));
}

- (void)setMailboxType:(int64_t)a3
{
  -[VMVoicemail setFlags:](self, "setFlags:", objc_msgSend((id)objc_opt_class(), "flagsByApplyingMailboxType:toFlags:", a3, -[VMVoicemail flags](self, "flags")));
}

- (BOOL)isRead
{
  return self->_flags & 1;
}

- (void)setRead:(BOOL)a3
{
  -[VMVoicemail setFlag:enabled:](self, "setFlag:enabled:", 1, a3);
}

- (void)setTemporary:(BOOL)a3
{
  -[VMVoicemail setFlag:enabled:](self, "setFlag:enabled:", 16, a3);
}

- (BOOL)isTranscribing
{
  return (BYTE1(self->_flags) >> 1) & 1;
}

- (BOOL)isTranscriptionAvailable
{
  return BYTE1(self->_flags) & 1;
}

- (void)setTranscriptionAvailable:(BOOL)a3
{
  -[VMVoicemail setFlag:enabled:](self, "setFlag:enabled:", 256, a3);
}

- (BOOL)isTranscriptionRated
{
  return (BYTE1(self->_flags) >> 3) & 1;
}

- (BOOL)isTrashed
{
  return (LOBYTE(self->_flags) >> 3) & 1;
}

- (void)setTrashed:(BOOL)a3
{
  -[VMVoicemail setFlag:enabled:](self, "setFlag:enabled:", 8, a3);
}

- (BOOL)isUnread
{
  return !-[VMVoicemail isRead](self, "isRead");
}

- (BOOL)wasTranscriptionAttempted
{
  return (BYTE1(self->_flags) >> 4) & 1;
}

- (VMVoicemailTranscript)transcript
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v11;
  id v12;

  if (!-[VMVoicemail isTranscriptionAvailable](self, "isTranscriptionAvailable"))
    return (VMVoicemailTranscript *)0;
  v3 = (void *)MEMORY[0x24BDBCE50];
  -[VMVoicemail transcriptionURL](self, "transcriptionURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v3, "dataWithContentsOfURL:options:error:", v4, 1, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;

  if (!v5)
  {
    vm_framework_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[VMVoicemail transcript].cold.1();
    v8 = v6;
    goto LABEL_11;
  }
  v11 = v6;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v11);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v11;

  if (v8)
  {
    vm_framework_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[VMVoicemail transcript].cold.2();

LABEL_11:
    v7 = 0;
  }

  return (VMVoicemailTranscript *)v7;
}

- (unint64_t)transcriptionState
{
  if (-[VMVoicemail isTranscriptionAvailable](self, "isTranscriptionAvailable"))
    return 3;
  if (-[VMVoicemail isTranscribing](self, "isTranscribing"))
    return 2;
  return -[VMVoicemail wasTranscriptionAttempted](self, "wasTranscriptionAttempted");
}

- (VMVoicemail)initWithData:(id)a3
{
  id v4;
  VMVoicemailMessage *v5;
  VMVoicemail *v6;

  v4 = a3;
  v5 = -[VMVoicemailMessage initWithData:]([VMVoicemailMessage alloc], "initWithData:", v4);

  if (v5)
  {
    self = -[VMVoicemail initWithVoicemailMessage:](self, "initWithVoicemailMessage:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (VMVoicemail)initWithVoicemailMessage:(id)a3
{
  id v4;
  VMVoicemail *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSUUID *uuid;
  double v10;
  void *v11;
  uint64_t v12;
  NSDate *date;
  void *v14;
  uint64_t v15;
  NSString *senderDestinationID;
  void *v17;
  uint64_t v18;
  NSString *receiverDestinationID;
  void *v20;
  uint64_t v21;
  NSString *receiverLabelID;
  void *v23;
  uint64_t v24;
  NSString *callbackDestinationID;
  void *v26;
  uint64_t v27;
  NSURL *dataURL;
  void *v29;
  void *v30;
  NSURL *v31;
  id v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  NSURL *transcriptionURL;
  void *v37;
  void *v38;
  NSURL *v39;
  id v40;
  NSObject *v41;
  id v43;
  id v44;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)VMVoicemail;
  v5 = -[VMVoicemail init](&v45, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDD1880]);
    objc_msgSend(v4, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithUUIDString:", v7);
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v8;

    v5->_identifier = objc_msgSend(v4, "identifier");
    v5->_remoteUID = objc_msgSend(v4, "remoteUID");
    objc_msgSend(v4, "duration");
    v5->_duration = v10;
    v11 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v4, "date");
    objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
    v12 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v12;

    objc_msgSend(v4, "senderDestinationID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    senderDestinationID = v5->_senderDestinationID;
    v5->_senderDestinationID = (NSString *)v15;

    objc_msgSend(v4, "receiverDestinationID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    receiverDestinationID = v5->_receiverDestinationID;
    v5->_receiverDestinationID = (NSString *)v18;

    objc_msgSend(v4, "receiverLabelID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    receiverLabelID = v5->_receiverLabelID;
    v5->_receiverLabelID = (NSString *)v21;

    objc_msgSend(v4, "callbackDestinationID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    callbackDestinationID = v5->_callbackDestinationID;
    v5->_callbackDestinationID = (NSString *)v24;

    v5->_flags = objc_msgSend(v4, "flags");
    objc_msgSend(v4, "dataURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v26);
      v27 = objc_claimAutoreleasedReturnValue();
      dataURL = v5->_dataURL;
      v5->_dataURL = (NSURL *)v27;

      if (v5->_dataURL)
      {
        objc_msgSend(v4, "audio");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "audioData");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v5->_dataURL;
        v44 = 0;
        objc_msgSend(v30, "writeToURL:options:error:", v31, 1, &v44);
        v32 = v44;

        if (v32)
        {
          -[VMVoicemail setDataAvailable:](v5, "setDataAvailable:", 0);
          vm_framework_log();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            -[VMVoicemail initWithVoicemailMessage:].cold.2();

        }
      }
    }
    objc_msgSend(v4, "transcriptionURL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "length"))
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v34);
      v35 = objc_claimAutoreleasedReturnValue();
      transcriptionURL = v5->_transcriptionURL;
      v5->_transcriptionURL = (NSURL *)v35;

      if (v5->_transcriptionURL)
      {
        objc_msgSend(v4, "transcript");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "transcriptionData");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v5->_transcriptionURL;
        v43 = 0;
        objc_msgSend(v38, "writeToURL:options:error:", v39, 1, &v43);
        v40 = v43;

        if (v40)
        {
          -[VMVoicemail setTranscriptionAvailable:](v5, "setTranscriptionAvailable:", 0);
          vm_framework_log();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            -[VMVoicemail initWithVoicemailMessage:].cold.1();

        }
      }
    }

  }
  return v5;
}

- (NSData)data
{
  VMVoicemailMessage *v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  VMAudioMessage *v19;
  void *v20;
  void *v21;
  void *v22;
  VMTranscriptMessage *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v3 = objc_alloc_init(VMVoicemailMessage);
  if (v3)
  {
    -[VMVoicemail uuid](self, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMVoicemailMessage setUuid:](v3, "setUuid:", v5);

    -[VMVoicemailMessage setIdentifier:](v3, "setIdentifier:", -[VMVoicemail identifier](self, "identifier"));
    -[VMVoicemailMessage setRemoteUID:](v3, "setRemoteUID:", -[VMVoicemail remoteUID](self, "remoteUID"));
    -[VMVoicemail duration](self, "duration");
    -[VMVoicemailMessage setDuration:](v3, "setDuration:");
    -[VMVoicemail date](self, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    -[VMVoicemailMessage setDate:](v3, "setDate:");

    -[VMVoicemail senderDestinationID](self, "senderDestinationID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    -[VMVoicemailMessage setSenderDestinationID:](v3, "setSenderDestinationID:", v8);

    -[VMVoicemail callbackDestinationID](self, "callbackDestinationID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    -[VMVoicemailMessage setCallbackDestinationID:](v3, "setCallbackDestinationID:", v10);

    -[VMVoicemail receiverDestinationID](self, "receiverDestinationID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    -[VMVoicemailMessage setReceiverDestinationID:](v3, "setReceiverDestinationID:", v12);

    -[VMVoicemail receiverLabelID](self, "receiverLabelID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    -[VMVoicemailMessage setReceiverLabelID:](v3, "setReceiverLabelID:", v14);

    -[VMVoicemailMessage setFlags:](v3, "setFlags:", -[VMVoicemail flags](self, "flags"));
    -[VMVoicemail transcriptionURL](self, "transcriptionURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMVoicemailMessage setTranscriptionURL:](v3, "setTranscriptionURL:", v16);

    -[VMVoicemail dataURL](self, "dataURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "absoluteString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMVoicemailMessage setDataURL:](v3, "setDataURL:", v18);

    -[VMVoicemailMessage setProtocolVersion:](v3, "setProtocolVersion:", 1);
    v19 = objc_alloc_init(VMAudioMessage);
    v20 = (void *)MEMORY[0x24BDBCE50];
    -[VMVoicemail dataURL](self, "dataURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dataWithContentsOfURL:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMAudioMessage setAudioData:](v19, "setAudioData:", v22);

    -[VMAudioMessage setProtocolVersion:](v19, "setProtocolVersion:", 1);
    -[VMVoicemailMessage setAudio:](v3, "setAudio:", v19);
    v23 = objc_alloc_init(VMTranscriptMessage);
    v24 = (void *)MEMORY[0x24BDBCE50];
    -[VMVoicemail transcriptionURL](self, "transcriptionURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dataWithContentsOfURL:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[VMTranscriptMessage setTranscriptionData:](v23, "setTranscriptionData:", v26);

    -[VMTranscriptMessage setProtocolVersion:](v23, "setProtocolVersion:", 1);
    -[VMVoicemailMessage setTranscript:](v3, "setTranscript:", v23);
    -[VMVoicemailMessage data](v3, "data");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0;
  }

  return (NSData *)v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[VMVoicemail initWithMessage:](+[VMVoicemail allocWithZone:](VMVoicemail, "allocWithZone:", a3), "initWithMessage:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[VMVoicemail initWithMessage:](+[VMMutableVoicemail allocWithZone:](VMMutableVoicemail, "allocWithZone:", a3), "initWithMessage:", self);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;

  v20 = (void *)MEMORY[0x24BDD17C8];
  v19 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[VMVoicemail identifier](self, "identifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMVoicemail uuid](self, "uuid");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[VMVoicemail remoteUID](self, "remoteUID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMVoicemail date](self, "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMVoicemail senderDestinationID](self, "senderDestinationID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMVoicemail receiverDestinationID](self, "receiverDestinationID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMVoicemail receiverLabelID](self, "receiverLabelID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMVoicemail callbackDestinationID](self, "callbackDestinationID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[VMVoicemail duration](self, "duration");
  objc_msgSend(v3, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMVoicemail dataURL](self, "dataURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMVoicemail transcriptionURL](self, "transcriptionURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMVoicemail mailboxTypeDescription](self, "mailboxTypeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMVoicemail flagDescription](self, "flagDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMVoicemail summarizationMetaData](self, "summarizationMetaData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMVoicemail summarizationMetaDataURL](self, "summarizationMetaDataURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@ %p identifier=%@, uuid=%@, remoteUID=%@, date=%@, sender=%@, receiver=%@, labelID=%@, callback=%@, duration=%@, dataURL=%@, transcriptionURL=%@, mailbox=%@, flags=%@, summarizationMetaData=%@>, summarizationMetaDataURL=%@"), v19, self, v18, v22, v17, v21, v15, v16, v13, v14, v12, v11, v4, v5, v6, v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)hasSameFlags:(id)a3
{
  uint64_t v4;

  if (!a3)
    return 0;
  v4 = objc_msgSend(a3, "flags");
  return v4 == -[VMVoicemail flags](self, "flags");
}

- (BOOL)hasSameContent:(id)a3
{
  id v4;
  void *v5;
  double duration;
  double v7;
  NSURL *dataURL;
  void *v9;
  NSURL *transcriptionURL;
  void *v11;
  char v12;

  v4 = a3;
  v5 = v4;
  if (v4 && (duration = self->_duration, objc_msgSend(v4, "duration"), duration == v7))
  {
    dataURL = self->_dataURL;
    objc_msgSend(v5, "dataURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSURL isEqual:](dataURL, "isEqual:", v9))
    {
      transcriptionURL = self->_transcriptionURL;
      objc_msgSend(v5, "transcriptionURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[NSURL isEqual:](transcriptionURL, "isEqual:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)flagDescription
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (-[VMVoicemail isRead](self, "isRead"))
    objc_msgSend(v3, "addObject:", CFSTR("Read"));
  if (-[VMVoicemail isDataAvailable](self, "isDataAvailable"))
    objc_msgSend(v3, "addObject:", CFSTR("DataAvailable"));
  if (-[VMVoicemail isDeleted](self, "isDeleted"))
    objc_msgSend(v3, "addObject:", CFSTR("Deleted"));
  if (-[VMVoicemail isTrashed](self, "isTrashed"))
    objc_msgSend(v3, "addObject:", CFSTR("Trashed"));
  if (-[VMVoicemail isTemporary](self, "isTemporary"))
    objc_msgSend(v3, "addObject:", CFSTR("Temporary"));
  if (-[VMVoicemail isDetached](self, "isDetached"))
    objc_msgSend(v3, "addObject:", CFSTR("Detached"));
  if (-[VMVoicemail isBlocked](self, "isBlocked"))
    objc_msgSend(v3, "addObject:", CFSTR("Blocked"));
  if (-[VMVoicemail isTranscriptionAvailable](self, "isTranscriptionAvailable"))
    objc_msgSend(v3, "addObject:", CFSTR("TranscriptionAvailable"));
  if (-[VMVoicemail isTranscribing](self, "isTranscribing"))
    objc_msgSend(v3, "addObject:", CFSTR("Transcribing"));
  if (-[VMVoicemail isDownloading](self, "isDownloading"))
    objc_msgSend(v3, "addObject:", CFSTR("Downloading"));
  if (-[VMVoicemail isTranscriptionRated](self, "isTranscriptionRated"))
    objc_msgSend(v3, "addObject:", CFSTR("TranscriptionRated"));
  if ((-[VMVoicemail flags](self, "flags") & 0x2000) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("Local"));
  if ((-[VMVoicemail flags](self, "flags") & 0x4000) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("Pending"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)mailboxTypeDescription
{
  unint64_t v2;

  v2 = -[VMVoicemail mailboxType](self, "mailboxType");
  if (v2 < 4)
    return off_24CC5B2D0[v2];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown mailboxType=%ld"), v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setFlag:(unint64_t)a3 enabled:(BOOL)a4
{
  unint64_t v4;

  if (a4)
    v4 = self->_flags | a3;
  else
    v4 = self->_flags & ~a3;
  self->_flags = v4;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSString)senderISOCountryCode
{
  return self->_senderISOCountryCode;
}

- (NSString)callbackISOCountryCode
{
  return self->_callbackISOCountryCode;
}

- (double)duration
{
  return self->_duration;
}

- (NSURL)dataURL
{
  return self->_dataURL;
}

- (void)setReceiverDestinationID:(id)a3
{
  objc_storeStrong((id *)&self->_receiverDestinationID, a3);
}

- (NSString)receiverISOCountryCode
{
  return self->_receiverISOCountryCode;
}

- (void)setReceiverISOCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_receiverISOCountryCode, a3);
}

- (NSURL)transcriptionURL
{
  return self->_transcriptionURL;
}

- (NSDictionary)summarizationMetaData
{
  return self->_summarizationMetaData;
}

- (void)setSummarizationMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_summarizationMetaData, a3);
}

- (NSURL)summarizationMetaDataURL
{
  return self->_summarizationMetaDataURL;
}

- (void)setSummarizationMetaDataURL:(id)a3
{
  objc_storeStrong((id *)&self->_summarizationMetaDataURL, a3);
}

- (unint64_t)flags
{
  return self->_flags;
}

- (NSString)dataPath
{
  void *v2;
  void *v3;

  -[VMVoicemail dataURL](self, "dataURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)hasFlags:(unint64_t)a3
{
  return (a3 & ~self->_flags) == 0;
}

- (BOOL)doesNotHaveFlags:(unint64_t)a3
{
  return (self->_flags & a3) == 0;
}

- (void)contactUsingContactStore:withKeysToFetch:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_2116D5000, v1, OS_LOG_TYPE_ERROR, "Error fetching contact for voicemail: %@, error: %@", v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)transcript
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_2116D5000, v0, v1, "Error unarchiving voicemail transcript: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithVoicemailMessage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_2116D5000, v0, v1, "Error saving transcription data to disk: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithVoicemailMessage:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_2116D5000, v0, v1, "Error saving audio data to disk: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
