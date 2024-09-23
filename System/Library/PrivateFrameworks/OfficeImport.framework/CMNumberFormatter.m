@implementation CMNumberFormatter

+ (id)formatterForNumberFormat:(int)a3 language:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  if (qword_255AFD9F0 != -1)
    dispatch_once(&qword_255AFD9F0, &__block_literal_global_105);
  v7 = v5 | ((unint64_t)v4 << 8);
  v8 = (void *)_MergedGlobals_52;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = (void *)v10;
  if (!v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNumberFormat:language:", v5, v4);
    v12 = (void *)_MergedGlobals_52;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, v13);

  }
  return v11;
}

void __55__CMNumberFormatter_formatterForNumberFormat_language___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCE40]);
  v1 = (void *)_MergedGlobals_52;
  _MergedGlobals_52 = (uint64_t)v0;

}

- (CMNumberFormatter)initWithNumberFormat:(int)a3 language:(int)a4
{
  CMNumberFormatter *v6;
  CMNumberFormatter *v7;
  void *v8;
  void *v9;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)CMNumberFormatter;
  v6 = -[CMNumberFormatter init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_format = a3;
    v6->_language = a4;
    if ((a3 & 0xFFFFFFFE) == 6)
    {
      v12 = 0;
      v13 = 0;
      OCDOfficeStringFromLanguage(a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
        uloc_canonicalize();
      }
      v7->_numberFormatter = (void **)unum_open();
      if (a3 == 7)
        unum_setTextAttribute();

    }
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_numberFormatter)
    unum_close();
  v3.receiver = self;
  v3.super_class = (Class)CMNumberFormatter;
  -[CMNumberFormatter dealloc](&v3, sel_dealloc);
}

