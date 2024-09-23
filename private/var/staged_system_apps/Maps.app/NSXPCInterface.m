@implementation NSXPCInterface

+ (id)_maps_mapsCompanionDaemonXPCInterface
{
  void *v2;
  uint64_t v3;
  NSSet *v4;
  void *v5;
  uint64_t v6;
  NSSet *v7;
  void *v8;
  uint64_t v9;
  NSSet *v10;
  void *v11;
  uint64_t v12;
  NSSet *v13;
  void *v14;
  uint64_t v15;
  NSSet *v16;
  void *v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MapsCompanionDaemonXPCInterface));
  v3 = objc_opt_class(NSData);
  v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(IPCLoadDirectionsMessage), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, "loadDirections:reply:", 0, 0);

  v6 = objc_opt_class(NSData);
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(IPCLoadDirectionsReply), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, "loadDirections:reply:", 0, 1);

  v9 = objc_opt_class(NSData);
  v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(IPCStartNavigationMessage), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, "startPreparedNavigation:reply:", 0, 0);

  v12 = objc_opt_class(NSData);
  v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(IPCNavigationActionReply), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, "startPreparedNavigation:reply:", 0, 1);

  v15 = objc_opt_class(NSData);
  v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, objc_opt_class(IPCNavigationActionReply), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v17, "endNavigationWithReply:", 0, 1);

  return v2;
}

+ (id)_maps_mapsCompanionDaemonXPCClientInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MapsCompanionDaemonXPCClientInterface);
}

+ (id)_maps_mapsConnectionBrokerEndpointSourceInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MapsConnectionBrokerEndpointSource);
}

+ (id)_maps_mapsConnectionBrokerEndpointConsumerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MapsConnectionBrokerEndpointConsumer);
}

+ (id)_maps_mapsConnectionBrokerEndpointRecorderInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MapsConnectionBrokerEndpointRecorder);
}

+ (id)_maps_mapsConnectionBrokerEndpointProviderInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MapsConnectionBrokerEndpointProvider);
}

+ (id)_maps_mapsPushDaemonXPCInterface
{
  void *v2;
  uint64_t v3;
  NSSet *v4;
  void *v5;
  uint64_t v6;
  NSSet *v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MapsPushDaemonXPCInterface));
  v3 = objc_opt_class(NSData);
  v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(IPCHandleTrafficAlertMessage), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, "handleTrafficeReroute:reply:", 0, 0);

  v6 = objc_opt_class(NSData);
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(IPCNavigationActionReply), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, "handleTrafficeReroute:reply:", 0, 1);

  return v2;
}

+ (id)_maps_mapsPushDaemonXPCClientInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MapsPushDaemonXPCClientInterface);
}

+ (id)_maps_mapsSiriXPCInterface
{
  void *v2;
  uint64_t v3;
  NSSet *v4;
  void *v5;
  uint64_t v6;
  NSSet *v7;
  void *v8;
  uint64_t v9;
  NSSet *v10;
  void *v11;
  uint64_t v12;
  NSSet *v13;
  void *v14;
  uint64_t v15;
  NSSet *v16;
  void *v17;
  uint64_t v18;
  NSSet *v19;
  void *v20;
  uint64_t v21;
  NSSet *v22;
  void *v23;
  uint64_t v24;
  NSSet *v25;
  void *v26;
  uint64_t v27;
  NSSet *v28;
  void *v29;
  uint64_t v30;
  NSSet *v31;
  void *v32;
  uint64_t v33;
  NSSet *v34;
  void *v35;
  uint64_t v36;
  NSSet *v37;
  void *v38;
  uint64_t v39;
  NSSet *v40;
  void *v41;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MapsSiriXPCInterface));
  v3 = objc_opt_class(NSData);
  v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(IPCHandleTrafficAlertMessage), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, "handleTrafficeReroute:reply:", 0, 0);

  v6 = objc_opt_class(NSData);
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(IPCNavigationActionReply), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, "handleTrafficeReroute:reply:", 0, 1);

  v9 = objc_opt_class(NSData);
  v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(IPCNavigationActionReply), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, "endNavigationWithReply:", 0, 1);

  v12 = objc_opt_class(NSData);
  v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(IPCGuidanceStateMessage), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, "getGuidanceState:reply:", 0, 0);

  v15 = objc_opt_class(NSData);
  v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, objc_opt_class(IPCGuidanceStateReply), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v17, "getGuidanceState:reply:", 0, 1);

  v18 = objc_opt_class(NSData);
  v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, objc_opt_class(IPCNavigationActionReply), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v20, "repeatLastReroutePromptWithReply:", 0, 1);

  v21 = objc_opt_class(NSData);
  v22 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v21, objc_opt_class(IPCNavigationActionReply), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, "repeatLastGuidanceInstructionWithReply:", 0, 1);

  v24 = objc_opt_class(NSData);
  v25 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v24, objc_opt_class(IPCLoadDirectionsMessage), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v26, "loadDirections:reply:", 0, 0);

  v27 = objc_opt_class(NSData);
  v28 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v27, objc_opt_class(IPCLoadDirectionsReply), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v29, "loadDirections:reply:", 0, 1);

  v30 = objc_opt_class(NSData);
  v31 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v30, objc_opt_class(IPCStartNavigationMessage), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v32, "startPreparedNavigation:reply:", 0, 0);

  v33 = objc_opt_class(NSData);
  v34 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v33, objc_opt_class(IPCNavigationActionReply), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v35, "startPreparedNavigation:reply:", 0, 1);

  v36 = objc_opt_class(NSData);
  v37 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v36, objc_opt_class(IPCMuteSpokenGuidanceMessage), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v38, "setNavigationMuted:", 0, 0);

  v39 = objc_opt_class(NSData);
  v40 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v39, objc_opt_class(IPCSetNavigationVoiceVolumeMessage), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v41, "setNavigationVoiceVolume:", 0, 0);

  return v2;
}

+ (id)_maps_mapsSiriXPCClientInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MapsSiriXPCClientInterface);
}

@end
