@implementation PKRemoteAssetManifest

+ (Class)_remoteAssestManifestItemClassWithValues:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  objc_class *v7;

  objc_msgSend(a3, "valueForKey:", CFSTR("url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsString:", CFSTR("cloudkit:"));

  if (v6)
    v4 = (void *)objc_opt_class();
  v7 = v4;

  return v7;
}

- (PKRemoteAssetManifest)initWithFileURL:(id)a3 passURL:(id)a4 error:(id *)a5
{
  return -[PKRemoteAssetManifest initWithFileURL:passURL:deviceSEIDs:error:](self, "initWithFileURL:passURL:deviceSEIDs:error:", a3, a4, 0, a5);
}

- (PKRemoteAssetManifest)initWithFileURL:(id)a3 passURL:(id)a4 deviceSEIDs:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  PKRemoteAssetManifest *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSMutableDictionary *remoteAssets;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  PKRemoteAssetManifest *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  PKRemoteAssetManifest *v65;
  char v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  char v73;
  PKRemoteAssetManifest *v74;
  PKRemoteAssetManifest *v75;
  uint64_t v76;
  NSArray *encryptedDeviceSpecificRemoteAssetFilenames;
  uint64_t v78;
  NSObject *v79;
  PKRemoteAssetManifest *v80;
  id v82;
  void *v83;
  PKRemoteAssetManifest *v84;
  PKRemoteAssetManifest *v85;
  PKRemoteAssetManifest *v86;
  uint64_t v87;
  id v88;
  void *v89;
  id v90;
  id *v91;
  uint64_t v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  objc_super v102;
  uint8_t buf[4];
  uint64_t v104;
  __int16 v105;
  id v106;
  _BYTE v107[128];
  _BYTE v108[128];
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v102.receiver = self;
  v102.super_class = (Class)PKRemoteAssetManifest;
  v14 = -[PKRemoteAssetManifest init](&v102, sel_init);
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v11);
    v15 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v15;
    if (v15)
    {
      v89 = (void *)v15;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v15, 0, a6);
      v24 = objc_claimAutoreleasedReturnValue();
      v85 = (PKRemoteAssetManifest *)v24;
      if (v24)
      {
        v32 = (void *)v24;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v90 = v12;
          objc_storeStrong((id *)&v14->_fileURL, a3);
          objc_storeStrong((id *)&v14->_passURL, a4);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v40 = objc_claimAutoreleasedReturnValue();
          remoteAssets = v14->_remoteAssets;
          v14->_remoteAssets = (NSMutableDictionary *)v40;

          v86 = (PKRemoteAssetManifest *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v98 = 0u;
          v99 = 0u;
          v100 = 0u;
          v101 = 0u;
          v42 = v32;
          v92 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
          if (!v92)
          {

            goto LABEL_58;
          }
          v43 = *(_QWORD *)v99;
          v91 = a6;
          v87 = *(_QWORD *)v99;
          v88 = v42;
          v82 = v11;
LABEL_7:
          v44 = 0;
          while (1)
          {
            if (*(_QWORD *)v99 != v43)
              objc_enumerationMutation(v42);
            v45 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * v44);
            objc_msgSend(v42, "objectForKey:", v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v93 = v46;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a6)
              {
                PKValidationErrorWithReason(CFSTR("%@ is not a dictionary for key %@"), v47, v48, v49, v50, v51, v52, v53, (uint64_t)v46);
                *a6 = (id)objc_claimAutoreleasedReturnValue();
                v54 = v14;
                v14 = 0;
LABEL_55:

                v64 = v93;
LABEL_56:

                goto LABEL_57;
              }
              v64 = v46;
              goto LABEL_41;
            }
            v54 = v46;
            -[PKRemoteAssetManifest PKArrayContaining:forKey:](v54, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("urls"));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "count"))
            {
              v96 = 0u;
              v97 = 0u;
              v94 = 0u;
              v95 = 0u;
              v56 = v55;
              v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
              if (v57)
              {
                v58 = v57;
                v83 = v55;
                v84 = v14;
                v59 = *(_QWORD *)v95;
                while (2)
                {
                  for (i = 0; i != v58; ++i)
                  {
                    if (*(_QWORD *)v95 != v59)
                      objc_enumerationMutation(v56);
                    v61 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
                    objc_msgSend(v61, "PKStringForKey:", CFSTR("seid"));
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v13, "containsObject:", v62) & 1) != 0)
                    {
                      v65 = v61;

                      v63 = 0;
                      v54 = v65;
                      goto LABEL_24;
                    }

                  }
                  v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v94, v107, 16);
                  if (v58)
                    continue;
                  break;
                }
                v63 = 1;