- (id)stringForNumber:(unint64_t)a3
{
  unint64_t v3;
  int v5;
  int format;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  id result;
  const __CFString *v12;
  unint64_t v13;
  const __CFString *v14;
  int v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  id v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  unint64_t v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  _OWORD v32[32];
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x24BDAC8D0];
  if (self->_numberFormatter)
  {
    memset(v32, 0, sizeof(v32));
    v5 = unum_format();
    LOWORD(v32[0]) = MEMORY[0x22E2DE134](0);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v32, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    return v10;
  }
  format = self->_format;
  if (format == 22)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2lu"), a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    return v10;
  }
  if (!format)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    return v10;
  }
  if (!a3)
    return CFSTR("?");
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_format;
  v9 = 1;
  switch(v8)
  {
    case 1:
    case 2:
      if (v3 >= 0x3E8)
      {
        if (v8 == 1)
          v12 = CFSTR("M");
        else
          v12 = CFSTR("m");
        do
        {
          objc_msgSend(v7, "appendString:", v12, v9);
          v3 -= 1000;
        }
        while (v3 > 0x3E7);
      }
      v13 = v3 - 900;
      if (v3 >= 0x384)
      {
        if (v8 == 1)
          v14 = CFSTR("CM");
        else
          v14 = CFSTR("cm");
LABEL_51:
        objc_msgSend(v7, "appendString:", v14, v9);
        v3 = v13;
        goto LABEL_57;
      }
      if (v3 < 0x1F4)
      {
        v13 = v3 - 400;
        if (v3 >= 0x190)
        {
          if (v8 == 1)
            v14 = CFSTR("CD");
          else
            v14 = CFSTR("cd");
          goto LABEL_51;
        }
      }
      else
      {
        if (v8 == 1)
          v21 = CFSTR("D");
        else
          v21 = CFSTR("d");
        objc_msgSend(v7, "appendString:", v21, v9);
        v3 -= 500;
      }
      if (v3 >= 0x64)
      {
        if (v8 == 1)
          v22 = CFSTR("C");
        else
          v22 = CFSTR("c");
        do
        {
          objc_msgSend(v7, "appendString:", v22);
          v3 -= 100;
        }
        while (v3 > 0x63);
      }
LABEL_57:
      v23 = v3 - 90;
      if (v3 >= 0x5A)
      {
        if (v8 == 1)
          v24 = CFSTR("XC");
        else
          v24 = CFSTR("xc");
LABEL_61:
        objc_msgSend(v7, "appendString:", v24);
        v3 = v23;
        goto LABEL_76;
      }
      if (v3 < 0x32)
      {
        v23 = v3 - 40;
        if (v3 >= 0x28)
        {
          if (v8 == 1)
            v24 = CFSTR("XL");
          else
            v24 = CFSTR("xl");
          goto LABEL_61;
        }
      }
      else
      {
        if (v8 == 1)
          v25 = CFSTR("L");
        else
          v25 = CFSTR("l");
        objc_msgSend(v7, "appendString:", v25);
        v3 -= 50;
      }
      if (v3 >= 0xA)
      {
        if (v8 == 1)
          v26 = CFSTR("X");
        else
          v26 = CFSTR("x");
        do
        {
          objc_msgSend(v7, "appendString:", v26);
          v3 -= 10;
        }
        while (v3 > 9);
      }
LABEL_76:
      if (v3 == 9)
      {
        v27 = CFSTR("ix");
        v28 = CFSTR("IX");
LABEL_85:
        if (v8 == 1)
          v30 = v28;
        else
          v30 = v27;
        objc_msgSend(v7, "appendString:", v30);
        goto LABEL_89;
      }
      if (v3 < 5)
      {
        if (v3 == 4)
        {
          v27 = CFSTR("iv");
          v28 = CFSTR("IV");
          goto LABEL_85;
        }
      }
      else
      {
        if (v8 == 1)
          v29 = CFSTR("V");
        else
          v29 = CFSTR("v");
        objc_msgSend(v7, "appendString:", v29);
        v3 -= 5;
      }
      if (v3)
      {
        if (v8 == 1)
          v31 = CFSTR("I");
        else
          v31 = CFSTR("i");
        do
        {
          objc_msgSend(v7, "appendString:", v31);
          --v3;
        }
        while (v3);
      }
LABEL_90:
      if (objc_msgSend(v7, "length"))
      {
        v19 = v7;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), v3);
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_41:
      v20 = v19;

      result = v20;
      break;
    case 3:
    case 4:
      if (v8 == 4)
        v15 = 97;
      else
        v15 = 65;
      do
      {
        v16 = (v3 - 1) % 0x1A;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c"), v9, (v15 + v16));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "insertString:atIndex:", v17, 0);

        v18 = v3 - v16;
        v3 = (v3 - v16) / 0x1A;
      }
      while (v18 >= 0x1A);
LABEL_89:
      v3 = 0;
      goto LABEL_90;
    case 10:
    case 11:
    case 17:
      v9 = 15;
      goto LABEL_40;
    case 12:
    case 20:
      v9 = 21;
      goto LABEL_40;
    case 13:
    case 21:
      v9 = 27;
      goto LABEL_40;
    case 16:
      v9 = 36;
      goto LABEL_40;
    case 18:
      v9 = 48;
      goto LABEL_40;
    case 19:
      v9 = 49;
      goto LABEL_40;
    case 24:
    case 25:
    case 41:
    case 42:
    case 43:
      v9 = 45;
      goto LABEL_40;
    case 27:
    case 57:
      goto LABEL_40;
    case 28:
    case 30:
    case 31:
    case 37:
    case 39:
    case 40:
      v9 = 30;
      goto LABEL_40;
    case 29:
      v9 = 31;
      goto LABEL_40;
    case 32:
    case 33:
    case 35:
    case 36:
    case 44:
      v9 = 33;
      goto LABEL_40;
    case 34:
      v9 = 42;
      goto LABEL_40;
    case 38:
      v9 = 39;
      goto LABEL_40;
    case 45:
    case 47:
      v9 = 62;
      goto LABEL_40;
    case 46:
      v9 = 52;
      goto LABEL_40;
    case 48:
      v9 = 55;
LABEL_40:
      objc_msgSend(MEMORY[0x24BDD17C8], "tswp_stringForValue:withListNumberFormat:includeFormatting:", v3, v9, 0);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    default:
      goto LABEL_90;
  }
  return result;
}

@end
