@implementation QLURLItemTransformer

+ (id)allowedOutputClasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
}

- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5
{
  return a3;
}

@end
