@implementation UIImageView(PhotosUI)

- (PUImageViewExtraction)pu_extractPlayOverlayBackgroundImageFromCenter:()PhotosUI asynchronously:handler:
{
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  PUImageViewExtraction *v22;
  PUImageViewExtraction *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  PUImageViewExtraction *v28;
  void *v30;
  _QWORD aBlock[4];
  PUImageViewExtraction *v32;
  id v33;
  id v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;

  v11 = a4;
  if (v11)
  {
    if (!a3)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIImageView+PhotosUI.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

    if (!a3)
      goto LABEL_5;
  }
  if (pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__onceToken != -1)
    dispatch_once(&pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__onceToken, &__block_literal_global_105700);
LABEL_5:
  objc_msgSend(a1, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = objc_msgSend(a1, "contentMode");
  v22 = objc_alloc_init(PUImageViewExtraction);
  if (pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__onceToken_8 != -1)
    dispatch_once(&pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__onceToken_8, &__block_literal_global_9);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__UIImageView_PhotosUI__pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler___block_invoke_3;
  aBlock[3] = &unk_1E58AB990;
  v23 = v22;
  v32 = v23;
  v35 = a5;
  v36 = a6;
  v24 = v12;
  v33 = v24;
  v37 = v14;
  v38 = v16;
  v39 = v18;
  v40 = v20;
  v41 = v21;
  v42 = a3;
  v25 = v11;
  v34 = v25;
  v26 = _Block_copy(aBlock);
  v27 = v26;
  if (a3)
  {
    (*((void (**)(id, uint64_t))v25 + 2))(v25, pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler__approximationImage);
    dispatch_async((dispatch_queue_t)pu_extractPlayOverlayBackgroundImageFromCenter_asynchronously_handler___extractionQueue, v27);
  }
  else
  {
    (*((void (**)(void *))v26 + 2))(v26);
  }
  v28 = v23;

  return v28;
}

@end
