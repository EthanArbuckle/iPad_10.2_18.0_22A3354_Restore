@implementation _UIDocumentPickerExtensionRemoteViewController

+ (id)serviceViewControllerInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDEFB670);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel__prepareWithExtensionInfo_completionHandler_, 0, 0);

  return v2;
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDEFF258);
}

- (void)_displayLocationMenu:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIDocumentPickerRemoteViewController publicController](self, "publicController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_displayLocationsMenuFromRect:", x, y, width, height);

}

- (void)_doneButtonPressed
{
  id v2;

  -[_UIDocumentPickerRemoteViewController publicController](self, "publicController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_dismissViewController");

}

@end
