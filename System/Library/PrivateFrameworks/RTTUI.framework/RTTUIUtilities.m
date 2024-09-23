@implementation RTTUIUtilities

+ (id)sharedUtilityProvider
{
  if (sharedUtilityProvider_onceToken != -1)
    dispatch_once(&sharedUtilityProvider_onceToken, &__block_literal_global_2);
  return (id)sharedUtilityProvider_UtilityProvider;
}

void __39__RTTUIUtilities_sharedUtilityProvider__block_invoke()
{
  RTTUIUtilities *v0;
  void *v1;

  v0 = objc_alloc_init(RTTUIUtilities);
  v1 = (void *)sharedUtilityProvider_UtilityProvider;
  sharedUtilityProvider_UtilityProvider = (uint64_t)v0;

}

+ (id)rttDisplayName:(int64_t)a3 forSubscriptionContextUUID:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BE7CB70], "sharedUtilityProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscriptionContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __60__RTTUIUtilities_rttDisplayName_forSubscriptionContextUUID___block_invoke;
  v14[3] = &unk_24D657F10;
  v7 = v4;
  v15 = v7;
  objc_msgSend(v6, "ax_filteredArrayUsingBlock:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7CB70], "sharedUtilityProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getCarrierValueForKey:andContext:", CFSTR("showRTTForEmergency"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v11, "BOOLValue");
  ttyLocString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __60__RTTUIUtilities_rttDisplayName_forSubscriptionContextUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (BOOL)contactIsTTYContact:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x24BE7CB70];
  v4 = a3;
  objc_msgSend(v3, "sharedUtilityProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "contactIsTTYContact:", v4);

  return v6;
}

+ (void)contactIsTTYContact:(id)a3 resultBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (contactIsTTYContact_resultBlock__onceToken != -1)
    dispatch_once(&contactIsTTYContact_resultBlock__onceToken, &__block_literal_global_13);
  v8 = contactIsTTYContact_resultBlock__Queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__RTTUIUtilities_contactIsTTYContact_resultBlock___block_invoke_2;
  block[3] = &unk_24D657F80;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __50__RTTUIUtilities_contactIsTTYContact_resultBlock___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("TTY-retrieval", 0);
  v1 = (void *)contactIsTTYContact_resultBlock__Queue;
  contactIsTTYContact_resultBlock__Queue = (uint64_t)v0;

}

