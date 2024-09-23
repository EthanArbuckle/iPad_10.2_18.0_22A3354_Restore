@implementation UIVPA

void ___UIVPA_CATransformDisplacement_block_invoke(uint64_t a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  float v10;
  void *v11;
  float v12;
  void *v13;
  float v14;
  void *v15;
  float v16;
  void *v17;
  float v18;
  void *v19;
  float v20;
  void *v21;
  float v22;
  void *v23;
  float v24;
  void *v25;
  float v26;
  _OWORD v27[8];

  *(_QWORD *)(a3 + 64) = 0;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  v5 = a2[5];
  v27[4] = a2[4];
  v27[5] = v5;
  v6 = a2[7];
  v27[6] = a2[6];
  v27[7] = v6;
  v7 = a2[1];
  v27[0] = *a2;
  v27[1] = v7;
  v8 = a2[3];
  v27[2] = a2[2];
  v27[3] = v8;
  objc_msgSend(*(id *)(a1 + 32), "setTransform:", v27);
  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("transform.translation.x"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  *(double *)(a3 + 48) = v10;

  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("transform.translation.y"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  *(double *)(a3 + 56) = v12;

  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("transform.translation.z"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  *(double *)(a3 + 64) = v14;

  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("transform.scale.x"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");
  *(double *)(a3 + 24) = v16;

  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("transform.scale.y"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  *(double *)(a3 + 32) = v18;

  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("transform.scale.z"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  *(double *)(a3 + 40) = v20;

  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("transform.rotation.x"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "floatValue");
  *(double *)a3 = v22;

  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("transform.rotation.y"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  *(double *)(a3 + 8) = v24;

  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("transform.rotation.z"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  *(double *)(a3 + 16) = v26;

}

@end
