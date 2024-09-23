@implementation CCDValidationKeyInfo

- (CCDValidationKeyInfo)initWithName:(id)a3 validationInfo:(id)a4
{
  id v6;
  CCDValidationKeyInfo *v7;
  void *v8;
  uint64_t v9;
  NSString *destinationKey;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  CCDValidationKeyInfo *v21;
  void *v22;
  CCDValidationKeyInfo *v23;
  NSArray *v24;
  NSArray *subKeys;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];

  v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CCDValidationKeyInfo;
  v7 = -[CCDValidationInfo initWithName:validationInfo:](&v32, "initWithName:validationInfo:", a3, v6);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("validationType")));
    v7->_validationType = (unint64_t)objc_msgSend(v8, "integerValue");

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("destinationKey")));
    destinationKey = v7->_destinationKey;
    v7->_destinationKey = (NSString *)v9;

    if (v7->_validationType == 8)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subKey")));

      if (v11)
      {
        v27 = v6;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("subKey")));
        v14 = (void *)objc_opt_new(NSMutableArray, v13);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v15 = v12;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v29;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v29 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v19);
              v21 = [CCDValidationKeyInfo alloc];
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v20));
              v23 = -[CCDValidationKeyInfo initWithName:validationInfo:](v21, "initWithName:validationInfo:", v20, v22);
              objc_msgSend(v14, "addObject:", v23);

              v19 = (char *)v19 + 1;
            }
            while (v17 != v19);
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
          }
          while (v17);
        }

        v24 = (NSArray *)objc_msgSend(v14, "copy");
        subKeys = v7->_subKeys;
        v7->_subKeys = v24;

        v6 = v27;
      }
    }
  }

  return v7;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
  if (-[CCDValidationInfo isRequired](self, "isRequired"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo validationInfo](self, "validationInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("validationType")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationKeyInfo destinationKey](self, "destinationKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n***********\nCloud Config Key Name: %@\nRequired: %@\nValidation Type: %@\nDestination Key: %@\n***********\n"), v3, v4, v6, v7));

  return v8;
}

- (BOOL)validateSelfUsingValidationInfoWithDictionary:(id)a3 resultsDictionary:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v6 = a3;
  v7 = a4;
  switch(-[CCDValidationKeyInfo validationType](self, "validationType"))
  {
    case 0uLL:
    case 3uLL:
      v9 = -[CCDValidationKeyInfo _validateBooleanInDictionary:](self, "_validateBooleanInDictionary:", v6);
      goto LABEL_13;
    case 1uLL:
      v9 = -[CCDValidationKeyInfo _validateCertificateArrayInDictionary:](self, "_validateCertificateArrayInDictionary:", v6);
      goto LABEL_13;
    case 2uLL:
      v9 = -[CCDValidationKeyInfo _validateHttpsURLStringInDictionary:](self, "_validateHttpsURLStringInDictionary:", v6);
      goto LABEL_13;
    case 4uLL:
      v9 = -[CCDValidationKeyInfo _validateNumberInDictionary:](self, "_validateNumberInDictionary:", v6);
      goto LABEL_13;
    case 5uLL:
      v9 = -[CCDValidationKeyInfo _validateStringInDictionary:](self, "_validateStringInDictionary:", v6);
      goto LABEL_13;
    case 6uLL:
      v9 = -[CCDValidationKeyInfo _validateStringArrayInDictionary:](self, "_validateStringArrayInDictionary:", v6);
      goto LABEL_13;
    case 7uLL:
      v9 = -[CCDValidationKeyInfo _validateCredentialTokenInDictionary:](self, "_validateCredentialTokenInDictionary:", v6);
      goto LABEL_13;
    case 8uLL:
      v11 = (void *)objc_opt_new(NSMutableDictionary, v8);
      LODWORD(v10) = -[CCDValidationKeyInfo _validateDictionaryInDictionary:resultsDictionary:](self, "_validateDictionaryInDictionary:resultsDictionary:", v6, v11);
      if (!v7)
        break;
      goto LABEL_14;
    case 9uLL:
      v9 = -[CCDValidationKeyInfo _validateUnstructureddDictionaryInDictionary:](self, "_validateUnstructureddDictionaryInDictionary:", v6);
LABEL_13:
      LODWORD(v10) = v9;
      v11 = 0;
      if (v7)
      {
LABEL_14:
        if ((_DWORD)v10)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v12));

          if (v10)
          {
            switch(-[CCDValidationKeyInfo validationType](self, "validationType"))
            {
              case 1uLL:
                v30 = v10;
                v13 = v10;
                v15 = (void *)objc_opt_new(NSMutableArray, v14);
                v31 = 0u;
                v32 = 0u;
                v33 = 0u;
                v34 = 0u;
                v16 = v13;
                v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
                if (v17)
                {
                  v18 = v17;
                  v19 = *(_QWORD *)v32;
                  do
                  {
                    for (i = 0; i != v18; i = (char *)i + 1)
                    {
                      if (*(_QWORD *)v32 != v19)
                        objc_enumerationMutation(v16);
                      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationKeyInfo _certificateDataFromBase64EncodedString:](self, "_certificateDataFromBase64EncodedString:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i)));
                      if (v21)
                        objc_msgSend(v15, "addObject:", v21);

                    }
                    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
                  }
                  while (v18);
                }

                v22 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationKeyInfo destinationKey](self, "destinationKey"));
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v22);

                v10 = v30;
                break;
              case 3uLL:
                v26 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v10, "BOOLValue") ^ 1));
                goto LABEL_32;
              case 7uLL:
                v23 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationKeyInfo destinationKey](self, "destinationKey"));
                v25 = &__kCFBooleanTrue;
                v24 = v7;
                goto LABEL_30;
              case 8uLL:
                v26 = objc_msgSend(v11, "copy");
