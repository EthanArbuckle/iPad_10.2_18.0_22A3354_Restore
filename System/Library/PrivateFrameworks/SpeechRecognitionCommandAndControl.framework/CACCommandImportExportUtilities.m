@implementation CACCommandImportExportUtilities

+ (unint64_t)maximumNumberOfAllowedEntries
{
  return 1000;
}

+ (BOOL)isSupportedCommandType:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(&unk_24F2CF5D8, "containsObject:", v3);
  else
    v4 = 0;

  return v4;
}

+ (id)defaultExportURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BDBCF48];
  v3 = (void *)MEMORY[0x24BDD17C8];
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommandImportExport.defaultExportedFileName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("~/%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByExpandingTildeInPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathExtension:", kCACCommandsFileExtensionVCCommands);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)importFromURL:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  CACImportExportResult *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  CACImportExportResult *v15;
  void *v16;
  CACImportExportResult *v17;
  CACImportExportResult *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CACImportExportResult *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CACImportExportResult *v41;
  void *v42;
  uint64_t v44;
  id v45;
  id v46;
  NSObject *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  CACImportExportResult *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  CACImportExportResult *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id obj;
  _QWORD v71[4];
  id v72;
  id v73;
  _QWORD block[4];
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  id v81;
  id v82;
  id v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithFilenameExtension:", kCACCommandsFileExtensionVCCommands);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0;
  v5 = *MEMORY[0x24BDBCBE8];
  v82 = 0;
  v6 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v83, v5, &v82);
  v7 = v83;
  v8 = v82;
  if (!v6 || !objc_msgSend(v7, "conformsToType:", v4))
  {
    v15 = [CACImportExportResult alloc];
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommandImportExport.cannotReadFile"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[CACImportExportResult initWithError:title:message:](v15, "initWithError:title:message:", v8, v16, 0);

    v9 = 0;
    if (!v8)
    {
LABEL_8:
      v14 = v17;
      goto LABEL_9;
    }
LABEL_6:
    v18 = -[CACImportExportResult initWithError:title:message:]([CACImportExportResult alloc], "initWithError:title:message:", v8, 0, 0);
    goto LABEL_36;
  }
  v81 = v8;
  v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfURL:error:", v3, &v81);
  v10 = (unint64_t)v81;

  if (v9 | v10)
  {
    v17 = 0;
    v8 = (id)v10;
    if (!v10)
      goto LABEL_8;
    goto LABEL_6;
  }
  v11 = [CACImportExportResult alloc];
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommandImportExport.cannotReadFile"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CACImportExportResult initWithError:title:message:](v11, "initWithError:title:message:", 0, v12, 0);

  v14 = (void *)v13;
  v9 = 0;
