@implementation PBProgTag

+ (void)readDocumentList:(id)a3 state:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_msgSend(a1, "readBulletStylesFromDocumentList:state:", v7, v6);
  objc_msgSend(a1, "readBulletImagesFromDocumentList:state:", v7, v6);
  objc_msgSend(a1, "readMacCharStylesFromDocumentList:state:", v7, v6);
  objc_msgSend(a1, "readHyperlinkScreenTipsFromDocumentList:state:", v7, v6);

}

+ (void)readBulletStylesFromDocumentList:(id)a3 state:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a4;
  objc_msgSend(a1, "binaryTagDataWithName:inProgTagsParent:", L"___PPT9", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "firstChildOfType:", 4014);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = -[PBOutlineBulletDictionary initFromContainer:objectType:]([PBOutlineBulletDictionary alloc], "initFromContainer:objectType:", v8, 4012);
        objc_msgSend(v10, "setPlaceholderBulletStyles:", v9);

      }
    }

  }
}

+ (id)binaryTagDataWithName:(const unsigned __int16 *)a3 inProgTagsParent:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a4, "firstChildOfType:", 5000);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "binaryTagDataWithName:inProgTags:", a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)binaryTagDataWithName:(const unsigned __int16 *)a3 inProgTags:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;

  v5 = a4;
  v6 = objc_msgSend(v5, "childCount");
  if (!v6)
  {
LABEL_10:
    v13 = 0;
    goto LABEL_11;
  }
  v7 = 0;
  while (1)
  {
    objc_opt_class();
    objc_msgSend(v5, "childAt:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "eshObject");
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v9 + 16))(v9) == 5002)
      break;
LABEL_9:

    if (v6 == ++v7)
      goto LABEL_10;
  }
  objc_msgSend(v8, "firstChildOfType:", 4026);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_8;
  v12 = (void *)objc_msgSend(v10, "eshObject");
  if (v12)
  if (!CsString::operator==((uint64_t)v12 + 48, (unsigned __int16 *)a3))
  {
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v8, "firstChildOfType:", 5003);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v15;
  else
    v13 = 0;

LABEL_11:
  return v13;
}

+ (void)readBulletImagesFromDocumentList:(id)a3 state:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a1, "binaryTagDataWithName:inProgTagsParent:", L"___PPT9", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(a1, "readBulletImagesFromContainerParent:state:", v6, v7);

}

+ (void)readMacCharStylesFromDocumentList:(id)a3 state:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a4;
  objc_msgSend(a1, "binaryTagDataWithName:inProgTagsParent:", "_", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "firstChildOfType:", 4123);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = -[PBOutlineBulletDictionary initFromContainer:objectType:]([PBOutlineBulletDictionary alloc], "initFromContainer:objectType:", v8, 4121);
        objc_msgSend(v10, "setPlaceholderMacCharStyles:", v9);

      }
    }

  }
}

+ (void)readHyperlinkScreenTipsFromDocumentList:(id)a3 state:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  unsigned int *v14;
  uint64_t v15;
  void *v16;
  const void *v17;
  _DWORD *v18;
  _DWORD *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a4;
  objc_msgSend(a1, "binaryTagDataWithName:inProgTagsParent:", L"___PPT9", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "childCount");
    if (v8)
    {
      v9 = 0;
      do
      {
        objc_msgSend(v7, "childAt:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "eshObject");
        if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11) == 4068)
        {
          objc_msgSend(v10, "firstChildOfType:", 4051);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (const void *)objc_msgSend(v12, "eshObject");

          if (v13)
          {
            if (v14)
            {
              v15 = v14[12];
              objc_msgSend(v10, "firstChildOfType:", 4026);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = (const void *)objc_msgSend(v16, "eshObject");

              if (v17)
              {
                if (v18)
                {
                  v19 = v18;
                  if (v18[16])
                  {
                    objc_msgSend(v22, "hyperlinkInfoWithId:createIfAbsent:", v15, 1);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCsString:", v19 + 12);
                    objc_msgSend(v20, "setScreenTip:", v21);

                  }
                }
              }
            }
          }
        }

        ++v9;
      }
      while (v8 != v9);
    }
  }

}

+ (void)readBulletStylesFromMainMaster:(id)a3 state:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const void *v11;
  EshRecord *v12;
  EshRecord *v13;
  unsigned int Instance;
  id v15;

  v15 = a4;
  objc_msgSend(a1, "binaryTagDataWithName:inProgTagsParent:", L"___PPT9", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "childCount");
  if (v7)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v6, "childAt:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "eshObject");
      if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v10 + 16))(v10) == 4013)
      {
        v11 = (const void *)objc_msgSend(v9, "eshObject");
        if (v11)
        {
          if (v12)
          {
            v13 = v12;
            Instance = EshRecord::getInstance(v12);
            if (Instance <= 8)
              *(_QWORD *)(objc_msgSend(v15, "currentSourceMasterStyleInfoOfType:", (unsigned __int16)Instance) + 8) = v13;
          }
        }
      }

      ++v8;
    }
    while (v7 != v8);
  }

}

+ (void)readClientData:(id)a3 state:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(a1, "readBulletStyleFromClientData:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readMacCharStyleFromClientData:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrentBulletStyle:macCharStyle:", v7, v8);

}

+ (id)readBulletStyleFromClientData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "binaryTagDataWithName:inProgTagsParent:", L"___PPT9", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "firstChildOfType:", 4012);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)readMacCharStyleFromClientData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "binaryTagDataWithName:inProgTagsParent:", "_", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "firstChildOfType:", 4121);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)readBulletImagesFromContainerParent:(id)a3 state:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  objc_msgSend(a3, "firstChildOfType:", 2040);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(v5, "childCount");
      if (v6)
      {
        v7 = 0;
        do
        {
          objc_msgSend(v5, "childAt:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "eshObject");
          if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v9 + 16))(v9) == 2041)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "tgtPresentation");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addBulletBlip:", v10);

          }
          ++v7;
        }
        while (v6 != v7);
      }
    }
  }

}

+ (const)textFormatInfoForProgTagName:(const unsigned __int16 *)a3
{
  uint64_t v4;

  v4 = 0;
  while (_ChWcscmp(a3, (const unsigned __int16 *)(&+[PBProgTag textFormatInfoForProgTagName:]::infoArray)[v4]))
  {
    v4 += 2;
    if (v4 == 8)
      return 0;
  }
  return (const PBTextFormatProgTagInfo *)&(&+[PBProgTag textFormatInfoForProgTagName:]::infoArray)[v4];
}

+ (id)ensureBinaryTagDataWithName:(const unsigned __int16 *)a3 inProgTagsParent:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(v6, "firstChildOfType:", 5000);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "addPptContainerChildOfType:", 5000);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "ensureBinaryTagDataWithName:inProgTags:", a3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)ensureBinaryTagDataWithName:(const unsigned __int16 *)a3 inProgTags:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  CsString *v9;
  id v10;

  v6 = a4;
  objc_msgSend(a1, "binaryTagDataWithName:inProgTags:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "addPptContainerChildOfType:", 5002);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (CsString *)operator new(0x48uLL);
    PptCString::PptCString((PptCString *)v9);
    v10 = (id)objc_msgSend(v8, "addEshChild:", v9);
    EshRecord::setInstance((uint64_t)v9, 0);
    CsString::append(v9 + 2, a3);
    objc_msgSend(v8, "addPptContainerChildOfType:", 5003);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

@end
