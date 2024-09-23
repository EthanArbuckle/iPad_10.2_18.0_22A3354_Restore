@implementation ZL42ktrace

const __CFDictionary **___ZL42ktrace_address_space_create_cssymbolicatorP21symbolication_contextP20ktrace_address_space_block_invoke_204(uint64_t a1, SymbolOwner *a2)
{
  const __CFDictionary **result;
  int v5;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  result = (const __CFDictionary **)find_or_create_uuid(*(symbolication_context **)(a1 + 48), a2);
  if (!result)
    ktrace_remotetime_update_params_cold_1();
  v5 = *((_DWORD *)a2 + 4);
  if (v5 != 1)
  {
    if (v5 == 5 || v5 == 2)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    return result;
  }
  v7 = (uint64_t)result;
  ktrace_find_segment_count(*(symbolication_context **)(a1 + 48), result);
  if ((*(_WORD *)(v7 + 160) & 0x20) != 0)
  {
    v9 = *(int *)(v7 + 80);
  }
  else
  {
    ktrace_find_text_size(*(symbolication_context **)(a1 + 48), (UUIDContext *)v7);
    v8 = *(_WORD *)(v7 + 160);
    if ((v8 & 8) != 0)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v8 = *(_WORD *)(v7 + 160);
    }
    if ((v8 & 0x10) == 0)
      goto LABEL_17;
    v9 = 1;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v9;
LABEL_17:
  ktrace_find_image_type(*(symbolication_context **)(a1 + 48), (UUIDContext *)v7);
  result = (const __CFDictionary **)ktrace_find_arch_with_default(*(symbolication_context **)(a1 + 48), v7, 0);
  if ((*(_WORD *)(v7 + 160) & 4) != 0)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if ((*(_WORD *)(v7 + 160) & 0x100) != 0 || !*(_QWORD *)(v10 + 48))
      *(_QWORD *)(v10 + 48) = *(_QWORD *)(v7 + 120);
  }
  return result;
}

@end