LABEL_24:
                v11 = v82;
                v55 = v83;
                v14 = v84;
              }
              else
              {
                v63 = 1;
              }

              a6 = v91;
              if (!v55)
                goto LABEL_32;
            }
            else
            {
              v63 = 1;
              if (!v55)
                goto LABEL_32;
            }
            -[PKRemoteAssetManifest addObject:](v86, "addObject:", v45);
            v66 = v63 ^ 1;
            if (!v13)
              v66 = 0;
            if ((v66 & 1) == 0)
            {

              v42 = v88;
              goto LABEL_55;
            }
LABEL_32:
            objc_msgSend(v11, "URLByDeletingLastPathComponent");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "URLByAppendingPathComponent:", v45);
            v68 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_remoteAssestManifestItemClassWithValues:", v54), "itemWithLocalURL:passURL:dictionary:error:", v68, v90, v54, a6);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = v69;
            if (v69)
            {
              objc_msgSend(v69, "seid");
              v71 = objc_claimAutoreleasedReturnValue();
              v72 = (void *)v71;
              if (!v13 || !v71 || (objc_msgSend(v13, "containsObject:", v71) & 1) != 0)
              {
                -[NSMutableDictionary setObject:forKey:](v14->_remoteAssets, "setObject:forKey:", v70, v45);
                v73 = 1;
                goto LABEL_40;
              }

              v73 = 0;
            }
            else
            {
              v73 = 0;
              v72 = v14;
            }
            v14 = 0;
LABEL_40:

            a6 = v91;
            v43 = v87;
            v42 = v88;
            v64 = v93;
            if ((v73 & 1) == 0)
              goto LABEL_56;
LABEL_41:

            if (++v44 == v92)
            {
              v92 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v98, v108, 16);
              if (v92)
                goto LABEL_7;
LABEL_57:

              if (v14)
              {
LABEL_58:
                v75 = v86;
                v76 = -[PKRemoteAssetManifest copy](v86, "copy");
                encryptedDeviceSpecificRemoteAssetFilenames = v14->_encryptedDeviceSpecificRemoteAssetFilenames;
                v14->_encryptedDeviceSpecificRemoteAssetFilenames = (NSArray *)v76;

                v78 = -[NSMutableDictionary count](v14->_remoteAssets, "count");
              }
              else
              {
                v78 = 0;
                v75 = v86;
              }
              PKLogFacilityTypeGetObject(0);
              v79 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218242;
                v104 = v78;
                v105 = 2112;
                v106 = v42;
                _os_log_impl(&dword_18FC92000, v79, OS_LOG_TYPE_DEFAULT, "Remote Asset Manifest found %lu assets from %@", buf, 0x16u);
              }

              v12 = v90;
LABEL_63:

LABEL_64:
              v74 = v85;
