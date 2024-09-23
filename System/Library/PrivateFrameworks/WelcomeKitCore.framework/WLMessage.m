@implementation WLMessage

+ (_NSRange)_populateMimeHeaders:(id)a3 recipients:(id)a4 fromRange:(_NSRange)a5 ofString:(id)a6 addCountryCodeToParties:(BOOL)a7 sqlController:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  NSUInteger v30;
  NSUInteger v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  _BOOL4 v36;
  id v37;
  _NSRange result;

  v36 = a7;
  length = a5.length;
  location = a5.location;
  v13 = a3;
  v35 = a4;
  v14 = a6;
  v37 = a8;
  while (length)
  {
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v14, "rangeOfString:options:range:", CFSTR("\r\n"), 8, location, length);
      if (v15)
        break;
    }
    v16 = objc_msgSend(v14, "rangeOfString:options:range:", CFSTR(": "), 0, location, length);
    if (!v17)
      break;
    v18 = v16;
    v19 = v17;
    objc_msgSend(v14, "substringWithRange:", location, v16 - location);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    location = v18 + v19;
    length = objc_msgSend(v14, "length") - (v18 + v19);
    v21 = objc_msgSend(v14, "rangeOfString:options:range:", CFSTR("\r\n"), 0, v18 + v19, length);
    if (!v22)
    {

      break;
    }
    v23 = v21;
    v24 = v22;
    objc_msgSend(v14, "substringWithRange:", location, v21 - location);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v14, "length");
    if ((objc_msgSend(v20, "isEqualToString:", CFSTR("To")) & 1) != 0
      || (v27 = v25, objc_msgSend(v20, "isEqualToString:", CFSTR("From"))))
    {
      v27 = -[WLMessageParty _initWithAddress:addCountryCode:sqlController:]([WLMessageParty alloc], "_initWithAddress:addCountryCode:sqlController:", v25, v36, v37);

      objc_msgSend(v27, "address");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = v25;
      v34 = v28;
      v32 = a1;
      _WLLog();

    }
    if (objc_msgSend(v20, "isEqualToString:", CFSTR("To"), v32, v33, v34))
    {
      objc_msgSend(v35, "addObject:", v27);
    }
    else
    {
      objc_msgSend(v13, "objectForKey:", v20);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        v32 = a1;
        v33 = v20;
        _WLLog();
      }
      objc_msgSend(v13, "setValue:forKey:", v27, v20, v32, v33);
    }
    location = v23 + v24;
    length = v26 - (v23 + v24);

  }
  v30 = location;
  v31 = length;
  result.length = v31;
  result.location = v30;
  return result;
}

+ (id)_dateFormatterForMimeDateStrings
{
  if (_dateFormatterForMimeDateStrings_onceToken != -1)
    dispatch_once(&_dateFormatterForMimeDateStrings_onceToken, &__block_literal_global_1);
  return (id)_dateFormatterForMimeDateStrings__dateFormatter;
}

void __45__WLMessage__dateFormatterForMimeDateStrings__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US"));
  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)_dateFormatterForMimeDateStrings__dateFormatter;
  _dateFormatterForMimeDateStrings__dateFormatter = (uint64_t)v0;

  objc_msgSend((id)_dateFormatterForMimeDateStrings__dateFormatter, "setDateFormat:", CFSTR("EEE',' dd MMM yyyy HH':'mm':'ss Z"));
  objc_msgSend((id)_dateFormatterForMimeDateStrings__dateFormatter, "setLocale:", v4);
  v2 = (void *)_dateFormatterForMimeDateStrings__dateFormatter;
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

}

+ (id)mimeHeadersFromMimeData:(id)a3 sqlController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 7);
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(a1, "_populateMimeHeaders:recipients:fromRange:ofString:addCountryCodeToParties:sqlController:", v9, v10, 0, objc_msgSend(v8, "length"), v8, 0, v7);
    objc_msgSend(a1, "addRecipients:toMimeHeaders:", v10, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    _WLLog();
    v9 = 0;
  }

  return v9;
}

+ (id)dateFromMimeHeaders:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Date"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(a1, "_dateFormatterForMimeDateStrings");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateFromString:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      _WLLog();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)senderFromMimeHeaders:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("From"));
}

+ (id)recipientsFromMimeHeaders:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("To"));
}

