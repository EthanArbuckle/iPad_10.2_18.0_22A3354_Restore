@implementation DMFProfile

- (id)initWithProfile:(id)a3 isManaged:(BOOL)a4 signerCertificates:(id)a5 restrictions:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  unsigned __int8 v27;
  id v28;
  id v29;
  id v30;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v40;
  void *v41;
  id v42;
  id obj;
  _BOOL8 obja;
  DMFProfile *objb;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];

  v8 = a3;
  v42 = a5;
  v40 = a6;
  v41 = v8;
  if ((objc_msgSend(v8, "isEncrypted") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "payloads"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(0, "count")));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v10;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v49;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v49 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v14);
          v16 = objc_alloc((Class)DMFProfilePayload);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "type"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
          v19 = objc_msgSend(v15, "version");
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "displayName"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "organization"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "payloadDescription"));
          v23 = objc_msgSend(v16, "initWithType:identifier:payloadVersion:displayName:organization:payloadDescription:", v17, v18, v19, v20, v21, v22);
          objc_msgSend(v46, "addObject:", v23);

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v12);
    }

    v8 = v41;
    v9 = v46;
  }
  v47 = v9;
  obja = objc_msgSend(v8, "installType") == (id)2;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUID"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v35 = objc_msgSend(v8, "version");
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayName"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "organization"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "profileDescription"));
  v25 = objc_msgSend(v8, "isLocked");
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "removalPasscode"));
  v27 = objc_msgSend(v8, "isEncrypted");
  v28 = objc_msgSend(v42, "copy");
  v29 = objc_msgSend(v9, "copy");
  v30 = objc_msgSend(v40, "copy");
  BYTE3(v32) = v27;
  BYTE2(v32) = v26 != 0;
  BYTE1(v32) = v25;
  LOBYTE(v32) = a4;
  objb = -[DMFProfile initWithUUID:type:identifier:profileVersion:displayName:organization:profileDescription:isManaged:isLocked:hasRemovalPasscode:isEncrypted:signerCertificates:payloads:restrictions:](self, "initWithUUID:type:identifier:profileVersion:displayName:organization:profileDescription:isManaged:isLocked:hasRemovalPasscode:isEncrypted:signerCertificates:payloads:restrictions:", v37, obja, v36, v35, v34, v33, v24, v32, v28, v29, v30);

  return objb;
}

@end