LABEL_65:

              v23 = v89;
              goto LABEL_66;
            }
          }
        }
        if (!a6)
          goto LABEL_64;
        PKValidationErrorWithReason(CFSTR("%@ is not a JSON dictionary"), v33, v34, v35, v36, v37, v38, v39, (uint64_t)v11);
      }
      else
      {
        if (!a6)
        {
LABEL_51:
          v75 = v14;
          v14 = 0;
          goto LABEL_63;
        }
        PKValidationErrorWithReason(CFSTR("Could not read JSON at %@"), v25, v26, v27, v28, v29, v30, v31, (uint64_t)v11);
      }
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_51;
    }
    if (a6)
    {
      v89 = 0;
      PKValidationErrorWithReason(CFSTR("Could not read file at %@"), v16, v17, v18, v19, v20, v21, v22, (uint64_t)v11);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      v74 = v14;
      v14 = 0;
      goto LABEL_65;
    }
LABEL_66:

  }
  v80 = v14;

  return v80;
}

- (id)deviceSpecificAsset
{
  return -[PKRemoteAssetManifest deviceSpecificAssetForScreenScale:suffix:](self, "deviceSpecificAssetForScreenScale:suffix:", 0, PKScreenScale());
}

- (id)deviceSpecificAssetForScreenScale:(double)a3 suffix:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v6 = a4;
  -[NSURL URLByDeletingPathExtension](self->_fileURL, "URLByDeletingPathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByDeletingPathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "isEqualToString:", CFSTR("pdf"));
  v12 = v11;
  if (v6)
  {
    if (v11)
    {
      objc_msgSend(v10, "stringByAppendingString:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingPathExtension:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary objectForKey:](self->_remoteAssets, "objectForKey:", v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v15)
        v15 = v14;

    }
    else
    {
      v15 = 0;
    }
    if (a3 >= 3.0 && !v15)
    {
      objc_msgSend(v10, "stringByAppendingString:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingString:", CFSTR("@3x"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByAppendingPathExtension:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary objectForKey:](self->_remoteAssets, "objectForKey:", v18);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v15)
        v15 = v18;

    }
    if (a3 >= 2.0 && !v15)
    {
      objc_msgSend(v10, "stringByAppendingString:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringByAppendingString:", CFSTR("@2x"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringByAppendingPathExtension:", v8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary objectForKey:](self->_remoteAssets, "objectForKey:", v21);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v15)
        v15 = v21;

    }
    if (v15)
      goto LABEL_45;
    objc_msgSend(v10, "stringByAppendingString:", v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingString:", CFSTR("@1x"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByAppendingPathExtension:", v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKey:](self->_remoteAssets, "objectForKey:", v24);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15)
      v15 = v24;

  }
  else
  {
    v15 = 0;
  }
  if (v15)
    v25 = 0;
  else
    v25 = v12;
  if (v25 == 1)
  {
    objc_msgSend(v10, "stringByAppendingPathExtension:", v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_remoteAssets, "objectForKey:", v26);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15)
      v15 = v26;

  }
  if (a3 >= 3.0 && !v15)
  {
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("@3x"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringByAppendingPathExtension:", v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKey:](self->_remoteAssets, "objectForKey:", v28);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15)
      v15 = v28;

  }
  if (a3 >= 2.0 && !v15)
  {
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("@2x"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringByAppendingPathExtension:", v8);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKey:](self->_remoteAssets, "objectForKey:", v30);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15)
      v15 = v30;

  }
  if (!v15)
  {
    objc_msgSend(v10, "stringByAppendingString:", CFSTR("@1x"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringByAppendingPathExtension:", v8);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKey:](self->_remoteAssets, "objectForKey:", v15);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
    {

LABEL_44:
      objc_msgSend(v7, "lastPathComponent");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    }
    if (!v15)
      goto LABEL_44;
  }
LABEL_45:
  -[NSMutableDictionary objectForKey:](self->_remoteAssets, "objectForKey:", v15);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSDictionary)remoteAssets
{
  return &self->_remoteAssets->super;
}

- (NSArray)encryptedDeviceSpecificRemoteAssetFilenames
{
  return self->_encryptedDeviceSpecificRemoteAssetFilenames;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedDeviceSpecificRemoteAssetFilenames, 0);
  objc_storeStrong((id *)&self->_remoteAssets, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
