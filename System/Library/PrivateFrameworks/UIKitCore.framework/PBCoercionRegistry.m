@implementation PBCoercionRegistry

void __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;

  v5 = a4;
  +[_UIInterprocessKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](_UIInterprocessKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD, _QWORD))v5 + 2))(v5, v6, 0, 0);

}

void __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_2(uint64_t a1, uint64_t a2, UIImage *a3, void *a4)
{
  id v5;
  id v6;

  v5 = a4;
  UIImagePNGRepresentation(a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD, _QWORD))v5 + 2))(v5, v6, 0, 0);

}

void __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;

  v5 = a4;
  _UIImageJPEGRepresentation(a3, 0, 0.8);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD, _QWORD))v5 + 2))(v5, v6, 0, 0);

}

id __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, _QWORD *a6)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v10 && v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v11);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v10)
  {
    v15 = 0;
    v14 = 0;
    if (!a6)
      goto LABEL_12;
    goto LABEL_11;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v10, 0);
  objc_msgSend(v13, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CB2CD0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "finishDecoding");
  if (v14)
  {
    v15 = 0;
  }
  else
  {
    PBCannotInstantiateObjectOfClassError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
  }

  if (a6)
LABEL_11:
    *a6 = objc_retainAutorelease(v15);
LABEL_12:

  return v14;
}

UIImage *__57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, _QWORD *a6)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  UIImage *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v10 && v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v11);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v10)
  {
    v13 = -[UIImage initWithData:]([UIImage alloc], "initWithData:", v10);
    if (!a6)
      goto LABEL_10;
  }
  else
  {
    v13 = 0;
    if (!a6)
      goto LABEL_10;
  }
  if (!v13)
  {
    PBCannotInstantiateObjectOfClassError();
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:

  return v13;
}

uint64_t __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD aBlock[4];
  id v7;

  v2 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_11;
  aBlock[3] = &unk_1E16DA470;
  v7 = v2;
  v3 = v2;
  v4 = _Block_copy(aBlock);

  return v4;
}

void __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_11(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void (**v9)(id, void *, _QWORD, id);
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)off_1E1678FA0)
  {
    objc_msgSend(v8, "string");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dataUsingEncoding:", 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
  }
  else
  {
    v10 = objc_msgSend(v8, "length");
    v11 = *(_QWORD *)(a1 + 32);
    v20 = *(_QWORD *)off_1E1678CE0;
    v21[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v8, "dataFromRange:documentAttributes:error:", 0, v10, v12, &v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v19;

    if (v14)
    {
      objc_msgSend(v14, "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D6C118]);

      if ((v16 & 1) == 0)
      {
        PBCannotLoadRepresentationError();
        v17 = objc_claimAutoreleasedReturnValue();

        v14 = (id)v17;
      }
    }
  }
  v9[2](v9, v13, 0, v14);

}

id __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_12(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD aBlock[4];
  id v7;

  v2 = a2;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_13;
  aBlock[3] = &unk_1E16DA4D8;
  v7 = v2;
  v3 = v2;
  v4 = _Block_copy(aBlock);

  return v4;
}

id __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_13(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, _QWORD *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  char v26;
  uint64_t v27;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *(_QWORD *)off_1E1678DD0) & 1) == 0
    && !objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *(_QWORD *)off_1E16792B8))
  {
    if (v11)
    {
      v20 = objc_alloc(MEMORY[0x1E0CB3498]);
      v21 = *(_QWORD *)(a1 + 32);
      v34 = *(_QWORD *)off_1E1678CE0;
      v35 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      v18 = (void *)objc_msgSend(v20, "initWithData:options:documentAttributes:error:", v11, v13, 0, &v30);
      v22 = v30;
    }
    else
    {
      if (!v12)
      {
LABEL_8:
        v19 = 0;
        goto LABEL_18;
      }
      v23 = objc_alloc(MEMORY[0x1E0CB3498]);
      v24 = *(_QWORD *)(a1 + 32);
      v32 = *(_QWORD *)off_1E1678CE0;
      v33 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v18 = (void *)objc_msgSend(v23, "initWithURL:options:documentAttributes:error:", v12, v13, 0, &v29);
      v22 = v29;
    }
    v19 = v22;
    goto LABEL_14;
  }
  v13 = v11;
  if (!v13 && v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v13)
    goto LABEL_8;
  v14 = objc_alloc(MEMORY[0x1E0CB3498]);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(_QWORD *)off_1E1678DC8;
  v36[0] = *(_QWORD *)off_1E1678CE0;
  v36[1] = v16;
  v37[0] = v15;
  v37[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v18 = (void *)objc_msgSend(v14, "_initWithHTMLData:options:documentAttributes:error:", v13, v17, 0, &v31);
  v19 = v31;

LABEL_14:
  if (v18)
    goto LABEL_21;
  if (v19)
  {
    objc_msgSend(v19, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToString:", *MEMORY[0x1E0D6C118]);

    if ((v26 & 1) == 0)
    {
      PBCannotInstantiateObjectOfClassError();
      v27 = objc_claimAutoreleasedReturnValue();

      v19 = (id)v27;
    }
  }
LABEL_18:
  if (a6)
  {
    v19 = objc_retainAutorelease(v19);
    v18 = 0;
    *a6 = v19;
  }
  else
  {
    v18 = 0;
  }
LABEL_21:

  return v18;
}

id __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_15;
  v12[3] = &unk_1E16DA528;
  v7 = *(id *)(a1 + 32);
  v14 = v6;
  v15 = v7;
  v13 = v5;
  v16 = *(id *)(a1 + 40);
  v8 = v6;
  v9 = v5;
  v10 = _Block_copy(v12);

  return v10;
}

