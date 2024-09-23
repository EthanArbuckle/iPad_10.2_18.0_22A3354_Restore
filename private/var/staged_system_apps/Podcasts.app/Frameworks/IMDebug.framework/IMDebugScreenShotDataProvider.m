@implementation IMDebugScreenShotDataProvider

- (id)debugDataFileName
{
  return CFSTR("ScreenShot.png");
}

- (id)debugData
{
  id v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __42__IMDebugScreenShotDataProvider_debugData__block_invoke;
  block[3] = &unk_10570;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __42__IMDebugScreenShotDataProvider_debugData__block_invoke(uint64_t a1)
{
  void *v2;
  NSData *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  UIImage *image;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[DebugUI debugViewController](DebugUI, "debugViewController"));
  image = (UIImage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "screenShotImage"));

  v3 = UIImagePNGRepresentation(image);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

@end
