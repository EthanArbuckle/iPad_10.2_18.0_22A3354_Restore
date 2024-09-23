@implementation VTEvent

- (VTEvent)initWithEventLogURL:(id)a3
{
  id v5;
  VTEvent *v6;
  VTEvent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VTEvent;
  v6 = -[VTEvent init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_jsonFileUrl, a3);
    -[VTEvent _readJsonFile:](v7, "_readJsonFile:", v5);
  }

  return v7;
}

- (id)jsonFileName
{
  return -[NSURL lastPathComponent](self->_jsonFileUrl, "lastPathComponent");
}

- (void)_readJsonFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *voiceTriggerEventInfo;
  id v11;

  v4 = a3;
  if (v4)
  {
    v11 = v4;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, 0);
      v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      voiceTriggerEventInfo = self->_voiceTriggerEventInfo;
      self->_voiceTriggerEventInfo = v9;

    }
    v4 = v11;
  }

}

- (id)timestampString
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  -[VTEvent jsonFileName](self, "jsonFileName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = &stru_24C7F6FB8;
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-almost.json"), &stru_24C7F6FB8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-rejected.json"), &stru_24C7F6FB8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-triggered.json"), &stru_24C7F6FB8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-prepare.json"), &stru_24C7F6FB8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-corrupted.json"), &stru_24C7F6FB8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocale:", v10);

  objc_msgSend(v9, "setDateFormat:", CFSTR("yyyyMMdd-HHmmss"));
  objc_msgSend(v9, "dateFromString:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v9, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
    objc_msgSend(v9, "stringFromDate:", v11);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)eventTrackerDictionary
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("title");
  -[VTEvent _buildTitle](self, "_buildTitle");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = CFSTR("???");
  v15[0] = v5;
  v14[1] = CFSTR("content");
  -[VTEvent _buildContent](self, "_buildContent");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("???");
  v15[1] = v8;
  v14[2] = CFSTR("detail");
  -[VTEvent _buildDetail](self, "_buildDetail");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = CFSTR("???");
  v15[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_buildTitle
{
  return 0;
}

- (id)_buildContent
{
  return 0;
}

- (id)_buildDetail
{
  return 0;
}

- (id)_buildTriggerContent
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

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTEvent _packAudioURLFromVTEventInfo:key:](self, "_packAudioURLFromVTEventInfo:key:", CFSTR("Audio Play"), CFSTR("captureFilePath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[VTEvent _getFloatStringFromVTEventWithKey:decimal:](self, "_getFloatStringFromVTEventWithKey:decimal:", CFSTR("triggerScore"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTEvent _packStringContent:value:](self, "_packStringContent:value:", CFSTR("Trigger Score"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  -[VTEvent _getFloatStringFromVTEventWithKey:decimal:](self, "_getFloatStringFromVTEventWithKey:decimal:", CFSTR("effectiveThreshold"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTEvent _packStringContent:value:](self, "_packStringContent:value:", CFSTR("Trigger Threshold"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  -[VTEvent _getFloatStringFromVTEventWithKey:decimal:](self, "_getFloatStringFromVTEventWithKey:decimal:", CFSTR("satScore"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTEvent _packStringContent:value:](self, "_packStringContent:value:", CFSTR("SAT Score"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  -[VTEvent _getFloatStringFromVTEventWithKey:decimal:](self, "_getFloatStringFromVTEventWithKey:decimal:", CFSTR("satThreshold"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTEvent _packStringContent:value:](self, "_packStringContent:value:", CFSTR("SAT Threshold"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  return v3;
}

- (id)_buildTriggerDetail
{
  void *v3;
  void *v4;
  void *v5;
  NSDictionary *voiceTriggerEventInfo;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  VTEvent *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  VTEvent *v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTEvent timestampString](self, "timestampString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VTEvent _packStringContent:value:](self, "_packStringContent:value:", CFSTR("DateTime"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  voiceTriggerEventInfo = self->_voiceTriggerEventInfo;
  if (voiceTriggerEventInfo)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[NSDictionary allKeys](voiceTriggerEventInfo, "allKeys", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v31 != v11)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          -[NSDictionary objectForKey:](self->_voiceTriggerEventInfo, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "scanInt:", 0) && objc_msgSend(v16, "isAtEnd"))
            {
              v17 = self;
              v18 = v14;
              v19 = 0;
              goto LABEL_26;
            }
            if (objc_msgSend(v16, "scanFloat:", 0) && objc_msgSend(v16, "isAtEnd"))
            {
              v17 = self;
              v18 = v14;
              v19 = 1;
LABEL_26:
              -[VTEvent _getFloatStringFromVTEventWithKey:decimal:](v17, "_getFloatStringFromVTEventWithKey:decimal:", v18, v19);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              -[VTEvent _packStringContent:value:](self, "_packStringContent:value:", v14, v13);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v28);

            }
            else
            {
              -[VTEvent _packStringFromVTEventInfo:key:](self, "_packStringFromVTEventInfo:key:", v14, v14);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v13);
            }

