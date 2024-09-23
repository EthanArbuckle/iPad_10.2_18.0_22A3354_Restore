@implementation TypistHWKeyboard_Deprecated

- (TypistHWKeyboard_Deprecated)initWithCountryCode:(id)a3 andPropertyDictionaryAtPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  id v22;
  dispatch_group_t v23;
  NSObject *v24;
  NSObject *v25;
  TypistHWKeyboard_Deprecated *v26;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[TypistHWKeyboard_Deprecated setEmulatedModel:](self, "setEmulatedModel:", v7);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathForResource:ofType:", v7, CFSTR("plist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDBCED8];
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v9);
    objc_msgSend(v10, "dictionaryWithDictionary:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setValue:forKey:", v6, CFSTR("CountryCode"));
    v13 = IOHIDUserDeviceCreate();
    v14 = +[TypistHWKeyboard_Deprecated _convertCountryCodeToHIDKeyboardType:](TypistHWKeyboard_Deprecated, "_convertCountryCodeToHIDKeyboardType:", objc_msgSend(v6, "unsignedIntValue"));
    +[TypistHWKeyboard_Deprecated _convertHIDKeyboardTypeToGSKeyboardType:](TypistHWKeyboard_Deprecated, "_convertHIDKeyboardTypeToGSKeyboardType:", v14);
    -[TypistHWKeyboard_Deprecated setHidKeyboardType:](self, "setHidKeyboardType:", v14);
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __79__TypistHWKeyboard_Deprecated_initWithCountryCode_andPropertyDictionaryAtPath___block_invoke;
    v28[3] = &unk_251A7C9D8;
    v28[4] = &v29;
    +[TypistKeyboardUtilities runOnMainThread:](TypistKeyboardUtilities, "runOnMainThread:", v28);
    TYLog(CFSTR("HWKeyboardEumlator: Layout: %@, keyboardType: %u"), v15, v16, v17, v18, v19, v20, v21, v30[3]);
    -[TypistHWKeyboard_Deprecated setEmulatedKeyboard:](self, "setEmulatedKeyboard:", v13);
    v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[TypistHWKeyboard_Deprecated setCharacterToKeycodeMap:](self, "setCharacterToKeycodeMap:", v22);

    -[TypistHWKeyboard_Deprecated setHardwareKeyboard:](self, "setHardwareKeyboard:", GSKeyboardCreate());
    -[TypistHWKeyboard_Deprecated setKeyboardCountryCode:](self, "setKeyboardCountryCode:", v6);
    v23 = dispatch_group_create();
    -[TypistHWKeyboard_Deprecated setGroup:](self, "setGroup:", v23);

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create("TypistHWKeyboard.queue", v24);
    dispatch_async(v25, &__block_literal_global_7);

    -[TypistHWKeyboard_Deprecated setTypistHWKeyboardQueue:](self, "setTypistHWKeyboardQueue:", v25);
    -[TypistHWKeyboard_Deprecated _setupCharacterToKeycodeMap](self, "_setupCharacterToKeycodeMap");
    objc_msgSend(v6, "unsignedIntValue");
    GSEventSetHardwareKeyboardAttachedWithCountryCodeAndType();
    -[TypistHWKeyboard_Deprecated emulatedKeyboard](self, "emulatedKeyboard");
    CFRunLoopGetMain();
    IOHIDUserDeviceScheduleWithRunLoop();
    -[TypistHWKeyboard_Deprecated setTypeInterval:](self, "setTypeInterval:", 0.02);
    v26 = self;
    _Block_object_dispose(&v29, 8);

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (TypistHWKeyboard_Deprecated)initWithCountryCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  TypistHWKeyboard_Deprecated *v7;

  v4 = a3;
  +[TypistKeyboardUtilities getMobileGestalt:](TypistKeyboardUtilities, "getMobileGestalt:", CFSTR("HWModelStr"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TypistHWKeyboard_Deprecated _determineAppropriatePropertyDictionaryForHWModelStr:](TypistHWKeyboard_Deprecated, "_determineAppropriatePropertyDictionaryForHWModelStr:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TypistHWKeyboard_Deprecated initWithCountryCode:andPropertyDictionaryAtPath:](self, "initWithCountryCode:andPropertyDictionaryAtPath:", v4, v6);
  return v7;
}

- (void)detach:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TypistHWKeyboard_Deprecated group](self, "group");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__TypistHWKeyboard_Deprecated_detach___block_invoke;
  v7[3] = &unk_251A7CFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_group_notify(v5, MEMORY[0x24BDAC9B8], v7);

}

