@implementation FBScene(SystemShellHostingEnvironment)

- (uint64_t)systemShellHostingEnvironment
{
  uint64_t v2;

  v2 = objc_opt_class();
  return objc_msgSend(a1, "componentForExtension:ofClass:", v2, objc_opt_class());
}

@end
