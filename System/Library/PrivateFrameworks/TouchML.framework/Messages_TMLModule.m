@implementation Messages_TMLModule

+ (BOOL)loadModule
{
  char v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AD25D6C;
  block[3] = &unk_24F4FCF78;
  block[4] = &v5;
  if (qword_255B51A30 != -1)
    dispatch_once(&qword_255B51A30, block);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (void)initializeJSContext:(id)a3
{
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  id v12;

  v12 = a3;
  objc_msgSend_defineConstants_(a1, v4, v5, v12);
  objc_msgSend_setObject_forKeyedSubscript_(v12, v6, v7, &unk_24F4FDC00, CFSTR("MSMessage"));
  objc_msgSend_setObject_forKeyedSubscript_(v12, v8, v9, &unk_24F4FDC20, CFSTR("MSMessageTemplateLayout"));
  objc_msgSend_setObject_forKeyedSubscript_(v12, v10, v11, &unk_24F4FDC60, CFSTR("MSMessageLiveLayout"));

}

+ (void)defineConstants:(id)a3
{
  void *v3;
  id v4;
  const char *v5;
  double v6;
  uint64_t v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  const char *v20;
  double v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  const char *v26;
  double v27;
  const char *v28;
  double v29;
  const char *v30;
  double v31;
  const char *v32;
  double v33;
  const char *v34;
  double v35;
  const char *v36;
  double v37;
  const char *v38;
  double v39;
  const char *v40;
  double v41;
  const char *v42;
  double v43;
  const char *v44;
  double v45;
  const char *v46;
  double v47;
  const char *v48;
  double v49;
  const char *v50;
  double v51;
  const char *v52;
  double v53;
  const char *v54;
  double v55;
  const char *v56;
  double v57;
  const char *v58;
  double v59;
  id v60;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend_dictionary(v3, v5, v6);
  v60 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDDA600];
  objc_msgSend_setObject_forKeyedSubscript_(v60, v8, v9, &unk_24F532520, *MEMORY[0x24BDDA600]);
  objc_msgSend_defineProperty_descriptor_(v4, v10, v11, CFSTR("MSMessagesAppPresentationStyleCompact"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v12, v13, &unk_24F532538, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v14, v15, CFSTR("MSMessagesAppPresentationStyleExpanded"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v16, v17, &unk_24F532550, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v18, v19, CFSTR("MSMessagesAppPresentationStyleTranscript"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v20, v21, *MEMORY[0x24BDDD0B8], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v22, v23, CFSTR("MSStickersErrorDomain"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v24, v25, *MEMORY[0x24BDDD0B0], v7);
  objc_msgSend_defineProperty_descriptor_(v4, v26, v27, CFSTR("MSMessagesErrorDomain"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v28, v29, &unk_24F532568, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v30, v31, CFSTR("MSMessageErrorCodeFileNotFound"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v32, v33, &unk_24F532580, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v34, v35, CFSTR("MSMessageErrorCodeFileUnreadable"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v36, v37, &unk_24F532598, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v38, v39, CFSTR("MSMessageErrorCodeImproperFileType"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v40, v41, &unk_24F5325B0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v42, v43, CFSTR("MSMessageErrorCodeImproperFileURL"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v44, v45, &unk_24F5325C8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v46, v47, CFSTR("MSMessageErrorCodeStickerFileImproperFileAttributes"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v48, v49, &unk_24F5325E0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v50, v51, CFSTR("MSMessageErrorCodeStickerFileImproperFileSize"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v52, v53, &unk_24F5325F8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v54, v55, CFSTR("MSMessageErrorCodeStickerFileImproperFileFormat"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v56, v57, &unk_24F532610, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v58, v59, CFSTR("MSMessageErrorCodeURLExceedsMaxSize"), v60);

}

@end