+ (id)_determineAppropriatePropertyDictionaryForHWModelStr:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("J207"))
    && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("J208"))
    && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("J217"))
    && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("J218")))
  {
    if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("J98A"))
      && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("J99A"))
      && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("J120"))
      && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("J121")))
    {
      if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("J127"))
        && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("J128"))
        && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("J210"))
        && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("J211"))
        && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("J96"))
        && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("J97")))
      {
        if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("J317"))
          && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("J318"))
          && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("J317x"))
          && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("J318x")))
        {
          if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("J320"))
            && objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("J321")))
          {
            v4 = 0;
          }
          else
          {
            v4 = CFSTR("R98");
          }
        }
        else
        {
          v4 = CFSTR("R88");
        }
      }
      else
      {
        v4 = CFSTR("B259");
      }
    }
    else
    {
      v4 = CFSTR("B249");
    }
  }
  else
  {
    v4 = CFSTR("R119");
  }

  return (id)v4;
}

+ (unsigned)_convertGSKeyboardTypeToIOHIDKeyboardType:(unsigned __int8)a3
{
  unsigned __int8 v3;
  unsigned __int8 v4;

  if (a3 == 202)
    v3 = 0;
  else
    v3 = a3;
  if (a3 == 203)
    v4 = 1;
  else
    v4 = v3;
  if (a3 == 207)
    return 2;
  else
    return v4;
}

+ (unsigned)_convertHIDKeyboardTypeToGSKeyboardType:(unsigned int)a3
{
  unsigned int v3;

  v3 = 0xCFCBCAu >> (8 * a3);
  if (a3 >= 3)
    LOBYTE(v3) = 0;
  return v3;
}

+ (id)modifierCharMap
{
  if (modifierCharMap_onceToken != -1)
    dispatch_once(&modifierCharMap_onceToken, &__block_literal_global_112);
  return (id)modifierCharMap_modifierCharMap;
}

- (void)_insertKey:(unsigned __int16)a3 gsKeyInfo:(id *)a4
{
  uint64_t v5;
  unsigned __int16 *var5;
  unsigned __int16 *var7;
  unsigned __int16 *p_var8;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int16 v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _BYTE v38[48];
  uint64_t v39;

  v5 = a3;
  v39 = *MEMORY[0x24BDAC8D0];
  v33 = 0;
  -[TypistHWKeyboard_Deprecated hardwareKeyboard](self, "hardwareKeyboard");
  var5 = a4->var5;
  var7 = a4->var7;
  p_var8 = &a4->var8;
  a4 = ($1F3A801B121D84C13238675D2BD4CA58 *)((char *)a4 + 110);
  GSKeyboardTranslateKeyExtended();
  -[TypistHWKeyboard_Deprecated hardwareKeyboard](self, "hardwareKeyboard", &v33, v38, p_var8, a4);
  GSKeyboardTranslateKeyExtended();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", var5, &v33, v38, p_var8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", var7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v38);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  TYLog(CFSTR("keyCode: %#x, characters: %@, unmodifiedCharacters: %@, shiftModifiedCharacters: %@, markedCharacters: %@ \n"), v13, v14, v15, v16, v17, v18, v19, v5);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", var7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[TypistHWKeyboard_Deprecated characterToKeycodeMap](self, "characterToKeycodeMap");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = CFSTR("keyCode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = CFSTR("modifier");
    v37[0] = v22;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", var7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v24, v25);

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v38);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[TypistHWKeyboard_Deprecated characterToKeycodeMap](self, "characterToKeycodeMap");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = CFSTR("keyCode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = CFSTR("modifier");
    v35[0] = v28;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v29;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v38);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKey:", v30, v31);

  }
}

