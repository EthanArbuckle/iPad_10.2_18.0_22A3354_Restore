@implementation UIKBCacheToken

- (int)_writeArray:(id)a3 toStr:(char *)a4 maxLen:(int)a5
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  char *v15;
  BOOL v16;
  int v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a3;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v22;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = -[UIKBCacheToken _writeString:toStr:maxLen:](self, "_writeString:toStr:maxLen:", v13, &a4[v10], (a5 - v10))+ v10;
          v10 = v14 & ((int)v14 >> 31);
          v15 = &a4[v14 - 1];
          while (1)
          {
            v16 = __OFSUB__((_DWORD)v14, 1);
            LODWORD(v14) = v14 - 1;
            if ((int)v14 < 0 != v16)
              break;
            if (*v15--)
            {
              v10 = v14 + 1;
              break;
            }
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v13, "floatValue");
            v18 = -[UIKBCacheToken _writeNumber:toStr:](self, "_writeNumber:toStr:", &a4[v10]);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_16;
            objc_msgSend(v13, "UIEdgeInsetsValue");
            v18 = -[UIKBCacheToken _writeEdgeInsets:toStr:maxLen:](self, "_writeEdgeInsets:toStr:maxLen:", &a4[v10], (a5 - v10));
          }
          v10 += v18;
        }
LABEL_16:
        a4[v10++] = 59;
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (!v9)
        goto LABEL_20;
    }
  }
  v10 = 0;
LABEL_20:

  return v10;
}

- (int)_writeNumber:(float)a3 toStr:(char *)a4
{
  float v4;
  int v6;
  int result;
  char v8;
  float v9;
  float v10;
  int v11;

  v4 = (float)(int)a3;
  if ((int)a3 <= 9 && v4 == a3)
  {
    *a4 = (int)a3 + 48;
    return 1;
  }
  else
  {
    if (a3 >= 0.0)
    {
      v6 = 0;
    }
    else
    {
      *a4 = 45;
      a3 = -a3;
      v4 = (float)(int)a3;
      v6 = 1;
    }
    v8 = 0;
    v9 = 1.0;
    if (a3 != v4)
      v9 = 0.1;
    v10 = 1000000000.0;
    do
    {
      while (1)
      {
        v11 = (int)(float)(a3 / v10);
        if ((v8 & 1) == 0 && v11 < 1)
          break;
        if (v10 == 0.1)
          a4[v6++] = 46;
        result = v6 + 1;
        a4[v6] = v11 + 48;
        a3 = a3 - (float)(v10 * (float)v11);
        v10 = v10 / 10.0;
        v8 = 1;
        ++v6;
        if (v10 < v9)
          return result;
      }
      v8 = 0;
      v10 = v10 / 10.0;
    }
    while (v10 >= v9);
    result = v6 + 1;
    a4[v6] = 48;
  }
  return result;
}

