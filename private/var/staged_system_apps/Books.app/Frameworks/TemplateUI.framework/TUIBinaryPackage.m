@implementation TUIBinaryPackage

+ (id)emptyPackage
{
  return objc_msgSend(objc_alloc((Class)a1), "initAsEmpty");
}

+ (TUIBinaryPackage)packageWithURL:(id)a3
{
  return (TUIBinaryPackage *)(id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "packageWithURL:baseURL:error:", a3, a3, 0));
}

+ (TUIBinaryPackage)packageWithURL:(id)a3 baseURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  TUIBinaryPackage *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v17;
  id v18;

  v7 = a3;
  v8 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2CB188);
  v9 = (void *)qword_2CB180;
  if (!qword_2CB180)
  {
    v10 = objc_opt_new(NSMutableDictionary);
    v11 = (void *)qword_2CB180;
    qword_2CB180 = (uint64_t)v10;

    v9 = (void *)qword_2CB180;
  }
  v12 = (TUIBinaryPackage *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v7));
  if (!v12)
  {
    v13 = TUIInstallBundleLog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543362;
      v18 = v7;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Installing TUIBinaryPackage for %{public}@", (uint8_t *)&v17, 0xCu);
    }

    v15 = objc_autoreleasePoolPush();
    v12 = -[TUIBinaryPackage initWithURL:baseURL:error:]([TUIBinaryPackage alloc], "initWithURL:baseURL:error:", v7, v8, a5);
    objc_autoreleasePoolPop(v15);
    if (v12)
      objc_msgSend((id)qword_2CB180, "setObject:forKeyedSubscript:", v12, v7);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2CB188);

  return v12;
}

+ (void)removeCacheForURL:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a3;
  v4 = TUIInstallBundleLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Removing TUIBinaryPackage for %{public}@", (uint8_t *)&v6, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&unk_2CB188);
  objc_msgSend((id)qword_2CB180, "removeObjectForKey:", v3);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2CB188);

}

+ (void)clearCache
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2CB188);
  objc_msgSend((id)qword_2CB180, "removeAllObjects");
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2CB188);
}

- (id)initAsEmpty
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIBinaryPackage;
  if (-[TUIBinaryPackage init](&v3, "init"))
    operator new();
  return 0;
}

- (TUIBinaryPackage)initWithURL:(id)a3
{
  return -[TUIBinaryPackage initWithURL:baseURL:error:](self, "initWithURL:baseURL:error:", a3, a3, 0);
}

- (TUIBinaryPackage)initWithURL:(id)a3 baseURL:(id)a4 error:(id *)a5
{
  id v8;
  TUIBinaryPackage *v9;
  TUIBinaryPackage *v10;
  id v11;
  const char *v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  id v18;
  __int128 v19;
  objc_super v20;
  stat v21;

  v8 = a3;
  v18 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TUIBinaryPackage;
  v9 = -[TUIBinaryPackage init](&v20, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_baseURL, a4);
    if (objc_msgSend(v8, "isFileURL"))
    {
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path")));
      v12 = (const char *)objc_msgSend(v11, "UTF8String");
      v10->_data = 0;
      v10->_size = 0;
      v13 = open(v12, 0, 0);
      v14 = v13;
      if (v13 < 0)
      {
        v15 = *__error();
      }
      else
      {
        if (fstat(v13, &v21) || (v16 = mmap(0, v21.st_size, 1, 1, v14, 0), v10->_data = v16, v16 == (void *)-1))
        {
          v15 = *__error();
        }
        else
        {
          v15 = 0;
          v10->_size = v21.st_size;
        }
        close(v14);
      }

      if (!v15)
      {
        TUI::Package::Decoder::Decoder((TUI::Package::Decoder *)&v21, v10->_data, v10->_size);
        TUI::Package::Decoder::swap((TUI::Package::Decoder *)&v10->_decoder, (TUI::Package::Decoder *)&v21);
        operator new();
      }
    }
    TUI::Package::Decoder::sectionWithTag((TUI::Package::Decoder *)&v10->_decoder, 0x656C6E62u, 2, (uint64_t)&v19);
    TUI::Package::Section::decodeStrings((uint64_t)&v19, 2, &v21);
    *(_OWORD *)&v10->_elementNames.base = *(_OWORD *)&v21.st_dev;
    v10->_elementNames.offsets = *(unsigned int **)&v21.st_uid;

    v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  TUI::Symbol::Tab *symtab;
  id *buffer;
  objc_super v5;

  if (self->_data)
  {
    symtab = (TUI::Symbol::Tab *)self->_symtab;
    if (symtab)
    {
      TUI::Symbol::Tab::~Tab(symtab);
      operator delete();
    }
    buffer = (id *)self->_buffer;
    if (buffer)
    {
      TUI::Package::Buffer::~Buffer(buffer);
      operator delete();
    }
    munmap(self->_data, self->_size);
  }
  v5.receiver = self;
  v5.super_class = (Class)TUIBinaryPackage;
  -[TUIBinaryPackage dealloc](&v5, "dealloc");
}

