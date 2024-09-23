@implementation TIKeyboardInputManager_chr

- (void)initImplementation
{
  void *result;
  uint64_t v3;

  result = *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x24BEB5498]);
  if (!result)
  {
    v3 = operator new();
    return (void *)MEMORY[0x234901770](v3);
  }
  return result;
}

- (BOOL)doesComposeText
{
  return -[TIKeyboardInputManager_chr inHardwareKeyboardMode](self, "inHardwareKeyboardMode") ^ 1;
}

- (BOOL)dictionaryUsesExternalEncoding
{
  return 0;
}

- (id)internalStringToExternal:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[TIKeyboardInputManager_chr inHardwareKeyboardMode](self, "inHardwareKeyboardMode"))
  {
    v5 = v4;
    goto LABEL_48;
  }
  v6 = objc_msgSend(v4, "length");
  v7 = MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v22 - v8;
  if (v7)
  {
    v22 = (uint64_t)&v22;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    while (1)
    {
      v13 = objc_msgSend(v4, "characterAtIndex:", v11, v22, v23);
      if (v6 - 1 > v11)
        break;
LABEL_44:
      v19 = v10 + 1;
      *(_WORD *)&v9[2 * v10] = v13;
      v11 = ++v12;
      ++v10;
      if (v6 <= v12)
      {
        v20 = v19;
        goto LABEL_47;
      }
    }
    v14 = objc_msgSend(v4, "characterAtIndex:", v12 + 1);
    if (v13 <= 5067)
    {
      if (v13 > 5048)
      {
        switch(v13)
        {
          case 5049:
            v15 = 1;
            v16 = 4;
            goto LABEL_37;
          case 5054:
            v15 = 1;
            v16 = 5;
            goto LABEL_37;
          case 5062:
            v15 = 1;
            v16 = 6;
            goto LABEL_37;
        }
      }
      else
      {
        switch(v13)
        {
          case 5030:
            v15 = 1;
            v16 = 1;
            goto LABEL_37;
          case 5037:
            v15 = 1;
            v16 = 2;
            goto LABEL_37;
          case 5043:
            v15 = 1;
            v16 = 3;
            goto LABEL_37;
        }
      }
    }
    else if (v13 <= 5084)
    {
      switch(v13)
      {
        case 5068:
          v15 = 1;
          v16 = 7;
          goto LABEL_37;
        case 5075:
          v15 = 1;
          v16 = 8;
          goto LABEL_37;
        case 5076:
          v15 = 1;
          v16 = 9;
          goto LABEL_37;
      }
    }
    else if (v13 > 5096)
    {
      if (v13 == 5097)
      {
        v15 = 1;
        v16 = 12;
        goto LABEL_37;
      }
      if (v13 == 5103)
      {
        v15 = 1;
        v16 = 13;
        goto LABEL_37;
      }
    }
    else
    {
      if (v13 == 5085)
      {
        v15 = 1;
        v16 = 10;
        goto LABEL_37;
      }
      if (v13 == 5091)
      {
        v15 = 1;
        v16 = 11;
LABEL_37:
        v17 = 0;
        v18 = v14 - 5024;
        if ((v14 - 5024) >= 6)
          v18 = -1;
        if (v15 && v18 != -1)
          v17 = cherokee_syllables[6 * v16 + v18];
        if (v17)
        {
          ++v12;
          LOWORD(v13) = v17;
        }
        goto LABEL_44;
      }
    }
    v15 = 0;
    v16 = -1;
    goto LABEL_37;
  }
  v20 = 0;
LABEL_47:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v9, v20);
  v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_48:

  return v5;
}

