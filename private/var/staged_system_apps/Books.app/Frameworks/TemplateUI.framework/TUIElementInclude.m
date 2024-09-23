@implementation TUIElementInclude

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return 0;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "stringForAttribute:node:", 213, a4.var0));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "baseURLForNode:", a4.var0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", v8, v9));

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v11, "includeTemplateWithURL:", v10);

}

@end
