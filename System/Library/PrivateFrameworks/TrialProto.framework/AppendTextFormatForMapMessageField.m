@implementation AppendTextFormatForMapMessageField

uint64_t __AppendTextFormatForMapMessageField_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;

  v6 = *(void **)(a1 + 32);
  v7 = 40;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
    v7 = 48;
  objc_msgSend(v6, "appendString:", *(_QWORD *)(a1 + v7));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 56));
  AppendStringEscaped(a2, *(void **)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 64));
  v8 = *(unsigned __int8 *)(a1 + 96);
  switch(v8)
  {
    case 13:
      AppendBufferAsString(a3, *(void **)(a1 + 32));
      break;
    case 15:
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("{\n"));
      AppendTextFormatForMessage(a3, *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 72), "stringByAppendingString:", CFSTR("    ")));
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@  }"), *(_QWORD *)(a1 + 72));
      break;
    case 14:
      AppendStringEscaped(a3, *(void **)(a1 + 32));
      break;
    default:
      v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void AppendTextFormatForMapMessageField(id, TRIPBFieldDescriptor *, NSMutableString *, NSString *, NSString *, NSString *)_block_invoke"), CFSTR("TRIPBUtilities.m"), 1608, CFSTR("Can't happen"));
      break;
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 80));
}

uint64_t __AppendTextFormatForMapMessageField_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = *(void **)(a1 + 32);
  v7 = 40;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
    v7 = 48;
  objc_msgSend(v6, "appendString:", *(_QWORD *)(a1 + v7));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 0;
  v8 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 104) == 14)
  {
    objc_msgSend(v8, "appendString:", *(_QWORD *)(a1 + 56));
    AppendStringEscaped(a2, *(void **)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  }
  else
  {
    objc_msgSend(v8, "appendFormat:", CFSTR("%@%@\n"), *(_QWORD *)(a1 + 56), a2);
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 64));
  switch(*(_BYTE *)(a1 + 105))
  {
    case 0xD:
      AppendBufferAsString(a3, *(void **)(a1 + 32));
      goto LABEL_18;
    case 0xE:
      AppendStringEscaped(a3, *(void **)(a1 + 32));
      goto LABEL_18;
    case 0xF:
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("{\n"));
      AppendTextFormatForMessage(a3, *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 72), "stringByAppendingString:", CFSTR("    ")));
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@  }"), *(_QWORD *)(a1 + 72));
      goto LABEL_18;
    case 0x10:
      v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void AppendTextFormatForMapMessageField(id, TRIPBFieldDescriptor *, NSMutableString *, NSString *, NSString *, NSString *)_block_invoke_2"), CFSTR("TRIPBUtilities.m"), 1667, CFSTR("Can't happen"));
      goto LABEL_16;
    case 0x11:
      v9 = objc_msgSend(a3, "intValue");
      v10 = (void *)objc_msgSend(*(id *)(a1 + 80), "enumDescriptor");
      if (v10 && (v11 = objc_msgSend(v10, "textFormatNameForValue:", v9)) != 0)
      {
        v12 = (void *)v11;
        v13 = *(void **)(a1 + 32);
LABEL_17:
        objc_msgSend(v13, "appendString:", v12);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%d"), v9);
      }
LABEL_18:
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
      return objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 88));
    default:
LABEL_16:
      v13 = *(void **)(a1 + 32);
      v12 = a3;
      goto LABEL_17;
  }
}

@end
