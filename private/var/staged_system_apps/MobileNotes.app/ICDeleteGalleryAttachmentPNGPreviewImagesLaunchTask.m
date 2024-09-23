@implementation ICDeleteGalleryAttachmentPNGPreviewImagesLaunchTask

- (id)taskIdentifier
{
  return CFSTR("DidDeleteGalleryAttachmentPNGPreviewImagesLaunchTask");
}

- (void)runLaunchTask
{
  id v2;
  _QWORD v3[4];
  id v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100067B98;
  v3[3] = &unk_100550110;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ICWorkerContextLaunchTask workerContext](self, "workerContext"));
  v2 = v4;
  objc_msgSend(v2, "performBlockAndWait:", v3);

}

@end
