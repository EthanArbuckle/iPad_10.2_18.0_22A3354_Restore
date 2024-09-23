@implementation EncodeV1Format

void __EncodeV1Format_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = objc_msgSend(v14, "count");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v8);
      if (v7 >= 2)
      {
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
        {
          v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v12 = *(void **)(v11 + 40);
          *(_QWORD *)(v11 + 40) = v10;

        }
        objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v13, v8);

      }
    }

  }
}

@end
