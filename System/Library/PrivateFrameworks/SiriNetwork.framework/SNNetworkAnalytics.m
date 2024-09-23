@implementation SNNetworkAnalytics

- (SNNetworkAnalytics)init
{

  return 0;
}

- (id)_init
{
  SNNetworkAnalytics *v2;
  uint64_t v3;
  SNNetworkAnalyticsInternal *underlyingNetworkAnalytics;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SNNetworkAnalytics;
  v2 = -[SNNetworkAnalytics init](&v6, sel_init);
  if (v2)
  {
    +[SNNetworkAnalyticsInternal sharedNetworkAnalytics](SNNetworkAnalyticsInternal, "sharedNetworkAnalytics");
    v3 = objc_claimAutoreleasedReturnValue();
    underlyingNetworkAnalytics = v2->_underlyingNetworkAnalytics;
    v2->_underlyingNetworkAnalytics = (SNNetworkAnalyticsInternal *)v3;

  }
  return v2;
}

+ (id)sharedSNNetworkAnalytics
{
  if (sharedSNNetworkAnalytics_onceToken != -1)
    dispatch_once(&sharedSNNetworkAnalytics_onceToken, &__block_literal_global_1);
  return (id)sharedSNNetworkAnalytics_shared;
}

void __46__SNNetworkAnalytics_sharedSNNetworkAnalytics__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[SNNetworkAnalytics _init]([SNNetworkAnalytics alloc], "_init");
  v1 = (void *)sharedSNNetworkAnalytics_shared;
  sharedSNNetworkAnalytics_shared = (uint64_t)v0;

}

+ (id)sessionConnectionFailedError:(id)a3 connectionMode:(id)a4 sessionType:(id)a5 sessionState:(id)a6 dormant:(BOOL)a7 connectionAnalysisInfo:(id)a8
{
  return +[SNNetworkAnalyticsInternal netSessionConnectionFailedWithError:connectionMode:sessionType:sessionState:isDormant:snConnectionAnalysisInfo:](SNNetworkAnalyticsInternal, "netSessionConnectionFailedWithError:connectionMode:sessionType:sessionState:isDormant:snConnectionAnalysisInfo:", a3, a4, a5, a6, a7, a8);
}

- (void)reset
{
  -[SNNetworkAnalyticsInternal reset](self->_underlyingNetworkAnalytics, "reset");
}

- (void)resetNetId
{
  -[SNNetworkAnalyticsInternal resetNetId](self->_underlyingNetworkAnalytics, "resetNetId");
}

- (void)setNetId:(id)a3
{
  -[SNNetworkAnalyticsInternal setNetId:](self->_underlyingNetworkAnalytics, "setNetId:", a3);
}

- (id)getNetId
{
  return -[SNNetworkAnalyticsInternal getNetId](self->_underlyingNetworkAnalytics, "getNetId");
}

- (unsigned)getSequenceNumber
{
  return -[SNNetworkAnalyticsInternal getSequenceNumber](self->_underlyingNetworkAnalytics, "getSequenceNumber");
}

- (void)setIsConnectionActive:(BOOL)a3
{
  -[SNNetworkAnalyticsInternal setIsConnectionActive:](self->_underlyingNetworkAnalytics, "setIsConnectionActive:", a3);
}

- (BOOL)isConnectionActive
{
  return -[SNNetworkAnalyticsInternal getIsConnectionActive](self->_underlyingNetworkAnalytics, "getIsConnectionActive");
}

- (void)setNetIdAvailable:(BOOL)a3
{
  -[SNNetworkAnalyticsInternal setNetIdAvailable:](self->_underlyingNetworkAnalytics, "setNetIdAvailable:", a3);
}

- (BOOL)isNetIdAvailable
{
  return -[SNNetworkAnalyticsInternal isNetIdAvailable](self->_underlyingNetworkAnalytics, "isNetIdAvailable");
}

