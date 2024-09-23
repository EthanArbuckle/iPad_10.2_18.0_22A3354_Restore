@implementation PKWebServiceSharingFeature

- (PKWebServiceSharingFeature)initWithDictionary:(id)a3 region:(id)a4
{
  id v6;
  PKWebServiceSharingFeature *v7;
  void *v8;
  NSArray *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  PKWebServiceSharingActivationConfiguration *v16;
  PKWebServiceSharingActivationConfiguration *v17;
  NSArray *activationCodeConfigurations;
  uint64_t v19;
  NSString *relayServerHost;
  uint64_t v21;
  NSArray *allowedRelayServerHosts;
  uint64_t v23;
  NSArray *relayServerHostsToHandleUniversalLinks;
  uint64_t v25;
  NSArray *relayServerHostsToUseThirdPartyPushTopic;
  uint64_t v27;
  NSURL *staticContentBaseURL;
  uint64_t v29;
  NSDictionary *openGraphPreviewUrls;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[PKWebServiceRegionFeature initWithFeatureType:dictionary:region:](self, "initWithFeatureType:dictionary:region:", 5, v6, a4);
  if (v7)
  {
    v7->_relayServerPasswordLength = objc_msgSend(v6, "PKIntegerForKey:", CFSTR("relayServerPasswordLength"));
    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("activationCodeConfigurations"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v34;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v34 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v14);
            v16 = [PKWebServiceSharingActivationConfiguration alloc];
            v17 = -[PKWebServiceSharingActivationConfiguration initWithDictionary:](v16, "initWithDictionary:", v15, (_QWORD)v33);
            -[NSArray safelyAddObject:](v9, "safelyAddObject:", v17);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v12);
      }

      activationCodeConfigurations = v7->_activationCodeConfigurations;
      v7->_activationCodeConfigurations = v9;

    }
    objc_msgSend(v6, "PKStringForKey:", CFSTR("relayServerHost"), (_QWORD)v33);
    v19 = objc_claimAutoreleasedReturnValue();
    relayServerHost = v7->_relayServerHost;
    v7->_relayServerHost = (NSString *)v19;

    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("allowedRelayServerHosts"));
    v21 = objc_claimAutoreleasedReturnValue();
    allowedRelayServerHosts = v7->_allowedRelayServerHosts;
    v7->_allowedRelayServerHosts = (NSArray *)v21;

    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("relayServerHostsToHandleUniversalLinks"));
    v23 = objc_claimAutoreleasedReturnValue();
    relayServerHostsToHandleUniversalLinks = v7->_relayServerHostsToHandleUniversalLinks;
    v7->_relayServerHostsToHandleUniversalLinks = (NSArray *)v23;

    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("relayServerHostsToUseThirdPartyPushTopic"));
    v25 = objc_claimAutoreleasedReturnValue();
    relayServerHostsToUseThirdPartyPushTopic = v7->_relayServerHostsToUseThirdPartyPushTopic;
    v7->_relayServerHostsToUseThirdPartyPushTopic = (NSArray *)v25;

    objc_msgSend(v6, "PKURLForKey:", CFSTR("staticContentBaseURL"));
    v27 = objc_claimAutoreleasedReturnValue();
    staticContentBaseURL = v7->_staticContentBaseURL;
    v7->_staticContentBaseURL = (NSURL *)v27;

    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("openGraphPreviewUrls"));
    v29 = objc_claimAutoreleasedReturnValue();
    openGraphPreviewUrls = v7->_openGraphPreviewUrls;
    v7->_openGraphPreviewUrls = (NSDictionary *)v29;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enabled"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      v7->_enabled = objc_msgSend(v6, "PKBoolForKey:", CFSTR("enabled"));
    else
      v7->_enabled = 1;

  }
  return v7;
}

- (NSArray)activationCodeConfigurations
{
  return self->_activationCodeConfigurations;
}

- (unint64_t)relayServerPasswordLength
{
  return self->_relayServerPasswordLength;
}

- (NSString)relayServerHost
{
  return self->_relayServerHost;
}

- (NSArray)allowedRelayServerHosts
{
  return self->_allowedRelayServerHosts;
}

- (NSArray)relayServerHostsToHandleUniversalLinks
{
  return self->_relayServerHostsToHandleUniversalLinks;
}

- (NSArray)relayServerHostsToUseThirdPartyPushTopic
{
  return self->_relayServerHostsToUseThirdPartyPushTopic;
}

- (NSURL)staticContentBaseURL
{
  return self->_staticContentBaseURL;
}

- (NSDictionary)openGraphPreviewUrls
{
  return self->_openGraphPreviewUrls;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openGraphPreviewUrls, 0);
  objc_storeStrong((id *)&self->_staticContentBaseURL, 0);
  objc_storeStrong((id *)&self->_relayServerHostsToUseThirdPartyPushTopic, 0);
  objc_storeStrong((id *)&self->_relayServerHostsToHandleUniversalLinks, 0);
  objc_storeStrong((id *)&self->_activationCodeConfigurations, 0);
  objc_storeStrong((id *)&self->_allowedRelayServerHosts, 0);
  objc_storeStrong((id *)&self->_relayServerHost, 0);
}

@end