LABEL_8:
            goto LABEL_9;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v20 = objc_retainAutorelease(v15);
            if (!strcmp((const char *)objc_msgSend(v20, "objCType"), "c")
              || (v21 = objc_retainAutorelease(v20), !strcmp((const char *)objc_msgSend(v21, "objCType"), "i"))
              || (v22 = objc_retainAutorelease(v21), !strcmp((const char *)objc_msgSend(v22, "objCType"), "s"))
              || (v23 = objc_retainAutorelease(v22), !strcmp((const char *)objc_msgSend(v23, "objCType"), "q"))
              || !strcmp((const char *)objc_msgSend(objc_retainAutorelease(v23), "objCType"), "q"))
            {
              v24 = self;
              v25 = v14;
              v26 = v14;
              v27 = CFSTR("%.0f");
            }
            else
            {
              v24 = self;
              v25 = v14;
              v26 = v14;
              v27 = CFSTR("%.2f");
            }
            -[VTEvent _packNumberFomVTEventInfo:key:format:](v24, "_packNumberFomVTEventInfo:key:format:", v25, v26, v27);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v16);
            goto LABEL_8;
          }
LABEL_9:

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v10);
    }

  }
  return v3;
}

- (id)_packAudioContent:(id)a3 filepath:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("type");
  v10[1] = CFSTR("name");
  v11[0] = CFSTR("audio");
  v11[1] = a3;
  v10[2] = CFSTR("value");
  v11[2] = a4;
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_packStringContent:(id)a3 value:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("type");
  v10[1] = CFSTR("name");
  v11[0] = CFSTR("plain");
  v11[1] = a3;
  v10[2] = CFSTR("value");
  v11[2] = a4;
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_packAudioURLFromVTEventInfo:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  NSDictionary *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = self->_voiceTriggerEventInfo;
  -[NSDictionary objectForKey:](v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NSDictionary objectForKey:](v8, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTEvent _packAudioContent:filepath:](self, "_packAudioContent:filepath:", v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[VTEvent _packAudioContent:filepath:](self, "_packAudioContent:filepath:", v6, &stru_24C7F6FB8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_getFloatStringFromVTEventWithKey:(id)a3 decimal:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSDictionary *v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  const __CFString *v12;
  __CFString *v13;

  v4 = a4;
  v6 = a3;
  v7 = self->_voiceTriggerEventInfo;
  -[NSDictionary objectForKey:](v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NSDictionary objectForKey:](v7, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    v11 = v10;

    if (v4)
      v12 = CFSTR("%.2f");
    else
      v12 = CFSTR("%.0f");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v12, v11);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = &stru_24C7F6FB8;
  }

  return v13;
}

- (id)_packBooleanFromVTEventInfo:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  NSDictionary *v8;
  void *v9;
  void *v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = self->_voiceTriggerEventInfo;
  -[NSDictionary objectForKey:](v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NSDictionary objectForKey:](v8, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");
    v12 = CFSTR("False");
    if (v11)
      v12 = CFSTR("True");
    v13 = v12;

    -[VTEvent _packStringContent:value:](self, "_packStringContent:value:", v6, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[VTEvent _packStringContent:value:](self, "_packStringContent:value:", v6, &stru_24C7F6FB8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)_packStringFromVTEventInfo:(id)a3 key:(id)a4
{
  id v6;
  id v7;
  NSDictionary *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = self->_voiceTriggerEventInfo;
  -[NSDictionary objectForKey:](v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NSDictionary objectForKey:](v8, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTEvent _packStringContent:value:](self, "_packStringContent:value:", v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[VTEvent _packStringContent:value:](self, "_packStringContent:value:", v6, &stru_24C7F6FB8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (NSURL)jsonFileUrl
{
  return self->_jsonFileUrl;
}

- (NSDictionary)voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceTriggerEventInfo, 0);
  objc_storeStrong((id *)&self->_jsonFileUrl, 0);
}

+ (id)eventFromURL:(id)a3
{
  id v3;
  int64_t v4;
  void *v5;

  v3 = a3;
  v4 = +[VTEvent eventTypeFromURL:](VTEvent, "eventTypeFromURL:", v3);
  if ((unint64_t)(v4 - 1) > 4)
    v5 = 0;
  else
    v5 = (void *)objc_msgSend(objc_alloc(*off_24C7F4720[v4 - 1]), "initWithEventLogURL:", v3);

  return v5;
}

+ (int64_t)eventTypeFromURL:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasSuffix:", CFSTR("-almost.json")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "hasSuffix:", CFSTR("-rejected.json")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "hasSuffix:", CFSTR("-triggered.json")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "hasSuffix:", CFSTR("-prepare.json")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "hasSuffix:", CFSTR("-corrupted.json")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