void __50__RTTUIUtilities_contactIsTTYContact_resultBlock___block_invoke_2(uint64_t a1)
{
  char v2;
  _QWORD v3[4];
  id v4;
  char v5;

  v2 = objc_msgSend(*(id *)(a1 + 48), "contactIsTTYContact:", *(_QWORD *)(a1 + 32));
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__RTTUIUtilities_contactIsTTYContact_resultBlock___block_invoke_3;
  v3[3] = &unk_24D657F58;
  v4 = *(id *)(a1 + 40);
  v5 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

uint64_t __50__RTTUIUtilities_contactIsTTYContact_resultBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

+ (BOOL)hardwareTTYIsSupported
{
  return objc_msgSend(MEMORY[0x24BE7CB70], "hardwareTTYIsSupported");
}

+ (BOOL)isRTTSupported
{
  return objc_msgSend(MEMORY[0x24BE7CB70], "isRTTSupported");
}

+ (BOOL)isOnlyRTTSupported
{
  return objc_msgSend(MEMORY[0x24BE7CB70], "isOnlyRTTSupported");
}

+ (BOOL)shouldUseRTT
{
  return objc_msgSend(MEMORY[0x24BE7CB70], "shouldUseRTT");
}

+ (BOOL)softwareTTYIsSupported
{
  return objc_msgSend(MEMORY[0x24BE7CB70], "softwareTTYIsSupported");
}

+ (BOOL)relayIsSupported
{
  return objc_msgSend(MEMORY[0x24BE7CB70], "relayIsSupported");
}

+ (id)relayPhoneNumber
{
  return (id)objc_msgSend(MEMORY[0x24BE7CB70], "relayPhoneNumber");
}

+ (id)ASCIINumericStringFromString:(__CFString *)a3
{
  CFIndex Length;
  __CFString *Mutable;
  CFIndex v6;
  UChar32 CharacterAtIndex;
  double NumericValue;
  double v9;
  UniChar chars;

  if (a3)
  {
    Length = CFStringGetLength(a3);
    Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (Length >= 1)
    {
      v6 = 0;
      chars = 0;
      do
      {
        CharacterAtIndex = CFStringGetCharacterAtIndex(a3, v6);
        chars = CharacterAtIndex;
        NumericValue = u_getNumericValue(CharacterAtIndex);
        if (NumericValue <= 9.0)
        {
          v9 = ceil(NumericValue);
          if (NumericValue >= 0.0 && NumericValue == v9)
            chars = (int)NumericValue + 48;
        }
        CFStringAppendCharacters(Mutable, &chars, 1);
        ++v6;
      }
      while (Length != v6);
    }
  }
  else
  {
    Mutable = 0;
  }
  return Mutable;
}

+ (id)phoneNumberStringFromString:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  UniChar v14;
  int64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  int64_t v21;
  int v22;
  unsigned int v23;
  int v24;
  unsigned __int16 v25;
  BOOL v26;
  UniChar buffer[8];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CFStringRef theString;
  const UniChar *v37;
  const char *v38;
  uint64_t v39;
  int64_t v40;
  int64_t v41;
  int64_t v42;
  CFRange v43;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    +[RTTUIUtilities ASCIINumericStringFromString:](RTTUIUtilities, "ASCIINumericStringFromString:", v3);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    *(_OWORD *)buffer = 0u;
    v29 = 0u;
    v6 = -[__CFString length](v5, "length");
    theString = v5;
    v39 = 0;
    v40 = v6;
    CharactersPtr = CFStringGetCharactersPtr(v5);
    CStringPtr = 0;
    v37 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
    v41 = 0;
    v42 = 0;
    v38 = CStringPtr;
    if (v6 >= 1)
    {
      v9 = 0;
      v10 = 0;
      v11 = 64;
      while (1)
      {
        if ((unint64_t)v10 >= 4)
          v12 = 4;
        else
          v12 = v10;
        v13 = v40;
        if (v40 <= v10)
          goto LABEL_41;
        if (v37)
        {
          v14 = v37[v10 + v39];
        }
        else if (v38)
        {
          v14 = v38[v39 + v10];
        }
        else
        {
          v15 = v41;
          if (v42 <= v10 || v41 > v10)
          {
            v17 = -v12;
            v18 = v12 + v9;
            v19 = v11 - v12;
            v20 = v10 + v17;
            v21 = v20 + 64;
            if (v20 + 64 >= v40)
              v21 = v40;
            v41 = v20;
            v42 = v21;
            if (v40 >= v19)
              v13 = v19;
            v43.length = v13 + v18;
            v43.location = v20 + v39;
            CFStringGetCharacters(theString, v43, buffer);
            v15 = v41;
          }
          v14 = buffer[v10 - v15];
        }
        v22 = v14;
        if ((unsigned __int16)(v14 - 65) <= 0x19u)
          break;
        if ((unsigned __int16)(v14 - 97) <= 0x19u)
        {
          v23 = v14 - 97;
          goto LABEL_33;
        }
        if ((unsigned __int16)(v14 + 223) <= 0x19u)
        {
          v24 = -65313;
          goto LABEL_32;
        }
        if ((unsigned __int16)(v14 + 191) <= 0x19u)
        {
          v24 = -65345;
LABEL_32:
          v23 = v22 + v24;
LABEL_33:
          v14 = _LetterNumberMap[v23] + 48;
          goto LABEL_34;
        }
        if ((unsigned __int16)(v14 + 240) > 9u)
        {
          v25 = 44;
          switch(v14)
          {
            case 0xFF03u:
              v25 = 35;
              goto LABEL_40;
            case 0xFF04u:
            case 0xFF05u:
            case 0xFF06u:
            case 0xFF07u:
            case 0xFF08u:
            case 0xFF09u:
              goto LABEL_34;
            case 0xFF0Au:
              v25 = 42;
              goto LABEL_40;
            case 0xFF0Bu:
              v25 = 43;
              goto LABEL_40;
            case 0xFF0Cu:
              goto LABEL_40;
            default:
              if (v14 != 65307)
                goto LABEL_34;
              v25 = 59;
              break;
          }
          goto LABEL_40;
        }
        v14 += 288;
LABEL_34:
        if ((unsigned __int16)(v14 - 48) >= 0xAu)
        {
          v26 = v14 > 0x3Bu || ((1 << v14) & 0x8001C0800000000) == 0;
          v25 = v14;
          if (v26)
            goto LABEL_41;
        }
        else
        {
          v25 = v14;
        }
LABEL_40:
        objc_msgSend(v4, "appendFormat:", CFSTR("%c"), v25);
LABEL_41:
        ++v10;
        --v9;
        ++v11;
        if (v6 == v10)
          goto LABEL_51;
      }
      v23 = v14 - 65;
      goto LABEL_33;
    }
LABEL_51:

  }
  return v4;
}

