@implementation NSReadAttributedStringFromURLOrDataCommon

void ___NSReadAttributedStringFromURLOrDataCommon_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v5;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;

  v5 = a3;
  if (!objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("DocumentType")))
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("DocumentType"));
    if (v5)
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
    else
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = v9;
    if (v8)
      v11 = (const __CFString *)v8;
    else
      v11 = CFSTR("NSHTML");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("DocumentType"));
    v5 = (id)objc_msgSend(v10, "copy");
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(a2, "mutableCopy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = v5;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = a4;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

uint64_t ___NSReadAttributedStringFromURLOrDataCommon_block_invoke_2(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "loadData:MIMEType:characterEncodingName:baseURL:", a1[4], CFSTR("application/x-webarchive"), a1[5], a1[6]);
}

@end
