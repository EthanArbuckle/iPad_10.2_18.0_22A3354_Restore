@implementation WLSourceDeviceHandshakeParser

- (BOOL)parseData:(id)a3 modifyingSourceDevice:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD);
  id v10;
  const xmlDoc *Memory;
  xmlDoc *v12;
  xmlNodePtr RootElement;
  const xmlNode *children;
  char v15;
  void *v16;
  xmlChar *Content;
  void *v18;
  BOOL v19;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  v10 = objc_retainAutorelease(v7);
  Memory = xmlReadMemory((const char *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), 0, 0, 0);
  if (!Memory)
    goto LABEL_15;
  v12 = (xmlDoc *)Memory;
  RootElement = xmlDocGetRootElement(Memory);
  if (!RootElement)
  {
    xmlFreeDoc(v12);
LABEL_15:
    v19 = 0;
    goto LABEL_18;
  }
  children = RootElement->children;
  if (children)
  {
    v15 = 0;
    do
    {
      if (children->name)
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", children->name);
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("api")))
        {
          Content = xmlNodeGetContent(children);
          if (Content)
          {
            v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", Content);
            objc_msgSend(v8, "setApi:", v18);

          }
        }
        else if (objc_msgSend(v16, "isEqualToString:", CFSTR("device_info")))
        {
          -[WLSourceDeviceHandshakeParser _parseDeviceInfoNode:modifyingSourceDevice:](self, "_parseDeviceInfoNode:modifyingSourceDevice:", children, v8);
          v15 = 1;
        }

      }
      children = children->next;
    }
    while (children);
  }
  else
  {
    v15 = 0;
  }
  xmlFreeDoc(v12);
  v9[2](v9, v15 & 1);
  v19 = 1;
LABEL_18:

  return v19;
}

