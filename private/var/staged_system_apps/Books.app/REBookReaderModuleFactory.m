@implementation REBookReaderModuleFactory

+ (void)prewarm
{
  swift_getObjCClassMetadata(a1);
  static BookReaderModuleFactory.prewarm()();
}

- (REBookReaderModuleFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[REBookReaderModuleFactory init](&v3, "init");
}

@end
