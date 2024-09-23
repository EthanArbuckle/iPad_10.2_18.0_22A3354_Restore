@implementation UVServiceHubServiceFactory

- (id)newAgentPipeService:(id)a3 error:(id *)a4
{
  +[_UVServiceHubServiceFactory makeAgentPipeServiceAndReturnError:messageHandler:](_TtC17PreviewsOSSupport27_UVServiceHubServiceFactory, "makeAgentPipeServiceAndReturnError:messageHandler:", a4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newShellPipeService:(id)a3 error:(id *)a4
{
  +[_UVServiceHubServiceFactory makeShellPipeServiceAndReturnError:messageHandler:](_TtC17PreviewsOSSupport27_UVServiceHubServiceFactory, "makeShellPipeServiceAndReturnError:messageHandler:", a4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newPreviewService:(id)a3 error:(id *)a4
{
  +[_UVServiceHubServiceFactory makePreviewServiceAndReturnError:](_TtC17PreviewsOSSupport27_UVServiceHubServiceFactory, "makePreviewServiceAndReturnError:", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
