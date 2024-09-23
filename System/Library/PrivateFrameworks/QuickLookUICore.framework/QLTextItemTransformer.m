@implementation QLTextItemTransformer

+ (id)allowedOutputClasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  CFStringEncoding v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a4;
  v8 = a3;
  v9 = QLGuessEncodingForTextFileAtURL();
  v10 = CFStringConvertEncodingToNSStringEncoding(v9);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_opt_class();
  objc_msgSend(v7, "contentType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "wrapperFromData:encoding:typeIdentifier:error:", v11, v10, v13, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)transformedContentsFromData:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  unint64_t v9;
  CFStringEncoding v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "stringEncoding"))
  {
    v9 = objc_msgSend(v8, "stringEncoding");
  }
  else
  {
    v10 = QLGuessEncodingForTextFileFromData();
    v9 = CFStringConvertEncodingToNSStringEncoding(v10);
  }
  v11 = v9;
  v12 = (void *)objc_opt_class();
  objc_msgSend(v8, "contentType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "wrapperFromData:encoding:typeIdentifier:error:", v7, v11, v13, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)attributedStringFromData:(id)a3 encoding:(unint64_t)a4 typeIdentifier:(id)a5 error:(id *)a6
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "wrapperFromData:encoding:typeIdentifier:error:", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)wrapperFromData:(id)a3 encoding:(unint64_t)a4 typeIdentifier:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  _QWORD *v42;
  _QWORD *v43;
  NSObject **v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  NSObject **v48;
  NSObject *v49;
  id *v50;
  id v51;
  void *v52;
  NSObject **v53;
  NSObject *v54;
  id v56;
  id v57;
  id v58;
  void *v59;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  id obj;
  void *v72;
  id v73;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  id v81;
  id v82;
  uint8_t buf[4];
  unint64_t v84;
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  uint64_t v89;
  uint64_t v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v67 = v9;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = *MEMORY[0x1E0CEC5C8];
  v66 = v10;
  if (objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC5C8]))
  {
    v68 = *MEMORY[0x1E0CEA0E0];
    v69 = *MEMORY[0x1E0CEA088];
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0CEA0E0], 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v13, *MEMORY[0x1E0CEA070]);

    }
    v81 = 0;
    v82 = 0;
    v59 = v12;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithData:options:documentAttributes:error:", v8, v12, &v82, &v81);
    v70 = v82;
    v15 = v81;
    if (v8 && !v14)
    {
      v16 = v8;
      v80 = 0;
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D835F0]), "initWithData:error:", v16, &v80);
      v58 = v80;
      if (!v58)
      {
        v57 = v16;
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        objc_msgSend(v17, "fileWrapper");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "fileWrappers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        obj = v19;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
        if (v20)
        {
          v21 = v20;
          v56 = v8;
          v22 = *(_QWORD *)v77;
          v23 = *MEMORY[0x1E0CEC588];
          v63 = v11;
          v64 = v17;
          v61 = *MEMORY[0x1E0CEC588];
          v62 = *(_QWORD *)v77;
          while (2)
          {
            v24 = 0;
            v65 = v21;
            do
            {
              if (*(_QWORD *)v77 != v22)
                objc_enumerationMutation(obj);
              v25 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v24);
              objc_msgSend(v25, "pathExtension");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (v26)
              {
                objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:conformingToType:", v26, v23);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v27, "conformsToType:", v11) & 1) != 0)
                {
                  v28 = v15;
                  v29 = objc_alloc(MEMORY[0x1E0CB3498]);
                  objc_msgSend(v17, "fileWrapper");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v72, "fileWrappers");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "objectForKeyedSubscript:", v25);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "serializedRepresentation");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v89 = v69;
                  v90 = v68;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v75 = v28;
                  v14 = (void *)objc_msgSend(v29, "initWithData:options:documentAttributes:error:", v32, v33, 0, &v75);
                  v15 = v75;

                  if (v14)
                  {

                    v8 = v56;
                    v17 = v64;
                    goto LABEL_51;
                  }
                  v11 = v63;
                  v17 = v64;
                  v23 = v61;
                  v22 = v62;
                  v21 = v65;
                }
                else
                {

                }
              }

              ++v24;
            }
            while (v21 != v24);
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v91, 16);
            if (v21)
              continue;
            break;
          }
          v14 = 0;
          v8 = v56;
        }
        else
        {
          v14 = 0;
        }
