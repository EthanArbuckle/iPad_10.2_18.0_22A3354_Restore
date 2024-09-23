@implementation TISmartInsertDeleteController

- (TISmartInsertDeleteController)initWithTextInputTraits:(id)a3
{
  id v5;
  TISmartInsertDeleteController *v6;
  TISmartInsertDeleteController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TISmartInsertDeleteController;
  v6 = -[TISmartInsertDeleteController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_enabled = 1;
    objc_storeStrong((id *)&v6->_textInputTraits, a3);
  }

  return v7;
}

- (void)smartDeleteForDocumentState:(id)a3 outBeforeLength:(unint64_t *)a4 outAfterLength:(unint64_t *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unsigned __int16 v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  unsigned int v29;
  void *v30;
  void *v31;
  unsigned __int16 v32;
  uint64_t v33;
  unsigned int v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  int v40;
  void *v41;
  unsigned int v42;
  _BOOL4 v43;
  unint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  int v52;
  void *v53;
  unsigned int v54;
  unsigned int v55;
  int v56;
  id v57;

  v8 = a3;
  if (a4)
    *a4 = 0;
  v57 = v8;
  if (a5)
    *a5 = 0;
  if (-[TISmartInsertDeleteController isEnabled](self, "isEnabled"))
  {
    -[TISmartInsertDeleteController textInputTraits](self, "textInputTraits");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "smartInsertDeleteEnabled"))
    {
LABEL_53:

      goto LABEL_54;
    }
    -[TISmartInsertDeleteController textInputTraits](self, "textInputTraits");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "smartInsertDeleteType");

    if (v57)
    {
      if (v11 != 1)
      {
        if (_getRegularWhiteSet_onceToken != -1)
          dispatch_once(&_getRegularWhiteSet_onceToken, &__block_literal_global_10545);
        v9 = (id)_getRegularWhiteSet__regularWhiteSet;
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "contextBeforeInput");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "length");

        objc_msgSend(v57, "contextAfterInput");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length");

        if (v15)
        {
          objc_msgSend(v57, "contextBeforeInput");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "_lastLongCharacter");

          if (objc_msgSend(v12, "characterIsMember:", v19))
          {
            v54 = objc_msgSend(v9, "characterIsMember:", v19);
            objc_msgSend(v57, "contextBeforeInput");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "length");

            if (objc_msgSend(v13, "characterIsMember:", v19))
            {
              v49 = v15;
              v22 = v12;
              v23 = 0;
              v56 = v21;
              v24 = v21 - 2;
              while (1)
              {
                v25 = v57;
                if (v24 == -1)
                  break;
                ++v23;
                objc_msgSend(v57, "contextBeforeInput");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "characterAtIndex:", v24);

                --v24;
                if ((objc_msgSend(v13, "characterIsMember:", v27) & 1) == 0)
                {
                  v51 = 0;
                  v28 = 1;
                  v56 = v23;
                  v25 = v57;
                  goto LABEL_33;
                }
              }
              v51 = 0;
              v28 = 1;
LABEL_33:
              v12 = v22;
              v15 = v49;
            }
            else
            {
              v51 = 0;
              v56 = 0;
              v28 = 1;
              v25 = v57;
            }
            v29 = v54;
            if (!v17)
              goto LABEL_35;
            goto LABEL_21;
          }
          _getPreSmartSet();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v30, "characterIsMember:", v19);

          v28 = 0;
          v29 = 0;
        }
        else
        {
          v28 = 0;
          v29 = 0;
          v51 = 0;
        }
        v56 = 0;
        v25 = v57;
        if (!v17)
        {
LABEL_35:
          v34 = 0;
          LODWORD(v36) = 0;
          v40 = v56;
          goto LABEL_36;
        }
