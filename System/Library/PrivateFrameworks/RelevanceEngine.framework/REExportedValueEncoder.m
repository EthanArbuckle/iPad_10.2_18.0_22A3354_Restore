@implementation REExportedValueEncoder

- (REExportedValueEncoder)initWithOptions:(unint64_t)a3
{
  REExportedValueEncoder *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REExportedValueEncoder;
  result = -[REExportedValueEncoder init](&v5, sel_init);
  if (result)
    result->_options = a3;
  return result;
}

- (void)writeExportedValue:(id)a3 toStream:(id)a4
{
  -[REExportedValueEncoder _writeValue:toStream:depth:needsIndent:](self, "_writeValue:toStream:depth:needsIndent:", a3, a4, 0, 0);
}

- (id)dataFromExportedValue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDBCF08];
  v5 = a3;
  objc_msgSend(v4, "outputStreamToMemory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "open");
  -[REExportedValueEncoder writeExportedValue:toStream:](self, "writeExportedValue:toStream:", v5, v6);

  objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BDBCB88]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "close");

  return v7;
}

- (void)_writeValue:(id)a3 toStream:(id)a4 depth:(unint64_t)a5 needsIndent:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  int v13;
  __CFString *v14;
  void *v15;
  unint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  unint64_t v33;

  v10 = a3;
  v11 = a4;
  +[REExportedValue exportedValueForObject:](REExportedValue, "exportedValueForObject:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self->_options & a6;
  if (v13 == 1)
  {
    if (a5)
    {
      if (a5 == 1)
      {
        v14 = CFSTR("    ");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", objc_msgSend(CFSTR("    "), "length") * a5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = a5;
        do
        {
          objc_msgSend(v15, "appendString:", CFSTR("    "));
          --v16;
        }
        while (v16);
        v14 = (__CFString *)objc_msgSend(v15, "copy");

      }
    }
    else
    {
      v14 = &stru_24CF92178;
    }
    objc_msgSend(v11, "re_writeString:", v14);

  }
  switch(objc_msgSend(v12, "type"))
  {
    case 0:
      v24[4] = self;
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_5;
      v25[3] = &unk_24CF8AFE0;
      v25[4] = self;
      v23[4] = self;
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_6;
      v24[3] = &unk_24CF8AFB8;
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_7;
      v23[3] = &unk_24CF8AFE0;
      -[REExportedValueEncoder _writeCollection:toStream:startBlock:writerBlock:endBlock:wantsHeader:depth:](self, "_writeCollection:toStream:startBlock:writerBlock:endBlock:wantsHeader:depth:", v12, v11, v25, v24, v23, -[REExportedValueEncoder writesArrayHeader](self, "writesArrayHeader"), a5);
      goto LABEL_16;
    case 1:
      v21[4] = self;
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_8;
      v22[3] = &unk_24CF8AFE0;
      v22[4] = self;
      v20[4] = self;
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_9;
      v21[3] = &unk_24CF8AFB8;
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_10;
      v20[3] = &unk_24CF8AFE0;
      -[REExportedValueEncoder _writeCollection:toStream:startBlock:writerBlock:endBlock:wantsHeader:depth:](self, "_writeCollection:toStream:startBlock:writerBlock:endBlock:wantsHeader:depth:", v12, v11, v22, v21, v20, -[REExportedValueEncoder writesDictionaryHeader](self, "writesDictionaryHeader"), a5);
LABEL_16:
      if (!v13)
        goto LABEL_29;
      goto LABEL_28;
    case 2:
      if (objc_msgSend(v12, "propertyCount") == 1)
      {
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke;
        v31[3] = &unk_24CF8AF68;
        v31[4] = self;
        v32 = v11;
        v33 = a5;
        objc_msgSend(v12, "enumerateValuesUsingBlock:", v31);
        v17 = v32;
      }
      else
      {
        v19 = MEMORY[0x24BDAC760];
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_2;
        v29[3] = &unk_24CF8AF90;
        v29[4] = self;
        v30 = v12;
        v28[0] = v19;
        v28[1] = 3221225472;
        v28[2] = __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_3;
        v28[3] = &unk_24CF8AFB8;
        v28[4] = self;
        v26[0] = v19;
        v26[1] = 3221225472;
        v26[2] = __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_4;
        v26[3] = &unk_24CF8AF90;
        v26[4] = self;
        v27 = v30;
        -[REExportedValueEncoder _writeCollection:toStream:startBlock:writerBlock:endBlock:wantsHeader:depth:](self, "_writeCollection:toStream:startBlock:writerBlock:endBlock:wantsHeader:depth:", v27, v11, v29, v28, v26, 1, a5);

        v17 = v30;
      }

      if (!v13)
        goto LABEL_29;
      goto LABEL_28;
    case 3:
      objc_msgSend(v12, "stringValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[REExportedValueEncoder writeString:toStream:](self, "writeString:toStream:", v18, v11);
      goto LABEL_20;
    case 4:
      objc_msgSend(v12, "numberValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[REExportedValueEncoder writeNumber:toStream:](self, "writeNumber:toStream:", v18, v11);
      goto LABEL_20;
    case 5:
      objc_msgSend(v12, "dateValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[REExportedValueEncoder writeDate:toStream:](self, "writeDate:toStream:", v18, v11);
LABEL_20:

      if (!v13)
        goto LABEL_29;
      goto LABEL_28;
    case 6:
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_26;
      }
      -[REExportedValueEncoder writeNullToStream:](self, "writeNullToStream:", v11);
      if (!v13)
        goto LABEL_29;
      goto LABEL_28;
    case 7:
LABEL_26:
      -[REExportedValueEncoder writeUnsupportedObject:toStream:](self, "writeUnsupportedObject:toStream:", v10, v11);
      goto LABEL_27;
    default:
LABEL_27:
      if (v13)
LABEL_28:
        objc_msgSend(v11, "re_writeString:", CFSTR("\n"));
LABEL_29:

      return;
  }
}

uint64_t __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeValue:toStream:depth:needsIndent:", a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

void __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "objectValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writeObjectStart:toStream:", v5, v4);

}

