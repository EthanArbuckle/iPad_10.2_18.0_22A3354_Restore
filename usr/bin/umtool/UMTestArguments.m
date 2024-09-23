@implementation UMTestArguments

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arguments"));
  v3 = (void *)qword_100010BF0;
  qword_100010BF0 = v2;

}

+ (id)getNextArgument
{
  unint64_t v2;
  void *v3;

  v2 = qword_100010BE8;
  if (v2 >= (unint64_t)objc_msgSend((id)qword_100010BF0, "count"))
  {
    v3 = 0;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100010BF0, "objectAtIndexedSubscript:", qword_100010BE8));
    ++qword_100010BE8;
  }
  return v3;
}

+ (void)goToPreviousArgument
{
  --qword_100010BE8;
}

+ (id)remainingArguments
{
  void *v2;
  uint64_t v3;
  char *v4;

  v2 = (void *)qword_100010BF0;
  v3 = qword_100010BE8;
  v4 = (char *)objc_msgSend((id)qword_100010BF0, "count");
  return objc_msgSend(v2, "subarrayWithRange:", v3, &v4[-qword_100010BE8]);
}

+ (id)getUserAttributes
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = (void *)objc_opt_new(NSMutableDictionary, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_userAttributes"));
  v5 = objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](UMTestArguments, "getNextArgument"));
  if (v5)
  {
    v6 = (void *)v5;
    while (1)
    {
      if (!objc_msgSend(v4, "containsObject:", v6))
      {
LABEL_6:

        goto LABEL_7;
      }
      v7 = objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](UMTestArguments, "getNextArgument"));
      if (!v7)
        break;
      v8 = (void *)v7;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, v6);

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](UMTestArguments, "getNextArgument"));
      if (!v6)
        goto LABEL_6;
    }

  }
  else
  {
LABEL_7:
    +[UMTestArguments goToPreviousArgument](UMTestArguments, "goToPreviousArgument");
  }
  v9 = objc_msgSend(v3, "copy");

  return v9;
}

+ (int)getUserUID
{
  void *v3;
  void *v4;
  int v5;

  v3 = (void *)objc_opt_new(UMMutableUser, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getUserAttributes"));
  objc_msgSend(a1, "applyAttributes:toUser:", v4, v3);
  if (objc_msgSend(v3, "uid") < 0x1F5)
    v5 = 0;
  else
    v5 = objc_msgSend(v3, "uid");

  return v5;
}

+ (int)getUserGID
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new(UMMutableUser, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getUserAttributes"));
  objc_msgSend(a1, "applyAttributes:toUser:", v4, v3);
  objc_msgSend(v3, "uid");
  LODWORD(a1) = objc_msgSend(v3, "uid");

  return (int)a1;
}

+ (void)applyAttributes:(id)a3 toUser:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a3;
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v11));
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("uid")))
        {
          objc_msgSend(v6, "setUid:", objc_msgSend(v12, "intValue"));
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("alternateDSID")))
        {
          objc_msgSend(v6, "setAlternateDSID:", v12);
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("username")))
        {
          objc_msgSend(v6, "setUsername:", v12);
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("givenName")))
        {
          objc_msgSend(v6, "setGivenName:", v12);
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("familyName")))
        {
          objc_msgSend(v6, "setFamilyName:", v12);
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("displayName")))
        {
          objc_msgSend(v6, "setDisplayName:", v12);
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("photoURL")))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v12));
          objc_msgSend(v6, "setPhotoURL:", v13);

        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("userAuxiliaryString")))
        {
          objc_msgSend(v6, "setUserAuxiliaryString:", v12);
        }

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

+ (id)getUser
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new(UMMutableUser, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getUserAttributes"));
  objc_msgSend(a1, "applyAttributes:toUser:", v4, v3);

  return v3;
}

+ (id)getUserIfExists
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getUser"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allUsers"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "isEqualToUser:", v2) & 1) != 0)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)_userAttributes
{
  if (qword_100010C00 != -1)
    dispatch_once(&qword_100010C00, &stru_10000C260);
  return (id)qword_100010BF8;
}

+ (id)getPasscodeData
{
  char *v2;
  char *v3;
  void *v4;
  void *v5;

  v2 = (char *)objc_msgSend(a1, "_passcodeIndex");
  if (v2 == (char *)0x7FFFFFFFFFFFFFFFLL || (v3 = v2, v2 >= objc_msgSend((id)qword_100010BF0, "count")))
  {
    v5 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100010BF0, "objectAtIndexedSubscript:", v3 + 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataUsingEncoding:", 4));

  }
  return v5;
}

+ (unint64_t)_passcodeIndex
{
  return (unint64_t)objc_msgSend((id)qword_100010BF0, "indexOfObject:", CFSTR("passcode"));
}

+ (id)_personaAttributes
{
  if (qword_100010C10 != -1)
    dispatch_once(&qword_100010C10, &stru_10000C280);
  return (id)qword_100010C08;
}