+ (void)addRecipients:(id)a3 toMimeHeaders:(id)a4
{
  objc_msgSend(a4, "setObject:forKey:", a3, CFSTR("To"));
}

- (void)parseMIMEData:(id)a3 sqlController:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSString *v16;
  NSString *dateString;
  void *v18;
  NSDate *v19;
  NSDate *date;
  void *v21;
  void *v22;
  WLMessageParty *v23;
  WLMessageParty *sender;
  NSString *v25;
  NSString *subject;
  NSString *threadID;
  NSString *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSString *v32;
  NSString *messageText;
  uint64_t v34;
  NSMutableArray *v35;
  NSMutableArray *mimeParts;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  NSString *v61;
  WLMessage *v62;
  WLMessage *v63;
  NSDate *v64;
  NSString *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  id obj;
  void *v74;
  id v75;
  void *v76;
  uint64_t v77;
  NSMutableArray *v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_mimeData, a3);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
  if (v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 6);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    v72 = v9;
    v12 = +[WLMessage _populateMimeHeaders:recipients:fromRange:ofString:addCountryCodeToParties:sqlController:](WLMessage, "_populateMimeHeaders:recipients:fromRange:ofString:addCountryCodeToParties:sqlController:", v10, v11, 0, objc_msgSend(v9, "length"), v9, 1, v8);
    v14 = v13;
    _WLLog();
    obj = v11;
    _WLLog();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("X-CMD-Message-Type"), self, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    self->_messageType = objc_msgSend(v15, "isEqualToString:", CFSTR("sms"));
    v74 = v10;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Date"));
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    dateString = self->_dateString;
    self->_dateString = v16;

    if (self->_dateString)
    {
      +[WLMessage _dateFormatterForMimeDateStrings](WLMessage, "_dateFormatterForMimeDateStrings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dateFromString:", self->_dateString);
      v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
      date = self->_date;
      self->_date = v19;

      v64 = self->_date;
      v65 = self->_dateString;
      v62 = self;
      _WLLog();
    }
    objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("X-CMD-Message-Direction"), v62, v64, v65);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v71 = v21;
    if (objc_msgSend(v21, "isEqualToString:", CFSTR("sent")))
    {
      self->_messageDirection = 0;
      v9 = v72;
      if (!objc_msgSend(v11, "count"))
      {
        v63 = self;
        _WLLog();
      }
    }
    else
    {
      self->_messageDirection = 1;
      objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("From"));
      v23 = (WLMessageParty *)objc_claimAutoreleasedReturnValue();
      sender = self->_sender;
      self->_sender = v23;

      v9 = v72;
    }
    objc_storeStrong((id *)&self->_recipients, v11);
    self->_isGroupMessage = -[NSArray count](self->_recipients, "count") > 1;
    objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("Subject"), v63);
    v25 = (NSString *)objc_claimAutoreleasedReturnValue();
    subject = self->_subject;
    self->_subject = v25;

    if (+[WLMessage _shouldIgnoreMessageThreadID](WLMessage, "_shouldIgnoreMessageThreadID"))
    {
      threadID = self->_threadID;
      self->_threadID = 0;
    }
    else
    {
      objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("X-CMD-Message-Thread"));
      v28 = (NSString *)objc_claimAutoreleasedReturnValue();
      threadID = self->_threadID;
      self->_threadID = v28;
    }

    v29 = objc_msgSend(v9, "rangeOfString:options:range:", CFSTR("\r\n"), 8, v12, v14);
    if (v30)
    {
      v12 = v29 + v30;
      v14 = objc_msgSend(v9, "length") - (v29 + v30);
    }
    if (self->_messageType == 1)
    {
      objc_msgSend(v9, "rangeOfString:options:range:", CFSTR("\r\n"), 12, v12, v14);
      objc_msgSend(v9, "substringWithRange:", v12, v14 - v31);
      v32 = (NSString *)objc_claimAutoreleasedReturnValue();
      messageText = self->_messageText;
      self->_messageText = v32;

    }
    else
    {
      objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("Content-Type"));
      v34 = objc_claimAutoreleasedReturnValue();
      v69 = v8;
      v70 = v7;
      v68 = (void *)v34;
      if (v34)
        objc_msgSend(v74, "setObject:forKey:", v34, CFSTR("content-type"));
      else
        _WLLog();
      v35 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      mimeParts = self->_mimeParts;
      self->_mimeParts = v35;

      v37 = -[NSData mutableCopy](self->_mimeData, "mutableCopy");
      v38 = objc_alloc(MEMORY[0x24BE66348]);
      v76 = (void *)v37;
      v39 = (void *)objc_msgSend(v38, "initWithBodyData:topLevelHeaders:headersToPreserve:", v37, v74, MEMORY[0x24BDBD1A8]);
      objc_msgSend(v39, "setDelegate:", self);
      v67 = v39;
      objc_msgSend(v39, "start");
      v75 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_mimeParts, "count"));
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v78 = self->_mimeParts;
      v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v78, "countByEnumeratingWithState:objects:count:", &v80, v84, 16);
      v41 = 0x255482000uLL;
      if (v40)
      {
        v42 = v40;
        v79 = *(_QWORD *)v81;
        do
        {
          v43 = 0;
          v77 = v42;
          do
          {
            if (*(_QWORD *)v81 != v79)
              objc_enumerationMutation(v78);
            v44 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v43);
            _WLLog();
            objc_msgSend(v44, "contentTransferEncoding", self, v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "lowercaseString");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("base64"));

            if (v47)
            {
              v48 = objc_msgSend(v44, "range");
              objc_msgSend(v76, "subdataWithRange:", v48, v49);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedData:options:", v50, 1);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v51, "length"));
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v50, "length"));
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              _WLLog();

              if (v51)
              {
                objc_msgSend((id)(v41 + 3184), "_fileNameForPart:smilContext:", v44, self->_smilContext, self, v52, v66);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(v44, "type");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "subtype");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "stringWithFormat:", CFSTR("%@/%@"), v55, v56);
                v57 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x24BDF8238], "typeWithMIMEType:", v57);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "identifier");
                v59 = (void *)objc_claimAutoreleasedReturnValue();

                _WLLog();
                v60 = -[WLMessageAttachment _initWithData:fileName:mimeType:uti:]([WLMessageAttachment alloc], "_initWithData:fileName:mimeType:uti:", v51, v53, v57, v59, self, v59, v57);
                objc_msgSend(v75, "addObject:", v60);

                v41 = 0x255482000;
              }
              else
              {
                _WLLog();
              }

              v42 = v77;
            }
            _WLLog();
            ++v43;
          }
          while (v42 != v43);
          v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v78, "countByEnumeratingWithState:objects:count:", &v80, v84, 16, self, v44);
        }
        while (v42);
      }

      objc_storeStrong((id *)&self->_attachments, v75);
      if (!self->_messageText)
      {
        _WLLog();
        v61 = self->_messageText;
        self->_messageText = (NSString *)&stru_24E376E00;

      }
      v8 = v69;
      v7 = v70;
      v9 = v72;
    }
    v22 = v74;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();
  }

}

