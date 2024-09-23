@implementation NSPConfigurationStats

- (id)eventName
{
  return CFSTR("com.apple.nsp.configurationStats");
}

- (id)analyticsDict
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSPConfigurationStats configurationVersion](self, "configurationVersion")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ConfigurationVersion"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats configurationEnabled](self, "configurationEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ConfigurationEnabled"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats tokenFetchEnabled](self, "tokenFetchEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("TokenFetchEnabled"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSPConfigurationStats tierType](self, "tierType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("TierType"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats safariUnencryptedEnabled](self, "safariUnencryptedEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("SafariUnencryptedEnabled"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats safariDNSEnabled](self, "safariDNSEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("SafariDNSEnabled"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats safariTrackersEnabled](self, "safariTrackersEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("SafariTrackersEnabled"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats safariAllEnabled](self, "safariAllEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("SafariAllEnabled"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats safariHTTPEnabled](self, "safariHTTPEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("SafariHTTPEnabled"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats safariPrivateUnencryptedEnabled](self, "safariPrivateUnencryptedEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("SafariPrivateUnencryptedEnabled"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats safariPrivateDNSEnabled](self, "safariPrivateDNSEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("SafariPrivateDNSEnabled"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats safariPrivateAllEnabled](self, "safariPrivateAllEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("SafariPrivateAllEnabled"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats safariMetricsEnabled](self, "safariMetricsEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("SafariMetricsEnabled"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats mailTrackersEnabled](self, "mailTrackersEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("MailTrackersEnabled"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats unencryptedEnabled](self, "unencryptedEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("UnencryptedEnabled"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats dnsEnabled](self, "dnsEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("DNSEnabled"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats knownTrackersEnabled](self, "knownTrackersEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("KnownTrackersEnabled"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats appTrackersEnabled](self, "appTrackersEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("AppTrackersEnabled"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats newsURLResolutionEnabled](self, "newsURLResolutionEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("NewsURLResolutionEnabled"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats exposureNotificationsEnabled](self, "exposureNotificationsEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("ExposureNotificationsEnabled"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats appleCertificatesEnabled](self, "appleCertificatesEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("AppleCertificatesEnabled"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats networkToolsEnabled](self, "networkToolsEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("NetworkToolsEnabled"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats metricsUploadEnabled](self, "metricsUploadEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("MetricsUploadEnabled"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats newsEmbeddedContentEnabled](self, "newsEmbeddedContentEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("NewsEmbeddedContentEnabled"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats appMetricsEnabled](self, "appMetricsEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("AppMetricsEnabled"));

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats promotedContentEnabled](self, "promotedContentEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("PromotedContentEnabled"));

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats brandedCallingEnabled](self, "brandedCallingEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("BrandedCallingEnabled"));

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats postbackFetchEnabled](self, "postbackFetchEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("PostbackFetchEnabled"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats passwordManagerIconFetchEnabled](self, "passwordManagerIconFetchEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("PasswordManagerIconFetchEnabled"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSPConfigurationStats launchWarningDetailsEnabled](self, "launchWarningDetailsEnabled")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("LaunchWarningDetailsEnabled"));

  return v3;
}

- (unint64_t)configurationVersion
{
  return self->_configurationVersion;
}

- (void)setConfigurationVersion:(unint64_t)a3
{
  self->_configurationVersion = a3;
}

- (BOOL)configurationEnabled
{
  return self->_configurationEnabled;
}

- (void)setConfigurationEnabled:(BOOL)a3
{
  self->_configurationEnabled = a3;
}

- (BOOL)tokenFetchEnabled
{
  return self->_tokenFetchEnabled;
}

- (void)setTokenFetchEnabled:(BOOL)a3
{
  self->_tokenFetchEnabled = a3;
}

- (NSString)tierType
{
  return self->_tierType;
}

- (void)setTierType:(id)a3
{
  objc_storeStrong((id *)&self->_tierType, a3);
}

- (BOOL)safariUnencryptedEnabled
{
  return self->_safariUnencryptedEnabled;
}

- (void)setSafariUnencryptedEnabled:(BOOL)a3
{
  self->_safariUnencryptedEnabled = a3;
}

- (BOOL)safariDNSEnabled
{
  return self->_safariDNSEnabled;
}

- (void)setSafariDNSEnabled:(BOOL)a3
{
  self->_safariDNSEnabled = a3;
}

- (BOOL)safariTrackersEnabled
{
  return self->_safariTrackersEnabled;
}

- (void)setSafariTrackersEnabled:(BOOL)a3
{
  self->_safariTrackersEnabled = a3;
}

- (BOOL)safariAllEnabled
{
  return self->_safariAllEnabled;
}

- (void)setSafariAllEnabled:(BOOL)a3
{
  self->_safariAllEnabled = a3;
}

- (BOOL)safariHTTPEnabled
{
  return self->_safariHTTPEnabled;
}

- (void)setSafariHTTPEnabled:(BOOL)a3
{
  self->_safariHTTPEnabled = a3;
}

- (BOOL)safariPrivateUnencryptedEnabled
{
  return self->_safariPrivateUnencryptedEnabled;
}

- (void)setSafariPrivateUnencryptedEnabled:(BOOL)a3
{
  self->_safariPrivateUnencryptedEnabled = a3;
}

- (BOOL)safariPrivateDNSEnabled
{
  return self->_safariPrivateDNSEnabled;
}

- (void)setSafariPrivateDNSEnabled:(BOOL)a3
{
  self->_safariPrivateDNSEnabled = a3;
}

- (BOOL)safariPrivateAllEnabled
{
  return self->_safariPrivateAllEnabled;
}

- (void)setSafariPrivateAllEnabled:(BOOL)a3
{
  self->_safariPrivateAllEnabled = a3;
}

- (BOOL)safariMetricsEnabled
{
  return self->_safariMetricsEnabled;
}

- (void)setSafariMetricsEnabled:(BOOL)a3
{
  self->_safariMetricsEnabled = a3;
}

- (BOOL)mailTrackersEnabled
{
  return self->_mailTrackersEnabled;
}

- (void)setMailTrackersEnabled:(BOOL)a3
{
  self->_mailTrackersEnabled = a3;
}

- (BOOL)unencryptedEnabled
{
  return self->_unencryptedEnabled;
}

- (void)setUnencryptedEnabled:(BOOL)a3
{
  self->_unencryptedEnabled = a3;
}

- (BOOL)dnsEnabled
{
  return self->_dnsEnabled;
}

- (void)setDnsEnabled:(BOOL)a3
{
  self->_dnsEnabled = a3;
}

- (BOOL)knownTrackersEnabled
{
  return self->_knownTrackersEnabled;
}

- (void)setKnownTrackersEnabled:(BOOL)a3
{
  self->_knownTrackersEnabled = a3;
}

- (BOOL)appTrackersEnabled
{
  return self->_appTrackersEnabled;
}

- (void)setAppTrackersEnabled:(BOOL)a3
{
  self->_appTrackersEnabled = a3;
}

- (BOOL)newsURLResolutionEnabled
{
  return self->_newsURLResolutionEnabled;
}

- (void)setNewsURLResolutionEnabled:(BOOL)a3
{
  self->_newsURLResolutionEnabled = a3;
}

- (BOOL)exposureNotificationsEnabled
{
  return self->_exposureNotificationsEnabled;
}

- (void)setExposureNotificationsEnabled:(BOOL)a3
{
  self->_exposureNotificationsEnabled = a3;
}

- (BOOL)appleCertificatesEnabled
{
  return self->_appleCertificatesEnabled;
}

- (void)setAppleCertificatesEnabled:(BOOL)a3
{
  self->_appleCertificatesEnabled = a3;
}

- (BOOL)networkToolsEnabled
{
  return self->_networkToolsEnabled;
}

- (void)setNetworkToolsEnabled:(BOOL)a3
{
  self->_networkToolsEnabled = a3;
}

- (BOOL)metricsUploadEnabled
{
  return self->_metricsUploadEnabled;
}

- (void)setMetricsUploadEnabled:(BOOL)a3
{
  self->_metricsUploadEnabled = a3;
}

- (BOOL)brandedCallingEnabled
{
  return self->_brandedCallingEnabled;
}

- (void)setBrandedCallingEnabled:(BOOL)a3
{
  self->_brandedCallingEnabled = a3;
}

- (BOOL)newsEmbeddedContentEnabled
{
  return self->_newsEmbeddedContentEnabled;
}

- (void)setNewsEmbeddedContentEnabled:(BOOL)a3
{
  self->_newsEmbeddedContentEnabled = a3;
}

- (BOOL)appMetricsEnabled
{
  return self->_appMetricsEnabled;
}

- (void)setAppMetricsEnabled:(BOOL)a3
{
  self->_appMetricsEnabled = a3;
}

- (BOOL)promotedContentEnabled
{
  return self->_promotedContentEnabled;
}

- (void)setPromotedContentEnabled:(BOOL)a3
{
  self->_promotedContentEnabled = a3;
}

- (BOOL)postbackFetchEnabled
{
  return self->_postbackFetchEnabled;
}

- (void)setPostbackFetchEnabled:(BOOL)a3
{
  self->_postbackFetchEnabled = a3;
}

- (BOOL)passwordManagerIconFetchEnabled
{
  return self->_passwordManagerIconFetchEnabled;
}

- (void)setPasswordManagerIconFetchEnabled:(BOOL)a3
{
  self->_passwordManagerIconFetchEnabled = a3;
}

- (BOOL)launchWarningDetailsEnabled
{
  return self->_launchWarningDetailsEnabled;
}

- (void)setLaunchWarningDetailsEnabled:(BOOL)a3
{
  self->_launchWarningDetailsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tierType, 0);
}

@end
