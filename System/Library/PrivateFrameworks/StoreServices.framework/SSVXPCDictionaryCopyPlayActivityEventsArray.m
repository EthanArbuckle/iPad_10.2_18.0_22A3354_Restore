@implementation SSVXPCDictionaryCopyPlayActivityEventsArray

uint64_t __SSVXPCDictionaryCopyPlayActivityEventsArray_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *length;
  SSVPlayActivityEvent *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812E8])
  {
    length = (void *)xpc_data_get_length(v5);
    if (length)
      length = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", xpc_data_get_bytes_ptr(v5), length, 0);
    v7 = -[SSVPlayActivityEvent initWithDataRepresentation:]([SSVPlayActivityEvent alloc], "initWithDataRepresentation:", length);
    if (v7)
    {
      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (!v8)
      {
        v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", xpc_array_get_count(*(xpc_object_t *)(a1 + 32)));
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

        v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      }
      objc_msgSend(v8, "addObject:", v7);
    }

  }
  return 1;
}

@end