LABEL_51:

        v16 = v57;
      }

      v15 = v58;
    }
LABEL_53:

    if (v15)
    {
      v48 = (NSObject **)MEMORY[0x1E0D83678];
      v49 = *MEMORY[0x1E0D83678];
      if (!*MEMORY[0x1E0D83678])
      {
        QLSInitLogging();
        v49 = *v48;
      }
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v84 = (unint64_t)v15;
        _os_log_impl(&dword_1D936E000, v49, OS_LOG_TYPE_ERROR, "Error while trying to read string %@ #AnyItemViewController", buf, 0xCu);
      }
      v50 = a6;
      if (a6)
      {
        v51 = objc_retainAutorelease(v15);
        v15 = v51;
LABEL_69:
        v52 = 0;
        *v50 = v51;
        goto LABEL_72;
      }
      goto LABEL_71;
    }
    goto LABEL_60;
  }
  if (objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC5C0]))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E0CEA088], *MEMORY[0x1E0CEA0E8], 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKey:", v35, *MEMORY[0x1E0CEA070]);

    }
    v73 = 0;
    v74 = 0;
    v59 = v34;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithData:options:documentAttributes:error:", v8, v34, &v74, &v73);
    v70 = v74;
    v15 = v73;
    goto LABEL_53;
  }
  if ((objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC590]) & 1) == 0
    && (objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC610]) & 1) == 0
    && (objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC5A8]) & 1) == 0
    && !objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC670]))
  {
    v70 = 0;
    goto LABEL_63;
  }
  if (a4)
    v36 = a4;
  else
    v36 = 4;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, v36);
  if (objc_msgSend(v8, "length") && !v37)
  {
    v36 = 1;
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 1);
  }
  if (v37
    || objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC5A8])
    && (v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 1)) != 0)
  {
    if (objc_msgSend(v10, "conformsToType:", *MEMORY[0x1E0CEC5E8]))
    {
      v87[0] = *MEMORY[0x1E0CEA098];
      v38 = (void *)MEMORY[0x1E0CEA5E8];
      objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontSize");
      objc_msgSend(v38, "monospacedSystemFontOfSize:weight:");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v87[1] = *MEMORY[0x1E0CEA090];
      v40 = *MEMORY[0x1E0CEA0D8];
      v88[0] = v39;
      v88[1] = v40;
      v41 = (void *)MEMORY[0x1E0C99D80];
      v42 = v88;
      v43 = v87;
    }
    else
    {
      v85[0] = *MEMORY[0x1E0CEA098];
      v46 = (void *)MEMORY[0x1E0CEA5E8];
      objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontSize");
      objc_msgSend(v46, "systemFontOfSize:");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v85[1] = *MEMORY[0x1E0CEA090];
      v86[0] = v39;
      v86[1] = *MEMORY[0x1E0CEA0D8];
      v41 = (void *)MEMORY[0x1E0C99D80];
      v42 = v86;
      v43 = v85;
    }
    objc_msgSend(v41, "dictionaryWithObjects:forKeys:count:", v42, v43, 2);
    v47 = objc_claimAutoreleasedReturnValue();

    v70 = (id)v47;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v37, v47);

  }
  else
  {
    v44 = (NSObject **)MEMORY[0x1E0D83678];
    v45 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v45 = *v44;
    }
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v84 = v36;
      _os_log_impl(&dword_1D936E000, v45, OS_LOG_TYPE_ERROR, "Could not create plain content from data with encoding: %lu #AnyItemViewController", buf, 0xCu);
    }
    v14 = 0;
    v70 = 0;
  }
LABEL_60:
  if (!v14)
  {
LABEL_63:
    v53 = (NSObject **)MEMORY[0x1E0D83678];
    v54 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v54 = *v53;
    }
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D936E000, v54, OS_LOG_TYPE_ERROR, "Could not create string content for text preview item. #AnyItemViewController", buf, 2u);
    }
    v50 = a6;
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.textItemTransformer"), 1, 0);
      v51 = (id)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v14 = 0;
      goto LABEL_69;
    }
    v15 = 0;
    v14 = 0;
LABEL_71:
    v52 = 0;
    goto LABEL_72;
  }
  v52 = (void *)objc_opt_new();
  objc_msgSend(v52, "setString:", v14);
  objc_msgSend(v52, "setAttributes:", v70);
  v15 = 0;
LABEL_72:

  return v52;
}

@end
