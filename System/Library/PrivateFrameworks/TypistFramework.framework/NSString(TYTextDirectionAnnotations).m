@implementation NSString(TYTextDirectionAnnotations)

- (id)textDirectionAnnotations
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, unint64_t, uint64_t, uint64_t);
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD14A8], "numberCombiningCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDFD70]), "initWithUnit:", 0);
  v5 = objc_alloc_init(MEMORY[0x24BDDFD50]);
  objc_msgSend(v4, "setString:", a1);
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v6 = objc_msgSend(a1, "length");
  v27 = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = __64__NSString_TYTextDirectionAnnotations__textDirectionAnnotations__block_invoke;
  v30 = &unk_251A7CBA0;
  v31 = a1;
  v35 = &v42;
  v7 = v5;
  v32 = v7;
  v36 = &v46;
  v37 = &v38;
  v8 = v3;
  v33 = v8;
  v9 = v2;
  v34 = v9;
  objc_msgSend(v4, "enumerateTokensInRange:usingBlock:", 0, v6, &v27);
  v10 = v43[3];
  if (v10 < objc_msgSend(a1, "length", v27, v28, v29, v30, v31))
  {
    v11 = v43[3];
    v12 = objc_msgSend(a1, "length");
    v13 = v12 - v43[3];
    objc_msgSend(a1, "substringWithRange:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processString:", v14);
    v15 = (void *)MEMORY[0x24BDBCEA0];
    objc_msgSend(v7, "dominantLanguage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "characterDirectionForLanguage:", v16);

    if (*((_BYTE *)v39 + 24)
      && (v17 != 2
       || (objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet"),
           v18 = (void *)objc_claimAutoreleasedReturnValue(),
           objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", v14),
           v19 = (void *)objc_claimAutoreleasedReturnValue(),
           v20 = objc_msgSend(v18, "isSupersetOfSet:", v19),
           v19,
           v18,
           v20)))
    {
      objc_msgSend(v9, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "range");
      objc_msgSend(v21, "range");
      objc_msgSend(v21, "setRange:", v22, v23 + v13);
    }
    else
    {
      +[TYTextDirectionAnnotation initWithRange:textDirection:](TYTextDirectionAnnotation, "initWithRange:textDirection:", v11, v13, v47[3]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v21);
    }

  }
  v24 = v34;
  v25 = v9;

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  return v25;
}

@end
