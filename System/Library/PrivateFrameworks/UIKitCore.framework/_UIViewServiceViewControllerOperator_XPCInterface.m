@implementation _UIViewServiceViewControllerOperator_XPCInterface

- (id)exportedInterface
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE055F48);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", v3, sel___createViewControllerWithOptions_completionBlock_, 0, 0);

  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", v4, sel___createViewControllerWithOptions_completionBlock_, 0, 1);

  v5 = MEMORY[0x1E0C812F8];
  objc_msgSend(v2, "setXPCType:forSelector:argumentIndex:ofReply:", MEMORY[0x1E0C812F8], sel___hostSceneDidUpdateWithDiff_, 0, 0);
  objc_msgSend(v2, "setXPCType:forSelector:argumentIndex:ofReply:", v5, sel___hostDidMoveToParentSceneWithSettings_, 0, 0);
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel___timelinesForDateInterval_completion_, 0, 1);

  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", +[_UIApplicationIntelligenceSupport remoteContextWrapperClass](_UIApplicationIntelligenceSupport, "remoteContextWrapperClass"), sel___intelligenceCollectRemoteContentInVisibleRect_withRemoteContextWrapper_, 1, 0);
  return v2;
}

- (id)hostObjectInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDEFD508);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel___viewServiceDidUpdateMultitaskingDragExclusionRects_, 0, 0);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel___viewServiceAddSceneForwardingLayersForOwners_, 0, 0);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel___viewServiceRemoveSceneForwardingLayersForOwners_, 0, 0);

  return v2;
}

- (id)connectionProtocol
{
  return &unk_1EE0CF368;
}

- (SEL)connectionSelector
{
  return sel___connectToViewControllerOperatorFromRemoteViewController_replyHandler_;
}

- (id)connectionInvocation
{
  return +[_UIViewServiceDeputyXPCInterfaceInvocationFactory invocationForConnectionSelector:](_UIViewServiceDeputyXPCInterfaceInvocationFactory, "invocationForConnectionSelector:", self);
}

@end
