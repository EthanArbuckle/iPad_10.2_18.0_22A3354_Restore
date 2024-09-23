@implementation LoadScreenTypes

void __LoadScreenTypes_block_invoke()
{
  void *v0;
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  NSObject *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  CGSize v25;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fixedCoordinateSpace");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;

  v6 = 0;
  v7 = 0;
  v8 = 480.0;
  v9 = 320.0;
  while (1)
  {
    v10 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v7 <= 0x11)
    {
      v10 = dbl_19DF154E8[v7];
      v11 = dbl_19DF15578[v7];
    }
    if (v10 == *MEMORY[0x1E0C9D820] && v11 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      break;
    v13 = v10 < v9;
    v14 = v9 > v3;
    if (v10 > v9)
      v14 = 1;
    if (v10 <= v3)
      v13 = v14;
    v15 = v11 < v8;
    v16 = v8 > v5;
    if (v11 > v8)
      v16 = 1;
    if (v11 <= v5)
      v15 = v16;
    if (v10 != v9)
      v15 = v13;
    if (!v13)
      v13 = v15;
    if (v13)
    {
      v6 = v7;
      v9 = v10;
      v8 = v11;
    }
    ++v7;
  }
  qword_1ED06C680 = v6;
  if (v9 != v3 || v8 != v5)
  {
    PKLogFacilityTypeGetObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v25.width = v3;
      v25.height = v5;
      NSStringFromCGSize(v25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v21;
      _os_log_error_impl(&dword_19D178000, v18, OS_LOG_TYPE_ERROR, "Error: unrecognized screen size detected - %{public}@. Please file a radar.", (uint8_t *)&v22, 0xCu);

    }
    v6 = qword_1ED06C680;
  }
  v19 = v6 - 3;
  if (v19 > 0xE)
    v20 = 0;
  else
    v20 = qword_19DF15608[v19];
  qword_1ED06C688 = v20;
}

@end
