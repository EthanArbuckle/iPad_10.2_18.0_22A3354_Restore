@implementation VUIJSFactory

+ (void)exposeObjectsInJSContext:(id)a3
{
  id v3;
  VUIJSNetworkInterface *v4;
  VUIJSNotificationCenter *v5;
  VUIJSSettingsInterface *v6;
  VUIJSAMSBagInterface *v7;
  VUIJSMetricsInterface *v8;
  VUIJSURLRouterInterface *v9;
  VUIJSVideosNativeInterface *v10;
  VUIJSSportsInterface *v11;
  VUIJSOfferInterface *v12;
  VUIJSMetadataInterface *v13;
  VUIJSPostPlayItemInterface *v14;
  IKJSAccountInfo *v15;
  VUIJSBookmarkInterface *v16;
  VUIJSPlayerTabsInterface *v17;
  VUIJSExitUpsellInterface *v18;
  VUIJSSportsKitInterface *v19;
  VUIJSKeyPlaysInterface *v20;
  id v21;

  v3 = a3;
  +[VUIAppContext currentAppContext](VUIAppContext, "currentAppContext");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[VUIJSNetworkInterface initWithAppContext:]([VUIJSNetworkInterface alloc], "initWithAppContext:", v21);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("wlNetworkInterface"));

  v5 = -[VUIJSNotificationCenter initWithAppContext:]([VUIJSNotificationCenter alloc], "initWithAppContext:", v21);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("wlNotifications"));

  v6 = -[VUIJSSettingsInterface initWithAppContext:]([VUIJSSettingsInterface alloc], "initWithAppContext:", v21);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("wlSettings"));

  v7 = -[VUIJSObject initWithAppContext:]([VUIJSAMSBagInterface alloc], "initWithAppContext:", v21);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("urlBag"));

  v8 = -[VUIJSMetricsInterface initWithAppContext:]([VUIJSMetricsInterface alloc], "initWithAppContext:", v21);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("videoMetrics"));

  v9 = -[VUIJSObject initWithAppContext:]([VUIJSURLRouterInterface alloc], "initWithAppContext:", v21);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("VideoURLRouterInterface"));

  v10 = -[VUIJSObject initWithAppContext:]([VUIJSVideosNativeInterface alloc], "initWithAppContext:", v21);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("videosNative"));

  v11 = -[VUIJSSportsInterface initWithAppContext:]([VUIJSSportsInterface alloc], "initWithAppContext:", v21);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("SportsInterface"));

  v12 = -[VUIJSObject initWithAppContext:]([VUIJSOfferInterface alloc], "initWithAppContext:", v21);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("offersInterface"));

  v13 = -[VUIJSObject initWithAppContext:]([VUIJSMetadataInterface alloc], "initWithAppContext:", v21);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("UTSMetadataInterface"));

  v14 = -[VUIJSObject initWithAppContext:]([VUIJSPostPlayItemInterface alloc], "initWithAppContext:", v21);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("PostPlayItemInterface"));

  v15 = -[IKJSAccountInfo initWithAppContext:]([IKJSAccountInfo alloc], "initWithAppContext:", v21);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("tvAccountInfo"));

  v16 = -[VUIJSObject initWithAppContext:]([VUIJSBookmarkInterface alloc], "initWithAppContext:", v21);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("BookmarkCache"));

  v17 = -[VUIJSObject initWithAppContext:]([VUIJSPlayerTabsInterface alloc], "initWithAppContext:", v21);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("PlayerTabsInterface"));

  v18 = -[VUIJSObject initWithAppContext:]([VUIJSExitUpsellInterface alloc], "initWithAppContext:", v21);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("ExitUpsellInterface"));

  v19 = -[VUIJSSportsKitInterface initWithAppContext:]([VUIJSSportsKitInterface alloc], "initWithAppContext:", v21);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("SportsKitInterface"));

  v20 = -[VUIJSObject initWithAppContext:]([VUIJSKeyPlaysInterface alloc], "initWithAppContext:", v21);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("KeyPlaysInterface"));

}

@end