- (void)_setupCharacterToKeycodeMap
{
  unsigned __int16 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[4];

  v65[2] = *MEMORY[0x24BDAC8D0];
  v43 = malloc_type_calloc(1uLL, 0xA2uLL, 0x10000402B2F1F51uLL);
  v3 = 4;
  while (2)
  {
    switch(v3)
    {
      case '(':
        -[TypistHWKeyboard_Deprecated characterToKeycodeMap](self, "characterToKeycodeMap");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v60[0] = CFSTR("keyCode");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 40);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v60[1] = CFSTR("modifier");
        v61[0] = v5;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v61[1] = v6;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v4;
        v9 = v7;
        v10 = CFSTR("⏎");
        goto LABEL_10;
      case ')':
        -[TypistHWKeyboard_Deprecated characterToKeycodeMap](self, "characterToKeycodeMap");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = CFSTR("keyCode");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 41);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v64[1] = CFSTR("modifier");
        v65[0] = v12;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v65[1] = v13;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("␛"));

        goto LABEL_11;
      case '*':
        -[TypistHWKeyboard_Deprecated characterToKeycodeMap](self, "characterToKeycodeMap");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = CFSTR("keyCode");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 42);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v62[1] = CFSTR("modifier");
        v63[0] = v5;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v63[1] = v6;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v4;
        v9 = v7;
        v10 = CFSTR("⌫");
        goto LABEL_10;
      case '+':
        -[TypistHWKeyboard_Deprecated characterToKeycodeMap](self, "characterToKeycodeMap");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = CFSTR("keyCode");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 43);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v58[1] = CFSTR("modifier");
        v59[0] = v5;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v59[1] = v6;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v4;
        v9 = v7;
        v10 = CFSTR("⇥");
        goto LABEL_10;
      case ',':
        -[TypistHWKeyboard_Deprecated characterToKeycodeMap](self, "characterToKeycodeMap");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = CFSTR("keyCode");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 44);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v54[1] = CFSTR("modifier");
        v55[0] = v5;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v55[1] = v6;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v4;
        v9 = v7;
        v10 = CFSTR(" ");
LABEL_10:
        objc_msgSend(v8, "setObject:forKey:", v9, v10);

        goto LABEL_11;
      default:
        if (v3 != 57)
        {
          -[TypistHWKeyboard_Deprecated _insertKey:gsKeyInfo:](self, "_insertKey:gsKeyInfo:", v3, v43);
LABEL_11:
          v15 = v3++;
          if (v15 >= 0x39)
            goto LABEL_12;
          continue;
        }
        -[TypistHWKeyboard_Deprecated characterToKeycodeMap](self, "characterToKeycodeMap");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = CFSTR("keyCode");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 57);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v56[1] = CFSTR("modifier");
        v57[0] = v40;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v57[1] = v41;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setObject:forKey:", v42, CFSTR("⇪"));

