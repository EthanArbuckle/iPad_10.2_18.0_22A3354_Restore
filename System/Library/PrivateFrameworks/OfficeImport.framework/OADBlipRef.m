@implementation OADBlipRef

- (OADBlipRef)initWithIndex:(int)a3 name:(id)a4 blip:(id)a5
{
  return -[OADBlipRef initWithIndex:name:blip:effects:](self, "initWithIndex:name:blip:effects:", *(_QWORD *)&a3, a4, a5, 0);
}

- (OADBlipRef)initWithIndex:(int)a3 name:(id)a4 blip:(id)a5 effects:(id)a6
{
  id v10;
  id v11;
  id v12;
  OADBlipRef *v13;
  OADBlipRef *v14;
  uint64_t v15;
  NSString *mName;
  uint64_t v17;
  NSMutableArray *mEffects;
  objc_super v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)OADBlipRef;
  v13 = -[OADBlipRef init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->mIndex = a3;
    v15 = objc_msgSend(v10, "copy");
    mName = v14->mName;
    v14->mName = (NSString *)v15;

    objc_storeStrong((id *)&v14->mBlip, a5);
    if (objc_msgSend(v12, "count"))
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:copyItems:", v12, 1);
      mEffects = v14->mEffects;
      v14->mEffects = (NSMutableArray *)v17;

    }
  }

  return v14;
}

- (id)blip
{
  return self->mBlip;
}

- (int)index
{
  return self->mIndex;
}

- (void)addEffect:(id)a3
{
  id v4;
  NSMutableArray *mEffects;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  mEffects = self->mEffects;
  v8 = v4;
  if (!mEffects)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->mEffects;
    self->mEffects = v6;

    mEffects = self->mEffects;
    v4 = v8;
  }
  -[NSMutableArray addObject:](mEffects, "addObject:", v4);

}

- (void)setBlip:(id)a3
{
  objc_storeStrong((id *)&self->mBlip, a3);
}

- (unint64_t)effectCount
{
  return -[NSMutableArray count](self->mEffects, "count");
}

- (id)effectAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mEffects, "objectAtIndex:", a3);
}

- (unint64_t)hash
{
  uint64_t mIndex;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;

  mIndex = self->mIndex;
  v4 = -[NSString hash](self->mName, "hash") ^ mIndex;
  v5 = v4 ^ -[OADBlip hash](self->mBlip, "hash");
  if (-[NSMutableArray count](self->mEffects, "count"))
  {
    v6 = 0;
    v7 = 1;
    do
    {
      -[NSMutableArray objectAtIndex:](self->mEffects, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 ^= objc_msgSend(v8, "hash");

      v6 = v7;
    }
    while (-[NSMutableArray count](self->mEffects, "count") > (unint64_t)v7++);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  objc_object **v5;
  objc_object **v6;
  int mIndex;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v5 = (objc_object **)v4;
  v6 = v5;
  if (!v5)
    goto LABEL_8;
  mIndex = self->mIndex;
  if (mIndex != objc_msgSend(v5, "index")
    || !TCObjectEqual((objc_object *)self->mName, v6[2])
    || !TCObjectEqual((objc_object *)self->mEffects, v6[3]))
  {
    goto LABEL_8;
  }
  v8 = TCObjectEqual((objc_object *)self->mBlip, v6[4]);
LABEL_9:

  return v8;
}

+ (int)blipTypeForContentType:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)+[OADBlipRef blipTypeForContentType:]::contentTypeToBlipTypeMap;
    if (!+[OADBlipRef blipTypeForContentType:]::contentTypeToBlipTypeMap)
    {
      v5 = objc_alloc(MEMORY[0x24BDBCE70]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 8);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)v7;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v5, "initWithObjectsAndKeys:", v25, CFSTR("image/bmp"), v6, CFSTR("image/x-ms-bmp"), v10, CFSTR("image/jpeg"), v24, CFSTR("image/jpg"), v28, CFSTR("image/png"), v27, CFSTR("image/x-wmf"), v8, CFSTR("image/x-emf"), v23, CFSTR("image/x-pict"), v9,
              CFSTR("image/pict"),
              v22,
              CFSTR("image/gif"),
              v21,
              CFSTR("image/tiff"),
              v26,
              CFSTR("image/tif"),
              v20,
              CFSTR("application/pdf"),
              v11,
              CFSTR("application/x-pdf"),
              v12,
              CFSTR("application/photoshop"),
              v13,
              CFSTR("application/x-photoshop"),
              0);
      v15 = (void *)+[OADBlipRef blipTypeForContentType:]::contentTypeToBlipTypeMap;
      +[OADBlipRef blipTypeForContentType:]::contentTypeToBlipTypeMap = v14;

      v4 = (void *)+[OADBlipRef blipTypeForContentType:]::contentTypeToBlipTypeMap;
    }
    objc_msgSend(v4, "objectForKey:", v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      v18 = objc_msgSend(v16, "intValue");
    else
      v18 = 0;

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)blipRefWithIndex:(int)a3 name:(id)a4 blip:(id)a5
{
  objc_msgSend(a1, "blipRefWithIndex:name:blip:effects:", *(_QWORD *)&a3, a4, a5, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)blipRefWithIndex:(int)a3 name:(id)a4 blip:(id)a5 effects:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  OADBlipRef *v12;

  v8 = *(_QWORD *)&a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = -[OADBlipRef initWithIndex:name:blip:effects:]([OADBlipRef alloc], "initWithIndex:name:blip:effects:", v8, v9, v10, v11);

  return v12;
}

