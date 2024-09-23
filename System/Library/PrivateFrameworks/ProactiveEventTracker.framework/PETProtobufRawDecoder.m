@implementation PETProtobufRawDecoder

+ (id)filterProtobufData:(id)a3 onField:(id)a4 onNestedMessageEnd:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  CFMutableDataRef Mutable;
  uint64_t v13;
  _QWORD v15[5];
  uint64_t v16;

  v7 = objc_retainAutorelease(a3);
  v8 = a5;
  v9 = a4;
  v10 = v7;
  v11 = objc_msgSend(v10, "bytes");
  Mutable = CFDataCreateMutable(0, 0);
  v16 = 0;
  v13 = objc_msgSend(v10, "length", v11);

  v15[1] = v11 + v13;
  v15[2] = v11;
  v15[3] = v11;
  v15[4] = Mutable;
  parse((uint64_t)v15, v9, v8);

  if ((_BYTE)v16)
  {
    CFRelease(Mutable);
    Mutable = 0;
  }
  return Mutable;
}

+ (id)filterProtobufData:(id)a3 withWhitelist:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "addObject:", v7);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  v9 = v7;
  v10 = MEMORY[0x1E0C809B0];
  v21 = v9;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__PETProtobufRawDecoder_filterProtobufData_withWhitelist___block_invoke;
  v17[3] = &unk_1E2A41058;
  v19 = v20;
  v18 = v8;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __58__PETProtobufRawDecoder_filterProtobufData_withWhitelist___block_invoke_2;
  v14[3] = &unk_1E2A41080;
  v11 = v18;
  v15 = v11;
  v16 = v20;
  objc_msgSend(a1, "filterProtobufData:onField:onNestedMessageEnd:", v6, v17, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v20, 8);
  return v12;
}

uint64_t __58__PETProtobufRawDecoder_filterProtobufData_withWhitelist___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v7, "BOOLValue") & 1) != 0)
    {
      v8 = 1;
      goto LABEL_8;
    }
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7);
  v8 = 1;
  *a3 = 1;
LABEL_8:

  return v8;
}

void __58__PETProtobufRawDecoder_filterProtobufData_withWhitelist___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "removeLastObject");
  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
