@implementation SidecarTransferSenderSliceData

void __SidecarTransferSenderSliceData_block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(v2 + 56) + 1;
    *(_QWORD *)(v2 + 56) = v3;
    if (v3 >= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectAtIndexedSubscript:", v3);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "data");
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v5 = objc_msgSend(v4, "bytes");
      v14 = v4;
      v6 = objc_msgSend(v4, "length");
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", (v6 >> 20) + 1);
      v8 = 0;
      v9 = v6;
      do
      {
        if (!v6 || v9)
        {
          if (v9 >= 0x100000)
            v10 = 0x100000;
          else
            v10 = v9;
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v5 + v8, v10, 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v11);

        }
        v8 += 0x100000;
        v9 -= 0x100000;
      }
      while (v8 <= v6);
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 72);
      *(_QWORD *)(v12 + 72) = v7;

    }
  }
}

@end