LABEL_12:
        if (-[TypistHWKeyboard_Deprecated hidKeyboardType](self, "hidKeyboardType") == 2)
        {
          v16 = v43;
          -[TypistHWKeyboard_Deprecated _insertKey:gsKeyInfo:](self, "_insertKey:gsKeyInfo:", 135, v43);
          v17 = 137;
          goto LABEL_16;
        }
        v16 = v43;
        if (-[TypistHWKeyboard_Deprecated hidKeyboardType](self, "hidKeyboardType") == 1)
        {
          v17 = 100;
LABEL_16:
          -[TypistHWKeyboard_Deprecated _insertKey:gsKeyInfo:](self, "_insertKey:gsKeyInfo:", v17, v16);
        }
        -[TypistHWKeyboard_Deprecated characterToKeycodeMap](self, "characterToKeycodeMap");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v52[0] = CFSTR("keyCode");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 79);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v52[1] = CFSTR("modifier");
        v53[0] = v19;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v53[1] = v20;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v21, CFSTR("→"));

        -[TypistHWKeyboard_Deprecated characterToKeycodeMap](self, "characterToKeycodeMap");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = CFSTR("keyCode");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 80);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v50[1] = CFSTR("modifier");
        v51[0] = v23;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v51[1] = v24;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKey:", v25, CFSTR("←"));

        -[TypistHWKeyboard_Deprecated characterToKeycodeMap](self, "characterToKeycodeMap");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = CFSTR("keyCode");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 81);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v48[1] = CFSTR("modifier");
        v49[0] = v27;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v49[1] = v28;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKey:", v29, CFSTR("↓"));

        -[TypistHWKeyboard_Deprecated characterToKeycodeMap](self, "characterToKeycodeMap");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = CFSTR("keyCode");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 82);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v46[1] = CFSTR("modifier");
        v47[0] = v31;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v47[1] = v32;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKey:", v33, CFSTR("↑"));

        -[TypistHWKeyboard_Deprecated characterToKeycodeMap](self, "characterToKeycodeMap");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v44[0] = CFSTR("keyCode");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = v35;
        v44[1] = CFSTR("modifier");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v45[1] = v36;
        v44[2] = CFSTR("globeKey");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v45[2] = v37;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKey:", v38, CFSTR("⌨"));

        free(v16);
        return;
    }
  }
}

+ (unsigned)GSEventMaskToKeyboardMask:(unsigned int)a3
{
  return HIWORD(a3);
}

- (id)generateKeystrokeStream:(id)a3 position:(int *)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int16 v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _BYTE v55[128];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[4];

  v58[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *a4;
  if (objc_msgSend(v6, "length") <= v7)
  {
    v56[0] = CFSTR("keyCode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = CFSTR("modifier");
    v57[0] = v8;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v58[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[TypistHWKeyboard_Deprecated modifierCharMap](TypistHWKeyboard_Deprecated, "modifierCharMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v6, "characterAtIndex:", *a4);
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v48, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v40 = v9;
      ++*a4;
      -[TypistHWKeyboard_Deprecated generateKeystrokeStream:position:](self, "generateKeystrokeStream:position:", v6, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "unsignedShortValue");
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v14 = v12;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
      if (v15)
      {
        v16 = v15;
        v42 = v11;
        v37 = v8;
        v38 = v6;
        v17 = 0;
        v18 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v45 != v18)
              objc_enumerationMutation(v14);
            v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_msgSend(v20, "objectForKey:", CFSTR("keyCode"), v37);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v17 |= objc_msgSend(v21, "unsignedShortValue");

            objc_msgSend(v20, "objectForKey:", CFSTR("modifier"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v13 |= objc_msgSend(v22, "unsignedShortValue");

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
        }
        while (v16);
        v8 = v37;
        v6 = v38;
        v11 = v42;
      }
      else
      {
        LOWORD(v17) = 0;
      }

      v53[0] = CFSTR("keyCode");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", (unsigned __int16)v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v53[1] = CFSTR("modifier");
      v54[0] = v25;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", (unsigned __int16)v13);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v54[1] = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v40;
    }
    else
    {
      -[TypistHWKeyboard_Deprecated characterToKeycodeMap](self, "characterToKeycodeMap");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v48, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", v24);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v9, "addObject:", v14);
      }
      else
      {
        v43 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v48, 1);
        -[TypistHWKeyboard_Deprecated hardwareKeyboard](self, "hardwareKeyboard");
        GSKeyboardHWKeyboardNormalizeInput();
        -[TypistHWKeyboard_Deprecated characterToKeycodeMap](self, "characterToKeycodeMap");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKey:", v43);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v51[0] = CFSTR("keyCode");
        objc_msgSend(v41, "objectForKey:");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v51[1] = CFSTR("modifier");
        v52[0] = v39;
        +[TypistHWKeyboard_Deprecated _getModifierMaskMap](TypistHWKeyboard_Deprecated, "_getModifierMaskMap");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKey:", v30);
        v31 = v8;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v52[1] = v32;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = v31;
        -[TypistHWKeyboard_Deprecated characterToKeycodeMap](self, "characterToKeycodeMap");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v48, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKey:", v33, v35);

        objc_msgSend(v9, "addObject:", v33);
      }
      v49[0] = CFSTR("keyCode");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v49[1] = CFSTR("modifier");
      v50[0] = v25;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v50[1] = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0;
    }
    objc_msgSend(v9, "addObject:", v27);

  }
  return v9;
}