LABEL_32:
                v27 = v26;
                v28 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationKeyInfo destinationKey](self, "destinationKey"));
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, v28);

                break;
              default:
                v23 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationKeyInfo destinationKey](self, "destinationKey"));
                v24 = v7;
                v25 = v10;
LABEL_30:
                objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, v23);

                break;
            }
          }

          LOBYTE(v10) = 1;
        }
      }
      break;
    default:
      LOBYTE(v10) = 0;
      v11 = 0;
      break;
  }

  return (char)v10;
}

- (id)_certificateDataFromBase64EncodedString:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CCDCertificateSupport decodeCertificateFromBase64String:](CCDCertificateSupport, "decodeCertificateFromBase64String:", v3));
  else
    v5 = 0;

  return v5;
}

- (BOOL)_validateCertificateArrayInDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  v7 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationKeyInfo _certificateDataFromBase64EncodedString:](self, "_certificateDataFromBase64EncodedString:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), (_QWORD)v16));

          if (!v13)
          {
            v14 = 0;
            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }
    v14 = 1;
LABEL_13:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_validateHttpsURLStringInDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  if (-[CCDValidationKeyInfo _validateStringInDictionary:](self, "_validateStringInDictionary:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scheme"));
      v9 = objc_msgSend(CFSTR("https"), "isEqualToString:", v8);

    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_validateNumberInDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  v7 = objc_opt_class(NSNumber);
  LOBYTE(v4) = objc_opt_isKindOfClass(v6, v7);

  return v4 & 1;
}

- (BOOL)_validateStringInDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  v7 = objc_opt_class(NSString);
  LOBYTE(v4) = objc_opt_isKindOfClass(v6, v7);

  return v4 & 1;
}

- (BOOL)_validateStringArrayInDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  v7 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v14 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
          {
            v15 = 0;
            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
    }
    v15 = 1;
LABEL_13:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_validateCredentialTokenInDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CCDKeychain dataFromString:](CCDKeychain, "dataFromString:", v6));
  v16 = 0;
  LOWORD(v15) = 0;
  +[CCDKeychain setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:](CCDKeychain, "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", v7, CFSTR("DEP-FastTime-Service"), CFSTR("DEP-FastTime-Account"), 0, 0, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly, 0, v15, &v16);
  v8 = v16;

  if (v8)
  {
    v11 = *(NSObject **)(DEPLogObjects(v9, v10) + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error trying to store credentials in keychain!! \n Error:  %{public}@ \n Failing CloudConfig Validation...", buf, 0xCu);

    }
  }

  return v8 == 0;
}

- (BOOL)_validateDictionaryInDictionary:(id)a3 resultsDictionary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v8));

  v10 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
LABEL_4:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v15);
        v17 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
          break;
        if (v13 == (id)++v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
          if (v13)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationKeyInfo subKeys](self, "subKeys", 0));
      v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (!v18)
      {
        v22 = 1;
        goto LABEL_21;
      }
      v19 = v18;
      v20 = *(_QWORD *)v25;
LABEL_12:
      v21 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v11);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21), "validateSelfWithDictionary:resultsDictionary:", v9, v7))break;
        if (v19 == (id)++v21)
        {
          v19 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          v22 = 1;
          if (v19)
            goto LABEL_12;
          goto LABEL_21;
        }
      }
    }
    v22 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v22 = 0;
LABEL_22:

  return v22;
}

- (BOOL)_validateUnstructureddDictionaryInDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  v7 = objc_opt_class(NSDictionary);
  LOBYTE(v5) = objc_opt_isKindOfClass(v6, v7);

  return v5 & 1;
}

- (unint64_t)validationType
{
  return self->_validationType;
}

- (void)setValidationType:(unint64_t)a3
{
  self->_validationType = a3;
}

- (NSString)destinationKey
{
  return self->_destinationKey;
}

- (void)setDestinationKey:(id)a3
{
  objc_storeStrong((id *)&self->_destinationKey, a3);
}

- (NSArray)subKeys
{
  return self->_subKeys;
}

- (void)setSubKeys:(id)a3
{
  objc_storeStrong((id *)&self->_subKeys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subKeys, 0);
  objc_storeStrong((id *)&self->_destinationKey, 0);
}

@end