LABEL_9:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend((id)v9, "objectForKey:", kCACCommandsFileExportCommandsKey);
    v17 = (CACImportExportResult *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && -[CACImportExportResult count](v17, "count"))
  {
    v61 = v14;
    v62 = v9;
    v63 = v7;
    v64 = v4;
    v65 = v3;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "allCustomCommandProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    -[CACImportExportResult allKeys](v17, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
    v21 = 0x24F2A9000uLL;
    v69 = v19;
    if (v20)
    {
      v22 = v20;
      v23 = *(_QWORD *)v78;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v78 != v23)
            objc_enumerationMutation(obj);
          v25 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i);
          -[CACImportExportResult objectForKey:](v17, "objectForKey:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v21;
          v28 = *(void **)(v21 + 1648);
          objc_msgSend(v26, "objectForKey:", CFSTR("CustomType"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v28) = objc_msgSend(v28, "isSupportedCommandType:", v29);

          if ((_DWORD)v28)
          {
            objc_msgSend(v19, "objectForKey:", v25);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v30;
            if (v30)
            {
              v32 = v17;
              objc_msgSend(v30, "objectForKey:", CFSTR("CustomModifyDate"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectForKey:", CFSTR("CustomModifyDate"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v33, "compare:", v34) == -1)
                  objc_msgSend(v67, "setObject:forKey:", v26, v25);
              }

              v17 = v32;
              v19 = v69;
            }
            else
            {
              objc_msgSend(v68, "setObject:forKey:", v26, v25);
            }

          }
          v21 = v27;
        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
      }
      while (v22);
    }

    v35 = objc_msgSend(v19, "count");
    v36 = v68;
    v37 = objc_msgSend(v68, "count") + v35;
    if (v37 <= objc_msgSend(*(id *)(v21 + 1648), "maximumNumberOfAllowedEntries"))
    {
      v44 = MEMORY[0x24BDAC760];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __49__CACCommandImportExportUtilities_importFromURL___block_invoke;
      block[3] = &unk_24F2AAD70;
      v45 = v66;
      v75 = v45;
      v46 = v68;
      v76 = v46;
      v47 = MEMORY[0x24BDAC9B8];
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      v71[0] = v44;
      v71[1] = 3221225472;
      v71[2] = __49__CACCommandImportExportUtilities_importFromURL___block_invoke_2;
      v71[3] = &unk_24F2AAD70;
      v72 = v45;
      v42 = v67;
      v48 = v67;
      v73 = v48;
      dispatch_async(v47, v71);

      v49 = objc_msgSend(v46, "count");
      v50 = objc_msgSend(v48, "count") + v49;
      v51 = [CACImportExportResult alloc];
      +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommandImportExport.importCompleteAlertTitle"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[CACImportExportResult initWithError:title:message:](v51, "initWithError:title:message:", 0, v52, 0);

      v7 = v63;
      if (v50)
      {
        v53 = (void *)MEMORY[0x24BDD17C8];
        +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommandImportExport.importCompleteAlertDescription"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "stringWithValidatedFormat:validFormatSpecifiers:error:", v54, CFSTR("%ld"), 0, v50);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[CACImportExportResult setMessage:](v18, "setMessage:", v55);

      }
      else
      {
        +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommandImportExport.importCompleteAlertDescriptionNoEntries"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[CACImportExportResult setMessage:](v18, "setMessage:", v54);
      }
      v4 = v64;
      v3 = v65;
      v9 = v62;

      v59 = v75;
    }
    else
    {
      v38 = objc_msgSend(v19, "count");
      v7 = v63;
      if (v38 >= objc_msgSend(*(id *)(v21 + 1648), "maximumNumberOfAllowedEntries"))
      {
        v40 = 0;
      }
      else
      {
        v39 = objc_msgSend(*(id *)(v21 + 1648), "maximumNumberOfAllowedEntries");
        v40 = v39 - objc_msgSend(v19, "count");
      }
      v4 = v64;
      v3 = v65;
      v56 = [CACImportExportResult alloc];
      +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommandImportExport.importOverflowFailAlertTitle"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[CACImportExportResult initWithError:title:message:](v56, "initWithError:title:message:", 0, v57, 0);

      if (v40)
      {
        v58 = (void *)MEMORY[0x24BDD17C8];
        +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommandImportExport.importOverflowFailAlertDescription"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "stringWithValidatedFormat:validFormatSpecifiers:error:", v59, CFSTR("%ld"), 0, v40);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[CACImportExportResult setMessage:](v18, "setMessage:", v60);

      }
      else
      {
        +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommandImportExport.importOverflowFailNoNewAlertDescription"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[CACImportExportResult setMessage:](v18, "setMessage:", v59);
      }
      v9 = v62;
      v42 = v67;
    }

  }
  else
  {
    v41 = [CACImportExportResult alloc];
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommandImportExport.importCompleteAlertDescriptionNoEntries"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[CACImportExportResult initWithError:title:message:](v41, "initWithError:title:message:", 0, v36, 0);
    v42 = v14;
  }

  v8 = 0;
LABEL_36:

  return v18;
}

uint64_t __49__CACCommandImportExportUtilities_importFromURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addOrUpdateCommandPropertiesFromImportedTable:", *(_QWORD *)(a1 + 40));
}

uint64_t __49__CACCommandImportExportUtilities_importFromURL___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addOrUpdateCommandPropertiesFromImportedTable:", *(_QWORD *)(a1 + 40));
}

+ (id)exportToURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  CACImportExportResult *v13;
  CACImportExportResult *v14;
  void *v15;
  id v17;

  v3 = a3;
  if (v3)
  {
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allCustomCommandProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      objc_msgSend(v7, "numberWithDouble:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v8, kCACCommandsFileExportDateKey);

      v9 = objc_alloc(MEMORY[0x24BDBCE70]);
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithContentsOfURL:error:", v10, 0);

      if (v11)
        objc_msgSend(v6, "setObject:forKey:", v11, kCACCommandsFileExportSystemKey);
      objc_msgSend(v6, "setObject:forKey:", v5, kCACCommandsFileExportCommandsKey);
      v17 = 0;
      objc_msgSend(v6, "writeToURL:error:", v3, &v17);
      v12 = v17;
      if (v12)
        v13 = -[CACImportExportResult initWithError:title:message:]([CACImportExportResult alloc], "initWithError:title:message:", v12, 0, 0);
      else
        v13 = 0;

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v14 = [CACImportExportResult alloc];
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommandImportExport.failedToCreateURL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CACImportExportResult initWithError:title:message:](v14, "initWithError:title:message:", 0, v15, 0);

  }
  return v13;
}

@end