- (id)generateKeystrokeStream:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  unint64_t v9;
  int v11;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\t"), CFSTR("⇥"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("⏎"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = 0;
  if (objc_msgSend(v5, "length"))
  {
    do
    {
      -[TypistHWKeyboard_Deprecated generateKeystrokeStream:position:](self, "generateKeystrokeStream:position:", v5, &v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v7);
      v8 = objc_msgSend(v7, "count");
      v11 = v8 + v11 - 1;

      v9 = v11;
    }
    while (objc_msgSend(v5, "length") > v9);
  }

  return v6;
}

- (void)typeKeyStrokeStream:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  char v24;
  char v25;
  char v26;
  int v27;
  char v28;
  char v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", CFSTR("modifier"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "unsignedShortValue");

        objc_msgSend(v8, "objectForKey:", CFSTR("keyCode"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedShortValue");

        objc_msgSend(v8, "objectForKey:", CFSTR("globeKey"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v8, "objectForKey:", CFSTR("globeKey"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "unsignedShortValue");

        }
        else
        {
          v15 = 0;
        }

        v16 = (void *)MEMORY[0x24BDD17F0];
        -[TypistHWKeyboard_Deprecated typeInterval](self, "typeInterval");
        objc_msgSend(v16, "sleepForTimeInterval:");
        v23 = 1;
        v24 = v10;
        v25 = 0;
        v26 = v12;
        v27 = 0;
        v28 = 0;
        v29 = v15;
        -[TypistHWKeyboard_Deprecated emulatedKeyboard](self, "emulatedKeyboard");
        IOHIDUserDeviceHandleReport();
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v30, 16);
    }
    while (v5);
  }
  v17 = (void *)MEMORY[0x24BDD17F0];
  -[TypistHWKeyboard_Deprecated typeInterval](self, "typeInterval");
  objc_msgSend(v17, "sleepForTimeInterval:");

}

- (void)typeString:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  TypistHWKeyboard_Deprecated *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[TypistHWKeyboard_Deprecated group](self, "group");
  v8 = objc_claimAutoreleasedReturnValue();
  -[TypistHWKeyboard_Deprecated TypistHWKeyboardQueue](self, "TypistHWKeyboardQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__TypistHWKeyboard_Deprecated_typeString_completion___block_invoke;
  block[3] = &unk_251A7D030;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_group_async(v8, v9, block);

}

- (void)pressAndHoldKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  TypistHWKeyboard_Deprecated *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[TypistHWKeyboard_Deprecated group](self, "group");
  v8 = objc_claimAutoreleasedReturnValue();
  -[TypistHWKeyboard_Deprecated TypistHWKeyboardQueue](self, "TypistHWKeyboardQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__TypistHWKeyboard_Deprecated_pressAndHoldKey_completion___block_invoke;
  block[3] = &unk_251A7D030;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_group_async(v8, v9, block);

}