+ (BOOL)ttyShouldBeRealtimeForCall:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BE7CB68], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "ttyShouldBeRealtime") & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v3, "isEmergency");

  return v5;
}

- (unint64_t)currentPreferredTransportMethod
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BE7CB70], "sharedUtilityProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentPreferredTransportMethod");

  return v3;
}

- (RTTUIUtilities)init
{
  RTTUIUtilities *v2;
  RTTUIUtilities *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RTTUIUtilities;
  v2 = -[RTTUIUtilities init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[RTTUIUtilities setCallCenterQueue:](v2, "setCallCenterQueue:", MEMORY[0x24BDAC9B8]);
  return v3;
}

- (id)myPhoneNumber
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BE7CB70], "sharedUtilityProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "myPhoneNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "length"))
  {
    ttyLocString();
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (id)ttyMeContact
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  if (-[RTTUIUtilities inUnitTestMode](self, "inUnitTestMode"))
  {
    if (ttyMeContact_onceToken != -1)
      dispatch_once(&ttyMeContact_onceToken, &__block_literal_global_21);
    return (id)ttyMeContact_unitTestMe;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x24BDBA288];
    v11[0] = v3;
    v11[1] = v4;
    v11[2] = *MEMORY[0x24BDBA348];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE7CB70], "sharedUtilityProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v7, "_ios_meContactWithKeysToFetch:error:", v5, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8;
    return v9;
  }
}

void __30__RTTUIUtilities_ttyMeContact__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBACA0]);
  v1 = (void *)ttyMeContact_unitTestMe;
  ttyMeContact_unitTestMe = (uint64_t)v0;

}

- (int64_t)textAlignmentForMe:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int64_t v15;

  v3 = a3;
  if (a3)
    v5 = 2;
  else
    v5 = 0;
  -[RTTUIUtilities overrideLTR](self, "overrideLTR");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[RTTUIUtilities overrideLTR](self, "overrideLTR");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");
    v9 = 2;
    if (v3)
      v9 = 0;
    if (v8)
      v10 = v9;
    else
      v10 = v5;

  }
  else
  {
    v11 = (void *)MEMORY[0x24BDBCEA0];
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDBCB20]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "characterDirectionForLanguage:", v13);

    v15 = 2;
    if (v3)
      v15 = 0;
    if (v14 == 2)
      return v15;
    else
      return v5;
  }
  return v10;
}

- (UIEdgeInsets)textInsetForMe:(BOOL)a3
{
  int64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v3 = -[RTTUIUtilities textAlignmentForMe:](self, "textAlignmentForMe:", a3);
  if (v3 == 2)
    v4 = 75.0;
  else
    v4 = 20.0;
  if (v3 == 2)
    v5 = 20.0;
  else
    v5 = 75.0;
  v6 = 10.0;
  v7 = 10.0;
  result.right = v5;
  result.bottom = v7;
  result.left = v4;
  result.top = v6;
  return result;
}

