@implementation STUMockWorkspacePrimitives

- (STUMockWorkspacePrimitives)init
{
  STUMockWorkspacePrimitives *v2;
  NSMutableArray *v3;
  NSMutableArray *openedApps;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUMockWorkspacePrimitives;
  v2 = -[STUMockWorkspacePrimitives init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableArray);
    openedApps = v2->_openedApps;
    v2->_openedApps = v3;

  }
  return v2;
}

- (BOOL)isVoiceOverEnabled
{
  return 0;
}

- (NSArray)runningApplications
{
  return objc_opt_new(NSArray);
}

- (id)URLForApplicationToOpenURL:(id)a3
{
  return +[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("file:///Applications/Safari.app/"));
}

- (BOOL)openURL:(id)a3
{
  return 1;
}

- (id)openAndActivateApplicationAtURL:(id)a3 device:(id)a4 completionHandler:(id)a5
{
  void (**v5)(id, STUMockRunningApplication *, _QWORD);
  STUMockRunningApplication *v6;
  STUMockOpenApplicationToken *v7;

  v5 = (void (**)(id, STUMockRunningApplication *, _QWORD))a5;
  v6 = objc_opt_new(STUMockRunningApplication);
  v5[2](v5, v6, 0);

  v7 = objc_opt_new(STUMockOpenApplicationToken);
  return v7;
}

- (id)URLForApplicationWithBundleIdentifier:(id)a3
{
  return +[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("file:///Applications/Safari.app/"));
}

- (id)openConfiguration
{
  return objc_opt_new(STUMockWorkspaceOpenConfiguration);
}

- (void)openApplicationAtURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, STUMockRunningApplication *, _QWORD);
  void *v8;
  id v9;
  STUMockRunningApplication *v10;
  id v11;

  v7 = (void (**)(id, STUMockRunningApplication *, _QWORD))a5;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "absoluteString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUMockWorkspacePrimitives openedApps](self, "openedApps"));
  v9 = objc_msgSend(v11, "copy");
  objc_msgSend(v8, "addObject:", v9);

  v10 = objc_opt_new(STUMockRunningApplication);
  v7[2](v7, v10, 0);

}

- (id)iconDataForApplicationURL:(id)a3 withProposedSize:(CGSize)a4
{
  return 0;
}

- (NSMutableArray)openedApps
{
  return self->_openedApps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openedApps, 0);
}

@end