void __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_15(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;

  v8 = a5;
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void (**)(uint64_t, uint64_t))(v9 + 16);
  v12 = a4;
  v13 = a3;
  v11(v9, v10);
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  PBUTIForNSAttributedStringDocumentType(*(void **)(a1 + 32));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PBUTIForNSAttributedStringDocumentType(*(void **)(a1 + 40));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  v25 = 0;
  ((void (**)(_QWORD, uint64_t, void *, id, id, id *))v14)[2](v14, v17, v15, v13, v12, &v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v25;
  v20 = v19;
  if (v18)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v21 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    PBUTIForNSAttributedStringDocumentType(*(void **)(a1 + 40));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_16;
    v23[3] = &unk_1E16DA500;
    v24 = v8;
    ((void (**)(_QWORD, void *, void *, _QWORD *))v21)[2](v21, v22, v18, v23);

  }
  else
  {
    if (!v19)
    {
      PBCannotCoerceRepresentationOfTypeToRepresentationOfTypeError();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v20);
  }

}

uint64_t __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  void (**v7)(id, void *, _QWORD, id);
  void *v8;
  id v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0D6C0B0];
  v10 = 0;
  v7 = a4;
  objc_msgSend(v6, "archivedDataFromObject:requestedType:outError:", a3, a2, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  v7[2](v7, v8, 0, v9);

}

uint64_t __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "string");
}

uint64_t __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend(MEMORY[0x1E0D6C0B0], "objectFromArchivedData:URL:requestedClass:typeIdentifier:outError:", a4, a5, a2, a3, a6);
}

id __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_20(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v17;
  void *v18;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)off_1E1679008;
  v12 = *(void (**)(uint64_t, uint64_t))(v10 + 16);
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v12(v10, v11);
  v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, uint64_t, id, id, id, uint64_t))v16)[2](v16, a2, v15, v14, v13, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_21(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  void (**v7)(id, void *, _QWORD, id);
  void *v8;
  id v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0D6C0B0];
  v10 = 0;
  v7 = a4;
  objc_msgSend(v6, "archivedDataFromObject:requestedType:outError:", a3, a2, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  v7[2](v7, v8, 0, v9);

}

uint64_t __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_22(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend(MEMORY[0x1E0D6C0B0], "objectFromArchivedData:URL:requestedClass:typeIdentifier:outError:", a4, a5, a2, a3, a6);
}

@end
