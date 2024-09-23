@implementation PXMemoriesTitleHelper

- (PXMemoriesTitleHelper)init
{
  PXMemoriesTitleHelper *v2;
  PXMemoriesTitleHelper *v3;
  NSString *softLineBreak;
  NSString *truncationToken;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXMemoriesTitleHelper;
  v2 = -[PXMemoriesTitleHelper init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    softLineBreak = v2->_softLineBreak;
    v2->_softLineBreak = (NSString *)CFSTR("\n");

    truncationToken = v3->_truncationToken;
    v3->_truncationToken = (NSString *)CFSTR("…");

    v3->_preferredLineLength = 11;
    v3->_minimumScaleFactor = 0.600000024;
  }
  return v3;
}

- (id)displayableTextForTitle:(id)a3 intent:(int64_t)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = v6;
  if ((unint64_t)a4 <= 2)
  {
    v8 = off_2514CF888[a4];
    -[PXMemoriesTitleHelper softLineBreak](self, "softLineBreak");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\u2028"), v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)titleForDisplayableText:(id)a3 titleCategory:(int64_t)a4 options:(unint64_t)a5
{
  char v5;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v30;
  id v31;
  id v32;
  PXMemoriesTitleHelper *v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  unint64_t v45;
  void (*v46)(uint64_t);
  id v47;
  _QWORD v48[4];
  _QWORD v49[5];

  v5 = a5;
  v8 = a3;
  v9 = v8;
  if (-[PXMemoriesTitleHelper _isTextLongerThanPreferredLine:range:minimumScaleFactor:](self, "_isTextLongerThanPreferredLine:range:minimumScaleFactor:", v8, 0, objc_msgSend(v8, "length"), 1.0))
  {
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v18, "mutableCopy");

      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "formUnionWithCharacterSet:", v20);

      objc_msgSend(v19, "removeCharactersInString:", CFSTR(")]}"));
      v48[0] = 0;
      v48[1] = v48;
      v48[2] = 0x2020000000;
      v48[3] = 0;
      v42 = 0;
      v43 = &v42;
      v44 = 0x3032000000;
      v45 = (unint64_t)__Block_byref_object_copy_;
      v46 = __Block_byref_object_dispose_;
      v47 = 0;
      v38 = 0;
      v39 = &v38;
      v40 = 0x2020000000;
      v41 = 0;
      v21 = objc_msgSend(v8, "length");
      v27 = MEMORY[0x24BDAC760];
      v28 = 3221225472;
      v29 = __71__PXMemoriesTitleHelper_titleForDisplayableText_titleCategory_options___block_invoke_14;
      v30 = &unk_2514CF868;
      v34 = v48;
      v22 = v19;
      v31 = v22;
      v9 = v8;
      v32 = v9;
      v33 = self;
      v36 = &v38;
      v37 = a4;
      v35 = &v42;
      objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v21, 3, &v27);
      v23 = (void *)v43[5];
      if (v23)
      {
        v24 = v23;

        if (*((_BYTE *)v39 + 24))
        {
          -[PXMemoriesTitleHelper truncationToken](self, "truncationToken", v27, v28, v29, v30, v31);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringByAppendingString:", v25);
          v9 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v9 = v24;
        }
      }

      _Block_object_dispose(&v38, 8);
      _Block_object_dispose(&v42, 8);

      _Block_object_dispose(v48, 8);
    }
    else
    {
      v42 = 0;
      v43 = &v42;
      v44 = 0x2020000000;
      v45 = 0;
      v45 = (unint64_t)objc_msgSend(v8, "length") >> 1;
      v10 = objc_msgSend(v8, "length");
      v49[0] = MEMORY[0x24BDAC760];
      v49[1] = 3221225472;
      v49[2] = __71__PXMemoriesTitleHelper_titleForDisplayableText_titleCategory_options___block_invoke;
      v49[3] = &unk_2514CF840;
      v49[4] = &v42;
      objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 3, v49);
      v11 = v43[3];
      if (v11 < objc_msgSend(v8, "length"))
      {
        objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("([{"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v43[3];
        if (v13 >= 2)
        {
          do
          {
            if (!objc_msgSend(v12, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", v13 - 1)))
              break;
            v14 = v43[3];
            v13 = v14 - 1;
            v43[3] = v14 - 1;
          }
          while (v14 > 2);
        }

      }
      v15 = v43[3];
      v9 = v8;
      if (v15 >= 1)
      {
        v9 = v8;
        if (v15 < (unint64_t)objc_msgSend(v8, "length"))
        {
          v16 = v43[3];
          -[PXMemoriesTitleHelper softLineBreak](self, "softLineBreak");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringByReplacingCharactersInRange:withString:", v16, 0, v17);
          v9 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      _Block_object_dispose(&v42, 8);
    }
  }

  return v9;
}

- (BOOL)_isTextLongerThanPreferredLine:(id)a3 range:(_NSRange)a4 minimumScaleFactor:(double)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (length >= 2)
  {
    v11 = length;
    v12 = location;
    while (objc_msgSend(v10, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", v12)))
    {
      ++v12;
      if (--v11 <= 1)
      {
        length = 1;
        goto LABEL_11;
      }
    }
    v13 = 0;
    v14 = length + location - 1;
    length = 1;
    while (objc_msgSend(v10, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", v14 + v13)))
    {
      if (--v13 + v11 <= 1)
        goto LABEL_11;
    }
    length = v11 + v13;
  }
LABEL_11:
  v15 = 1.0 / a5 * (double)-[PXMemoriesTitleHelper preferredLineLength](self, "preferredLineLength") < (double)length;

  return v15;
}

- (NSString)softLineBreak
{
  return self->_softLineBreak;
}

- (void)setSoftLineBreak:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)truncationToken
{
  return self->_truncationToken;
}

- (void)setTruncationToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)preferredLineLength
{
  return self->_preferredLineLength;
}

- (void)setPreferredLineLength:(int64_t)a3
{
  self->_preferredLineLength = a3;
}

- (double)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (void)setMinimumScaleFactor:(double)a3
{
  self->_minimumScaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truncationToken, 0);
  objc_storeStrong((id *)&self->_softLineBreak, 0);
}

uint64_t __71__PXMemoriesTitleHelper_titleForDisplayableText_titleCategory_options___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, _BYTE *a7)
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v10;

  v7 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v8 = *(_QWORD *)(v7 + 24);
  if (v8 >= a5 && v8 - a5 < a6)
  {
    if (v8 >= a3 + (a4 >> 1))
      v10 = a6;
    else
      v10 = 0;
    *(_QWORD *)(v7 + 24) = a5 + v10;
    *a7 = 1;
  }
  return result;
}

