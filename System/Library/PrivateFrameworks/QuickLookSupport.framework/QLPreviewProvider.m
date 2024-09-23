@implementation QLPreviewProvider

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_2549B7E10))
    objc_msgSend(v4, "setPreviewProvider:", self);

}

- (void)providePreviewForFileRequest:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

@end