- (void)_parseDeviceInfoNode:(_xmlNode *)a3 modifyingSourceDevice:(id)a4
{
  _xmlNode *i;
  const char *name;
  xmlChar *v7;
  void *v8;
  xmlChar *Content;
  xmlChar *v10;
  xmlChar *v11;
  xmlChar *v12;
  xmlChar *v13;
  xmlChar *v14;
  xmlChar *v15;
  xmlChar *v16;
  xmlChar *v17;
  xmlChar *v18;
  xmlChar *v19;
  xmlChar *v20;
  xmlChar *v21;
  void *v22;
  xmlChar *v23;
  void *v24;
  xmlChar *v25;
  xmlChar *v26;
  xmlChar *v27;
  xmlChar *v28;
  xmlChar *v29;
  xmlChar *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  unsigned int v39;
  void *v40;
  id v41;

  v41 = a4;
  for (i = a3->children; i; i = i->next)
  {
    name = (const char *)i->name;
    if (name)
    {
      if (!strcmp((const char *)i->name, "port"))
      {
        Content = xmlNodeGetContent(i);
        if (Content)
          objc_msgSend(v41, "setHttpPort:", (unsigned __int16)atoi((const char *)Content));
        continue;
      }
      if (!strcmp(name, "auth_port"))
      {
        v10 = xmlNodeGetContent(i);
        if (v10)
          objc_msgSend(v41, "setSocketPort:", (unsigned __int16)atoi((const char *)v10));
        continue;
      }
      if (!strcmp(name, "name"))
      {
        v11 = xmlNodeGetContent(i);
        if (v11)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v11);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setName:", v8);
LABEL_47:

        }
      }
      else if (!strcmp(name, "device_id"))
      {
        v12 = xmlNodeGetContent(i);
        if (v12)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v12);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setPersistentIdentifier:", v8);
          goto LABEL_47;
        }
      }
      else if (!strcmp(name, "os_api_version"))
      {
        v13 = xmlNodeGetContent(i);
        if (v13)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v13);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setOsAPIVersion:", v8);
          goto LABEL_47;
        }
      }
      else if (!strcmp(name, "hardware_brand"))
      {
        v14 = xmlNodeGetContent(i);
        if (v14)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v14);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setHardwareBrand:", v8);
          goto LABEL_47;
        }
      }
      else if (!strcmp(name, "hardware_model"))
      {
        v15 = xmlNodeGetContent(i);
        if (v15)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v15);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setHardwareModel:", v8);
          goto LABEL_47;
        }
      }
      else if (!strcmp(name, "hardware_design"))
      {
        v16 = xmlNodeGetContent(i);
        if (v16)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v16);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setHardwareDesign:", v8);
          goto LABEL_47;
        }
      }
      else if (!strcmp(name, "hardware_maker"))
      {
        v17 = xmlNodeGetContent(i);
        if (v17)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v17);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setHardwareMaker:", v8);
          goto LABEL_47;
        }
      }
      else
      {
        if (strcmp(name, "hardware_product"))
        {
          if (!strcmp(name, "supports_file_length"))
          {
            objc_msgSend(v41, "setSupportsFileLength:", 1);
            continue;
          }
          if (!strcmp(name, "can_add"))
          {
            v19 = xmlNodeGetContent(i);
            if (!v19)
              continue;
            v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v19);
            if (objc_msgSend(v8, "isEqualToString:", CFSTR("display")))
            {
              objc_msgSend(v41, "setCanAddDisplay:", 1);
            }
            else if (objc_msgSend(v8, "isEqualToString:", CFSTR("accessibility")))
            {
              objc_msgSend(v41, "setCanAddAccessibility:", 1);
            }
            else if (objc_msgSend(v8, "isEqualToString:", CFSTR("files")))
            {
              objc_msgSend(v41, "setCanAddFiles:", 1);
            }
          }
          else if (!strcmp(name, "client_version"))
          {
            v20 = xmlNodeGetContent(i);
            if (!v20)
              continue;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v20);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setClientVersion:", v8);
          }
          else
          {
            if (!strcmp(name, "is_selecting_data_type_in_handshake"))
            {
              v21 = xmlNodeGetContent(i);
              if (v21)
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", (char)*v21);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v22, "BOOLValue");

                objc_msgSend(v41, "setIsSelectingDataTypeInHandshake:", v39);
              }
              continue;
            }
            if (!strcmp(name, "upgrade"))
            {
              v23 = xmlNodeGetContent(i);
              if (v23)
              {
                v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v23);
                objc_msgSend(v40, "lowercaseString");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v24, "isEqualToString:", CFSTR("api/2.0"));

                if (v38)
                  objc_msgSend(v41, "setUseMigrationKit:", 1);

              }
              continue;
            }
            if (!strcmp(name, "api_level"))
            {
              v25 = xmlNodeGetContent(i);
              if (!v25)
                continue;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v25);
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "setApiLevel:", v8);
            }
            else if (!strcmp(name, "brand"))
            {
              v26 = xmlNodeGetContent(i);
              if (!v26)
                continue;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v26);
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "setBrand:", v8);
            }
            else if (!strcmp(name, "locale"))
            {
              v27 = xmlNodeGetContent(i);
              if (!v27)
                continue;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v27);
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "setLocale:", v8);
            }
            else if (!strcmp(name, "model"))
            {
              v28 = xmlNodeGetContent(i);
              if (!v28)
                continue;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v28);
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "setModel:", v8);
            }
            else if (!strcmp(name, "os_version"))
            {
              v29 = xmlNodeGetContent(i);
              if (!v29)
                continue;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v29);
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "setOsVersion:", v8);
            }
            else if (!strcmp(name, "version"))
            {
              v30 = xmlNodeGetContent(i);
              if (!v30)
                continue;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v30);
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "setVersion:", v8);
            }
            else
            {
              if (strcmp(name, "version_code"))
                continue;
              v7 = xmlNodeGetContent(i);
              if (!v7)
                continue;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v7);
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "setVersionCode:", v8);
            }
          }
          goto LABEL_47;
        }
        v18 = xmlNodeGetContent(i);
        if (v18)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v18);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setHardwareProduct:", v8);
          goto LABEL_47;
        }
      }
    }
  }
  objc_msgSend(v41, "persistentIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "length");

  if (!v32)
  {
    if (objc_msgSend(MEMORY[0x24BEC2810], "isInternal"))
    {
      v33 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v41, "ipAddress");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "name");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringWithFormat:", CFSTR("%@.%@"), v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setPersistentIdentifier:", v36);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "UUIDString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setPersistentIdentifier:", v35);
    }

    objc_msgSend(v41, "persistentIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    _WLLog();

  }
}

- (id)_parseConnectionFailureReasons:(_xmlNode *)a3
{
  id v4;
  _xmlNode *i;
  const char *name;
  xmlChar *Content;
  void *v8;
  void *v9;
  id v10;

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  for (i = a3->children; i; i = i->next)
  {
    name = (const char *)i->name;
    if (name)
    {
      if (!strcmp(name, "reason"))
      {
        Content = xmlNodeGetContent(i);
        if (Content)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", Content);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v8);

        }
      }
    }
  }
  if (objc_msgSend(v4, "count"))
    v9 = v4;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

@end
