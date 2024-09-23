@implementation IntentsUI_TMLModule

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
  block[2] = sub_22AD4D9BC;
  block[3] = &unk_24F4FCF78;
  block[4] = &v5;
  if (qword_255B51BD8 != -1)
    dispatch_once(&qword_255B51BD8, block);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (void)initializeJSContext:(id)a3
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
  id v24;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend_dictionary(v3, v5, v6);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDDA600];
  objc_msgSend_setObject_forKeyedSubscript_(v24, v8, v9, &unk_24F532CD0, *MEMORY[0x24BDDA600]);
  objc_msgSend_defineProperty_descriptor_(v4, v10, v11, CFSTR("INUIAddVoiceShortcutButtonStyleWhite"), v24);
  objc_msgSend_setObject_forKeyedSubscript_(v24, v12, v13, &unk_24F532CE8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v14, v15, CFSTR("INUIAddVoiceShortcutButtonStyleWhiteOutline"), v24);
  objc_msgSend_setObject_forKeyedSubscript_(v24, v16, v17, &unk_24F532D00, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v18, v19, CFSTR("INUIAddVoiceShortcutButtonStyleBlack"), v24);
  objc_msgSend_setObject_forKeyedSubscript_(v24, v20, v21, &unk_24F532D18, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v22, v23, CFSTR("INUIAddVoiceShortcutButtonStyleBlackOutline"), v24);

}

@end
