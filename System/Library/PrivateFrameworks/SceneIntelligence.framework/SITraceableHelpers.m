@implementation SITraceableHelpers

+ (id)traceableTransform:(__n128)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v33[4];
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[6];

  v37[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v28;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a2.n128_f64[0]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v27;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a3.n128_f64[0]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v26;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a4.n128_f64[0]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v24;
  HIDWORD(v4) = a1.n128_u32[1];
  LODWORD(v4) = a1.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v23;
  HIDWORD(v5) = a2.n128_u32[1];
  LODWORD(v5) = a2.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v22;
  HIDWORD(v6) = a3.n128_u32[1];
  LODWORD(v6) = a3.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v21;
  HIDWORD(v7) = a4.n128_u32[1];
  LODWORD(v7) = a4.n128_u32[1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v19;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v18;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[3])));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v14;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[3])));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 4);
  a4.n128_u64[0] = objc_claimAutoreleasedReturnValue();

  return (id)a4.n128_u64[0];
}

@end