+ (id)getPersonaAttributes
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = (void *)objc_opt_new(NSMutableDictionary, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_personaAttributes"));
  v5 = objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](UMTestArguments, "getNextArgument"));
  if (v5)
  {
    v6 = (void *)v5;
    while (1)
    {
      if (!objc_msgSend(v4, "containsObject:", v6))
      {
LABEL_6:

        goto LABEL_7;
      }
      v7 = objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](UMTestArguments, "getNextArgument"));
      if (!v7)
        break;
      v8 = (void *)v7;
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, v6);

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](UMTestArguments, "getNextArgument"));
      if (!v6)
        goto LABEL_6;
    }

  }
  else
  {
LABEL_7:
    +[UMTestArguments goToPreviousArgument](UMTestArguments, "goToPreviousArgument");
  }
  v9 = objc_msgSend(v3, "copy");

  return v9;
}

+ (id)getProvisionAttributes
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[2];

  v2 = (void *)objc_opt_new(NSMutableDictionary, a2);
  v10[0] = CFSTR("quotasize");
  v10[1] = CFSTR("numusers");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  v4 = objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](UMTestArguments, "getNextArgument"));
  if (v4)
  {
    v5 = (void *)v4;
    while (1)
    {
      if (!objc_msgSend(v3, "containsObject:", v5))
      {
LABEL_6:

        goto LABEL_7;
      }
      v6 = objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](UMTestArguments, "getNextArgument"));
      if (!v6)
        break;
      v7 = (void *)v6;
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, v5);

      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](UMTestArguments, "getNextArgument"));
      if (!v5)
        goto LABEL_6;
    }

  }
  else
  {
LABEL_7:
    +[UMTestArguments goToPreviousArgument](UMTestArguments, "goToPreviousArgument");
  }
  v8 = objc_msgSend(v2, "copy");

  return v8;
}

+ (id)getLayoutAttributes
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[6];

  v2 = (void *)objc_opt_new(NSMutableDictionary, a2);
  v10[0] = CFSTR("sdvpath");
  v10[1] = CFSTR("userpath");
  v10[2] = CFSTR("systempath");
  v10[3] = CFSTR("disknode");
  v10[4] = CFSTR("volumeuuid");
  v10[5] = CFSTR("volumename");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 6));
  v4 = objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](UMTestArguments, "getNextArgument"));
  if (v4)
  {
    v5 = (void *)v4;
    while (1)
    {
      if (!objc_msgSend(v3, "containsObject:", v5))
      {
LABEL_6:

        goto LABEL_7;
      }
      v6 = objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](UMTestArguments, "getNextArgument"));
      if (!v6)
        break;
      v7 = (void *)v6;
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, v5);

      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UMTestArguments getNextArgument](UMTestArguments, "getNextArgument"));
      if (!v5)
        goto LABEL_6;
    }

  }
  else
  {
LABEL_7:
    +[UMTestArguments goToPreviousArgument](UMTestArguments, "goToPreviousArgument");
  }
  v8 = objc_msgSend(v2, "copy");

  return v8;
}

+ (id)getPersonaStringAttribute
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getPersonaAttributes"));
  v3 = v2;
  if (v2
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("personastring")))) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "copy");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)getbundleIDAttribute
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getPersonaAttributes"));
  v3 = v2;
  if (v2
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("bundleid")))) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "copy");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)getPersonaTypeAttribute
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getPersonaAttributes"));
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("personatype")));
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("personal")))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
      +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("getPersonaTypeAttribute validated Personal type"));
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("enterprise")))
    {
      +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("getPersonaTypeAttribute validated Enterprise type"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2));
    }
    else
    {
      +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("getPersonaTypeAttribute invalid string is %@"), v4);
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)getImagePathAttribute
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getPersonaAttributes"));
  v3 = v2;
  if (v2
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("imagepath")))) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "copy");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (int)getPersonaTestCount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getPersonaAttributes"));
  v3 = v2;
  if (v2
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("ptestcount")))) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "intValue");

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

+ (int)getProvisionQuotaSize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getProvisionAttributes"));
  v3 = v2;
  if (v2
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("quotasize")))) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "intValue");

  }
  else
  {
    v6 = 10;
  }

  return v6;
}

+ (int)getProvisionNumUsers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getProvisionAttributes"));
  v3 = v2;
  if (v2
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("numusers")))) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "intValue");

  }
  else
  {
    v6 = 10;
  }

  return v6;
}

+ (id)getSharedDataVolumePathAttribute
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getLayoutAttributes"));
  v3 = v2;
  if (v2
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("sdvpath")))) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "copy");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)getUserVolumePathAttribute
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getLayoutAttributes"));
  v3 = v2;
  if (v2
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("userpath")))) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "copy");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)getSystemVolumePathAttribute
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "getLayoutAttributes"));
  v3 = v2;
  if (v2
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("systempath")))) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "copy");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