- (int)_writeString:(id)a3 toStr:(char *)a4 maxLen:(int)a5
{
  int result;
  uint64_t v7;
  id v8;
  uint64_t v9;

  result = 0;
  if (a3)
  {
    if ((a5 & 0x80000000) == 0)
    {
      v9 = 0;
      v7 = a5;
      v8 = a3;
      objc_msgSend(v8, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", a4, v7, &v9, 4, 0, 0, objc_msgSend(v8, "length"), 0);

      return v9;
    }
  }
  return result;
}

- (int)_writeEdgeInsets:(UIEdgeInsets)a3 toStr:(char *)a4 maxLen:(int)a5
{
  double right;
  double bottom;
  double left;
  double top;
  int v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  int result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v11 = -[UIKBCacheToken _writeString:toStr:maxLen:](self, "_writeString:toStr:maxLen:", CFSTR("insets:{"), a4, *(_QWORD *)&a5);
  *(float *)&v12 = top;
  v13 = -[UIKBCacheToken _writeNumber:toStr:](self, "_writeNumber:toStr:", &a4[v11], v12) + (uint64_t)v11;
  a4[v13] = 44;
  *(float *)&v14 = left;
  v15 = (int)v13 + 1 + -[UIKBCacheToken _writeNumber:toStr:](self, "_writeNumber:toStr:", &a4[(int)v13 + 1], v14);
  a4[v15] = 44;
  *(float *)&v16 = bottom;
  v17 = (int)v15 + 1 + -[UIKBCacheToken _writeNumber:toStr:](self, "_writeNumber:toStr:", &a4[(int)v15 + 1], v16);
  a4[v17] = 44;
  *(float *)&v18 = right;
  v19 = (int)v17 + 1 + -[UIKBCacheToken _writeNumber:toStr:](self, "_writeNumber:toStr:", &a4[(int)v17 + 1], v18);
  result = v19 + 1;
  a4[v19] = 125;
  return result;
}

- (NSSet)transformationIdentifiers
{
  return self->_transformationIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformationIdentifiers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

- (id)stringForRenderFlags:(int64_t)a3 lightKeyboard:(BOOL)a4
{
  NSMutableArray *components;
  _QWORD v6[6];
  BOOL v7;

  components = self->_components;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__UIKBCacheToken_stringForRenderFlags_lightKeyboard___block_invoke;
  v6[3] = &unk_1E16CD8A8;
  v7 = a4;
  v6[4] = self;
  v6[5] = a3;
  -[UIKBCacheToken stringForComponentArray:additionalValues:](self, "stringForComponentArray:additionalValues:", components, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UIKBCacheToken)initWithComponents:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  UIKBCacheToken *v9;
  UIKBCacheToken *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIKBCacheToken;
  v9 = -[UIKBCacheToken init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_components, a3);
    objc_storeStrong((id *)&v10->_name, a4);
    v10->_emptyFields = 0;
  }

  return v10;
}

- (id)stringForComponentArray:(id)a3 additionalValues:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__UIKBCacheToken_stringForComponentArray_additionalValues___block_invoke;
  v12[3] = &unk_1E16CD880;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  -[UIKBCacheToken stringForConstruction:](self, "stringForConstruction:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)stringForConstruction:(id)a3
{
  int (**v5)(id, void *, uint64_t);
  void *v6;
  void *v7;

  v5 = (int (**)(id, void *, uint64_t))a3;
  if (!v5)
    goto LABEL_5;
  v6 = malloc_type_malloc(0x100uLL, 0xF8DE6785uLL);
  if (v6)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v6, v5[2](v5, v6, 256), 4, 1);
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIKBCacheToken.m"), 192, CFSTR("Invalid key string for token: %@"), self);

LABEL_5:
      v6 = 0;
    }
  }

  return v6;
}

uint64_t __59__UIKBCacheToken_stringForComponentArray_additionalValues___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = objc_msgSend(*(id *)(a1 + 32), "_writeArray:toStr:maxLen:", *(_QWORD *)(a1 + 40), a2, a3);
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    return (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, a2 + (int)v6, a3)
         + v6;
  return v6;
}

- (NSString)string
{
  return (NSString *)-[UIKBCacheToken stringForComponentArray:additionalValues:](self, "stringForComponentArray:additionalValues:", self->_components, 0);
}

uint64_t __53__UIKBCacheToken_stringForRenderFlags_lightKeyboard___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  int v5;
  double v6;

  LOBYTE(a3) = *(_BYTE *)(a1 + 48);
  *(float *)&a3 = (float)LODWORD(a3);
  v5 = objc_msgSend(*(id *)(a1 + 32), "_writeNumber:toStr:", a2, a3);
  *(_BYTE *)(a2 + v5) = 59;
  *(float *)&v6 = (float)*(int *)(a1 + 40);
  return v5 + objc_msgSend(*(id *)(a1 + 32), "_writeNumber:toStr:", a2 + 2, v6) + 1;
}

