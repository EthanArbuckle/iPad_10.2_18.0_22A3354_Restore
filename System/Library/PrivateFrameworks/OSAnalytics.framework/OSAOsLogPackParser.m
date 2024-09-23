@implementation OSAOsLogPackParser

- (id)parse:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  id v10;
  void (**v12)(_QWORD, _QWORD);
  char v13;
  NSString *v14;
  unsigned __int8 *v15;
  NSString *formatStringOriginatingModulePath;
  int v17;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  OSAParsedOsLogPart *v22;
  void *v23;
  OSAParsedOsLogPart *v24;
  OSAParsedOsLogPart *v25;
  int v26;
  OSAParsedOsLogPart *v27;
  void *v28;
  OSAParsedOsLogPart *v29;
  void *v30;
  OSAParsedOsLogPart *v31;
  void *v32;
  OSAParsedOsLogPart *v33;
  OSAParsedOsLogPart *v34;
  void *v35;
  OSAParsedOsLogPart *v36;
  OSAParsedOsLogPart *v37;
  OSAParsedOsLogPart *v38;
  OSAParsedOsLogPart *v39;
  OSAParsedOsLogPart *v40;
  OSAParsedOsLogPart *v41;
  OSAParsedOsLogPart *v42;
  OSAParsedOsLogPart *v43;
  OSAParsedOsLogPart *v44;
  OSAParsedOsLogPart *v45;
  uint64_t v46;
  OSAParsedOsLogPart *v47;
  OSAParsedOsLogPart *v48;
  OSAParsedOsLogPart *v49;
  id v50;
  OSAParsedOsLogPart *v51;
  uint64_t v52;
  int v53;
  _QWORD v54[5];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "bytes");
  v8 = *(unsigned __int8 *)(v7 + 69);
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__1;
  v59 = __Block_byref_object_dispose__1;
  (*((void (**)(void))self->_readCStringFromTarget + 2))();
  v60 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)v56[5];
  if (!v9 || !objc_msgSend(v9, "length") || (unint64_t)objc_msgSend((id)v56[5], "length") >= 0x401)
  {
    v10 = v5;
    goto LABEL_5;
  }
  objc_storeStrong((id *)&self->_formatString, (id)v56[5]);
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __28__OSAOsLogPackParser_parse___block_invoke;
  v54[3] = &unk_1E4DEDBC0;
  v54[4] = &v55;
  v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85A8184](v54);
  v13 = (*((uint64_t (**)(void))self->_pointerPointsToImmutableMemory + 2))();
  self->_formatStringIsImmutable = v13;
  if ((v13 & 1) == 0)
  {
    v51 = -[OSAParsedOsLogPart initWithLiteral:isImmutable:]([OSAParsedOsLogPart alloc], "initWithLiteral:isImmutable:", CFSTR("%s"), 1);
    objc_msgSend(v5, "addObject:", v51);

    v50 = v5;
    goto LABEL_77;
  }
  (*((void (**)(void))self->_modulePathForImmutableMemoryPointer + 2))();
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  v15 = (unsigned __int8 *)(v7 + 70);
  formatStringOriginatingModulePath = self->_formatStringOriginatingModulePath;
  self->_formatStringOriginatingModulePath = v14;

  v17 = 0;
  do
  {
    if (!objc_msgSend((id)v56[5], "length") || v17 > 7)
      break;
    v19 = objc_msgSend((id)v56[5], "rangeOfString:", CFSTR("%"));
    if (!v20)
      break;
    v21 = v19;
    if (objc_msgSend((id)v56[5], "length") < v19)
      break;
    if (objc_msgSend((id)v56[5], "characterAtIndex:", v21 + 1) != 37)
    {
      if (!v8)
        break;
      v53 = v17;
      v52 = v15[1];
      v27 = [OSAParsedOsLogPart alloc];
      objc_msgSend((id)v56[5], "substringToIndex:", v21);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[OSAParsedOsLogPart initWithLiteral:isImmutable:](v27, "initWithLiteral:isImmutable:", v28, self->_formatStringIsImmutable);
      objc_msgSend(v5, "addObject:", v29);

      objc_msgSend((id)v56[5], "substringFromIndex:", v21 + 1);
      v17 = v53;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v21);
      v12[2](v12, 1);
      if (objc_msgSend(v30, "hasPrefix:", CFSTR("s")))
      {
        v12[2](v12, 1);
        if ((*v15 & 0xF0) == 0x20 && v15[1] == 8)
        {
          __memcpy_chk();
          v31 = [OSAParsedOsLogPart alloc];
          (*((void (**)(void))self->_readCStringFromTarget + 2))();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = -[OSAParsedOsLogPart initWithStringArgument:isImmutable:](v31, "initWithStringArgument:isImmutable:", v32, (*((uint64_t (**)(void))self->_pointerPointsToImmutableMemory + 2))());
          objc_msgSend(v5, "addObject:", v33);

          v17 = v53 + 1;
          v26 = 2;
          goto LABEL_70;
        }
LABEL_69:
        v26 = 3;
LABEL_70:
        v46 = v52;
LABEL_71:
        --v8;
        v15 += v46 + 2;

        continue;
      }
      if (objc_msgSend(v30, "hasPrefix:", CFSTR("d")))
      {
        v12[2](v12, objc_msgSend(CFSTR("d"), "length"));
        if (*v15 > 0xFu || v15[1] != 4)
          goto LABEL_69;
        __memcpy_chk();
        v34 = [OSAParsedOsLogPart alloc];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[OSAParsedOsLogPart initWithIntegerArgumentStringValue:](v34, "initWithIntegerArgumentStringValue:", v35);
        objc_msgSend(v5, "addObject:", v36);
        goto LABEL_66;
      }
      if (objc_msgSend(v30, "hasPrefix:", CFSTR("ld")))
      {
        v12[2](v12, objc_msgSend(CFSTR("ld"), "length"));
        if (*v15 > 0xFu || v15[1] != 8)
          goto LABEL_69;
        __memcpy_chk();
        v37 = [OSAParsedOsLogPart alloc];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[OSAParsedOsLogPart initWithIntegerArgumentStringValue:](v37, "initWithIntegerArgumentStringValue:", v35);
        objc_msgSend(v5, "addObject:", v36);
        goto LABEL_66;
      }
      if (objc_msgSend(v30, "hasPrefix:", CFSTR("lld")))
      {
        v12[2](v12, objc_msgSend(CFSTR("lld"), "length"));
        if (*v15 > 0xFu || v15[1] != 8)
          goto LABEL_69;
        __memcpy_chk();
        v38 = [OSAParsedOsLogPart alloc];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[OSAParsedOsLogPart initWithIntegerArgumentStringValue:](v38, "initWithIntegerArgumentStringValue:", v35);
        objc_msgSend(v5, "addObject:", v36);
        goto LABEL_66;
      }
      if (objc_msgSend(v30, "hasPrefix:", CFSTR("u")))
      {
        v12[2](v12, objc_msgSend(CFSTR("u"), "length"));
        if (*v15 > 0xFu || v15[1] != 4)
          goto LABEL_69;
        __memcpy_chk();
        v39 = [OSAParsedOsLogPart alloc];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[OSAParsedOsLogPart initWithIntegerArgumentStringValue:](v39, "initWithIntegerArgumentStringValue:", v35);
        objc_msgSend(v5, "addObject:", v36);
        goto LABEL_66;
      }
      if (objc_msgSend(v30, "hasPrefix:", CFSTR("lu")))
      {
        v12[2](v12, objc_msgSend(CFSTR("lu"), "length"));
        if (*v15 > 0xFu || v15[1] != 8)
          goto LABEL_69;
        __memcpy_chk();
        v40 = [OSAParsedOsLogPart alloc];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[OSAParsedOsLogPart initWithIntegerArgumentStringValue:](v40, "initWithIntegerArgumentStringValue:", v35);
        objc_msgSend(v5, "addObject:", v36);
        goto LABEL_66;
      }
      if (objc_msgSend(v30, "hasPrefix:", CFSTR("llu")))
      {
        v12[2](v12, objc_msgSend(CFSTR("llu"), "length"));
        if (*v15 > 0xFu || v15[1] != 8)
          goto LABEL_69;
        __memcpy_chk();
        v41 = [OSAParsedOsLogPart alloc];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[OSAParsedOsLogPart initWithIntegerArgumentStringValue:](v41, "initWithIntegerArgumentStringValue:", v35);
        objc_msgSend(v5, "addObject:", v36);
        goto LABEL_66;
      }
      if (objc_msgSend(v30, "hasPrefix:", CFSTR("x")))
      {
        v12[2](v12, objc_msgSend(CFSTR("x"), "length"));
        if (*v15 > 0xFu || v15[1] != 4)
          goto LABEL_69;
        __memcpy_chk();
        v42 = [OSAParsedOsLogPart alloc];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%x"), 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[OSAParsedOsLogPart initWithIntegerArgumentStringValue:](v42, "initWithIntegerArgumentStringValue:", v35);
        objc_msgSend(v5, "addObject:", v36);
        goto LABEL_66;
      }
      if (objc_msgSend(v30, "hasPrefix:", CFSTR("lx")))
      {
        v12[2](v12, objc_msgSend(CFSTR("lx"), "length"));
        if (*v15 > 0xFu || v15[1] != 8)
          goto LABEL_69;
        __memcpy_chk();
        v43 = [OSAParsedOsLogPart alloc];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lx"), 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[OSAParsedOsLogPart initWithIntegerArgumentStringValue:](v43, "initWithIntegerArgumentStringValue:", v35);
        objc_msgSend(v5, "addObject:", v36);
        goto LABEL_66;
      }
      if (objc_msgSend(v30, "hasPrefix:", CFSTR("llx")))
      {
        v12[2](v12, objc_msgSend(CFSTR("llx"), "length"));
        if (*v15 > 0xFu || v15[1] != 8)
          goto LABEL_69;
        __memcpy_chk();
        v44 = [OSAParsedOsLogPart alloc];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llx"), 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[OSAParsedOsLogPart initWithIntegerArgumentStringValue:](v44, "initWithIntegerArgumentStringValue:", v35);
        objc_msgSend(v5, "addObject:", v36);
        goto LABEL_66;
      }
      if (objc_msgSend(v30, "hasPrefix:", CFSTR("p")))
      {
        v12[2](v12, objc_msgSend(CFSTR("p"), "length"));
        if (*v15 > 0xFu)
          goto LABEL_69;
        if (v15[1] == 8)
        {
LABEL_65:
          __memcpy_chk();
          v45 = [OSAParsedOsLogPart alloc];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = -[OSAParsedOsLogPart initWithIntegerArgumentStringValue:](v45, "initWithIntegerArgumentStringValue:", v35);
          objc_msgSend(v5, "addObject:", v36);
LABEL_66:

          v46 = v52;
          v26 = 0;
          v17 = v53 + 1;
          goto LABEL_71;
        }
      }
      else
      {
        if (!objc_msgSend(v30, "hasPrefix:", CFSTR("@")))
        {
          v47 = -[OSAParsedOsLogPart initWithLiteral:isImmutable:]([OSAParsedOsLogPart alloc], "initWithLiteral:isImmutable:", CFSTR("%"), self->_formatStringIsImmutable);
          objc_msgSend(v5, "addObject:", v47);

          goto LABEL_69;
        }
        v12[2](v12, objc_msgSend(CFSTR("p"), "length"));
        if ((*v15 & 0xF0) == 0x40 && v15[1] == 8)
          goto LABEL_65;
      }
      v26 = 3;
      v17 = v53;
      goto LABEL_70;
    }
    v22 = [OSAParsedOsLogPart alloc];
    objc_msgSend((id)v56[5], "substringToIndex:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[OSAParsedOsLogPart initWithLiteral:isImmutable:](v22, "initWithLiteral:isImmutable:", v23, self->_formatStringIsImmutable);
    objc_msgSend(v5, "addObject:", v24);

    v25 = -[OSAParsedOsLogPart initWithLiteral:isImmutable:]([OSAParsedOsLogPart alloc], "initWithLiteral:isImmutable:", CFSTR("%"), self->_formatStringIsImmutable);
    objc_msgSend(v5, "addObject:", v25);

    v12[2](v12, v21 + 2);
    v26 = 2;
  }
  while (v26 != 3);
  if (objc_msgSend((id)v56[5], "length"))
  {
    v48 = [OSAParsedOsLogPart alloc];
    v49 = -[OSAParsedOsLogPart initWithLiteral:isImmutable:](v48, "initWithLiteral:isImmutable:", v56[5], self->_formatStringIsImmutable);
    objc_msgSend(v5, "addObject:", v49);

  }
  v50 = (id)objc_msgSend(v5, "copy");
