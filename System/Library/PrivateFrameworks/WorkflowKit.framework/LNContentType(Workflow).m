@implementation LNContentType(Workflow)

- (id)wf_fileType
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0DC7B30];
  objc_msgSend(a1, "contentType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "typeWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)wf_initWithFileType:()Workflow
{
  id v4;
  void *v5;
  void *v6;

  v4 = a1;
  objc_msgSend(a3, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithContentType:", v5);

  return v6;
}

@end