- (NSDictionary)prebuiltTemplates
{
  return self->_templates;
}

- (void)symtab
{
  return self->_symtab;
}

- (void)packageBuffer
{
  return self->_buffer;
}

- (const)packageDecoder
{
  return &self->_decoder;
}

- ($201E9A47BE70A2B12CCA2F48B75AA2F7)nameForString:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *symtab;
  int v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  __int16 v20;
  char *v21;
  _BYTE *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  id v28;
  int v29;
  int v30;
  void *__p[2];
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  void *v37;
  char *v38;
  char *v39;
  _BYTE v40[128];

  v4 = a3;
  v29 = HIWORD(TUINameNil);
  v30 = (unsigned __int16)TUINameNil;
  if (v4)
  {
    v37 = 0;
    v38 = 0;
    v39 = 0;
    v28 = v4;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("::")));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v7)
            objc_enumerationMutation(v5);
          symtab = self->_symtab;
          sub_9350(__p, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i)), "UTF8String"));
          v10 = TUI::Symbol::Tab::lookup((uint64_t)symtab, (unsigned __int8 *)__p);
          if (v32 < 0)
            operator delete(__p[0]);
          if (v10 != 0xFFFF)
          {
            v11 = v38;
            if (v38 >= v39)
            {
              v13 = (char *)v37;
              v14 = v38 - (_BYTE *)v37;
              if (v38 - (_BYTE *)v37 <= -3)
                sub_6F9C();
              v15 = v14 >> 1;
              if (v39 - (_BYTE *)v37 <= (unint64_t)((v14 >> 1) + 1))
                v16 = v15 + 1;
              else
                v16 = v39 - (_BYTE *)v37;
              if ((unint64_t)(v39 - (_BYTE *)v37) >= 0x7FFFFFFFFFFFFFFELL)
                v17 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v17 = v16;
              if (v17)
              {
                v18 = (char *)sub_9414((uint64_t)&v39, v17);
                v13 = (char *)v37;
                v11 = v38;
              }
              else
              {
                v18 = 0;
              }
              v19 = &v18[2 * v15];
              *(_WORD *)v19 = v10;
              v12 = v19 + 2;
              while (v11 != v13)
              {
                v20 = *((_WORD *)v11 - 1);
                v11 -= 2;
                *((_WORD *)v19 - 1) = v20;
                v19 -= 2;
              }
              v37 = v19;
              v38 = v12;
              v39 = &v18[2 * v17];
              if (v13)
                operator delete(v13);
            }
            else
            {
              *(_WORD *)v38 = v10;
              v12 = v11 + 2;
            }
            v38 = v12;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      }
      while (v6);
    }

    v22 = v37;
    v21 = v38;
    if (objc_msgSend(v5, "count") == (id)((v21 - v22) >> 1) && v38 != v37)
    {
      v23 = *((unsigned __int16 *)v38 - 1);
      v38 -= 2;
      v24 = TUI::Symbol::Tab::lookup((uint64_t)self->_symtab, (uint64_t)&v37);
      if (v24 == 0xFFFF)
        v25 = v30;
      else
        v25 = v24;
      v26 = v29;
      if (v24 != 0xFFFF)
        v26 = v23;
      v29 = v26;
      v30 = v25;
    }

    if (v37)
    {
      v38 = (char *)v37;
      operator delete(v37);
    }
    v4 = v28;
  }

  return ($201E9A47BE70A2B12CCA2F48B75AA2F7)(v30 | (v29 << 16));
}

