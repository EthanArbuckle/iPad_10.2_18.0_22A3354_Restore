@implementation VCUserActivityFromEvent

void __VCUserActivityFromEvent_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v8 = *(void **)(v7 + 40);
        *(_QWORD *)(v7 + 40) = v6;
      }
      else if ((unint64_t)objc_msgSend(v4, "count") < 2)
      {
        v8 = 0;
      }
      else
      {
        objc_msgSend(v4, "objectAtIndex:", 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
            v9 = objc_claimAutoreleasedReturnValue();
            v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v11 = *(void **)(v10 + 40);
            *(_QWORD *)(v10 + 40) = v9;

          }
        }
      }

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
