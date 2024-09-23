@implementation UserNotifications_TMLModule

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
  block[2] = sub_22AD56B24;
  block[3] = &unk_24F4FCF78;
  block[4] = &v5;
  if (qword_255B51C78 != -1)
    dispatch_once(&qword_255B51C78, block);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
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
  objc_msgSend_setObject_forKeyedSubscript_(v60, v8, v9, &unk_24F532EF8, *MEMORY[0x24BDDA600]);
  objc_msgSend_defineProperty_descriptor_(v4, v10, v11, CFSTR("UNErrorCodeNotificationsNotAllowed"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v12, v13, &unk_24F532F10, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v14, v15, CFSTR("UNErrorCodeAttachmentInvalidURL"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v16, v17, &unk_24F532F28, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v18, v19, CFSTR("UNErrorCodeAttachmentUnrecognizedType"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v20, v21, &unk_24F532F40, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v22, v23, CFSTR("UNErrorCodeAttachmentInvalidFileSize"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v24, v25, &unk_24F532F58, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v26, v27, CFSTR("UNErrorCodeAttachmentNotInDataStore"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v28, v29, &unk_24F532F70, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v30, v31, CFSTR("UNErrorCodeAttachmentMoveIntoDataStoreFailed"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v32, v33, &unk_24F532F88, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v34, v35, CFSTR("UNErrorCodeAttachmentCorrupt"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v36, v37, &unk_24F532FA0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v38, v39, CFSTR("UNErrorCodeNotificationInvalidNoDate"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v40, v41, &unk_24F532FB8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v42, v43, CFSTR("UNErrorCodeNotificationInvalidNoContent"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v44, v45, &unk_24F532FD0, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v46, v47, CFSTR("UNNotificationActionOptionAuthenticationRequired"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v48, v49, &unk_24F532FE8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v50, v51, CFSTR("UNNotificationActionOptionDestructive"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v52, v53, &unk_24F533000, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v54, v55, CFSTR("UNNotificationActionOptionForeground"), v60);
  objc_msgSend_setObject_forKeyedSubscript_(v60, v56, v57, &unk_24F533018, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v58, v59, CFSTR("UNNotificationActionOptionNone"), v60);

}

@end
