@implementation VSSAMLRequestFactory

+ (id)authNRequestWithResponse:(id)a3 forced:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  VSSharedSAMLParserController();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "newAuthNRequest:error:", CFSTR("com.apple.VideoSubscriberAccount.SAML"), a5);

  if (v7 && v9)
  {
    objc_msgSend(v9, "setSubjectFromResponse:", v7);
    objc_msgSend(v9, "setForceAuthN:", v6);
  }

  return v9;
}

+ (id)attributeQueryWithAttributeNames:(id)a3 channelID:(id)a4 authNResponse:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  VSSharedSAMLParserController();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "newAttributeQuery:error:", v10, a6);

  if (v13)
  {
    objc_msgSend(v13, "setSubjectFromResponse:", v11);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v13, "addAttribute:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v18++), (_QWORD)v20);
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v16);
    }

  }
  return v13;
}

+ (id)logoutRequestWithError:(id *)a3
{
  void *v4;
  void *v5;

  VSSharedSAMLParserController();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newLogoutRequest:", a3);

  return v5;
}

@end