- (id)name
{
  return self->mName;
}

- (id)effects
{
  return self->mEffects;
}

- (void)setEffects:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *mEffects;
  id v6;

  v6 = a3;
  v4 = (NSMutableArray *)objc_msgSend(v6, "mutableCopy");
  mEffects = self->mEffects;
  self->mEffects = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIndex:name:blip:effects:", self->mIndex, self->mName, self->mBlip, self->mEffects);
}

- (OADBlipRef)init
{

  return 0;
}

- (void)setIndex:(int)a3
{
  self->mIndex = a3;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->mName, a3);
}

- (void)removeEffectAtIndex:(unint64_t)a3
{
  -[NSMutableArray removeObjectAtIndex:](self->mEffects, "removeObjectAtIndex:", a3);
}

+ (int)blipTypeForExtension:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v3 = a3;
  v4 = v3;
  if (+[OADBlipRef blipTypeForExtension:]::extToBlipTypeMap)
  {
    if (!v3)
      goto LABEL_7;
  }
  else
  {
    v27 = v3;
    v5 = objc_alloc(MEMORY[0x24BDBCE70]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v19, "initWithObjectsAndKeys:", v26, CFSTR("bmp"), v6, CFSTR("jpg"), v7, CFSTR("jpeg"), v25, CFSTR("jp2"), v8, CFSTR("png"), v9, CFSTR("wmf"), v24, CFSTR("emf"), v10, CFSTR("pct"), v23,
            CFSTR("pict"),
            v22,
            CFSTR("gif"),
            v21,
            CFSTR("tif"),
            v20,
            CFSTR("tiff"),
            v11,
            CFSTR("pdf"),
            v12,
            CFSTR("psd"),
            0);
    v14 = (void *)+[OADBlipRef blipTypeForExtension:]::extToBlipTypeMap;
    +[OADBlipRef blipTypeForExtension:]::extToBlipTypeMap = v13;

    v4 = v27;
    if (!v27)
    {
LABEL_7:
      v17 = 0;
      goto LABEL_8;
    }
  }
  objc_msgSend((id)+[OADBlipRef blipTypeForExtension:]::extToBlipTypeMap, "objectForKey:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    goto LABEL_7;
  v17 = objc_msgSend(v15, "intValue");

LABEL_8:
  return v17;
}

