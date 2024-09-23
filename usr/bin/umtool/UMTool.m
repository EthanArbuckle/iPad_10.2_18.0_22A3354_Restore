@implementation UMTool

+ (id)name
{
  return CFSTR("umtool");
}

+ (id)description
{
  return CFSTR("A tool for diagnosing the UserManagement framework");
}

+ (id)subcommands
{
  uint64_t v3;

  v3 = objc_opt_class(UMTestSysdiagnose);
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

@end