uint64_t __50__UIKBCacheToken_Key__stringWithAdditionalValues___block_invoke(uint64_t a1, uint64_t a2, int a3, double a4)
{
  int *v7;
  int v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  double v19;
  uint64_t v20;
  double *v21;
  double v22;
  uint64_t v23;
  double *v24;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t *v32;
  double v33;
  uint64_t v34;
  unint64_t *v35;
  double v36;
  uint64_t v37;
  double *v38;
  double v39;
  uint64_t v40;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) &= 0xFFFFFFu;
  v7 = *(int **)(a1 + 32);
  *(float *)&a4 = (float)v7[14];
  v8 = objc_msgSend(v7, "_writeNumber:toStr:", a2, a4);
  *(_BYTE *)(a2 + v8) = 59;
  v9 = (int)objc_msgSend(*(id *)(a1 + 32), "_writeString:toStr:maxLen:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), a2 + v8 + 1, (a3 - (v8 + 1)))+ (uint64_t)(v8 + 1);
  v11 = v9 + 1;
  *(_BYTE *)(a2 + v9) = 59;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(v12 + 72);
  if (v13)
  {
    v14 = objc_msgSend((id)v12, "_writeString:toStr:maxLen:", v13, a2 + v11, (a3 - v11)) + v11;
    LODWORD(v11) = v14 + 1;
    *(_BYTE *)(a2 + v14) = 59;
    v12 = *(_QWORD *)(a1 + 32);
  }
  v15 = *(_QWORD *)(v12 + 80);
  if (v15)
  {
    v16 = (int)objc_msgSend((id)v12, "_writeString:toStr:maxLen:", v15, a2 + (int)v11, (a3 - v11))
        + (uint64_t)(int)v11;
    LODWORD(v11) = v16 + 1;
    *(_BYTE *)(a2 + v16) = 59;
    v12 = *(_QWORD *)(a1 + 32);
  }
  *(float *)&v10 = (float)*(int *)(v12 + 88);
  v17 = (int)objc_msgSend((id)v12, "_writeNumber:toStr:", a2 + (int)v11, v10) + (uint64_t)(int)v11;
  *(_BYTE *)(a2 + v17) = 59;
  v18 = *(int **)(a1 + 32);
  *(float *)&v19 = (float)v18[23];
  v20 = (int)v17 + 1 + (int)objc_msgSend(v18, "_writeNumber:toStr:", a2 + (int)v17 + 1, v19);
  *(_BYTE *)(a2 + v20) = 59;
  v21 = *(double **)(a1 + 32);
  v22 = v21[12];
  *(float *)&v22 = v22;
  v23 = (int)v20 + 1 + (int)objc_msgSend(v21, "_writeNumber:toStr:", a2 + (int)v20 + 1, v22);
  *(_BYTE *)(a2 + v23) = 59;
  v24 = *(double **)(a1 + 32);
  v25 = v24[13];
  *(float *)&v25 = v25;
  v26 = (int)v23 + 1 + (int)objc_msgSend(v24, "_writeNumber:toStr:", a2 + (int)v23 + 1, v25);
  v28 = (int)v26 + 1;
  *(_BYTE *)(a2 + v26) = 59;
  v29 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v29 + 136))
  {
    v30 = v28
        + (int)objc_msgSend((id)v29, "_writeEdgeInsets:toStr:maxLen:", a2 + (int)v28, (a3 - v28), *(double *)(v29 + 144), *(double *)(v29 + 152), *(double *)(v29 + 160), *(double *)(v29 + 168));
    LODWORD(v28) = v30 + 1;
    *(_BYTE *)(a2 + v30) = 59;
    v29 = *(_QWORD *)(a1 + 32);
  }
  *(float *)&v27 = (float)*(unsigned int *)(v29 + 112);
  v31 = (int)objc_msgSend((id)v29, "_writeNumber:toStr:", a2 + (int)v28, v27) + (uint64_t)(int)v28;
  *(_BYTE *)(a2 + v31) = 59;
  v32 = *(unint64_t **)(a1 + 32);
  *(float *)&v33 = (float)v32[15];
  v34 = (int)v31 + 1 + (int)objc_msgSend(v32, "_writeNumber:toStr:", a2 + (int)v31 + 1, v33);
  *(_BYTE *)(a2 + v34) = 59;
  v35 = *(unint64_t **)(a1 + 32);
  *(float *)&v36 = (float)v35[16];
  v37 = (int)v34 + 1 + (int)objc_msgSend(v35, "_writeNumber:toStr:", a2 + (int)v34 + 1, v36);
  if (*(double *)(*(_QWORD *)(a1 + 32) + 24) > 0.0)
  {
    *(_BYTE *)(a2 + v37) = 59;
    v38 = *(double **)(a1 + 32);
    v39 = v38[3];
    *(float *)&v39 = v39;
    v37 = objc_msgSend(v38, "_writeNumber:toStr:", a2 + (int)v37 + 1, v39) + (_DWORD)v37 + 1;
  }
  v40 = *(_QWORD *)(a1 + 40);
  if (v40)
    return (*(unsigned int (**)(uint64_t, uint64_t, _QWORD))(v40 + 16))(v40, a2 + (int)v37, (a3 - v37))+ v37;
  return v37;
}