LABEL_21:
        v52 = v28;
        v55 = v29;
        objc_msgSend(v25, "contextAfterInput", v49);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "_firstLongCharacter");

        v33 = v32;
        v53 = v12;
        if (objc_msgSend(v12, "characterIsMember:", v33))
        {
          v34 = objc_msgSend(v9, "characterIsMember:", v32);
          objc_msgSend(v57, "contextAfterInput");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "length");

          if ((objc_msgSend(v13, "characterIsMember:", v33) & 1) != 0)
          {
            v50 = v15;
            v37 = 1;
            while (v36 != v37)
            {
              objc_msgSend(v57, "contextAfterInput");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v38, "characterAtIndex:", v37);

              ++v37;
              if ((objc_msgSend(v13, "characterIsMember:", v39) & 1) == 0)
              {
                LODWORD(v36) = v37 - 1;
                break;
              }
            }
            v40 = v56;
            v28 = v52;
            v12 = v53;
            v15 = v50;
            v29 = v55;
LABEL_36:
            v45 = 0;
            v43 = v17 != 0;
            LODWORD(v44) = v40 == 2;
            if (v40 == 2)
              v46 = 1;
            else
              v46 = v29;
            if (!v17 && (v46 & 1) != 0)
            {
LABEL_41:
              v44 = 1;
              if (!a4)
                goto LABEL_50;
              goto LABEL_49;
            }
            goto LABEL_43;
          }
          LODWORD(v36) = 0;
          v45 = 0;
          v40 = v56;
          LODWORD(v44) = v56 == 2;
          v43 = 1;
        }
        else
        {
          _getPostSmartSet();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "characterIsMember:", v32);

          LODWORD(v36) = 0;
          v34 = 0;
          v43 = 0;
          v40 = v56;
          LODWORD(v44) = v56 == 2;
          v45 = v42;
        }
        v12 = v53;
        v29 = v55;
        v28 = v52;
LABEL_43:
        if ((_DWORD)v36 == 2)
          v47 = 1;
        else
          v47 = v34;
        if (!v15 && (v47 & 1) != 0)
          goto LABEL_48;
        if ((v28 & v43) != 1)
        {
          if (v51 & v34 | v29 ^ 1)
            v44 = 0;
          else
            v44 = v45;
          v45 = v51 & v34;
          if (a4)
            goto LABEL_49;
          goto LABEL_50;
        }
        if (((v29 | v34) & 1) != 0)
        {
          v44 = v29;
          v45 = v29 ^ 1;
          if (!a4)
            goto LABEL_50;
          goto LABEL_49;
        }
        if ((_DWORD)v36 == 1)
          v48 = v44;
        else
          v48 = 0;
        if ((v48 & 1) != 0)
        {
          v45 = 0;
          goto LABEL_41;
        }
        if (v40 == 1 && (_DWORD)v36 == 2)
        {
LABEL_48:
          v44 = 0;
          v45 = 1;
          if (a4)
LABEL_49:
            *a4 = v44;
        }
        else
        {
          if ((_DWORD)v36 == 2)
            v44 = v44;
          else
            v44 = 0;
          v45 = v44;
          if (a4)
            goto LABEL_49;
        }
LABEL_50:
        if (a5)
          *a5 = v45;

        goto LABEL_53;
      }
    }
  }
LABEL_54:

}

- (unint64_t)_numberOfCharactersInSet:(id)a3 atBeginningOfString:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v6 = a4;
  v7 = objc_msgSend(v6, "length");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__TISmartInsertDeleteController__numberOfCharactersInSet_atBeginningOfString___block_invoke;
  v11[3] = &unk_1E243B2D0;
  v12 = v5;
  v13 = &v14;
  v8 = v5;
  objc_msgSend(v6, "_enumerateLongCharactersInRange:usingBlock:", 0, v7, v11);

  v9 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v9;
}

