@implementation TIKeyboardFeatureSpecialization_ain

- (BOOL)shouldConvertEagerly
{
  return 0;
}

- (id)internalStringToExternal:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  objc_msgSend(a3, "_stringByReplacingCharacter:withCharacter:", 32, 12288);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_stringByReplacingCharacter:withCharacter:", 45, 12540);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardFeatureSpecialization_ain;
  -[TIKeyboardFeatureSpecialization internalStringToExternal:](&v8, sel_internalStringToExternal_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)wordCharacters
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4E90]), "initWithBaseCharacterSet:", 10);
  -[TIKeyboardFeatureSpecialization nonstopPunctuationCharacters](self, "nonstopPunctuationCharacters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addCharactersInString:", v4);

  objc_msgSend(v3, "removeCharactersInString:", CFSTR("ー"));
  return v3;
}

- (id)findPrefixMatchesFor:(id)a3 fromIndex:(unint64_t)a4 usingCompositionMap:(id)a5 matchesInputAsPrefix:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  const __CFString *v17;
  int v18;
  unint64_t v19;
  unint64_t v21;
  unint64_t v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  const __CFString *v33;
  objc_super v34;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  if (objc_msgSend(v10, "length") && objc_msgSend(v10, "length") > a4)
  {
    v34.receiver = self;
    v34.super_class = (Class)TIKeyboardFeatureSpecialization_ain;
    -[TIKeyboardFeatureSpecialization findPrefixMatchesFor:fromIndex:usingCompositionMap:matchesInputAsPrefix:](&v34, sel_findPrefixMatchesFor_fromIndex_usingCompositionMap_matchesInputAsPrefix_, v10, a4, v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v13 = objc_msgSend(v10, "characterAtIndex:", a4);
      v14 = v13;
      if ((_DWORD)v13 == 114 || (_DWORD)v13 == 104)
      {
        v15 = objc_msgSend(v10, "characterAtIndex:", a4 - 1);
        objc_msgSend(MEMORY[0x24BDD17C8], "_stringWithUnichar:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_DWORD)v14 == 114)
        {
          v17 = 0;
          v18 = 0;
          HIDWORD(v21) = v15 - 97;
          LODWORD(v21) = v15 - 97;
          switch((v21 >> 1))
          {
            case 0u:
              v17 = CFSTR("ㇻ");
              goto LABEL_23;
            case 2u:
              v17 = CFSTR("ㇾ");
              goto LABEL_23;
            case 4u:
              v17 = CFSTR("ㇼ");
              goto LABEL_23;
            case 7u:
              v17 = CFSTR("ㇿ");
              goto LABEL_23;
            case 0xAu:
              v17 = CFSTR("ㇽ");
LABEL_23:
              v18 = 1;
              break;
            default:
              break;
          }
        }
        else if ((_DWORD)v14 == 104)
        {
          v17 = 0;
          v18 = 0;
          HIDWORD(v19) = v15 - 97;
          LODWORD(v19) = v15 - 97;
          switch((v19 >> 1))
          {
            case 0u:
              v17 = CFSTR("ㇵ");
              goto LABEL_23;
            case 2u:
              v17 = CFSTR("ㇸ");
              goto LABEL_23;
            case 4u:
              v17 = CFSTR("ㇶ");
              goto LABEL_23;
            case 7u:
              v17 = CFSTR("ㇹ");
              goto LABEL_23;
            case 0xAu:
              v17 = CFSTR("ㇷ");
              goto LABEL_23;
            default:
              break;
          }
        }
        else
        {
          v18 = 0;
          v17 = 0;
        }
        v22 = a4 + 1;
        v23 = v22 >= objc_msgSend(v10, "length") || objc_msgSend(v10, "characterAtIndex:", v22) != 106;
        if ((v18 & v23) == 1)
        {
          v24 = (void *)objc_msgSend(v12, "mutableCopy");
          v25 = objc_msgSend(v24, "count");
          if (objc_msgSend(v24, "count"))
          {
            v32 = v25;
            v33 = v17;
            v26 = 0;
            while (1)
            {
              objc_msgSend(v24, "objectAtIndexedSubscript:", v26, v32);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "key");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "length");
              v30 = objc_msgSend(v16, "length");

              if (v29 <= v30)
                break;
              if (objc_msgSend(v24, "count") <= (unint64_t)++v26)
              {
                v25 = v32;
                v17 = v33;
                goto LABEL_34;
              }
            }
            v25 = v26;
            v17 = v33;
          }
LABEL_34:
          objc_msgSend(MEMORY[0x24BEB5358], "itemWithKey:value:", v16, v17);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "insertObject:atIndex:", v31, v25);

          v12 = v24;
        }

      }
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v12;
}

@end
