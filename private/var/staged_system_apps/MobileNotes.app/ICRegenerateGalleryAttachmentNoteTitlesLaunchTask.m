@implementation ICRegenerateGalleryAttachmentNoteTitlesLaunchTask

- (id)taskIdentifier
{
  return CFSTR("DidRegenerateGalleryAttachmentNoteTitlesV2");
}

- (void)runOneTimeLaunchTask
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;

  v3 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10040B20C(v3, v4, v5, v6, v7, v8, v9, v10);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000E5760;
  v20[3] = &unk_100550110;
  v21 = (id)objc_claimAutoreleasedReturnValue(-[ICWorkerContextLaunchTask workerContext](self, "workerContext"));
  v11 = v21;
  objc_msgSend(v11, "performBlockAndWait:", v20);
  v12 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_10040B1D8(v12, v13, v14, v15, v16, v17, v18, v19);

}

@end
