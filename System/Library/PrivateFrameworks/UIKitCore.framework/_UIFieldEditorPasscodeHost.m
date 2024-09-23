@implementation _UIFieldEditorPasscodeHost

- (id)_viewForHostingFieldEditor
{
  void *v2;
  void *v3;

  -[_UIFieldEditorHost hostingView](self, "hostingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