uint64_t __57__UIKBCacheToken_Key_stringForRenderFlags_lightKeyboard___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  int v5;
  double v6;

  *a2 = 59;
  LOBYTE(a3) = *(_BYTE *)(a1 + 48);
  *(float *)&a3 = (float)LODWORD(a3);
  v5 = objc_msgSend(*(id *)(a1 + 32), "_writeNumber:toStr:", a2 + 1, a3);
  a2[v5 + 1] = 59;
  *(float *)&v6 = (float)*(int *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_writeNumber:toStr:", &a2[v5 + 2], v6) + v5 + 2;
}

- (UIKBCacheToken)initWithName:(id)a3
{
  return -[UIKBCacheToken initWithComponents:name:](self, "initWithComponents:name:", 0, a3);
}

+ (id)tokenForKey:(id)a3 style:(id)a4
{
  return +[UIKBCacheToken_Key tokenForKey:style:](UIKBCacheToken_Key, "tokenForKey:style:", a3, *(_QWORD *)&a4);
}

uint64_t __56__UIKBCacheToken_Keyplane_stringForSplitState_handBias___block_invoke(uint64_t a1, uint64_t a2, int a3, double a4)
{
  int v7;
  double *v8;
  double v9;
  int v10;
  uint64_t v11;
  double *v12;
  double v13;
  uint64_t v14;
  int v15;
  int v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double *v39;
  double v40;

  if (*(_BYTE *)(a1 + 48))
  {
    v7 = 0;
  }
  else
  {
    v8 = *(double **)(a1 + 32);
    v9 = v8[7];
    *(float *)&v9 = v9;
    v10 = objc_msgSend(v8, "_writeNumber:toStr:", a2, v9);
    *(_BYTE *)(a2 + v10) = 59;
    v11 = v10 + 1;
    v12 = *(double **)(a1 + 32);
    v13 = v12[8];
    *(float *)&v13 = v13;
    v14 = (int)objc_msgSend(v12, "_writeNumber:toStr:", a2 + v11, v13) + (uint64_t)(int)v11;
    v15 = v14 + 1;
    *(_BYTE *)(a2 + v14) = 59;
    v16 = objc_msgSend(*(id *)(a1 + 32), "_writeString:toStr:maxLen:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), a2 + v14 + 1, (a3 - (v14 + 1)));
    v7 = v16 + v15 + 1;
    *(_BYTE *)(a2 + v16 + v15) = 59;
  }
  v17 = *(int **)(a1 + 32);
  *(float *)&a4 = (float)v17[18];
  v18 = (int)objc_msgSend(v17, "_writeNumber:toStr:", a2 + v7, a4) + (uint64_t)v7;
  *(_BYTE *)(a2 + v18) = 59;
  v19 = (int)v18
      + 1
      + (int)objc_msgSend(*(id *)(a1 + 32), "_writeString:toStr:maxLen:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), a2 + (int)v18 + 1, (a3 - (v18 + 1)));
  v20 = (int)v19 + 1;
  *(_BYTE *)(a2 + v19) = 59;
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "preferencesActions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "BOOLForPreferenceKey:", CFSTR("GesturesEnabled"));

  v24 = *(_QWORD **)(a1 + 32);
  if (v23)
  {
    v25 = v24[12];
    if (v25)
    {
      v26 = v20 + (int)objc_msgSend(v24, "_writeString:toStr:maxLen:", v25, a2 + (int)v20, (a3 - v20));
      *(_BYTE *)(a2 + v26) = 59;
      v27 = (int)v26
          + 1
          + (int)objc_msgSend(*(id *)(a1 + 32), "_writeString:toStr:maxLen:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), a2 + (int)v26 + 1, (a3 - (v26 + 1)));
      LODWORD(v20) = v27 + 1;
      *(_BYTE *)(a2 + v27) = 59;
      v24 = *(_QWORD **)(a1 + 32);
    }
  }
  v28 = v24[13];
  if (v28)
  {
    v29 = (int)objc_msgSend(v24, "_writeString:toStr:maxLen:", v28, a2 + (int)v20, (a3 - v20))
        + (uint64_t)(int)v20;
    LODWORD(v20) = v29 + 1;
    *(_BYTE *)(a2 + v29) = 59;
    v24 = *(_QWORD **)(a1 + 32);
  }
  if (*(_BYTE *)(a1 + 48))
    v30 = CFSTR("split");
  else
    v30 = CFSTR("default");
  v31 = (int)objc_msgSend(v24, "_writeString:toStr:maxLen:", v30, a2 + (int)v20, (a3 - v20))
      + (uint64_t)(int)v20;
  v32 = *(_QWORD *)(a1 + 40);
  if (v32)
  {
    if (v32 == 2)
      v33 = CFSTR("left");
    else
      v33 = CFSTR("right");
    LODWORD(v31) = objc_msgSend(*(id *)(a1 + 32), "_writeString:toStr:maxLen:", v33, a2 + v31, (a3 - v31))
                 + v31;
  }
  v34 = (int)v31 + 1;
  *(_BYTE *)(a2 + (int)v31) = 59;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    v35 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allObjects");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "componentsJoinedByString:", CFSTR(","));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR("t:%@;"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = objc_msgSend(*(id *)(a1 + 32), "_writeString:toStr:maxLen:", v38, a2 + v34, (a3 - v34))+ v34;
  }
  v39 = *(double **)(a1 + 32);
  v40 = v39[3];
  if (v40 > 0.0)
  {
    *(float *)&v40 = v40;
    return objc_msgSend(v39, "_writeNumber:toStr:", a2 + (int)v34, v40) + v34;
  }
  return v34;
}

+ (id)tokenForKeyplane:(id)a3
{
  return +[UIKBCacheToken_Keyplane tokenForKeyplane:](UIKBCacheToken_Keyplane, "tokenForKeyplane:", a3);
}

- (void)setTransformationIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_transformationIdentifiers, a3);
}

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (int)rowHint
{
  return 0;
}