uint64_t __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeObjectValuePairToStream:keyWriter:valueWriter:isLast:", a2, a3, a4, a5);
}

void __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "objectValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writeObjectEnd:toStream:", v5, v4);

}

uint64_t __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeArrayStartToStream:", a2);
}

uint64_t __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeArrayValuePairToStream:valueWriter:isLast:", a2);
}

uint64_t __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeArrayEndToStream:", a2);
}

uint64_t __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeDictionaryStartToStream:", a2);
}

uint64_t __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeDictionaryValuePairToStream:keyWriter:valueWriter:isLast:", a2, a3, a4, a5);
}

uint64_t __65__REExportedValueEncoder__writeValue_toStream_depth_needsIndent___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeDictionaryEndToStream:", a2);
}

- (void)_writeCollection:(id)a3 toStream:(id)a4 startBlock:(id)a5 writerBlock:(id)a6 endBlock:(id)a7 wantsHeader:(BOOL)a8 depth:(unint64_t)a9
{
  _BOOL4 v9;
  unint64_t v15;
  id v16;
  id v17;
  unint64_t options;
  BOOL v19;
  char v20;
  unsigned int v21;
  int v22;
  id v23;
  id v24;
  __CFString *v25;
  void *v26;
  void *v27;
  id v28;
  REExportedValueEncoder *v29;
  void (**v30)(id, id);
  id v31;
  _QWORD v32[4];
  id v33;
  REExportedValueEncoder *v34;
  id v35;
  _QWORD *v36;
  unint64_t v37;
  BOOL v38;
  char v39;
  BOOL v40;
  char v41;
  _QWORD v42[3];
  uint64_t v43;

  v9 = a8;
  v15 = a9;
  v31 = a3;
  v16 = a4;
  v17 = a5;
  v28 = a6;
  v29 = self;
  v30 = (void (**)(id, id))a7;
  options = self->_options;
  if (a9)
    v19 = (self->_options & 4) != 0;
  else
    v19 = 1;
  v20 = options & 1;
  v21 = (options >> 1) & 1;
  v27 = v17;
  (*((void (**)(id, id))v17 + 2))(v17, v16);
  v22 = options & v9;
  if (v22 == 1)
    objc_msgSend(v16, "re_writeString:", CFSTR("\n"));
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v43 = 0;
  v43 = objc_msgSend(v31, "propertyCount");
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __102__REExportedValueEncoder__writeCollection_toStream_startBlock_writerBlock_endBlock_wantsHeader_depth___block_invoke;
  v32[3] = &unk_24CF8B058;
  v36 = v42;
  v38 = v19;
  v39 = v21;
  v40 = v9;
  v41 = v20;
  v23 = v16;
  v33 = v23;
  v37 = a9;
  v24 = v28;
  v34 = v29;
  v35 = v24;
  objc_msgSend(v31, "enumerateValuesUsingBlock:", v32);
  if (v22)
  {
    if (a9)
    {
      if (a9 == 1)
      {
        v25 = CFSTR("    ");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", objc_msgSend(CFSTR("    "), "length") * a9);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        do
        {
          objc_msgSend(v26, "appendString:", CFSTR("    "));
          --v15;
        }
        while (v15);
        v25 = (__CFString *)objc_msgSend(v26, "copy");

      }
    }
    else
    {
      v25 = &stru_24CF92178;
    }
    objc_msgSend(v23, "re_writeString:", v25);

  }
  v30[2](v30, v23);

  _Block_object_dispose(v42, 8);
}

