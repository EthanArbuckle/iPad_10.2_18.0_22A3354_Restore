@implementation SMLocation

void __60__SMLocation_RTCoreDataTransformable__createWithLocationMO___block_invoke(uint64_t a1)
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v2 = objc_alloc(MEMORY[0x1E0D8B998]);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "latitude");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "longitude");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "hunc");
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "altitude");
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "vunc");
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v2, "initWithIdentifier:latitude:longitude:hunc:altitude:vunc:date:", v17, v13, v4, v6, v8, v10, v12);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

@end
