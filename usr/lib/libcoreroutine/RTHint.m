@implementation RTHint

void __52__RTHint_RTCoreDataTransformable__createWithHintMO___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v2 = objc_alloc(MEMORY[0x1E0D183A0]);
  v3 = objc_alloc(MEMORY[0x1E0D183B0]);
  objc_msgSend(*(id *)(a1 + 32), "latitude");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "longitude");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "horizontalUncertainty");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "date");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithLatitude:longitude:horizontalUncertainty:date:", v16, v5, v7, v9);
  v11 = objc_msgSend(*(id *)(a1 + 32), "source");
  objc_msgSend(*(id *)(a1 + 32), "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v2, "initWithLocation:source:date:", v10, v11, v12);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

@end