void __102__REExportedValueEncoder__writeCollection_toStream_startBlock_writerBlock_endBlock_wantsHeader_depth___block_invoke(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint64_t v32;
  __CFString *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD *v41;
  _QWORD v42[3];
  char v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v27 = a2;
  v5 = a3;
  v28 = a1;
  --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  +[REExportedValue exportedValueForObject:](REExportedValue, "exportedValueForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "type") > 2 || *(_BYTE *)(a1 + 72))
    goto LABEL_18;
  if ((unint64_t)objc_msgSend(v6, "type") > 2)
  {
LABEL_17:

    v5 = CFSTR("More Details...");
    goto LABEL_18;
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  REEncodeIdentificationProperites();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (!v8)
  {

    goto LABEL_17;
  }
  v9 = 0;
  v10 = *(_QWORD *)v45;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v45 != v10)
        objc_enumerationMutation(v7);
      objc_msgSend(v6, "exportedValueForKey:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12 && objc_msgSend(v12, "type") == 3)
      {
        v14 = v13;

        objc_msgSend(v14, "stringValue");
        v15 = objc_claimAutoreleasedReturnValue();

        v9 = 1;
        v6 = v14;
        v5 = (__CFString *)v15;
      }

    }
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  }
  while (v8);

  if ((v9 & 1) == 0)
    goto LABEL_17;
LABEL_18:
  if (!*(_BYTE *)(v28 + 73) || objc_msgSend(v6, "shouldEncodeProperty:", v27))
  {
    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v28 + 56) + 8) + 24);
    v17 = *(unsigned __int8 *)(v28 + 74);
    if (*(_BYTE *)(v28 + 75) && ((unint64_t)objc_msgSend(v6, "type") > 2 || *(_BYTE *)(v28 + 74)))
    {
      v18 = *(void **)(v28 + 32);
      v19 = *(_QWORD *)(v28 + 64) + v17;
      if (v19)
      {
        if (v19 == 1)
        {
          v20 = CFSTR("    ");
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", objc_msgSend(CFSTR("    "), "length") * v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          do
          {
            objc_msgSend(v21, "appendString:", CFSTR("    "));
            --v19;
          }
          while (v19);
          v20 = (__CFString *)objc_msgSend(v21, "copy");

        }
      }
      else
      {
        v20 = &stru_24CF92178;
      }
      objc_msgSend(v18, "re_writeString:", v20);

    }
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x2020000000;
    v43 = 0;
    v22 = *(_QWORD *)(v28 + 48);
    v23 = *(void **)(v28 + 32);
    v24 = MEMORY[0x24BDAC760];
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __102__REExportedValueEncoder__writeCollection_toStream_startBlock_writerBlock_endBlock_wantsHeader_depth___block_invoke_2;
    v38[3] = &unk_24CF8B008;
    v39 = v23;
    v40 = v27;
    v41 = v42;
    v29[0] = v24;
    v29[1] = 3221225472;
    v29[2] = __102__REExportedValueEncoder__writeCollection_toStream_startBlock_writerBlock_endBlock_wantsHeader_depth___block_invoke_3;
    v29[3] = &unk_24CF8B030;
    v37 = *(_BYTE *)(v28 + 75);
    v34 = v42;
    v30 = v6;
    v25 = *(id *)(v28 + 32);
    v35 = *(_QWORD *)(v28 + 64);
    v36 = v17;
    v26 = *(_QWORD *)(v28 + 40);
    v31 = v25;
    v32 = v26;
    v33 = v5;
    (*(void (**)(uint64_t, id, _QWORD *, _QWORD *, BOOL))(v22 + 16))(v22, v39, v38, v29, v16 == 0);
    if (*(_BYTE *)(v28 + 75) && (*(_BYTE *)(v28 + 74) || v16))
      objc_msgSend(*(id *)(v28 + 32), "re_writeString:", CFSTR("\n"));

    _Block_object_dispose(v42, 8);
  }

}