+ (id)_fileNameForPart:(id)a3 smilContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "disposition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7
    || (v9 = objc_msgSend(v7, "rangeOfString:", CFSTR("; filename=\")), v9 == 0x7FFFFFFFFFFFFFFFLL)
    || (v11 = v9 + v10,
        v12 = objc_msgSend(v8, "rangeOfString:options:range:", CFSTR("\"), 0, v11, objc_msgSend(v8, "length") - v11),
        v12 == 0x7FFFFFFFFFFFFFFFLL)
    || (objc_msgSend(v8, "substringWithRange:", v11, v12 - v11),
        (v13 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v6, "parts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (!v15)
    {

LABEL_17:
      v23 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUIDString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("Image_%@"), v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    v16 = v15;
    v27 = v6;
    v13 = 0;
    v17 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v19, "elementName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("text"));

        if ((v21 & 1) == 0)
        {
          objc_msgSend(v19, "fileName");
          v22 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v22;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v16);

    v6 = v27;
    if (!v13)
      goto LABEL_17;
  }
LABEL_18:

  return v13;
}

+ (BOOL)_shouldIgnoreMessageThreadID
{
  if (_shouldIgnoreMessageThreadID_onceToken != -1)
    dispatch_once(&_shouldIgnoreMessageThreadID_onceToken, &__block_literal_global_87);
  return _shouldIgnoreMessageThreadID_shouldIgnoreMessageThreadID;
}

void __41__WLMessage__shouldIgnoreMessageThreadID__block_invoke()
{
  id v0;

  _shouldIgnoreMessageThreadID_shouldIgnoreMessageThreadID = objc_msgSend(MEMORY[0x24BEC2830], "BOOLForKey:", CFSTR("WLIgnoreMessageThreadID")) == 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _WLLog();

}

- (void)progressiveMimeParser:(id)a3 beganMimePart:(id)a4
{
  _WLLog();
}

- (void)progressiveMimeParser:(id)a3 finishedMimePart:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSData *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSString *v15;
  NSString *v16;
  void *v17;
  void *v18;
  int v19;
  WLMessageSMILContext *v20;
  WLMessageSMILContext *smilContext;
  NSData *mimeData;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSString *messageText;
  void *v28;
  void *v29;
  id v30;

  v30 = a4;
  _WLLog();
  objc_msgSend(v30, "type", self, v30);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("multipart"));

  if (v6)
    goto LABEL_2;
  objc_msgSend(v30, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("text")) & 1) == 0)
  {

LABEL_10:
    objc_msgSend(v30, "type");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("application")) & 1) != 0)
    {
      objc_msgSend(v30, "subtype");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("smil"));

      if (v19)
      {
        _WLLog();
        if (self->_smilContext)
        {
LABEL_2:
          _WLLog();
LABEL_21:
          v10 = v30;
          goto LABEL_22;
        }
        v20 = objc_alloc_init(WLMessageSMILContext);
        smilContext = self->_smilContext;
        self->_smilContext = v20;

        mimeData = self->_mimeData;
        v23 = objc_msgSend(v30, "range", self, v30);
        -[NSData wl_subdataWithRangeExcludingTrailingCrnl:](mimeData, "wl_subdataWithRangeExcludingTrailingCrnl:", v23, v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1978]), "initWithData:", v14);
        objc_msgSend(v25, "setDelegate:", self->_smilContext);
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v14, 4);
        _WLLog();

        v26 = objc_msgSend(v25, "parse", self, v28);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        _WLLog();

        goto LABEL_19;
      }
    }
    else
    {

    }
    _WLLog();
    -[NSMutableArray addObject:](self->_mimeParts, "addObject:", v30, self, v30);
    goto LABEL_21;
  }
  objc_msgSend(v30, "subtype");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("plain"));

  if (!v9)
    goto LABEL_10;
  v10 = v30;
  if (!self->_messageText)
  {
    _WLLog();
    v11 = self->_mimeData;
    v12 = objc_msgSend(v30, "range", self, v30);
    -[NSData wl_subdataWithRangeExcludingTrailingCrnl:](v11, "wl_subdataWithRangeExcludingTrailingCrnl:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "length"))
    {
      _WLLog();
      messageText = self->_messageText;
      self->_messageText = (NSString *)&stru_24E376E00;

      goto LABEL_20;
    }
    v15 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v14, 4);
    v16 = self->_messageText;
    self->_messageText = v15;

    if (-[NSString length](self->_messageText, "length") <= 0x63)
    {
      _WLLog();
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSString length](self->_messageText, "length"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();
LABEL_19:

    goto LABEL_20;
  }
LABEL_22:

}