- (unint64_t)_numberOfCharactersInSet:(id)a3 atEndOfString:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v6 = a4;
  v7 = objc_msgSend(v6, "length");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__TISmartInsertDeleteController__numberOfCharactersInSet_atEndOfString___block_invoke;
  v11[3] = &unk_1E243B2D0;
  v12 = v5;
  v13 = &v14;
  v8 = v5;
  objc_msgSend(v6, "_reverseEnumerateLongCharactersInRange:usingBlock:", 0, v7, v11);

  v9 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)smartInsertForDocumentState:(id)a3 stringToInsert:(id)a4 outBeforeString:(id *)a5 outAfterString:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned __int16 v21;
  void *v22;
  void *v23;
  unsigned __int16 v24;
  void *v25;
  unint64_t v26;
  _BOOL4 v27;
  char v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  char v33;
  _BOOL4 v34;
  BOOL v35;
  int v36;
  char v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  int v46;
  BOOL v47;
  int v48;
  char v50;
  BOOL v51;
  int v53;
  char v54;
  _BOOL4 v55;
  int v56;
  unint64_t v57;
  void *v58;
  int v59;
  unint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  id v66;

  v66 = a3;
  v10 = a4;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  if (-[TISmartInsertDeleteController isEnabled](self, "isEnabled"))
  {
    -[TISmartInsertDeleteController textInputTraits](self, "textInputTraits");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "smartInsertDeleteEnabled"))
    {
LABEL_90:

      goto LABEL_91;
    }
    -[TISmartInsertDeleteController textInputTraits](self, "textInputTraits");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "smartInsertDeleteType");

    if (v13 != 1 && v66 && v10)
    {
      v11 = v10;
      _getPreSmartSet();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      _getPostSmartSet();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v11, "length");
      objc_msgSend(v66, "contextBeforeInput");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");

      objc_msgSend(v66, "contextAfterInput");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v19, "length");

      v61 = v18;
      if (v18)
      {
        objc_msgSend(v66, "contextBeforeInput");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "_lastLongCharacter");

        if (objc_msgSend(v14, "characterIsMember:", v21))
        {
          objc_msgSend(v66, "contextBeforeInput");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = -[TISmartInsertDeleteController _numberOfCharactersInSet:atEndOfString:](self, "_numberOfCharactersInSet:atEndOfString:", v64, v22);

          v55 = 0;
          v59 = 1;
        }
        else
        {
          v60 = 0;
          v59 = 0;
          v55 = 1;
          if ((v21 & 0xFF00) != 0xE00 && (unsigned __int16)(v21 - 4096) >= 0xA0u)
          {
            v59 = 0;
            v60 = 0;
            v55 = v21 >> 7 == 47;
          }
        }
      }
      else
      {
        v59 = 0;
        v55 = 0;
        v60 = 0;
      }
      v58 = v14;
      if (v65)
      {
        objc_msgSend(v66, "contextAfterInput");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "_firstLongCharacter");

        if (objc_msgSend(v15, "characterIsMember:", v24))
        {
          objc_msgSend(v66, "contextAfterInput");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[TISmartInsertDeleteController _numberOfCharactersInSet:atBeginningOfString:](self, "_numberOfCharactersInSet:atBeginningOfString:", v64, v25);

          v27 = 0;
          v28 = 1;
        }
        else
        {
          v26 = 0;
          v28 = 0;
          v27 = 1;
          if ((v24 & 0xFF00) != 0xE00 && (unsigned __int16)(v24 - 4096) >= 0xA0u)
          {
            v28 = 0;
            v26 = 0;
            v27 = v24 >> 7 == 47;
          }
        }
      }
      else
      {
        v28 = 0;
        v27 = 0;
        v26 = 0;
      }
      v57 = v26;
      v62 = v15;
      if (v16)
      {
        v54 = v28;
        v29 = v27;
        v30 = objc_msgSend(v11, "characterAtIndex:", 0);
        v31 = objc_msgSend(v11, "characterAtIndex:", v16 - 1);
        v32 = objc_msgSend(v63, "characterIsMember:", v30);
        v33 = objc_msgSend(v63, "characterIsMember:", v31);
        v56 = objc_msgSend(v64, "characterIsMember:", v30);
        LODWORD(v16) = objc_msgSend(v64, "characterIsMember:", v31);
        v34 = 1;
        if ((v30 & 0xFF00) != 0xE00 && (unsigned __int16)(v30 - 4096) >= 0xA0u)
          v34 = v30 >> 7 == 47;
        v35 = 0;
        v27 = v29;
        if ((v31 & 0xFF00) == 0xE00)
        {
          v36 = v59;
          v28 = v54;
        }
        else
        {
          v36 = v59;
          v28 = v54;
          if ((unsigned __int16)(v31 - 4096) >= 0xA0u)
            v35 = v31 >> 7 != 47;
        }
      }
      else
      {
        v32 = 0;
        v33 = 0;
        v34 = 0;
        v56 = 0;
        v35 = 1;
        v36 = v59;
      }
      if (((v36 | v32) & 1) == 0 && v61)
      {
        if (v55)
        {
          if (!a5 || v34)
            goto LABEL_41;
        }
        else if (!a5)
        {
          goto LABEL_41;
        }
        *a5 = CFSTR(" ");
      }
