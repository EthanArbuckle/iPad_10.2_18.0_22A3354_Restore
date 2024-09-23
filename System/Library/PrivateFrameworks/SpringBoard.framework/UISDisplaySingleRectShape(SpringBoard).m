@implementation UISDisplaySingleRectShape(SpringBoard)

+ (id)sb_thisDeviceDisplayShape
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__UISDisplaySingleRectShape_SpringBoard__sb_thisDeviceDisplayShape__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sb_thisDeviceDisplayShape_onceToken != -1)
    dispatch_once(&sb_thisDeviceDisplayShape_onceToken, block);
  return (id)sb_thisDeviceDisplayShape_sThisDeviceScreenType;
}

+ (id)sb_displayShapeForScreenType:()SpringBoard
{
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  NSObject *v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  v4 = _SBHNativeScaleForScreenType(a3);
  if (a3 <= 0x10 && ((1 << a3) & 0x18600) != 0)
    v4 = v4 * 1.04166667;
  v5 = 0.0;
  v6 = 90.0;
  v7 = 627.0;
  v8 = 249.0;
  switch(a3)
  {
    case 3uLL:
    case 4uLL:
      goto LABEL_17;
    case 5uLL:
    case 6uLL:
      v7 = 628.0;
      v8 = 307.0;
      goto LABEL_17;
    case 7uLL:
    case 8uLL:
      v6 = 64.0;
      v7 = 454.0;
      v8 = 187.0;
      goto LABEL_17;
    case 9uLL:
    case 0xAuLL:
      v6 = 103.0;
      v7 = 678.0;
      v8 = 223.5;
      goto LABEL_17;
    case 0xBuLL:
    case 0xCuLL:
      v6 = 96.0;
      v7 = 630.0;
      v8 = 270.0;
      goto LABEL_17;
    case 0xDuLL:
    case 0xEuLL:
      v6 = 96.0;
      v7 = 628.0;
      v8 = 328.0;
      goto LABEL_17;
    case 0xFuLL:
    case 0x10uLL:
      v6 = 112.0;
      v7 = 522.0;
      v8 = 301.5;
      goto LABEL_17;
    case 0x11uLL:
    case 0x12uLL:
      v6 = 101.0;
      v7 = 484.0;
      v8 = 343.0;
      goto LABEL_17;
    case 0x13uLL:
    case 0x14uLL:
      v6 = 101.0;
      v7 = 484.0;
      v8 = 400.0;
      goto LABEL_17;
    case 0x15uLL:
    case 0x16uLL:
      v6 = 110.0;
      v7 = 375.0;
      v5 = 34.0;
      v8 = 402.0;
      goto LABEL_17;
    case 0x17uLL:
    case 0x18uLL:
      v6 = 110.0;
      v7 = 376.0;
      v5 = 34.0;
      v8 = 457.0;
      goto LABEL_17;
    case 0x19uLL:
    case 0x1AuLL:
      v6 = 110.0;
      v7 = 376.0;
      v5 = 42.0;
      v8 = 415.0;
      goto LABEL_17;
    case 0x1BuLL:
    case 0x1CuLL:
      v6 = 110.0;
      v7 = 376.0;
      v5 = 42.0;
      v8 = 472.0;
LABEL_17:
      v15.origin.x = v8;
      v15.origin.y = v5;
      v15.size.width = v7;
      v15.size.height = v6;
      v9 = CGRectGetMinX(v15) / v4;
      v16.origin.x = v8;
      v16.origin.y = v5;
      v16.size.width = v7;
      v16.size.height = v6;
      v10 = CGRectGetMinY(v16) / v4;
      v17.origin.x = v8;
      v17.origin.y = v5;
      v17.size.width = v7;
      v17.size.height = v6;
      v11 = CGRectGetWidth(v17) / v4;
      v18.origin.x = v8;
      v18.origin.y = v5;
      v18.size.width = v7;
      v18.size.height = v6;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC5BB8]), "initWithRect:", v9, v10, v11, CGRectGetHeight(v18) / v4);
      break;
    default:
      if (SBHScreenTypeIsPhone() && (SBHScreenTypeHasHomeButton() & 1) == 0)
      {
        SBLogHomeAffordance();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          +[UISDisplaySingleRectShape(SpringBoard) sb_displayShapeForScreenType:].cold.1(a3, v14);

      }
      v12 = 0;
      break;
  }
  return v12;
}

+ (void)sb_displayShapeForScreenType:()SpringBoard .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SBHStringForScreenType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "We expect an exclusion rect for %@, but don't have one", (uint8_t *)&v4, 0xCu);

}

@end
