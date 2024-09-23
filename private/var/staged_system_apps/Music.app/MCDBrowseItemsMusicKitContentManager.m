@implementation MCDBrowseItemsMusicKitContentManager

- (id)_modelRequest
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  _Unwind_Exception *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = objc_alloc_init((Class)MPModelStoreBrowseRoomRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
  v5 = objc_opt_respondsToSelector(v4, "parentSection");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MCDFuseContentManager dataSource](self, "dataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentSection"));
    objc_msgSend(v3, "configureWithParentSection:", v7);

  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v8 = (_QWORD *)qword_1011ECE28;
  v19 = qword_1011ECE28;
  if (!qword_1011ECE28)
  {
    v9 = (void *)sub_100031F24();
    v8 = dlsym(v9, "MCDMusicCarPlayBundleIdentifier");
    v17[3] = (uint64_t)v8;
    qword_1011ECE28 = (uint64_t)v8;
  }
  _Block_object_dispose(&v16, 8);
  if (!v8)
  {
    sub_100DE9368();
LABEL_14:
    sub_100DE9368();
    goto LABEL_15;
  }
  objc_msgSend(v3, "setClientIdentifier:", *v8, v16);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v10 = (_QWORD *)qword_1011ECE38;
  v19 = qword_1011ECE38;
  if (!qword_1011ECE38)
  {
    v11 = (void *)sub_100031F24();
    v10 = dlsym(v11, "MCDMusicCarPlayVersion");
    v17[3] = (uint64_t)v10;
    qword_1011ECE38 = (uint64_t)v10;
  }
  _Block_object_dispose(&v16, 8);
  if (!v10)
    goto LABEL_14;
  objc_msgSend(v3, "setClientVersion:", *v10, v16);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v12 = (_QWORD *)qword_1011ECE40;
  v19 = qword_1011ECE40;
  if (!qword_1011ECE40)
  {
    v13 = (void *)sub_100031F24();
    v12 = dlsym(v13, "MCDMusicCarPlayPlatformIdentifier");
    v17[3] = (uint64_t)v12;
    qword_1011ECE40 = (uint64_t)v12;
  }
  _Block_object_dispose(&v16, 8);
  if (!v12)
  {
LABEL_15:
    v15 = (_Unwind_Exception *)sub_100DE9368();
    _Block_object_dispose(&v16, 8);
    _Unwind_Resume(v15);
  }
  objc_msgSend(v3, "setClientPlatformIdentifier:", *v12, v16);
  objc_msgSend(v3, "setAuthenticationOptions:", 1);
  return v3;
}

@end
