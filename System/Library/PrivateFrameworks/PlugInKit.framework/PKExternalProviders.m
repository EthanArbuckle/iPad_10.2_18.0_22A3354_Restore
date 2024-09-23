@implementation PKExternalProviders

- (PKLaunchProvider)launch
{
  return self->_launch;
}

- (PKLaunchServicesProvider)ls
{
  return self->_ls;
}

- (PKExternalProviders)init
{
  PKExternalProviders *v2;
  uint64_t v3;
  PKLaunchServicesProvider *ls;
  uint64_t v5;
  PKFilesystemProvider *filesystem;
  uint64_t v7;
  PKLaunchProvider *launch;
  uint64_t v9;
  PKSandboxProvider *sandbox;
  uint64_t v11;
  PKRunningBoardProvider *runningboard;
  uint64_t v13;
  PKSystemProvider *sys;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKExternalProviders;
  v2 = -[PKExternalProviders init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    ls = v2->_ls;
    v2->_ls = (PKLaunchServicesProvider *)v3;

    v5 = objc_opt_new();
    filesystem = v2->_filesystem;
    v2->_filesystem = (PKFilesystemProvider *)v5;

    v7 = objc_opt_new();
    launch = v2->_launch;
    v2->_launch = (PKLaunchProvider *)v7;

    v9 = objc_opt_new();
    sandbox = v2->_sandbox;
    v2->_sandbox = (PKSandboxProvider *)v9;

    v11 = objc_opt_new();
    runningboard = v2->_runningboard;
    v2->_runningboard = (PKRunningBoardProvider *)v11;

    v13 = objc_opt_new();
    sys = v2->_sys;
    v2->_sys = (PKSystemProvider *)v13;

  }
  return v2;
}

- (PKExternalProviders)initWithLaunchServicesProvider:(id)a3
{
  id v5;
  PKExternalProviders *v6;
  PKExternalProviders *v7;
  uint64_t v8;
  PKFilesystemProvider *filesystem;
  uint64_t v10;
  PKLaunchProvider *launch;
  uint64_t v12;
  PKSandboxProvider *sandbox;
  uint64_t v14;
  PKRunningBoardProvider *runningboard;
  uint64_t v16;
  PKSystemProvider *sys;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKExternalProviders;
  v6 = -[PKExternalProviders init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ls, a3);
    v8 = objc_opt_new();
    filesystem = v7->_filesystem;
    v7->_filesystem = (PKFilesystemProvider *)v8;

    v10 = objc_opt_new();
    launch = v7->_launch;
    v7->_launch = (PKLaunchProvider *)v10;

    v12 = objc_opt_new();
    sandbox = v7->_sandbox;
    v7->_sandbox = (PKSandboxProvider *)v12;

    v14 = objc_opt_new();
    runningboard = v7->_runningboard;
    v7->_runningboard = (PKRunningBoardProvider *)v14;

    v16 = objc_opt_new();
    sys = v7->_sys;
    v7->_sys = (PKSystemProvider *)v16;

  }
  return v7;
}

- (PKFilesystemProvider)filesystem
{
  return self->_filesystem;
}

- (PKSandboxProvider)sandbox
{
  return self->_sandbox;
}

- (PKRunningBoardProvider)runningboard
{
  return self->_runningboard;
}

- (PKSystemProvider)sys
{
  return self->_sys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sys, 0);
  objc_storeStrong((id *)&self->_runningboard, 0);
  objc_storeStrong((id *)&self->_sandbox, 0);
  objc_storeStrong((id *)&self->_launch, 0);
  objc_storeStrong((id *)&self->_filesystem, 0);
  objc_storeStrong((id *)&self->_ls, 0);
}

@end