- (void)releaseKeyPressWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[TypistHWKeyboard_Deprecated group](self, "group");
  v5 = objc_claimAutoreleasedReturnValue();
  -[TypistHWKeyboard_Deprecated TypistHWKeyboardQueue](self, "TypistHWKeyboardQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__TypistHWKeyboard_Deprecated_releaseKeyPressWithCompletion___block_invoke;
  v8[3] = &unk_251A7CFC8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_group_async(v5, v6, v8);

}

+ (id)_getModifierMaskMap
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[16];
  _QWORD v39[18];

  v39[16] = *MEMORY[0x24BDAC8D0];
  v26 = (id)MEMORY[0x24BDBCED8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v37;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v36;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0x20000);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v35;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v34;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0x80000);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v33;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v32;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0x100000);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v31;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v30;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0x10000);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v29;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v28;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 655360);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38[5] = v25;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39[5] = v24;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1179648);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38[6] = v23;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39[6] = v22;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 196608);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38[7] = v21;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39[7] = v20;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1572864);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38[8] = v19;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39[8] = v18;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 589824);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[9] = v17;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39[9] = v16;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1114112);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38[10] = v15;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39[10] = v14;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1703936);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38[11] = v13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v39[11] = v2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 720896);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v38[12] = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v39[12] = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1245184);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38[13] = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39[13] = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1638400);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38[14] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39[14] = v8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 1769472);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38[15] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", 15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39[15] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dictionaryWithDictionary:", v11);
  v27 = (id)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)keyboardCountryCodes
{
  if (keyboardCountryCodes_onceToken != -1)
    dispatch_once(&keyboardCountryCodes_onceToken, &__block_literal_global_162);
  return (id)keyboardCountryCodes_keyboardCountryCodes;
}

+ (unsigned)_convertCountryCodeToHIDKeyboardType:(unsigned __int8)a3
{
  if ((int)a3 > 29)
    return a3 != 30 && a3 != 33;
  if (a3 != 15)
    return a3 != 16;
  return 2;
}

- (double)typeInterval
{
  return self->_typeInterval;
}

- (void)setTypeInterval:(double)a3
{
  self->_typeInterval = a3;
}

- (__IOHIDUserDevice)emulatedKeyboard
{
  return self->_emulatedKeyboard;
}

- (void)setEmulatedKeyboard:(__IOHIDUserDevice *)a3
{
  self->_emulatedKeyboard = a3;
}

- (__GSKeyboard)hardwareKeyboard
{
  return self->_hardwareKeyboard;
}

- (void)setHardwareKeyboard:(__GSKeyboard *)a3
{
  self->_hardwareKeyboard = a3;
}

- (NSNumber)keyboardCountryCode
{
  return self->_keyboardCountryCode;
}

- (void)setKeyboardCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardCountryCode, a3);
}

- (NSMutableDictionary)characterToKeycodeMap
{
  return self->_characterToKeycodeMap;
}

- (void)setCharacterToKeycodeMap:(id)a3
{
  objc_storeStrong((id *)&self->_characterToKeycodeMap, a3);
}

- (NSString)emulatedModel
{
  return self->_emulatedModel;
}

- (void)setEmulatedModel:(id)a3
{
  objc_storeStrong((id *)&self->_emulatedModel, a3);
}

- (unsigned)hidKeyboardType
{
  return self->_hidKeyboardType;
}

- (void)setHidKeyboardType:(unsigned int)a3
{
  self->_hidKeyboardType = a3;
}

- (OS_dispatch_queue)TypistHWKeyboardQueue
{
  return self->_TypistHWKeyboardQueue;
}

- (void)setTypistHWKeyboardQueue:(id)a3
{
  objc_storeStrong((id *)&self->_TypistHWKeyboardQueue, a3);
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_TypistHWKeyboardQueue, 0);
  objc_storeStrong((id *)&self->_emulatedModel, 0);
  objc_storeStrong((id *)&self->_characterToKeycodeMap, 0);
  objc_storeStrong((id *)&self->_keyboardCountryCode, 0);
}

@end