- (void)increaseSequenceNumber
{
  -[SNNetworkAnalyticsInternal increaseSequenceNumber](self->_underlyingNetworkAnalytics, "increaseSequenceNumber");
}

- (void)resetSequenceNumber
{
  -[SNNetworkAnalyticsInternal resetSequenceNumber](self->_underlyingNetworkAnalytics, "resetSequenceNumber");
}

- (void)setOrchestratorRequestId:(id)a3
{
  -[SNNetworkAnalyticsInternal setOrchestatorRequestId:](self->_underlyingNetworkAnalytics, "setOrchestatorRequestId:", a3);
}

- (id)getOrchestratorRequestId
{
  return -[SNNetworkAnalyticsInternal getOrchestratorRequestId](self->_underlyingNetworkAnalytics, "getOrchestratorRequestId");
}

- (void)logRequestLinkBetweenOrchestratorAndNetworkComponent
{
  -[SNNetworkAnalyticsInternal logRequestLinkBetweenOrchestratorAndNetworkComponent](self->_underlyingNetworkAnalytics, "logRequestLinkBetweenOrchestratorAndNetworkComponent");
}

- (void)logSessionConnectionHttpHeaderCreated:(id)a3
{
  -[SNNetworkAnalyticsInternal logSessionConnectionHttpHeaderCreated:](self->_underlyingNetworkAnalytics, "logSessionConnectionHttpHeaderCreated:", a3);
}

- (void)logNetworkConnectionStatePreparationSnapshotCaptured:(id)a3
{
  -[SNNetworkAnalyticsInternal logNetworkConnectionStatePreparationSnapshotCaptured:](self->_underlyingNetworkAnalytics, "logNetworkConnectionStatePreparationSnapshotCaptured:", a3);
}

- (void)logDebugNetworkConnectionStatePreparationSnapshotCaptured:(id)a3
{
  -[SNNetworkAnalyticsInternal logDebugNetworkConnectionStatePreparationSnapshotCaptured:](self->_underlyingNetworkAnalytics, "logDebugNetworkConnectionStatePreparationSnapshotCaptured:", a3);
}

- (void)logNetworkConnectionStateReadySnapshotCaptured:(id)a3
{
  -[SNNetworkAnalyticsInternal logNetworkConnectionStateReadySnapshotCaptured:](self->_underlyingNetworkAnalytics, "logNetworkConnectionStateReadySnapshotCaptured:", a3);
}

- (void)logDebugNetworkConnectionStateReadySnapshotCaptured:(id)a3
{
  -[SNNetworkAnalyticsInternal logDebugNetworkConnectionStateReadySnapshotCaptured:](self->_underlyingNetworkAnalytics, "logDebugNetworkConnectionStateReadySnapshotCaptured:", a3);
}

- (void)logSessionConnectionSnapshotCaptured:(id)a3
{
  -[SNNetworkAnalyticsInternal logSessionConnectionSnapshotCaptured:](self->_underlyingNetworkAnalytics, "logSessionConnectionSnapshotCaptured:", a3);
}

- (void)logDebugSessionConnectionSnapshotCaptured:(id)a3
{
  -[SNNetworkAnalyticsInternal logDebugSessionConnectionSnapshotCaptured:](self->_underlyingNetworkAnalytics, "logDebugSessionConnectionSnapshotCaptured:", a3);
}

- (void)logSessionConnectionFailed:(id)a3
{
  -[SNNetworkAnalyticsInternal logSessionConnectionFailed:](self->_underlyingNetworkAnalytics, "logSessionConnectionFailed:", a3);
}

- (void)logPeerConnectionFailed:(id)a3
{
  -[SNNetworkAnalyticsInternal logPeerConnectionFailed:](self->_underlyingNetworkAnalytics, "logPeerConnectionFailed:", a3);
}

- (SNNetworkAnalyticsInternal)underlyingNetworkAnalytics
{
  return self->_underlyingNetworkAnalytics;
}

- (void)setUnderlyingNetworkAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingNetworkAnalytics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingNetworkAnalytics, 0);
}

@end
