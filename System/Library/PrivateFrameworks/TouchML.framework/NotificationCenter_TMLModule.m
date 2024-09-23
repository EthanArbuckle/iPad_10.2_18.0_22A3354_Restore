@implementation NotificationCenter_TMLModule

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
  block[2] = sub_22AD4CAF8;
  block[3] = &unk_24F4FCF78;
  block[4] = &v5;
  if (qword_255B51BC8 != -1)
    dispatch_once(&qword_255B51BC8, block);
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
  id v28;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend_dictionary(v3, v5, v6);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDDA600];
  objc_msgSend_setObject_forKeyedSubscript_(v28, v8, v9, &unk_24F532BE0, *MEMORY[0x24BDDA600]);
  objc_msgSend_defineProperty_descriptor_(v4, v10, v11, CFSTR("NCUpdateResultNewData"), v28);
  objc_msgSend_setObject_forKeyedSubscript_(v28, v12, v13, &unk_24F532BF8, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v14, v15, CFSTR("NCUpdateResultNoData"), v28);
  objc_msgSend_setObject_forKeyedSubscript_(v28, v16, v17, &unk_24F532C10, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v18, v19, CFSTR("NCUpdateResultFailed"), v28);
  objc_msgSend_setObject_forKeyedSubscript_(v28, v20, v21, &unk_24F532C28, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v22, v23, CFSTR("NCWidgetDisplayModeCompact"), v28);
  objc_msgSend_setObject_forKeyedSubscript_(v28, v24, v25, &unk_24F532C40, v7);
  objc_msgSend_defineProperty_descriptor_(v4, v26, v27, CFSTR("NCWidgetDisplayModeExpanded"), v28);

}

@end
