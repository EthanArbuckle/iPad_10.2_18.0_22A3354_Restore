@implementation PhosphorusDomain

- (unint64_t)domain
{
  return 16;
}

- (id)domainChangeNotificationName
{
  return CFSTR("com.apple.os-eligibility-domain.change.phosphorus");
}

- (PhosphorusDomain)init
{
  PhosphorusDomain *v2;
  PhosphorusDomain *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PhosphorusDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2)
    -[PhosphorusDomain _internal_doInit](v2, "_internal_doInit");
  return v3;
}

- (PhosphorusDomain)initWithCoder:(id)a3
{
  PhosphorusDomain *v3;
  PhosphorusDomain *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PhosphorusDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[PhosphorusDomain _internal_doInit](v3, "_internal_doInit");
  return v4;
}

- (id)status
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char **v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v17;
  objc_super v18;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](MobileAssetManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "phosphorusAsset"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "policies"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    v9 = &selRef_defaultCenter;
    while (2)
    {
      v10 = 0;
      v11 = v9[239];
      v12 = v7;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v4);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v10);
        -[EligibilityDomain resetInputsOfInterest](self, "resetInputsOfInterest");
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100005F94;
        v19[3] = &unk_1000309F8;
        v19[4] = self;
        v20 = v3;
        objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v19);
        v18.receiver = self;
        v18.super_class = (Class)PhosphorusDomain;
        v14 = objc_msgSendSuper2(&v18, v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue(v14);

        if ((id)-[EligibilityDomain computeAnswerFromStatus:](self, "computeAnswerFromStatus:", v7) == (id)4)
        {
          v15 = v7;

          goto LABEL_13;
        }

        v10 = (char *)v10 + 1;
        v12 = v7;
      }
      while (v6 != v10);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v9 = &selRef_defaultCenter;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }

  v15 = v7;
LABEL_13:

  return v15;
}

- (BOOL)computeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[InputManager sharedInstance](InputManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForInputValue:", 2));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "countryCode"));
  -[EligibilityDomain addContextForKey:value:](self, "addContextForKey:value:", CFSTR("OS_ELIGIBILITY_CONTEXT_COUNTRY_BILLING"), v7);

  LOBYTE(a3) = -[EligibilityDomain computeAnswerFromStatusWithError:](self, "computeAnswerFromStatusWithError:", a3);
  return (char)a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
