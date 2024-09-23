@implementation TIKeyboardInputManager

void __54__TIKeyboardInputManager_my_internalStringToExternal___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  char v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int16 v45;
  _WORD __base[3];

  v3 = a2;
  v4 = objc_msgSend(v3, "rangeAtIndex:", 1);
  v41 = v5;
  v42 = v4;
  v6 = objc_msgSend(v3, "rangeAtIndex:", 2);
  v7 = objc_msgSend(v3, "rangeAtIndex:", 4);
  v9 = v8;
  v10 = objc_msgSend(v3, "rangeAtIndex:", 6);
  v12 = v11;
  v13 = objc_msgSend(v3, "rangeAtIndex:", 7);
  v43 = v14;
  v44 = v13;
  v15 = objc_msgSend(v3, "rangeAtIndex:", 8);
  v17 = v16;
  if (!objc_msgSend(v3, "range"))
    goto LABEL_7;
  if (objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", objc_msgSend(v3, "range") - 1) != 4153)
    goto LABEL_7;
  if ((unint64_t)objc_msgSend(v3, "range") >= 3)
  {
    v40 = objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", objc_msgSend(v3, "range") - 3);
    v18 = v6;
    v19 = v17;
    v20 = v15;
    v21 = *(void **)(a1 + 32);
    v22 = objc_msgSend(v3, "range") - 2;
    v23 = v21;
    v15 = v20;
    v17 = v19;
    v6 = v18;
    v24 = objc_msgSend(v23, "characterAtIndex:", v22);
    if (v40 == 4100 && v24 == 4154)
    {
LABEL_7:
      if (v7 != 0x7FFFFFFFFFFFFFFFLL && v9)
      {
        objc_msgSend(*(id *)(a1 + 40), "deleteCharactersInRange:", v7, v9);
        v25 = v15;
        v26 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v7, v9);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v26;
        v15 = v25;
        objc_msgSend(v28, "insertString:atIndex:", v27, v6);

      }
      if (v12)
      {
        if (v12 == 1)
        {
          v29 = objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", v10) >= 0x103D;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "getCharacters:range:", __base, v10, v12);
          qsort_b(__base, v12, 2uLL, &__block_literal_global);
          v30 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", __base, v12);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "replaceCharactersInRange:withString:", v10, v12, v31);

          v29 = __base[0] >= 0x103Du;
        }
        LOBYTE(v12) = !v29;
      }
      if (v42 != 0x7FFFFFFFFFFFFFFFLL && v41)
      {
        objc_msgSend(*(id *)(a1 + 40), "insertString:atIndex:", CFSTR("ေ"), v44);
        objc_msgSend(*(id *)(a1 + 40), "deleteCharactersInRange:", v42, v41);
      }
      if (v43 == 2)
      {
        v32 = objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", v44);
        v33 = objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", v44 + 1);
        v45 = v33;
        if (((v32 - 4141) > 5 || ((1 << (v32 - 45)) & 0x23) == 0)
          && (v33 - 4141) <= 5
          && ((1 << (v33 - 45)) & 0x23) != 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "deleteCharactersInRange:", v44 + 1, 1);
          v34 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v45, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "insertString:atIndex:", v35, v44);

        }
      }
      if (v15 == 0x7FFFFFFFFFFFFFFFLL || v17 == 0)
        v37 = 1;
      else
        v37 = v12;
      if ((v37 & 1) == 0)
      {
        objc_msgSend(v3, "rangeAtIndex:", 3);
        if (!v38)
        {
          v39 = objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", v6);
          if (_ZZZ54__TIKeyboardInputManager_my_internalStringToExternal__EUb_E11__onceToken != -1)
            dispatch_once(&_ZZZ54__TIKeyboardInputManager_my_internalStringToExternal__EUb_E11__onceToken, &__block_literal_global_5);
          if (objc_msgSend((id)_ZZZ54__TIKeyboardInputManager_my_internalStringToExternal__EUb_E27__requiresTallACharacterSet, "characterIsMember:", v39))objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withString:", v15, v17, CFSTR("ါ"));
        }
      }
    }
  }

}

uint64_t __54__TIKeyboardInputManager_my_internalStringToExternal___block_invoke_2(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  return *a2 - *a3;
}

void __54__TIKeyboardInputManager_my_internalStringToExternal___block_invoke_3()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("ခဂငဒပဝ"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_ZZZ54__TIKeyboardInputManager_my_internalStringToExternal__EUb_E27__requiresTallACharacterSet;
  _ZZZ54__TIKeyboardInputManager_my_internalStringToExternal__EUb_E27__requiresTallACharacterSet = v0;

}

void __54__TIKeyboardInputManager_my_externalStringToInternal___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v3 = objc_msgSend(v12, "rangeAtIndex:", 1);
  v5 = v4;
  v6 = objc_msgSend(v12, "rangeAtIndex:", 3);
  v8 = v7;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL && v5)
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "length");
    if (v5 + v3 + 1 < (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length"))
      v9 = objc_msgSend(*(id *)(a1 + 32), "rangeOfComposedCharacterSequenceAtIndex:", v5 + v3 + 1);
    v10 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v3, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertString:atIndex:", v11, v9);

    objc_msgSend(*(id *)(a1 + 40), "deleteCharactersInRange:", v3, v5);
  }
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "deleteCharactersInRange:", v6, v8);
    objc_msgSend(*(id *)(a1 + 40), "insertString:atIndex:", CFSTR("ေ"), objc_msgSend(v12, "range"));
  }

}

@end
