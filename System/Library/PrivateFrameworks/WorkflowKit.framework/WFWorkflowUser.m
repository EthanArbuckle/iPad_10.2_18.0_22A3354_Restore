@implementation WFWorkflowUser

- (NSString)websiteDisplayName
{
  void *v2;
  void *v3;

  -[WFWorkflowUser websiteURL](self, "websiteURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wf_displayStringWithCharacterLimit:", 0x7FFFFFFFFFFFFFFFLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)twitterDisplayName
{
  void *v2;
  void *v3;

  -[WFWorkflowUser twitter](self, "twitter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(CFSTR("@"), "stringByAppendingString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NSString *v13;

  -[WFWorkflowUser websiteDisplayName](self, "websiteDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowUser fullName](self, "fullName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWorkflowUser twitterDisplayName](self, "twitterDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFWorkflowUser mainIdentity](self, "mainIdentity");
  v7 = v5;
  if (!v6)
    goto LABEL_6;
  if (v6 == 2)
  {
    v7 = v4;
    goto LABEL_6;
  }
  v7 = v3;
  if (v6 == 1)
  {
LABEL_6:
    v8 = v7;
    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:
  if (!objc_msgSend(v8, "length") && objc_msgSend(v4, "length"))
  {
    v9 = v4;

    v8 = v9;
  }
  if (!objc_msgSend(v8, "length") && objc_msgSend(v5, "length"))
  {
    v10 = v5;

    v8 = v10;
  }
  if (!objc_msgSend(v8, "length") && objc_msgSend(v3, "length"))
  {
    v11 = v3;

    v8 = v11;
  }
  if (objc_msgSend(v8, "length"))
    v12 = v8;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  WFMutableWorkflowUser *v4;
  void *v5;

  v4 = -[MTLModel init](+[WFMutableWorkflowUser allocWithZone:](WFMutableWorkflowUser, "allocWithZone:", a3), "init");
  -[MTLModel dictionaryValue](self, "dictionaryValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFMutableWorkflowUser setValuesForKeysWithDictionary:](v4, "setValuesForKeysWithDictionary:", v5);

  return v4;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)email
{
  return self->_email;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (NSString)twitter
{
  return self->_twitter;
}

- (NSURL)websiteURL
{
  return self->_websiteURL;
}

- (NSURL)profileImageURL
{
  return self->_profileImageURL;
}

- (NSDate)dateJoined
{
  return self->_dateJoined;
}

- (NSNumber)isAdmin
{
  return self->_isAdmin;
}

- (int64_t)mainIdentity
{
  return self->_mainIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isAdmin, 0);
  objc_storeStrong((id *)&self->_dateJoined, 0);
  objc_storeStrong((id *)&self->_profileImageURL, 0);
  objc_storeStrong((id *)&self->_websiteURL, 0);
  objc_storeStrong((id *)&self->_twitter, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)JSONKeyPathsByPropertyKey
{
  _QWORD v3[9];
  _QWORD v4[10];

  v4[9] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("identifier");
  v3[1] = CFSTR("email");
  v4[0] = CFSTR("uuid");
  v4[1] = CFSTR("email");
  v3[2] = CFSTR("fullName");
  v3[3] = CFSTR("twitter");
  v4[2] = CFSTR("fullName");
  v4[3] = CFSTR("twitter");
  v3[4] = CFSTR("websiteURL");
  v3[5] = CFSTR("mainIdentity");
  v4[4] = CFSTR("website");
  v4[5] = CFSTR("mainIdentity");
  v3[6] = CFSTR("profileImageURL");
  v3[7] = CFSTR("isAdmin");
  v4[6] = CFSTR("profileImage");
  v4[7] = CFSTR("isAdmin");
  v3[8] = CFSTR("dateJoined");
  v4[8] = CFSTR("dateJoined");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)mainIdentityJSONTransformer
{
  return +[NSValueTransformer mtl_valueMappingTransformerWithDictionary:defaultValue:reverseDefaultValue:](MTLValueTransformer, "mtl_valueMappingTransformerWithDictionary:defaultValue:reverseDefaultValue:", &unk_1E7B8DFB8, &unk_1E7B8BE30, 0);
}

@end
