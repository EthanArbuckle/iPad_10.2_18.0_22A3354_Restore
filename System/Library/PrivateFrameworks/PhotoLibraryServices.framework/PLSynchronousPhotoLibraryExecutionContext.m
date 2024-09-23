@implementation PLSynchronousPhotoLibraryExecutionContext

- (void)performTransactionOnLibrary:(id)a3 transaction:(id)a4 completionHandler:(id)a5
{
  objc_msgSend(a3, "performTransactionAndWait:completionHandler:", a4, a5);
}

@end
