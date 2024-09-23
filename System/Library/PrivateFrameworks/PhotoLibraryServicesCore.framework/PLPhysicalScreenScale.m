@implementation PLPhysicalScreenScale

void __PLPhysicalScreenScale_block_invoke()
{
  float v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  id v9;

  MGGetFloat32Answer();
  *(double *)&PLPhysicalScreenScale_screenScale = v0;
  if (v0 == -1.0)
  {
    -[objc_class mainScreen](NSClassFromString((NSString *)CFSTR("UIScreen")), "mainScreen");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "scale");
    PLPhysicalScreenScale_screenScale = v2;

    if (*(double *)&PLPhysicalScreenScale_screenScale == 1.0)
    {
      -[objc_class mainScreen](NSClassFromString((NSString *)CFSTR("UIScreen")), "mainScreen");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "currentMode");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v4 = v9;
      if (v9)
      {
        objc_msgSend(v9, "size");
        v4 = v9;
        v7 = 0;
        while (1)
        {
          v8 = *(double *)&PLSecureCaptureExtensionIdentifier_block_invoke___HIDPIScreenDimensions[v7];
          if (v8 == v5
            && *(double *)&PLSecureCaptureExtensionIdentifier_block_invoke___HIDPIScreenDimensions[v7 + 1] == v6)
          {
            break;
          }
          if (v8 == v6
            && *(double *)&PLSecureCaptureExtensionIdentifier_block_invoke___HIDPIScreenDimensions[v7 + 1] == v5)
          {
            break;
          }
          v7 += 2;
          if (v7 == 6)
            goto LABEL_13;
        }
        PLPhysicalScreenScale_screenScale = 0x4000000000000000;
      }
LABEL_13:

    }
  }
}

@end
