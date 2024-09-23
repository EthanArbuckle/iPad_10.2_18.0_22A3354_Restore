@implementation UIKitDebugHierarchyMetaDataProvider

+ (id)fallback_debugHierarchyEnumDescriptions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  void *v6;
  _QWORD v7[13];
  _QWORD v8[13];

  v7[0] = &off_55180;
  v7[1] = &off_55198;
  v8[0] = CFSTR("UIViewContentModeScaleToFill");
  v8[1] = CFSTR("UIViewContentModeScaleAspectFit");
  v7[2] = &off_551B0;
  v7[3] = &off_551C8;
  v8[2] = CFSTR("UIViewContentModeScaleAspectFill");
  v8[3] = CFSTR("UIViewContentModeRedraw");
  v7[4] = &off_551E0;
  v7[5] = &off_551F8;
  v8[4] = CFSTR("UIViewContentModeCenter");
  v8[5] = CFSTR("UIViewContentModeTop");
  v7[6] = &off_55210;
  v7[7] = &off_55228;
  v8[6] = CFSTR("UIViewContentModeBottom");
  v8[7] = CFSTR("UIViewContentModeLeft");
  v7[8] = &off_55240;
  v7[9] = &off_55258;
  v8[8] = CFSTR("UIViewContentModeRight");
  v8[9] = CFSTR("UIViewContentModeTopLeft");
  v7[10] = &off_55270;
  v7[11] = &off_55288;
  v8[10] = CFSTR("UIViewContentModeTopRight");
  v8[11] = CFSTR("UIViewContentModeBottomLeft");
  v7[12] = &off_552A0;
  v8[12] = CFSTR("UIViewContentModeBottomRight");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 13));
  v5 = CFSTR("UIViewContentMode");
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return v3;
}

+ (id)fallback_debugHierarchyOptionDescriptions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  void *v6;
  _QWORD v7[7];
  _QWORD v8[7];

  v7[0] = &off_552B8;
  v7[1] = &off_552D0;
  v8[0] = CFSTR("UIViewAutoresizingNone");
  v8[1] = CFSTR("UIViewAutoresizingFlexibleLeftMargin");
  v7[2] = &off_552E8;
  v7[3] = &off_55300;
  v8[2] = CFSTR("UIViewAutoresizingFlexibleWidth");
  v8[3] = CFSTR("UIViewAutoresizingFlexibleRightMargin");
  v7[4] = &off_55318;
  v7[5] = &off_55330;
  v8[4] = CFSTR("UIViewAutoresizingFlexibleTopMargin");
  v8[5] = CFSTR("UIViewAutoresizingFlexibleHeight");
  v7[6] = &off_55348;
  v8[6] = CFSTR("UIViewAutoresizingFlexibleBottomMargin");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 7));
  v5 = CFSTR("UIViewAutoresizing");
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));

  return v3;
}

@end
