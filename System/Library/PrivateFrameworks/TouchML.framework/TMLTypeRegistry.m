@implementation TMLTypeRegistry

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

+ (unint64_t)typeForTypeName:(id)a3
{
  const char *v3;
  id v4;
  double v5;
  const char *v6;
  double v7;
  unsigned int v8;
  unint64_t v9;
  void *v10;
  const char *v11;
  double v12;

  v4 = a3;
  if (qword_255B51CE8 != -1)
    dispatch_once(&qword_255B51CE8, &unk_24F503E68);
  if (!objc_msgSend_length(v4, v3, v5))
    goto LABEL_8;
  v8 = objc_msgSend_characterAtIndex_(v4, v6, v7, 0);
  if (v8 > 0x7F)
  {
    if (__maskrune(v8, 0x8000uLL))
      goto LABEL_6;
LABEL_8:
    objc_msgSend_objectForKeyedSubscript_((void *)qword_255B51CE0, v6, v7, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend_unsignedIntegerValue(v10, v11, v12);

    goto LABEL_9;
  }
  if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v8 + 60) & 0x8000) == 0)
    goto LABEL_8;
LABEL_6:
  v9 = 16;
LABEL_9:

  return v9;
}

+ (id)typeNameForType:(unint64_t)a3
{
  if (a3 - 1 > 0x1D)
    return CFSTR("unknown");
  else
    return off_24F503EC8[a3 - 1];
}

+ (id)classNameForType:(unint64_t)a3
{
  if (a3 == 18)
    return CFSTR("NSAttributedString");
  else
    return &stru_24F505EA8;
}

+ (unint64_t)typeForEncodedType:(id)a3
{
  id v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  double v11;
  unint64_t v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  const char *v20;
  double v21;

  v3 = a3;
  if (objc_msgSend_hasPrefix_(v3, v4, v5, CFSTR("r")))
  {
    objc_msgSend_substringFromIndex_(v3, v6, v7, 1);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v8;
  }
  if (qword_255B51CF8 != -1)
    dispatch_once(&qword_255B51CF8, &unk_24F503E88);
  objc_msgSend_objectForKeyedSubscript_((void *)qword_255B51CF0, v6, v7, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_unsignedIntegerValue(v9, v10, v11);

  if (!v12)
  {
    if (objc_msgSend_rangeOfString_options_(v3, v13, v14, CFSTR("directionalEdgeInsets"), 1) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((objc_msgSend_hasPrefix_(v3, v15, v16, CFSTR("@")) & 1) != 0)
      {
        v12 = 16;
      }
      else if ((objc_msgSend_hasPrefix_(v3, v17, v18, CFSTR("{")) & 1) != 0)
      {
        v12 = 27;
      }
      else if (objc_msgSend_rangeOfString_(v3, v20, v21, CFSTR("^")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v12 = 26;
      }
    }
    else
    {
      v12 = 30;
    }
  }

  return v12;
}

+ (id)encodedTypeForType:(unint64_t)a3
{
  double v3;
  void *v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;

  if (qword_255B51D08 != -1)
    dispatch_once(&qword_255B51D08, &unk_24F503EA8);
  v5 = (void *)qword_255B51D00;
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], a2, v3, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v7, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
