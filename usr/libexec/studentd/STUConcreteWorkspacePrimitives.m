@implementation STUConcreteWorkspacePrimitives

- (NSArray)runningApplications
{
  return (NSArray *)&__NSArray0__struct;
}

- (id)URLForApplicationToOpenURL:(id)a3
{
  return 0;
}

- (BOOL)openURL:(id)a3
{
  return 0;
}

- (id)openAndActivateApplicationAtURL:(id)a3 device:(id)a4 completionHandler:(id)a5
{
  void (**v5)(id, _QWORD, void *);
  STUMockOpenApplicationToken *v6;
  uint64_t v7;
  void *v8;

  v5 = (void (**)(id, _QWORD, void *))a5;
  v6 = objc_opt_new(STUMockOpenApplicationToken);
  v7 = CRKErrorWithCodeAndUserInfo(1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v5[2](v5, 0, v8);

  return v6;
}

- (id)URLForApplicationWithBundleIdentifier:(id)a3
{
  return 0;
}

- (id)openConfiguration
{
  return objc_opt_new(STUConcreteWorkspaceOpenConfiguration_iOS);
}

- (void)openApplicationAtURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = a5;
  v7 = CRKErrorWithCodeAndUserInfo(1, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue(v7);
  (*((void (**)(id, _QWORD, id))a5 + 2))(v6, 0, v8);

}

- (id)iconDataForApplicationURL:(id)a3 withProposedSize:(CGSize)a4
{
  return 0;
}

- (BOOL)isVoiceOverEnabled
{
  return 0;
}

@end