uint64_t __102__REExportedValueEncoder__writeCollection_toStream_startBlock_writerBlock_endBlock_wantsHeader_depth___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "re_writeString:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

uint64_t __102__REExportedValueEncoder__writeCollection_toStream_startBlock_writerBlock_endBlock_wantsHeader_depth___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;

  if (*(_BYTE *)(a1 + 88)
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
    && (unint64_t)objc_msgSend(*(id *)(a1 + 32), "type") <= 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "re_writeString:", CFSTR("\n"));
    v2 = *(void **)(a1 + 40);
    v3 = *(_QWORD *)(a1 + 80) + *(_QWORD *)(a1 + 72);
    if (v3)
    {
      if (v3 == 1)
      {
        v4 = CFSTR("    ");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", objc_msgSend(CFSTR("    "), "length") * v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        do
        {
          objc_msgSend(v5, "appendString:", CFSTR("    "));
          --v3;
        }
        while (v3);
        v4 = (__CFString *)objc_msgSend(v5, "copy");

      }
    }
    else
    {
      v4 = &stru_24CF92178;
    }
    objc_msgSend(v2, "re_writeString:", v4);

  }
  return objc_msgSend(*(id *)(a1 + 48), "_writeValue:toStream:depth:needsIndent:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72) + 1, 0);
}

- (id)_namesArrayFromArray:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  id v25;
  id obj;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[REExportedValue exportedValueForObject:](REExportedValue, "exportedValueForObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "type") == 6)
    {
      v6 = 0;
    }
    else
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      REEncodeIdentificationProperites();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      if (v6)
      {
        v8 = *(_QWORD *)v39;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(_QWORD *)v39 != v8)
              objc_enumerationMutation(v7);
            objc_msgSend(v5, "exportedValueForKey:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "type");

            if (v11 == 3)
            {
              v24 = v5;

              objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = 0u;
              v35 = 0u;
              v36 = 0u;
              v37 = 0u;
              v25 = v3;
              obj = v3;
              v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
              if (v29)
              {
                v28 = *(_QWORD *)v35;
                do
                {
                  for (j = 0; j != v29; ++j)
                  {
                    if (*(_QWORD *)v35 != v28)
                      objc_enumerationMutation(obj);
                    v13 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
                    v30 = 0u;
                    v31 = 0u;
                    v32 = 0u;
                    v33 = 0u;
                    REEncodeIdentificationProperites();
                    v14 = (void *)objc_claimAutoreleasedReturnValue();
                    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
                    if (v15)
                    {
                      v16 = v15;
                      v17 = *(_QWORD *)v31;
                      while (2)
                      {
                        for (k = 0; k != v16; ++k)
                        {
                          if (*(_QWORD *)v31 != v17)
                            objc_enumerationMutation(v14);
                          v19 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * k);
                          +[REExportedValue exportedValueForObject:](REExportedValue, "exportedValueForObject:", v13, v24);
                          v20 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v20, "exportedValueForKey:", v19);
                          v21 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v21, "stringValue");
                          v22 = (void *)objc_claimAutoreleasedReturnValue();

                          if (v22)
                          {
                            objc_msgSend(v27, "addObject:", v22);

                            goto LABEL_29;
                          }
                        }
                        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
                        if (v16)
                          continue;
                        break;
                      }
                    }
LABEL_29:

                  }
                  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
                }
                while (v29);
              }

              v7 = v27;
              v6 = (void *)objc_msgSend(v27, "copy");
              v5 = v24;
              v3 = v25;
              goto LABEL_32;
            }
          }
          v6 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_32:

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)writeUnsupportedObject:(id)a3 toStream:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v10 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "objectValue");
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v7;
  }
  else
  {
    v8 = v10;
  }
  v11 = v8;
  objc_msgSend(v8, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REExportedValueEncoder writeString:toStream:](self, "writeString:toStream:", v9, v6);

}

- (BOOL)writesDictionaryHeader
{
  return 0;
}

- (BOOL)writesArrayHeader
{
  return 0;
}

@end