- (id)externalStringToInternal:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[TIKeyboardInputManager_chr inHardwareKeyboardMode](self, "inHardwareKeyboardMode"))
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(v4, "length");
    MEMORY[0x24BDAC7A8]();
    v7 = (char *)v15 - v6;
    if (objc_msgSend(v4, "length"))
    {
      v8 = 0;
      v9 = 0;
      do
      {
        v10 = objc_msgSend(v4, "characterAtIndex:", v8);
        v11 = 1;
        v12 = 1;
        switch(v10)
        {
          case 5032:
            goto LABEL_79;
          case 5033:
            v12 = 2;
            goto LABEL_10;
          case 5034:
            v12 = 3;
            goto LABEL_10;
          case 5035:
            v12 = 4;
            goto LABEL_10;
          case 5036:
            v12 = 5;
LABEL_10:
            v11 = 1;
            goto LABEL_79;
          case 5038:
            v12 = 1;
            goto LABEL_16;
          case 5039:
            v11 = 2;
            v12 = 2;
            goto LABEL_79;
          case 5040:
            v12 = 3;
            goto LABEL_16;
          case 5041:
            v12 = 4;
            goto LABEL_16;
          case 5042:
            v12 = 5;
LABEL_16:
            v11 = 2;
            goto LABEL_79;
          case 5044:
            v12 = 1;
            goto LABEL_22;
          case 5045:
            v12 = 2;
            goto LABEL_22;
          case 5046:
            v11 = 3;
            v12 = 3;
            goto LABEL_79;
          case 5047:
            v12 = 4;
            goto LABEL_22;
          case 5048:
            v12 = 5;
LABEL_22:
            v11 = 3;
            goto LABEL_79;
          case 5050:
            v12 = 1;
            goto LABEL_26;
          case 5051:
            v12 = 2;
            goto LABEL_26;
          case 5052:
            v12 = 3;
LABEL_26:
            v11 = 4;
            goto LABEL_79;
          case 5053:
            v11 = 4;
            v12 = 4;
            goto LABEL_79;
          case 5057:
            v12 = 1;
            goto LABEL_32;
          case 5058:
            v12 = 2;
            goto LABEL_32;
          case 5059:
            v12 = 3;
            goto LABEL_32;
          case 5060:
            v12 = 4;
LABEL_32:
            v11 = 5;
            goto LABEL_79;
          case 5061:
            v11 = 5;
            v12 = 5;
            goto LABEL_79;
          case 5063:
            v12 = 1;
            goto LABEL_39;
          case 5064:
            v12 = 2;
            goto LABEL_39;
          case 5065:
            v12 = 3;
            goto LABEL_39;
          case 5066:
            v12 = 4;
            goto LABEL_39;
          case 5067:
            v12 = 5;
LABEL_39:
            v11 = 6;
            goto LABEL_79;
          case 5070:
            v12 = 1;
            goto LABEL_45;
          case 5071:
            v12 = 2;
            goto LABEL_45;
          case 5072:
            v12 = 3;
            goto LABEL_45;
          case 5073:
            v12 = 4;
            goto LABEL_45;
          case 5074:
            v12 = 5;
LABEL_45:
            v11 = 7;
            goto LABEL_79;
          case 5077:
            v12 = 1;
            goto LABEL_54;
          case 5078:
            v12 = 1;
            goto LABEL_50;
          case 5079:
            v12 = 2;
            goto LABEL_54;
          case 5080:
            v12 = 2;
LABEL_50:
            v11 = 9;
            goto LABEL_79;
          case 5081:
            v12 = 3;
            goto LABEL_54;
          case 5082:
            v12 = 4;
            goto LABEL_54;
          case 5083:
            v12 = 5;
LABEL_54:
            v11 = 8;
            goto LABEL_79;
          case 5086:
            v12 = 1;
            goto LABEL_60;
          case 5087:
            v12 = 2;
            goto LABEL_60;
          case 5088:
            v12 = 3;
            goto LABEL_60;
          case 5089:
            v12 = 4;
            goto LABEL_60;
          case 5090:
            v12 = 5;
LABEL_60:
            v11 = 10;
            goto LABEL_79;
          case 5092:
            v12 = 1;
            goto LABEL_66;
          case 5093:
            v12 = 2;
            goto LABEL_66;
          case 5094:
            v12 = 3;
            goto LABEL_66;
          case 5095:
            v12 = 4;
            goto LABEL_66;
          case 5096:
            v12 = 5;
LABEL_66:
            v11 = 11;
            goto LABEL_79;
          case 5098:
            v12 = 1;
            goto LABEL_72;
          case 5099:
            v12 = 2;
            goto LABEL_72;
          case 5100:
            v12 = 3;
            goto LABEL_72;
          case 5101:
            v12 = 4;
            goto LABEL_72;
          case 5102:
            v12 = 5;
LABEL_72:
            v11 = 12;
            goto LABEL_79;
          case 5104:
            v12 = 1;
            goto LABEL_78;
          case 5105:
            v12 = 2;
            goto LABEL_78;
          case 5106:
            v12 = 3;
            goto LABEL_78;
          case 5107:
            v12 = 4;
            goto LABEL_78;
          case 5108:
            v12 = 5;
LABEL_78:
            v11 = 13;
LABEL_79:
            *(_WORD *)&v7[2 * v9] = cherokee_syllables[6 * v11];
            LOWORD(v10) = cherokee_syllables[v12];
            ++v9;
            break;
          default:
            break;
        }
        *(_WORD *)&v7[2 * v9++] = v10;
        ++v8;
      }
      while (objc_msgSend(v4, "length") > v8);
      v13 = v9;
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v7, v13);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end
