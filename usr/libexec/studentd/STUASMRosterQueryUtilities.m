@implementation STUASMRosterQueryUtilities

+ (BOOL)trustedUserWithAppleID:(id)a3 existsInRoster:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "courses"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crk_flatMapUsingBlock:", &stru_1000C9E90));
  v8 = objc_msgSend(v7, "containsObject:", v5);

  return v8;
}

+ (BOOL)courseWithIdentifier:(id)a3 existsInRoster:(id)a4
{
  void *v4;
  BOOL v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "courseWithIdentifier:inRoster:", a3, a4));
  v5 = v4 != 0;

  return v5;
}

+ (id)courseWithIdentifier:(id)a3 inRoster:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "courses", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
        v12 = objc_msgSend(v11, "isEqual:", v5);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)userIdentityForCourseWithIdentifier:(id)a3 inRoster:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "courseWithIdentifier:inRoster:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identity"));

  return v5;
}

+ (id)trustedUserCertificatesForCourseWithIdentifier:(id)a3 inRoster:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "courseWithIdentifier:inRoster:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allTrustedUserCertificates"));

  return v5;
}

+ (id)courseIdentifiersInRoster:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSSet *v6;
  NSSet *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "courses"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crk_mapToSetUsingBlock:", &stru_1000C9F10));
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = objc_opt_new(NSSet);
  v7 = v6;

  return v7;
}

+ (id)trustedUserWithIdentifier:(id)a3 inCourse:(id)a4
{
  unint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = (unint64_t)a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "trustedUsers", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        if (v5 | v12)
        {
          v13 = (void *)v12;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
          v15 = objc_msgSend(v14, "isEqual:", v5);

          if ((v15 & 1) == 0)
            continue;
        }
        v16 = v11;
        goto LABEL_13;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v16 = 0;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v16 = 0;
  }
LABEL_13:

  return v16;
}

@end
