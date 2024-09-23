@implementation SUPluginLoader

+ (BOOL)loadPlugin:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  NSString *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  Class v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  Class v53;
  BOOL v54;
  uint64_t v56;
  uint64_t v57;
  id v58;

  v3 = a3;
  SULogInfo(CFSTR("Attempting to load plugin"), v4, v5, v6, v7, v8, v9, v10, v56);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v18;
    if (v18)
    {
      v58 = 0;
      v27 = objc_msgSend(v18, "loadAndReturnError:", &v58);
      v35 = v58;
      if ((v27 & 1) != 0)
      {
        objc_msgSend(v26, "infoDictionary");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKey:", CFSTR("NSPrincipalClass"));
        v37 = (NSString *)objc_claimAutoreleasedReturnValue();

        if (v37 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v45 = NSClassFromString(v37);
          if (v45)
          {
            v53 = v45;
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              -[objc_class awakeFromBundle](v53, "awakeFromBundle");
              v54 = 1;
LABEL_16:

              goto LABEL_17;
            }
          }
          SULogInfo(CFSTR("plugin's principal class does not respond to awakeFromBundle: %@"), v46, v47, v48, v49, v50, v51, v52, (uint64_t)v3);
        }
        else
        {
          SULogInfo(CFSTR("Unable to load plugin principalClassName: %@"), v38, v39, v40, v41, v42, v43, v44, (uint64_t)v3);
        }
        v54 = 0;
        goto LABEL_16;
      }
      SULogInfo(CFSTR("Failed to load plugin bundle: %@ with error: %@"), v28, v29, v30, v31, v32, v33, v34, (uint64_t)v3);

    }
    else
    {
      SULogInfo(CFSTR("Unable to create bundle from bundle path: %@"), v19, v20, v21, v22, v23, v24, v25, (uint64_t)v3);
    }
    v54 = 0;
LABEL_17:

    goto LABEL_18;
  }
  SULogInfo(CFSTR("Unable to load bundle with nil path"), v11, v12, v13, v14, v15, v16, v17, v57);
  v54 = 0;
LABEL_18:

  return v54;
}

@end