+ (int)blipTypeForImageData:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  int v8;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;

  v3 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  v6 = v5;
  if (v5 < 4)
    goto LABEL_2;
  if (v5 >= 6)
  {
    if (*(_BYTE *)v4 == 66 && *(_BYTE *)(v4 + 1) == 77 && v5 == *(_DWORD *)(v4 + 2))
    {
      v7 = 1;
      goto LABEL_26;
    }
    if (v5 >= 8)
    {
      if (*(_DWORD *)v4 == 1196314761 && *(_DWORD *)(v4 + 4) == 169478669)
      {
        v7 = 3;
        goto LABEL_26;
      }
      if (v5 >= 0xB
        && (*(_DWORD *)v4 == -520103681 && !strcmp("JFIF", (const char *)(v4 + 6))
         || *(_DWORD *)v4 == -503326465 && !strcmp("Exif", (const char *)(v4 + 6))
         || v6 >= 0xC && *(_DWORD *)v4 == -385885953 && !strcmp("SPIFF", (const char *)(v4 + 6))))
      {
        v7 = 2;
        goto LABEL_26;
      }
    }
    if (!strncmp((const char *)v4, "GIF87a", 6uLL))
      goto LABEL_25;
  }
  if (!strncmp((const char *)v4, "GIF89a", 6uLL))
  {
LABEL_25:
    v7 = 7;
    goto LABEL_26;
  }
  if (*(_DWORD *)v4 == 2771273 || (v8 = *(_DWORD *)v4, *(_DWORD *)v4 == 704662861))
  {
    v7 = 8;
    goto LABEL_26;
  }
  if (v6 >= 0x16 && *(_DWORD *)v4 == -1698247209 && !*(_WORD *)(v4 + 2))
  {
    v10 = 22;
    if (*(_DWORD *)(v4 + 16))
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  if (v6 >= v10 + 18)
  {
    v11 = v4 + v10;
    if ((*(_WORD *)v11 == 1 || *(_WORD *)v11 == 2)
      && *(_WORD *)(v11 + 2) == 9
      && v6 == *(_DWORD *)(v11 + 6)
      && !*(_WORD *)(v11 + 16))
    {
      v7 = 4;
      goto LABEL_26;
    }
  }
  if (v6 >= 0x34)
  {
    if (*(_DWORD *)(v4 + 40) == 1179469088 && v6 == *(_DWORD *)(v4 + 48))
    {
      v7 = 5;
      goto LABEL_26;
    }
    if (v8 != 1178882085)
      goto LABEL_2;
LABEL_45:
    v12 = *(unsigned __int8 *)(v6 + v4 - 1);
    if (v12 == 10)
    {
      if (*(_BYTE *)(v6 + v4 - 2) == 13 && *(_BYTE *)(v6 + v4 - 8) == 10 && *(_BYTE *)(v6 + v4 - 9) == 13)
      {
        v13 = -7;
        goto LABEL_56;
      }
      if (*(_BYTE *)(v6 + v4 - 7) == 10)
      {
LABEL_55:
        v13 = -6;
LABEL_56:
        if (!strncmp("%%EOF", (const char *)(v4 + v13 + v6), 5uLL))
        {
          v7 = 9;
          goto LABEL_26;
        }
      }
    }
    else if (v12 == 13 && *(_BYTE *)(v6 + v4 - 7) == 13)
    {
      goto LABEL_55;
    }
LABEL_2:
    v7 = 0;
    goto LABEL_26;
  }
  v7 = 0;
  if (v6 >= 0xD && v8 == 1178882085)
    goto LABEL_45;
LABEL_26:

  return v7;
}

+ (id)inflatedExtensionForGzippedExtension:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)+[OADBlipRef inflatedExtensionForGzippedExtension:]::extMap;
  if (!+[OADBlipRef inflatedExtensionForGzippedExtension:]::extMap)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("wmf"), CFSTR("wmz"), CFSTR("emf"), CFSTR("emz"), 0);
    v6 = (void *)+[OADBlipRef inflatedExtensionForGzippedExtension:]::extMap;
    +[OADBlipRef inflatedExtensionForGzippedExtension:]::extMap = v5;

    v4 = (void *)+[OADBlipRef inflatedExtensionForGzippedExtension:]::extMap;
  }
  objc_msgSend(v4, "objectForKey:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isNull
{
  return self->mIndex == -1 && self->mBlip == 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADBlipRef;
  -[OADBlipRef description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBlip, 0);
  objc_storeStrong((id *)&self->mEffects, 0);
  objc_storeStrong((id *)&self->mName, 0);
}

@end