- (void)progressiveMimeParser:(id)a3 beganDataForMimePart:(id)a4
{
  _WLLog();
}

- (void)progressiveMimeParser:(id)a3 failedWithError:(id)a4
{
  _WLLog();
}

- (id)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (NSData)mimeData
{
  return self->_mimeData;
}

- (unint64_t)messageType
{
  return self->_messageType;
}

- (NSString)dateString
{
  return self->_dateString;
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)messageDirection
{
  return self->_messageDirection;
}

- (void)setMessageDirection:(unint64_t)a3
{
  self->_messageDirection = a3;
}

- (WLMessageParty)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_storeStrong((id *)&self->_sender, a3);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (BOOL)isGroupMessage
{
  return self->_isGroupMessage;
}

- (void)setIsGroupMessage:(BOOL)a3
{
  self->_isGroupMessage = a3;
}

- (NSString)subject
{
  return self->_subject;
}

- (NSString)messageText
{
  return self->_messageText;
}

- (NSString)threadID
{
  return self->_threadID;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_messageText, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_dateString, 0);
  objc_storeStrong((id *)&self->_mimeData, 0);
  objc_storeStrong((id *)&self->_mimeParts, 0);
  objc_storeStrong((id *)&self->_smilContext, 0);
  objc_storeStrong((id *)&self->_summary, 0);
}

@end
