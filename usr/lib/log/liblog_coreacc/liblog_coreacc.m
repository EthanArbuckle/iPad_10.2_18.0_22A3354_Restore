id convertNSDataToNSString(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  void *v9;

  v3 = a1;
  v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = objc_retainAutorelease(v3);
    v6 = objc_msgSend(v5, "bytes");
    v7 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    if (objc_msgSend(v5, "length"))
    {
      v8 = 0;
      do
        objc_msgSend(v7, "appendFormat:", v4, *(unsigned __int8 *)(v6 + v8++));
      while (v8 < objc_msgSend(v5, "length"));
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id trimBidirectionalUnicodeCharacters(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD14A8];
  v2 = a1;
  objc_msgSend(v1, "characterSetWithCharactersInString:", CFSTR("\u202A\u202B\u202C\u202D"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id removeBidirectionalUnicodeCharacters(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x24BDD14A8];
  v2 = a1;
  objc_msgSend(v1, "characterSetWithCharactersInString:", CFSTR("\u202A\u202B\u202C\u202D"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsJoinedByString:", &stru_24EB650F8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id convertNSStringToNSData(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  size_t v7;
  _BYTE *v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  char v12;
  char v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  char v17;
  char v18;
  unint64_t v19;
  void *v20;
  __int16 v22;

  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "hexadecimalCharacterSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invertedSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "componentsSeparatedByCharactersInSet:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", &stru_24EB650F8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v1 = objc_retainAutorelease(v5);
    v6 = (const char *)objc_msgSend(v1, "UTF8String");
    v7 = strlen(v6) >> 1;
    v8 = malloc_type_malloc(v7, 0x71BB6ACDuLL);
    if (v6 && (unint64_t)objc_msgSend(v1, "length") >= 2)
    {
      v9 = 0;
      v10 = 0;
      do
      {
        v11 = 0;
        v22 = -21846;
        v12 = 1;
        do
        {
          v13 = v12;
          v14 = v6[v11 | (2 * v10)];
          v15 = v14 - 48;
          v16 = v14 - 65;
          if ((v14 - 97) >= 6)
            v17 = 0;
          else
            v17 = v14 - 87;
          v18 = v14 - 55;
          if (v16 > 5)
            v18 = v17;
          if (v15 < 0xA)
            v18 = v15;
          *((_BYTE *)&v22 + v11) = v18;
          v11 = 1;
          v12 = 0;
        }
        while ((v13 & 1) != 0);
        v8[v9] = HIBYTE(v22) | (16 * v22);
        v9 = (v10 + 1);
        v19 = objc_msgSend(v1, "length");
        v10 = v9;
      }
      while (v9 < v19 >> 1);
    }
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v8, v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      free(v8);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t classImplementsMethodsInProtocol(void *a1, void *a2, BOOL a3, BOOL a4, _QWORD *a5)
{
  Protocol *v9;
  void *v10;
  objc_method_description *v11;
  objc_method_description *v12;
  unint64_t v13;
  SEL *p_name;
  void *v15;
  uint64_t v16;
  unsigned int outCount;

  v9 = a2;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  outCount = 0;
  v11 = protocol_copyMethodDescriptionList(v9, a3, a4, &outCount);
  v12 = v11;
  if (outCount)
  {
    v13 = 0;
    p_name = &v11->name;
    do
    {
      if ((objc_msgSend(a1, "instancesRespondToSelector:", *p_name) & 1) == 0)
      {
        NSStringFromSelector(*p_name);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v15);

      }
      ++v13;
      p_name += 2;
    }
    while (v13 < outCount);
  }
  free(v12);
  if (outCount && objc_msgSend(v10, "count"))
  {
    v16 = 0;
    if (!a5)
      goto LABEL_12;
    goto LABEL_11;
  }
  v16 = 1;
  if (a5)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

  return v16;
}

uint64_t isNSObjectNull(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;

  if (!a1)
    return 1;
  v1 = (void *)MEMORY[0x24BDBCEF8];
  v2 = a1;
  objc_msgSend(v1, "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

id NSObjectIfNotNull(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if ((isNSObjectNull(v1) & 1) != 0)
    v2 = 0;
  else
    v2 = v1;

  return v2;
}

uint64_t isNSObjectEqual(unint64_t a1, uint64_t a2)
{
  if (a1 | a2)
    return objc_msgSend((id)a1, "isEqual:", a2);
  else
    return 1;
}

id castNSObjectToType(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id readJSONFile(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v5;

  if (!a1)
  {
    v3 = 0;
    return v3;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
    goto LABEL_5;
  v5 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v1, 0, &v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v5)
  {

LABEL_5:
    v3 = 0;
  }

  return v3;
}

uint64_t writeJSONFile(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;

  v3 = a1;
  v4 = a2;
  if (!v4)
    goto LABEL_7;
  if (!v3)
    v3 = (id)MEMORY[0x24BDBD1B8];
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v3))
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v3, 1, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v9)
      v7 = 0;
    else
      v7 = objc_msgSend(v5, "writeToFile:atomically:", v4, 1);

  }
  else
  {
LABEL_7:
    v7 = 0;
  }

  return v7;
}

id base64EncodeArray(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "base64EncodedStringWithOptions:", 0, (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

id base64DecodeArray(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = objc_alloc(MEMORY[0x24BDBCE50]);
        v10 = (void *)objc_msgSend(v9, "initWithBase64EncodedString:options:", v8, 0, (_QWORD)v12);
        if (v10)
          objc_msgSend(v2, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v2;
}

uint64_t OSLogCopyFormattedString(const char *a1, void *a2)
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  __CFString *v7;
  int v8;
  unsigned int v9;
  void *v10;
  char **v11;
  uint64_t v12;
  const __CFString *v13;
  unsigned int v14;
  __CFString **v15;
  unsigned int v16;
  __CFString **v17;
  unsigned int v18;
  __CFString *v19;
  unsigned int v20;
  __CFString *v21;
  unsigned int v22;
  __CFString **v23;
  unsigned int v24;
  const __CFString *v25;
  unsigned int v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  int v32;
  int v33;
  unint64_t v34;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<decode failure [%s]: <%@: %@>>"), a1, v6, v3);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!strcmp(a1, "BOOL"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(v3, "BOOLValue");

      if (v8)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
    }
  }
  if (!strcmp(a1, "bytes"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_25;
    convertNSDataToNSString(v3, CFSTR("%02X "));
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (!strcmp(a1, "ACCConnection_Type_t"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(v3, "intValue");
      if (v9 <= 9)
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        v11 = kACCConnection_Type_Strings;
        goto LABEL_22;
      }
    }
  }
  else if (!strcmp(a1, "ACCAuthInfo_Status_t"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = objc_msgSend(v3, "intValue");
      if (v18 < 4)
      {
        v13 = *(&off_24EB64CF8 + (int)v18);
        goto LABEL_24;
      }
    }
  }
  else if (!strcmp(a1, "ACCAuthInfo_Type_t"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = objc_msgSend(v3, "intValue");
      if (v26 < 7 && ((0x5Fu >> v26) & 1) != 0)
      {
        v13 = *(&off_24EB64D18 + (int)v26);
        goto LABEL_24;
      }
    }
  }
  else if (!strcmp(a1, "ACCAuthInfo_Version_t"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = objc_msgSend(v3, "intValue");
      switch(v27)
      {
        case 0:
          v13 = CFSTR("[Unknown]");
          goto LABEL_24;
        case 3:
          v13 = CFSTR("[V3]");
          goto LABEL_24;
        case 2:
          v13 = CFSTR("[V2]");
          goto LABEL_24;
      }
    }
  }
  else if (!strcmp(a1, "ACCAuthInfo_V2_Info_CertClass_t"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = objc_msgSend(v3, "intValue");
      if (!v29)
      {
        v13 = CFSTR("[00 - Apple]");
        goto LABEL_24;
      }
      if (v29 == 255)
      {
        v13 = CFSTR("[FF - Unknown]");
        goto LABEL_24;
      }
    }
  }
  else if (!strcmp(a1, "ACCEndpoint_TransportType_t"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(v3, "intValue");
      if (v9 <= 0xF)
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        v11 = kACCEndpoint_TransportType_Strings;
        goto LABEL_22;
      }
    }
  }
  else if (!strcmp(a1, "ACCEndpoint_Protocol_t"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(v3, "intValue");
      if (v9 <= 0x11)
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        v11 = kACCEndpoint_Protocol_Strings;
LABEL_22:
        objc_msgSend(v10, "stringWithFormat:", CFSTR("[%s]"), v11[v9]);
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_23:
        v13 = (const __CFString *)v12;
LABEL_24:

        v7 = (__CFString *)v13;
      }
    }
  }
LABEL_25:
  if (!strcmp(a1, "ACCDeviceNotification_t"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = objc_msgSend(v3, "intValue");
      if (v16 < 6 && ((0x2Fu >> v16) & 1) != 0)
      {
        v17 = &off_24EB64D50 + (int)v16;
LABEL_46:
        v19 = *v17;

        v7 = v19;
      }
    }
  }
  else if (!strcmp(a1, "ACCNowPlaying_NowPlayingUpdate_PlaybackAttributes_PlaybackStatus_t"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = objc_msgSend(v3, "intValue");
      if (v14 < 5)
      {
        v15 = &off_24EB64D80;
        goto LABEL_45;
      }
    }
  }
  else if (!strcmp(a1, "ACCNowPlaying_NowPlayingUpdate_PlaybackAttributes_ShuffleMode_t"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = objc_msgSend(v3, "intValue");
      if (v14 < 3)
      {
        v15 = &off_24EB64DA8;
        goto LABEL_45;
      }
    }
  }
  else if (!strcmp(a1, "ACCNowPlaying_NowPlayingUpdate_PlaybackAttributes_RepeatMode_t"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = objc_msgSend(v3, "intValue");
      if (v14 < 3)
      {
        v15 = &off_24EB64DC0;
LABEL_45:
        v17 = &v15[v14];
        goto LABEL_46;
      }
    }
  }
  if (!strcmp(a1, "iAP2Feature_t"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = objc_msgSend(v3, "intValue");
      if (v20 <= 0x1C)
      {
        v21 = *(&off_24EB64DD8 + (int)v20);

        v7 = v21;
      }
    }
  }
  if (strcmp(a1, "iAP2Feature_AccAuthentication_State_t"))
  {
    if (!strcmp(a1, "iAP2Feature_Identification_State_t"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = objc_msgSend(v3, "intValue");
        if (v22 < 7)
        {
          v23 = &off_24EB64ED8;
          goto LABEL_109;
        }
      }
      goto LABEL_111;
    }
    if (!strcmp(a1, "iAP2ParamID_IdentificationInfo_HIDComponent_Function_t"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_111;
      v24 = objc_msgSend(v3, "intValue");
      if (v24 >= 9 || ((0x1DFu >> v24) & 1) == 0)
        goto LABEL_111;
      v25 = *(&off_24EB64F10 + (int)v24);
    }
    else
    {
      if (!strcmp(a1, "iAP2PacketServiceType_t"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v22 = objc_msgSend(v3, "intValue");
          if (v22 < 4)
          {
            v23 = &off_24EB64F58;
            goto LABEL_109;
          }
        }
        goto LABEL_111;
      }
      if (strcmp(a1, "iAP2ParamID_RequestAppLaunch_AppLaunchMethod_t"))
      {
        if (!strcmp(a1, "ACCCommunications_CallService_t"))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = objc_msgSend(v3, "intValue");
            if (v22 < 4)
            {
              v23 = &off_24EB64F78;
              goto LABEL_109;
            }
          }
        }
        else if (!strcmp(a1, "ACCCommunications_CommunicationsUpdate_RegistrationStatus_t"))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = objc_msgSend(v3, "intValue");
            if (v22 < 7)
            {
              v23 = &off_24EB64F98;
              goto LABEL_109;
            }
          }
        }
        else
        {
          if (!strcmp(a1, "ACCCommunications_CallControls_AcceptAction_t"))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_111;
            v32 = objc_msgSend(v3, "intValue");
            if (v32)
            {
              if (v32 != 1)
                goto LABEL_111;
              v25 = CFSTR("[End and Accept]");
            }
            else
            {
              v25 = CFSTR("[Accept/Hold and Accept]");
            }
            goto LABEL_110;
          }
          if (!strcmp(a1, "ACCCommunications_CallControls_EndAction_t"))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(v3, "intValue"))
            {
              v25 = CFSTR("[End]");
              goto LABEL_110;
            }
          }
          else if (!strcmp(a1, "ACCCommunications_CallControls_DTMFTone_t"))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v22 = objc_msgSend(v3, "intValue");
              if (v22 < 0xC)
              {
                v23 = &off_24EB64FD0;
                goto LABEL_109;
              }
            }
          }
          else
          {
            if (!strcmp(a1, "ACCCommunications_ListUpdate_Type_t"))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_111;
              v33 = objc_msgSend(v3, "intValue");
              if (v33)
              {
                if (v33 != 1)
                  goto LABEL_111;
                v25 = CFSTR("[Favorites]");
              }
              else
              {
                v25 = CFSTR("[Recents]");
              }
              goto LABEL_110;
            }
            if (!strcmp(a1, "FairPlaySAPSessionState"))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v34 = objc_msgSend(v3, "unsignedIntegerValue");
                if (v34 < 3)
                {
                  v25 = *(&off_24EB65030 + v34);
                  goto LABEL_110;
                }
              }
            }
            else if (!strcmp(a1, "MFAACertificateManager_CertStatus_t"))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v22 = objc_msgSend(v3, "intValue");
                if (v22 < 5)
                {
                  v23 = &off_24EB65048;
                  goto LABEL_109;
                }
              }
            }
            else if (!strcmp(a1, "CertificateType_t"))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v22 = objc_msgSend(v3, "intValue");
                if (v22 < 3)
                {
                  v23 = &off_24EB65070;
                  goto LABEL_109;
                }
              }
            }
            else if (!strcmp(a1, "MFAACertificateManager_SWAuth_CertType_t"))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v22 = objc_msgSend(v3, "intValue");
                if (v22 < 4)
                {
                  v23 = &off_24EB65088;
                  goto LABEL_109;
                }
              }
            }
            else if (!strcmp(a1, "SeciAuthVersion"))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v22 = objc_msgSend(v3, "intValue");
                if (v22 < 6)
                {
                  v23 = &off_24EB650A8;
LABEL_109:
                  v25 = v23[v22];
                  goto LABEL_110;
                }
              }
            }
          }
        }
        goto LABEL_111;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_111;
      v28 = objc_msgSend(v3, "intValue");
      if (!v28)
      {
        v25 = CFSTR("[With User Alert]");
        goto LABEL_110;
      }
      if (v28 != 1)
        goto LABEL_111;
      v25 = CFSTR("[Without User Alert]");
    }
LABEL_110:

    v7 = (__CFString *)v25;
    goto LABEL_111;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = objc_msgSend(v3, "intValue");
    if (v22 < 3)
    {
      v23 = &off_24EB64EC0;
      goto LABEL_109;
    }
  }
LABEL_111:
  v30 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v7);

  return v30;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x24BEDD4D0](p, isRequiredMethod, isInstanceMethod, outCount);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

