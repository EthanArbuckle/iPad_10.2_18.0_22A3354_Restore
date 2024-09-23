@implementation PBMedia

+ (BOOL)readEmbeddedSoundFromClientDataHolder:(id)a3 toImage:(id)a4 state:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t DocumentRef;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const void *v20;
  char *v21;
  void *v22;
  void *v23;
  const void *v24;
  char *v25;
  void *v26;
  const void *v27;
  PptBinaryDataAtom *v28;
  OcBinaryData *BinaryDataReference;
  OADSound *v30;
  ESDBlipContext *v31;
  OADOle *v32;
  char v33;
  int v34;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  int v41;
  void *v42;

  v7 = a3;
  v40 = a4;
  v8 = a5;
  objc_msgSend(v7, "firstChildOfType:", 4115);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    v16 = 0;
    goto LABEL_28;
  }
  DocumentRef = PptBinaryReader::getDocumentRef((PptBinaryReader *)objc_msgSend(v8, "reader"));
  objc_msgSend(v8, "documentRoot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v10;
  objc_msgSend(v12, "pbReferenceWithID:", DocumentRef);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v8;
  v38 = v7;

  v36 = v13;
  objc_msgSend(v13, "firstChildOfType:", 2020);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = 0;
  while (objc_msgSend(v14, "childCount") > (unint64_t)v15)
  {
    objc_msgSend(v14, "childAt:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "eshObject");
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v18 + 16))(v18) != 2022)
      goto LABEL_21;
    objc_msgSend(v17, "childOfType:instance:", 4026, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (const void *)objc_msgSend(v19, "eshObject");
    if (v20
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCsString:", v21 + 48);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    if (objc_msgSend(v22, "intValue") != v41)
    {

LABEL_21:
      goto LABEL_22;
    }
    objc_msgSend(v17, "childOfType:instance:", 4026, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (const void *)objc_msgSend(v23, "eshObject");
    if (v24
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCsString:", v25 + 48);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v42 = 0;
    }
    objc_msgSend(v17, "firstChildOfType:", 2023);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (const void *)objc_msgSend(v26, "eshObject");
    if (v27
    {
      BinaryDataReference = PptBinaryDataAtom::getBinaryDataReference(v28);
      if (BinaryDataReference->var3)
      {
        v30 = objc_alloc_init(OADSound);
        v31 = -[ESDBlipContext initWithOffset:byteCount:stream:streamID:]([ESDBlipContext alloc], "initWithOffset:byteCount:stream:streamID:", BinaryDataReference->var1, BinaryDataReference->var3, BinaryDataReference->var7, BinaryDataReference->var2);
        -[OCDDelayedNode setDelayedContext:](v30, "setDelayedContext:", v31);
        -[OADSound setName:](v30, "setName:", v42);
        v32 = objc_alloc_init(OADOle);
        -[OADOle setObject:](v32, "setObject:", v30);
        objc_msgSend(v40, "setOle:", v32);

        v33 = 0;
        v34 = 0;
        v16 = 1;
      }
      else
      {
        v34 = 0;
        v33 = 1;
      }
    }
    else
    {
      v33 = 0;
      v34 = 1;
    }

    if ((v33 & 1) != 0)
      goto LABEL_21;

    if (!v34)
      break;
LABEL_22:
    ++v15;
  }

  v8 = v37;
  v7 = v38;
  v10 = v39;
LABEL_28:

  return v16 & 1;
}

+ (BOOL)readLinkedMovieFromMovieHolder:(id)a3 toImage:(id)a4 state:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "eshObject");
  (*(void (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8);
  objc_msgSend(v6, "childOfType:instance:", 4026, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = (char *)objc_msgSend(v9, "eshObject");
    if (v11)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCsString:", v11 + 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "movie");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v13 = objc_alloc_init((Class)objc_opt_class());
      objc_msgSend(v13, "setIsExternal:", 1);
      objc_msgSend(v7, "setMovie:", v13);
    }
    objc_msgSend(v13, "setName:", v12);

  }
  return v10 != 0;
}

@end