- (UIEdgeInsets)bubbleInsetForMe:(BOOL)a3
{
  int64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v3 = -[RTTUIUtilities textAlignmentForMe:](self, "textAlignmentForMe:", a3);
  v4 = -5.0;
  if (v3 == 2)
    v5 = -5.0;
  else
    v5 = -15.0;
  if (v3 == 2)
    v6 = -15.0;
  else
    v6 = -5.0;
  v7 = -5.0;
  result.right = v6;
  result.bottom = v4;
  result.left = v5;
  result.top = v7;
  return result;
}

- (id)bubbleColorForMe:(BOOL)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.4784, 1.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "lightGrayColor");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

- (id)largeTTYIconWithTint:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  ttyImageNamed(CFSTR("tty_icon"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    v6 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(v4, "size");
    objc_msgSend(v6, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v3, 0, v5, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }

  return v5;
}

- (id)ttyIconWithTint:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  v4 = objc_msgSend(MEMORY[0x24BE7CB70], "currentSupportedTextingType") - 1;
  if (v4 <= 2)
  {
    ttyImageNamed(off_24D658010[v4]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_6;
    goto LABEL_5;
  }
  v5 = 0;
  if (v3)
  {
LABEL_5:
    v6 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(v5, "size");
    objc_msgSend(v6, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v3, 0, v5, 0);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
LABEL_6:

  return v5;
}

- (id)tintedTTYIcon
{
  void *v3;
  void *v4;

  _UIGetTintedCircularButtonDefaultBlueColor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIUtilities ttyIconWithTint:](self, "ttyIconWithTint:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)bubbleFillForMe:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  NSObject *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  NSObject *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  NSObject *v83;
  void *v84;
  double v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  void *v102;
  id v103;
  NSObject *v104;
  void *v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  void *v112;
  void *v113;
  NSObject *v114;
  void *v115;
  int64_t v116;
  uint64_t *v117;
  void *v118;
  CGFloat scale;
  id v121;
  BOOL v122;
  id location;
  _BYTE buf[32];
  void (*v125)(uint64_t);
  id v126;
  uint64_t v127;
  CGSize v128;
  CGSize v129;
  CGSize v130;
  CGSize v131;
  CGSize v132;
  UIEdgeInsets v133;
  UIEdgeInsets v134;
  UIEdgeInsets v135;
  UIEdgeInsets v136;

  v3 = a3;
  v127 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMainThread");

  if ((v6 & 1) != 0)
  {
    if (_AXSInUnitTestMode())
    {
      v7 = (void *)bubbleFillForMe__LeftBubbleImage;
      bubbleFillForMe__LeftBubbleImage = 0;

      v8 = (void *)bubbleFillForMe__RightBubbleImage;
      bubbleFillForMe__RightBubbleImage = 0;

    }
    v9 = (id)bubbleFillForMe__RightBubbleImage;
    if (-[RTTUIUtilities textAlignmentForMe:](self, "textAlignmentForMe:", v3))
    {
      if (v9)
        return v9;
    }
    else
    {
      v11 = (id)bubbleFillForMe__LeftBubbleImage;

      v9 = v11;
      if (v11)
        return v9;
    }
    ttyImageNamed(CFSTR("bubble"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ttyImageNamed(CFSTR("bubble-stroked"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scale");
    scale = v15;

    AXLogRTT();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(CGFloat *)&buf[4] = scale;
      _os_log_impl(&dword_216E9C000, v16, OS_LOG_TYPE_INFO, "Drawing new bubble images for screen scale: %f", buf, 0xCu);
    }

    v17 = 4 * (-[RTTUIUtilities textAlignmentForMe:](self, "textAlignmentForMe:", v3) != 2);
    if (objc_msgSend(v12, "imageOrientation") != v17)
    {
      AXLogRTT();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v12, "scale");
        v20 = v19;
        objc_msgSend(v13, "scale");
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)&buf[4] = v17;
        *(_WORD *)&buf[8] = 2048;
        *(_QWORD *)&buf[10] = v20;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = v21;
        _os_log_impl(&dword_216E9C000, v18, OS_LOG_TYPE_INFO, "Flipping image to orientation %i with bubble scale %f and bubble stroked scale %f", buf, 0x1Cu);
      }

      v22 = objc_alloc(MEMORY[0x24BDF6AC8]);
      v23 = objc_retainAutorelease(v12);
      v24 = objc_msgSend(v23, "CGImage");
      objc_msgSend(v23, "scale");
      v12 = (void *)objc_msgSend(v22, "initWithCGImage:scale:orientation:", v24, v17);

      v25 = objc_alloc(MEMORY[0x24BDF6AC8]);
      v26 = objc_retainAutorelease(v13);
      v27 = objc_msgSend(v26, "CGImage");
      objc_msgSend(v26, "scale");
      v13 = (void *)objc_msgSend(v25, "initWithCGImage:scale:orientation:", v27, v17);

    }
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "scale");
    v30 = v29;

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "scale");
    v33 = v32;

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "scale");
    v36 = v35;

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "scale");
    v39 = v38;

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "scale");
    v42 = v41;

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "scale");
    v45 = v44;

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "scale");
    v48 = v47;

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "scale");
    v51 = v50;

    AXLogRTT();
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = floor(v30 * 17.5) / v30;
    v54 = floor(v33 * 28.5) / v33;
    v55 = floor(v36 * 17.0) / v36;
    v56 = floor(v39 * 27.0) / v39;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      v133.top = v53;
      v133.left = v54;
      v133.bottom = v55;
      v133.right = v56;
      NSStringFromUIEdgeInsets(v133);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v57;
      _os_log_impl(&dword_216E9C000, v52, OS_LOG_TYPE_INFO, "Balloon mask cap insets: %@", buf, 0xCu);

    }
    AXLogRTT();
    v58 = objc_claimAutoreleasedReturnValue();
    v59 = ceil(v42 * 11.0) / v42;
    v60 = ceil(v45 * 12.0) / v45;
    v61 = ceil(v48 * 12.0) / v48;
    v62 = ceil(v51 * 18.0) / v51;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      v134.top = v59;
      v134.left = v60;
      v134.bottom = v61;
      v134.right = v62;
      NSStringFromUIEdgeInsets(v134);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v63;
      _os_log_impl(&dword_216E9C000, v58, OS_LOG_TYPE_INFO, "Balloon mask alignment insets: %@", buf, 0xCu);

    }
    objc_msgSend(v12, "resizableImageWithCapInsets:", v53, v54, v55, v56);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v64, "imageWithAlignmentRectInsets:", v59, v60, v61, v62);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "resizableImageWithCapInsets:", v53, v54, v55, v56);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v66, "imageWithAlignmentRectInsets:", v59, v60, v61, v62);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    AXLogRTT();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v65;
      _os_log_impl(&dword_216E9C000, v68, OS_LOG_TYPE_INFO, "Bubble: %@", buf, 0xCu);
    }

    AXLogRTT();
    v69 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v67;
      _os_log_impl(&dword_216E9C000, v69, OS_LOG_TYPE_INFO, "Bubble stroked: %@", buf, 0xCu);
    }

    objc_msgSend(v65, "size");
    UIGraphicsBeginImageContextWithOptions(v128, 0, scale);
    objc_msgSend(v65, "size");
    v71 = v70;
    objc_msgSend(v65, "size");
    objc_msgSend(v65, "drawInRect:", 0.0, 0.0, v71, v72);
    +[RTTUIUtilities sharedUtilityProvider](RTTUIUtilities, "sharedUtilityProvider");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "bubbleColorForMe:", v3);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "set");

    v75 = (void *)MEMORY[0x24BDF6870];
    objc_msgSend(v65, "size");
    v77 = v76;
    objc_msgSend(v65, "size");
    objc_msgSend(v75, "bezierPathWithRect:", 0.0, 0.0, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "fillWithBlendMode:alpha:", 18, 0.4);

    UIGraphicsGetImageFromCurrentImageContext();
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "capInsets");
    objc_msgSend(v80, "resizableImageWithCapInsets:");
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    v82 = v81;

    AXLogRTT();
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v67, "size");
      NSStringFromCGSize(v129);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v84;
      _os_log_impl(&dword_216E9C000, v83, OS_LOG_TYPE_INFO, "Create overlay image with size: %@", buf, 0xCu);

    }
    objc_msgSend(v82, "size");
    v86 = v85;
    v88 = v87;

    v130.width = v86;
    v130.height = v88;
    UIGraphicsBeginImageContextWithOptions(v130, 0, scale);
    objc_msgSend(v67, "size");
    v90 = v89;
    objc_msgSend(v67, "size");
    objc_msgSend(v67, "drawInRect:", 0.0, 0.0, v90, v91);
    +[RTTUIUtilities sharedUtilityProvider](RTTUIUtilities, "sharedUtilityProvider");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "bubbleColorForMe:", v3);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "set");

    v94 = (void *)MEMORY[0x24BDF6870];
    objc_msgSend(v67, "size");
    v96 = v95;
    objc_msgSend(v67, "size");
    objc_msgSend(v94, "bezierPathWithRect:", 0.0, 0.0, v96, v97);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "fillWithBlendMode:alpha:", 18, 0.9);

    UIGraphicsGetImageFromCurrentImageContext();
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "capInsets");
    objc_msgSend(v99, "resizableImageWithCapInsets:");
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    AXLogRTT();
    v101 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v67, "capInsets");
      NSStringFromUIEdgeInsets(v135);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v102;
      _os_log_impl(&dword_216E9C000, v101, OS_LOG_TYPE_INFO, "Created overlay image with cap insets: %@", buf, 0xCu);

    }
    UIGraphicsEndImageContext();
    v103 = v100;

    AXLogRTT();
    v104 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v103, "size");
      NSStringFromCGSize(v131);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v105;
      _os_log_impl(&dword_216E9C000, v104, OS_LOG_TYPE_INFO, "Create final image with size: %@", buf, 0xCu);

    }
    objc_msgSend(v82, "size");
    UIGraphicsBeginImageContextWithOptions(v132, 0, scale);
    objc_msgSend(v82, "size");
    v107 = v106;
    objc_msgSend(v82, "size");
    objc_msgSend(v82, "drawInRect:", 0.0, 0.0, v107, v108);
    objc_msgSend(v103, "size");
    v110 = v109;
    objc_msgSend(v103, "size");
    objc_msgSend(v103, "drawInRect:", 0.0, 0.0, v110, v111);
    UIGraphicsGetImageFromCurrentImageContext();
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "capInsets");
    objc_msgSend(v112, "resizableImageWithCapInsets:");
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    AXLogRTT();
    v114 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v103, "capInsets");
      NSStringFromUIEdgeInsets(v136);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v115;
      _os_log_impl(&dword_216E9C000, v114, OS_LOG_TYPE_INFO, "Created final image with cap insets: %@", buf, 0xCu);

    }
    UIGraphicsEndImageContext();
    v9 = v113;
    v116 = -[RTTUIUtilities textAlignmentForMe:](self, "textAlignmentForMe:", v3);
    v117 = &bubbleFillForMe__RightBubbleImage;
    if (!v116)
      v117 = &bubbleFillForMe__LeftBubbleImage;
    v118 = (void *)*v117;
    *v117 = (uint64_t)v9;

  }
  else
  {
    AXLogRTT();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[RTTUIUtilities bubbleFillForMe:].cold.1(v10);

    objc_initWeak(&location, self);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__1;
    v125 = __Block_byref_object_dispose__1;
    v126 = 0;
    objc_copyWeak(&v121, &location);
    v122 = v3;
    AXPerformBlockSynchronouslyOnMainThread();
    v9 = *(id *)(*(_QWORD *)&buf[8] + 40);
    objc_destroyWeak(&v121);
    _Block_object_dispose(buf, 8);

    objc_destroyWeak(&location);
  }
  return v9;
}

