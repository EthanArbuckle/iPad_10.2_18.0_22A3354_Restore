@implementation _UIPopoverShapePathProvider

+ (id)defaultProviderForIdiom:(int64_t)a3
{
  return (id)objc_opt_new();
}

- (id)generatePopoverPathForParameters:(_UIPopoverShapePathParameters *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPopoverShapePathProvider.m"), 32, CFSTR("Calling -generatePopoverPathForParameters: on instance abstract class _UIPopoverShapePathProvider."));

  return 0;
}

@end