- (int)displayHint
{
  return 0;
}

- ($5C396DA91E87D63640AC871340DC94CC)styling
{
  return ($5C396DA91E87D63640AC871340DC94CC)0;
}

- (BOOL)isUsableForCacheToken:(id)a3 withRenderFlags:(int64_t)a4
{
  return 0;
}

- (BOOL)hasKey
{
  return 0;
}

- (id)stringForKey:(id)a3 state:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (-[UIKBCacheToken emptyFields](self, "emptyFields") == 1)
  {
    -[UIKBCacheToken stringForState:](self, "stringForState:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[UIKBCacheToken string](self, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cacheDisplayString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@ %d %d %d"), 0, v10, objc_msgSend(v6, "displayTypeHint"), v4, objc_msgSend(v6, "clipCorners"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)stringForState:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[UIKBCacheToken string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%d"), 0, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stringForSplitState:(BOOL)a3 handBias:(int64_t)a4
{
  _BOOL4 v5;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a3;
  v7 = -[NSMutableArray count](self->_components, "count");
  if (v5)
    v8 = CFSTR("split");
  else
    v8 = CFSTR("default");
  if (v5)
    v9 = 3;
  else
    v9 = 0;
  if (v5)
    v10 = v7 - 3;
  else
    v10 = v7;
  -[NSMutableArray subarrayWithRange:](self->_components, "subarrayWithRange:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBCacheToken stringForComponentArray:additionalValues:](self, "stringForComponentArray:additionalValues:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (a4)
  {
    v15 = CFSTR("right");
    if (a4 == 2)
      v15 = CFSTR("left");
    objc_msgSend(v13, "appendFormat:", CFSTR("_%@"), v15);
  }
  if (-[NSSet count](self->_transformationIdentifiers, "count"))
  {
    -[NSSet allObjects](self->_transformationIdentifiers, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR(","));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendFormat:", CFSTR("t:%@;"), v17);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@"), 0, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)tokenForKey:(id)a3 style:(id)a4 displayInsets:(UIEdgeInsets)a5
{
  return +[UIKBCacheToken_Key tokenForKey:style:displayInsets:](UIKBCacheToken_Key, "tokenForKey:style:displayInsets:", a3, *(_QWORD *)&a4, a5.top, a5.left, a5.bottom, a5.right);
}

+ (id)tokenForKeyMask:(id)a3 style:(id)a4 displayInsets:(UIEdgeInsets)a5
{
  return +[UIKBCacheToken_KeyMask tokenForKey:style:displayInsets:](UIKBCacheToken_KeyMask, "tokenForKey:style:displayInsets:", a3, *(_QWORD *)&a4, a5.top, a5.left, a5.bottom, a5.right);
}

+ (id)tokenTemplateForKey:(id)a3 style:(int)a4 size:(CGSize)a5
{
  double height;
  double width;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;

  height = a5.height;
  width = a5.width;
  v7 = *(_QWORD *)&a4;
  v8 = a3;
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKBCacheToken tokenTemplateForKey:name:style:size:](UIKBCacheToken, "tokenTemplateForKey:name:style:size:", v8, v9, v7, width, height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)tokenTemplateForKey:(id)a3 name:(id)a4 style:(int)a5 size:(CGSize)a6
{
  return +[UIKBCacheToken_KeyTemplate tokenTemplateForKey:name:style:size:](UIKBCacheToken_KeyTemplate, "tokenTemplateForKey:name:style:size:", a3, a4, *(_QWORD *)&a5, a6.width, a6.height);
}

+ (id)tokenTemplateFilledForKey:(id)a3 style:(int)a4 size:(CGSize)a5
{
  return +[UIKBCacheToken_KeyFilledTemplate tokenTemplateFilledForKey:style:size:](UIKBCacheToken_KeyFilledTemplate, "tokenTemplateFilledForKey:style:size:", a3, *(_QWORD *)&a4, a5.width, a5.height);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIKBCacheToken;
  -[UIKBCacheToken description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBCacheToken string](self, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" <%@>"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (int)emptyFields
{
  return self->_emptyFields;
}

- (void)setEmptyFields:(int)a3
{
  self->_emptyFields = a3;
}

- (int64_t)renderFlags
{
  return self->_renderFlags;
}

- (void)setRenderFlags:(int64_t)a3
{
  self->_renderFlags = a3;
}

uint64_t __54__UIKBCacheToken_KeyMask__stringWithAdditionalValues___block_invoke(uint64_t a1, uint64_t a2, int a3, double a4)
{
  int *v7;
  int v8;
  uint64_t v9;
  double *v10;
  double v11;
  uint64_t v12;
  double *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  double v18;
  uint64_t v19;
  unint64_t *v20;
  double v21;
  uint64_t v22;
  unint64_t *v23;
  double v24;
  uint64_t v25;
  double *v26;
  double v27;
  uint64_t v28;

  v7 = *(int **)(a1 + 32);
  *(float *)&a4 = (float)v7[14];
  v8 = objc_msgSend(v7, "_writeNumber:toStr:", a2, a4);
  v9 = v8 + 1;
  *(_BYTE *)(a2 + v8) = 59;
  v10 = *(double **)(a1 + 32);
  v11 = v10[12];
  *(float *)&v11 = v11;
  v12 = (int)objc_msgSend(v10, "_writeNumber:toStr:", a2 + v9, v11) + (uint64_t)(int)v9;
  *(_BYTE *)(a2 + v12) = 59;
  v13 = *(double **)(a1 + 32);
  v14 = v13[13];
  *(float *)&v14 = v14;
  v15 = (int)objc_msgSend(v13, "_writeNumber:toStr:", a2 + v12 + 1, v14) + (uint64_t)((int)v12 + 1);
  *(_BYTE *)(a2 + v15) = 59;
  v16 = (int)objc_msgSend(*(id *)(a1 + 32), "_writeEdgeInsets:toStr:maxLen:", a2 + v15 + 1, (a3 - (v15 + 1)), *(double *)(*(_QWORD *)(a1 + 32) + 144), *(double *)(*(_QWORD *)(a1 + 32) + 152), *(double *)(*(_QWORD *)(a1 + 32) + 160), *(double *)(*(_QWORD *)(a1 + 32) + 168))+ (uint64_t)((int)v15 + 1);
  *(_BYTE *)(a2 + v16) = 59;
  v17 = *(unsigned int **)(a1 + 32);
  *(float *)&v18 = (float)v17[28];
  v19 = (int)objc_msgSend(v17, "_writeNumber:toStr:", a2 + v16 + 1, v18) + (uint64_t)((int)v16 + 1);
  *(_BYTE *)(a2 + v19) = 59;
  v20 = *(unint64_t **)(a1 + 32);
  *(float *)&v21 = (float)v20[15];
  v22 = (int)objc_msgSend(v20, "_writeNumber:toStr:", a2 + v19 + 1, v21) + (uint64_t)((int)v19 + 1);
  *(_BYTE *)(a2 + v22) = 59;
  v23 = *(unint64_t **)(a1 + 32);
  *(float *)&v24 = (float)v23[16];
  v25 = (int)objc_msgSend(v23, "_writeNumber:toStr:", a2 + v22 + 1, v24) + (uint64_t)((int)v22 + 1);
  if (*(double *)(*(_QWORD *)(a1 + 32) + 24) > 0.0)
  {
    *(_BYTE *)(a2 + v25) = 59;
    v26 = *(double **)(a1 + 32);
    v27 = v26[3];
    *(float *)&v27 = v27;
    v25 = objc_msgSend(v26, "_writeNumber:toStr:", a2 + v25 + 1, v27) + (_DWORD)v25 + 1;
  }
  v28 = *(_QWORD *)(a1 + 40);
  if (v28)
    return (*(unsigned int (**)(uint64_t, uint64_t, _QWORD))(v28 + 16))(v28, a2 + (int)v25, (a3 - v25))+ v25;
  return v25;
}

uint64_t __58__UIKBCacheToken_KeyTemplate__stringWithAdditionalValues___block_invoke(uint64_t a1, uint64_t a2, int a3, double a4)
{
  int *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  double v18;
  uint64_t v19;
  double *v20;
  double v21;
  uint64_t v22;
  double *v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double *v28;
  double v29;
  uint64_t v30;

  v7 = *(int **)(a1 + 32);
  *(float *)&a4 = (float)v7[14];
  v8 = objc_msgSend(v7, "_writeNumber:toStr:", a2, a4);
  *(_BYTE *)(a2 + v8) = 59;
  v9 = (int)objc_msgSend(*(id *)(a1 + 32), "_writeString:toStr:maxLen:", CFSTR("%@"), a2 + v8 + 1, (a3 - (v8 + 1)))+ (uint64_t)(v8 + 1);
  v10 = v9 + 1;
  *(_BYTE *)(a2 + v9) = 59;
  v11 = *(_QWORD **)(a1 + 32);
  v12 = v11[9];
  if (v12)
  {
    v13 = objc_msgSend(v11, "_writeString:toStr:maxLen:", v12, a2 + v10, (a3 - v10)) + v10;
    LODWORD(v10) = v13 + 1;
    *(_BYTE *)(a2 + v13) = 59;
    v11 = *(_QWORD **)(a1 + 32);
  }
  v14 = v11[10];
  if (v14)
  {
    v15 = (int)objc_msgSend(v11, "_writeString:toStr:maxLen:", v14, a2 + (int)v10, (a3 - v10))
        + (uint64_t)(int)v10;
    LODWORD(v10) = v15 + 1;
    *(_BYTE *)(a2 + v15) = 59;
    v11 = *(_QWORD **)(a1 + 32);
  }
  v16 = (int)objc_msgSend(v11, "_writeString:toStr:maxLen:", CFSTR("%d"), a2 + (int)v10, (a3 - v10))
      + (uint64_t)(int)v10;
  *(_BYTE *)(a2 + v16) = 59;
  v17 = *(int **)(a1 + 32);
  *(float *)&v18 = (float)v17[23];
  v19 = (int)v16 + 1 + (int)objc_msgSend(v17, "_writeNumber:toStr:", a2 + (int)v16 + 1, v18);
  *(_BYTE *)(a2 + v19) = 59;
  v20 = *(double **)(a1 + 32);
  v21 = v20[12];
  *(float *)&v21 = v21;
  v22 = (int)v19 + 1 + (int)objc_msgSend(v20, "_writeNumber:toStr:", a2 + (int)v19 + 1, v21);
  *(_BYTE *)(a2 + v22) = 59;
  v23 = *(double **)(a1 + 32);
  v24 = v23[13];
  *(float *)&v24 = v24;
  v25 = (int)v22 + 1 + (int)objc_msgSend(v23, "_writeNumber:toStr:", a2 + (int)v22 + 1, v24);
  *(_BYTE *)(a2 + v25) = 59;
  v26 = (int)v25
      + 1
      + (int)objc_msgSend(*(id *)(a1 + 32), "_writeString:toStr:maxLen:", CFSTR("%d"), a2 + (int)v25 + 1, (a3 - (v25 + 1)));
  *(_BYTE *)(a2 + v26) = 59;
  v27 = (int)v26
      + 1
      + (int)objc_msgSend(*(id *)(a1 + 32), "_writeString:toStr:maxLen:", CFSTR("%d"), a2 + (int)v26 + 1, (a3 - (v26 + 1)));
  if (*(double *)(*(_QWORD *)(a1 + 32) + 24) > 0.0)
  {
    *(_BYTE *)(a2 + v27) = 59;
    v28 = *(double **)(a1 + 32);
    v29 = v28[3];
    *(float *)&v29 = v29;
    v27 = objc_msgSend(v28, "_writeNumber:toStr:", a2 + (int)v27 + 1, v29) + (_DWORD)v27 + 1;
  }
  v30 = *(_QWORD *)(a1 + 40);
  if (v30)
    return (*(unsigned int (**)(uint64_t, uint64_t, _QWORD))(v30 + 16))(v30, a2 + (int)v27, (a3 - v27))+ v27;
  return v27;
}

uint64_t __64__UIKBCacheToken_KeyFilledTemplate__stringWithAdditionalValues___block_invoke(uint64_t a1, uint64_t a2, int a3, double a4)
{
  int *v7;
  int v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int *v16;
  double v17;
  uint64_t v18;
  double *v19;
  double v20;
  uint64_t v21;
  double *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  double *v26;
  double v27;
  uint64_t v28;

  v7 = *(int **)(a1 + 32);
  *(float *)&a4 = (float)v7[14];
  v8 = objc_msgSend(v7, "_writeNumber:toStr:", a2, a4);
  *(_BYTE *)(a2 + v8) = 59;
  v9 = (int)objc_msgSend(*(id *)(a1 + 32), "_writeString:toStr:maxLen:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), a2 + v8 + 1, (a3 - (v8 + 1)))+ (uint64_t)(v8 + 1);
  v11 = v9 + 1;
  *(_BYTE *)(a2 + v9) = 59;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_QWORD *)(v12 + 72);
  if (v13)
  {
    v14 = objc_msgSend((id)v12, "_writeString:toStr:maxLen:", v13, a2 + v11, (a3 - v11)) + v11;
    LODWORD(v11) = v14 + 1;
    *(_BYTE *)(a2 + v14) = 59;
    v12 = *(_QWORD *)(a1 + 32);
  }
  *(float *)&v10 = (float)*(int *)(v12 + 88);
  v15 = (int)objc_msgSend((id)v12, "_writeNumber:toStr:", a2 + (int)v11, v10) + (uint64_t)(int)v11;
  *(_BYTE *)(a2 + v15) = 59;
  v16 = *(int **)(a1 + 32);
  *(float *)&v17 = (float)v16[23];
  v18 = (int)v15 + 1 + (int)objc_msgSend(v16, "_writeNumber:toStr:", a2 + (int)v15 + 1, v17);
  *(_BYTE *)(a2 + v18) = 59;
  v19 = *(double **)(a1 + 32);
  v20 = v19[12];
  *(float *)&v20 = v20;
  v21 = (int)v18 + 1 + (int)objc_msgSend(v19, "_writeNumber:toStr:", a2 + (int)v18 + 1, v20);
  *(_BYTE *)(a2 + v21) = 59;
  v22 = *(double **)(a1 + 32);
  v23 = v22[13];
  *(float *)&v23 = v23;
  v24 = (int)v21 + 1 + (int)objc_msgSend(v22, "_writeNumber:toStr:", a2 + (int)v21 + 1, v23);
  *(_BYTE *)(a2 + v24) = 59;
  v25 = (int)v24
      + 1
      + (int)objc_msgSend(*(id *)(a1 + 32), "_writeString:toStr:maxLen:", CFSTR("%d"), a2 + (int)v24 + 1, (a3 - (v24 + 1)));
  if (*(double *)(*(_QWORD *)(a1 + 32) + 24) > 0.0)
  {
    *(_BYTE *)(a2 + v25) = 59;
    v26 = *(double **)(a1 + 32);
    v27 = v26[3];
    *(float *)&v27 = v27;
    v25 = objc_msgSend(v26, "_writeNumber:toStr:", a2 + (int)v25 + 1, v27) + (_DWORD)v25 + 1;
  }
  v28 = *(_QWORD *)(a1 + 40);
  if (v28)
    return (*(unsigned int (**)(uint64_t, uint64_t, _QWORD))(v28 + 16))(v28, a2 + (int)v25, (a3 - v25))+ v25;
  return v25;
}

@end