void __71__PXMemoriesTitleHelper_titleForDisplayableText_titleCategory_options___block_invoke_14(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;

  v11 = a2;
  if ((uint64_t)++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >= 2)
  {
    v30 = v11;
    v12 = a5 + a6;
    do
    {
      v13 = v12;
      if (v12 < 2)
        break;
      --v12;
    }
    while ((objc_msgSend(*(id *)(a1 + 32), "characterIsMember:", objc_msgSend(*(id *)(a1 + 40), "characterAtIndex:", v13 - 1)) & 1) != 0);
    if (v13 == objc_msgSend(*(id *)(a1 + 40), "length") - 1)
      v14 = v13 + 1;
    else
      v14 = v13;
    v15 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "substringToIndex:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "titleForDisplayableText:titleCategory:options:", v16, *(_QWORD *)(a1 + 80), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v14 < objc_msgSend(*(id *)(a1 + 40), "length");
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v21 = *(_QWORD *)(v19 + 40);
    v20 = (id *)(v19 + 40);
    if (v21)
    {
      objc_msgSend(*(id *)(a1 + 48), "softLineBreak");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v17, "rangeOfString:options:", v22, 4);
      v25 = v24;

      v26 = objc_msgSend(v17, "length");
      if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v27 = v23 + v25;
        v28 = v26 - v27;
        v29 = *(void **)(a1 + 48);
        objc_msgSend(v29, "minimumScaleFactor");
        if (objc_msgSend(v29, "_isTextLongerThanPreferredLine:range:minimumScaleFactor:", v17, v27, v28))
        {
          *a7 = 1;
LABEL_14:

          v11 = v30;
          goto LABEL_15;
        }
      }
      v20 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    }
    objc_storeStrong(v20, v17);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v18;
    goto LABEL_14;
  }
LABEL_15:

}

+ (PXMemoriesTitleHelper)defaultHelper
{
  if (defaultHelper_onceToken != -1)
    dispatch_once(&defaultHelper_onceToken, &__block_literal_global_2696);
  return (PXMemoriesTitleHelper *)(id)defaultHelper_defaultHelper;
}

void __38__PXMemoriesTitleHelper_defaultHelper__block_invoke()
{
  PXMemoriesTitleHelper *v0;
  void *v1;

  v0 = objc_alloc_init(PXMemoriesTitleHelper);
  v1 = (void *)defaultHelper_defaultHelper;
  defaultHelper_defaultHelper = (uint64_t)v0;

}

@end