- (void)performAccess:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- ($7E080378D8F67055EE0984892F39872B)symbolForString:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *symtab;
  id v8;
  $7E080378D8F67055EE0984892F39872B v9;
  void *__p[2];
  char v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "characterAtIndex:", 0);
    symtab = self->_symtab;
    if (v6 == 58)
    {
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringFromIndex:", 1)));
      sub_9350(__p, (char *)objc_msgSend(v8, "UTF8String"));
      v9.var0 = TUI::Symbol::Tab::lookup((uint64_t)symtab, (unsigned __int8 *)__p);
      if (v12 < 0)
        operator delete(__p[0]);

    }
    else
    {
      sub_9350(__p, (char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
      v9.var0 = TUI::Symbol::Tab::lookup((uint64_t)symtab, (unsigned __int8 *)__p);
      if (v12 < 0)
        operator delete(__p[0]);
    }
  }
  else
  {
    v9.var0 = TUISymbolNil;
  }

  return v9;
}

- (id)templateWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheme"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
    v7 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", v6, self->_baseURL));

    v4 = (id)v7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v4, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByStandardizingPath"));
  objc_msgSend(v8, "setPath:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_templates, "objectForKeyedSubscript:", v11));

  return v12;
}

- (id)debugLocationForNode:(id)a3
{
  uint64_t v3;
  _QWORD *buffer;
  uint64_t v5;
  unint64_t v7;
  unsigned __int16 *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  unint64_t v22;

  v3 = *(_QWORD *)&a3.var0;
  buffer = self->_buffer;
  if (buffer[27] > (unint64_t)a3.var0)
  {
    v5 = buffer[26] + 28 * a3.var0;
    if (v5)
    {
      v7 = *(unsigned int *)(v5 + 24);
      if (buffer[17] > v7 >> 12 && (v8 = (unsigned __int16 *)(buffer[16] + 8 * (v7 >> 12))) != 0)
      {
        v9 = *v8;
        v10 = (unint64_t)*((unsigned int *)v8 + 1) << 32;
        v11 = v9 << 16;
      }
      else
      {
        v10 = 0xFFFFFFFF00000000;
        v11 = 4294901760;
      }
      v22 = v10 | v11 | v7 & 0xFFF;
      v14 = TUI::Package::Location::Entry::pathURL((unsigned __int16 *)&v22, buffer);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v15 = self->_buffer;
      if (v15[11] > (unint64_t)HIDWORD(v22) && (v16 = v15[10]) != 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v16 + *(unsigned int *)(v15[12] + 4 * HIDWORD(v22))));
        if (v17)
          v18 = v12 == 0;
        else
          v18 = 1;
        if (!v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
          v20 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Path:%@ XPath:%@"), v19, v17));
LABEL_17:
          v13 = (void *)v20;

          goto LABEL_18;
        }
      }
      else
      {
        v17 = 0;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
      v20 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NoLocationOrXPath:%@"), v19));
      goto LABEL_17;
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a3.var0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("InvalidNode:%@"), v12));
LABEL_18:

  return v13;
}

- (NSURL)url
{
  return self->_url;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_templates, 0);
  sub_92D4((uint64_t)&self->_decoder._sections);
}

- (id).cxx_construct
{
  self->_elementNames.base = 0;
  self->_elementNames.count = 0;
  self->_elementNames.offsets = 0;
  TUI::Package::Decoder::Decoder((TUI::Package::Decoder *)&self->_decoder);
  return self;
}

@end
