@implementation AnchorableResourceIdentifiersInTimelineSegment

void __AnchorableResourceIdentifiersInTimelineSegment_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (a2 >= 1)
  {
    v20 = v10;
    v21 = v9;
    v22 = v8;
    v23 = v7;
    v24 = v6;
    v25 = v5;
    v26 = v11;
    v27 = v12;
    v14 = a2;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "clipWithIdentifier:", *a5, v20, v21, v22, v23, v24, v25, v26, v27);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "resource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v17, "px_storyResourceKind") | 2) == 3)
      {
        v18 = *(void **)(a1 + 40);
        objc_msgSend(v17, "px_storyResourceIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v19);

      }
      a5 += 96;

      --v14;
    }
    while (v14);
  }
}

@end