void __34__RTTUIUtilities_bubbleFillForMe___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "bubbleFillForMe:", *(unsigned __int8 *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (void)displayCallPromptForContact:(id)a3 withCompletion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  if (a4)
  {
    v5 = (void *)MEMORY[0x24BE7CB58];
    v6 = a4;
    v7 = a3;
    objc_msgSend(v5, "sharedInstance");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayCallPromptForContact:withCompletion:", v7, v6);

  }
}

+ (void)cancelCallPromptDisplay
{
  id v2;

  objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelCallPromptDisplay");

}

- (id)conversationForCallUID:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  v4 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __41__RTTUIUtilities_conversationForCallUID___block_invoke;
  v10[3] = &unk_24D657FF0;
  v12 = &v13;
  v6 = v4;
  v11 = v6;
  objc_msgSend(v5, "findConversationForCallUID:andResult:", v3, v10);

  v7 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v6, v7);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __41__RTTUIUtilities_conversationForCallUID___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)deleteConversationWithCallUID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x24BE7CB58];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "deleteConversationWithCallUID:", v4);

  return v6;
}

- (BOOL)contactIsTTYContact:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x24BE7CB58];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "contactIsTTYContact:", v4);

  return v6;
}

- (id)transcriptStringForConversation:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
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
  uint64_t v28;
  uint64_t v29;
  void *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v36 = objc_alloc_init(MEMORY[0x24BDD1688]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v31 = v3;
  objc_msgSend(v3, "utterances");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v4)
  {
    v5 = v4;
    v34 = *MEMORY[0x24BDF77E8];
    v35 = *(_QWORD *)v38;
    v33 = *MEMORY[0x24BDF78A0];
    v6 = *MEMORY[0x24BDF7868];
    v7 = *MEMORY[0x24BDF65F8];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v38 != v35)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x24BDBACC0];
        v11 = (void *)MEMORY[0x24BDBACA0];
        objc_msgSend(v9, "contactPath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contactForPhoneNumber:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringFromContact:style:", v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v14, "length"))
        {
          if (objc_msgSend(v9, "isMe"))
            ttyLocString();
          else
            objc_msgSend(v9, "contactPath");
          v15 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v15;
        }
        if (!objc_msgSend(v14, "length"))
        {
          ttyLocString();
          v16 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v16;
        }
        objc_msgSend(MEMORY[0x24BDF6A78], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v34, 0x8000, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v33;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v18;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "fontDescriptorByAddingAttributes:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = (void *)MEMORY[0x24BDF6A70];
        objc_msgSend(v20, "pointSize");
        objc_msgSend(v21, "fontWithDescriptor:size:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v9, "text");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: %@\n"), v14, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v25);
        v41 = v7;
        v42 = v22;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v25, "rangeOfString:", v14);
        objc_msgSend(v26, "setAttributes:range:", v27, v28, v29);

        objc_msgSend(v36, "appendAttributedString:", v26);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v5);
  }

  return v36;
}

- (BOOL)inUnitTestMode
{
  return self->_inUnitTestMode;
}

- (void)setInUnitTestMode:(BOOL)a3
{
  self->_inUnitTestMode = a3;
}

- (NSNumber)overrideLTR
{
  return self->_overrideLTR;
}

- (void)setOverrideLTR:(id)a3
{
  objc_storeStrong((id *)&self->_overrideLTR, a3);
}

- (BOOL)headphoneJackSupportsTTY
{
  return self->_headphoneJackSupportsTTY;
}

- (void)setHeadphoneJackSupportsTTY:(BOOL)a3
{
  self->_headphoneJackSupportsTTY = a3;
}

- (OS_dispatch_queue)callCenterQueue
{
  return self->_callCenterQueue;
}

- (void)setCallCenterQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callCenterQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callCenterQueue, 0);
  objc_storeStrong((id *)&self->_overrideLTR, 0);
}

- (void)bubbleFillForMe:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_216E9C000, log, OS_LOG_TYPE_FAULT, "Expected to be called on the main thread", v1, 2u);
}

@end