LABEL_41:
      v37 = v28 | v33;
      v38 = v58;
      v39 = v62;
      if ((v37 & 1) != 0 || !v65)
        goto LABEL_50;
      if (v27)
      {
        if (!a6)
          v35 = 0;
        if (!v35)
        {
LABEL_50:
          if (TIGetFlexibleSmartWhitespaceEnabledValue_onceToken != -1)
            dispatch_once(&TIGetFlexibleSmartWhitespaceEnabledValue_onceToken, &__block_literal_global_36);
          +[TIPreferencesController sharedPreferencesController](TIPreferencesController, "sharedPreferencesController");
          v40 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v40, "valueForPreferenceKey:", CFSTR("FlexibleSmartWhitespaceEnabled"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v40) = objc_msgSend(v41, "BOOLValue");
          if ((v40 & 1) == 0)
          {
            v46 = v56;
            if (v60 != 1)
              v46 = 1;
            if (((v46 | v16) & 1) != 0 || v57 != 1)
              goto LABEL_89;
            if (a5)
              *a5 = CFSTR("\n");
            goto LABEL_87;
          }
          objc_msgSend(v66, "contextBeforeInput");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "length");

          objc_msgSend(v66, "contextAfterInput");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "length");

          if ((v56 & 1) != 0 || v60 != 1 || v43 == 1 || !v57)
          {
            if (v65)
              v47 = 1;
            else
              v47 = v61 == 0;
            v48 = !v47;
            if (v60 != 1 || v43 == 1)
              v48 = 0;
            if (!a5 || (v48 & ~(_DWORD)v16 & (v56 ^ 1)) == 0 || *a5)
              goto LABEL_80;
          }
          else if (!a5)
          {
            goto LABEL_80;
          }
          *a5 = CFSTR("\n");
LABEL_80:
          if (v60)
            v50 = v16;
          else
            v50 = 1;
          v38 = v58;
          if ((v50 & 1) != 0 || v57 != 1 || v45 == 1)
          {
            v39 = v62;
            if (v61)
              v51 = 1;
            else
              v51 = v65 == 0;
            if (v51 || v57 == v45)
              v53 = 1;
            else
              v53 = v56;
            if (!a6 || v16 | v53 || *a6)
              goto LABEL_89;
            goto LABEL_88;
          }
          v39 = v62;
LABEL_87:
          if (!a6)
          {
LABEL_89:

            goto LABEL_90;
          }
LABEL_88:
          *a6 = CFSTR("\n");
          goto LABEL_89;
        }
      }
      else if (!a6)
      {
        goto LABEL_50;
      }
      *a6 = CFSTR(" ");
      goto LABEL_50;
    }
  }
LABEL_91:

}

- (TITextInputTraits)textInputTraits
{
  return self->_textInputTraits;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textInputTraits, 0);
}

uint64_t __72__TISmartInsertDeleteController__numberOfCharactersInSet_atEndOfString___block_invoke(uint64_t a1, unsigned __int16 a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "characterIsMember:", a2);
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  else
    *a3 = 1;
  return result;
}

uint64_t __78__TISmartInsertDeleteController__numberOfCharactersInSet_atBeginningOfString___block_invoke(uint64_t a1, unsigned __int16 a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "characterIsMember:", a2);
  if ((_DWORD)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  else
    *a3 = 1;
  return result;
}

@end