LABEL_77:
  v10 = v50;

LABEL_5:
  _Block_object_dispose(&v55, 8);

  return v10;
}

void __28__OSAOsLogPackParser_parse___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "substringFromIndex:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)filterOutSensitiveStrings:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  OSAParsedOsLogPart *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "isImmutable", (_QWORD)v14))
        {
          objc_msgSend(v4, "addObject:", v10);
        }
        else
        {
          v11 = -[OSAParsedOsLogPart initWithStringArgument:isImmutable:]([OSAParsedOsLogPart alloc], "initWithStringArgument:isImmutable:", CFSTR("%s"), 1);
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (id)compose:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "stringValue", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendString:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (id)extractArguments:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "isArgument", (_QWORD)v14))
        {
          objc_msgSend(v10, "stringValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (id)pointerPointsToImmutableMemory
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setPointerPointsToImmutableMemory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (id)modulePathForImmutableMemoryPointer
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setModulePathForImmutableMemoryPointer:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (id)readCStringFromTarget
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setReadCStringFromTarget:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)formatString
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFormatString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (BOOL)formatStringIsImmutable
{
  return self->_formatStringIsImmutable;
}

- (void)setFormatStringIsImmutable:(BOOL)a3
{
  self->_formatStringIsImmutable = a3;
}

- (NSString)formatStringOriginatingModulePath
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFormatStringOriginatingModulePath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatStringOriginatingModulePath, 0);
  objc_storeStrong((id *)&self->_formatString, 0);
  objc_storeStrong(&self->_readCStringFromTarget, 0);
  objc_storeStrong(&self->_modulePathForImmutableMemoryPointer, 0);
  objc_storeStrong(&self->_pointerPointsToImmutableMemory, 0);
}

@end
