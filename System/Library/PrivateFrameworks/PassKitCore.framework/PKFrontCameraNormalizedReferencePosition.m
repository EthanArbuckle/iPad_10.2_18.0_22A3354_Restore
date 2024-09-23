@implementation PKFrontCameraNormalizedReferencePosition

void __PKFrontCameraNormalizedReferencePosition_block_invoke()
{
  uint64_t v0;
  const void *v1;
  int v2;
  int v3;
  int v4;
  CFTypeID v5;
  double v6;
  float v7;
  double v8;
  float v9;

  qword_1ECF21DB0 = 0x3FE0000000000000;
  *(_QWORD *)algn_1ECF21DB8 = 0x3FE0000000000000;
  v0 = MGCopyAnswer();
  if (v0)
  {
    v1 = (const void *)v0;
    v2 = MGGetSInt32Answer();
    v3 = MGGetSInt32Answer();
    v4 = MGGetSInt32Answer();
    v5 = CFGetTypeID(v1);
    if (v5 == CFArrayGetTypeID() && CFArrayGetCount((CFArrayRef)v1) >= 2 && v2 >= 1 && v3 >= 1 && v4 >= 1)
    {
      v6 = (double)v2 / 25.4;
      objc_msgSend((id)CFArrayGetValueAtIndex((CFArrayRef)v1, 0), "floatValue");
      v8 = v7;
      objc_msgSend((id)CFArrayGetValueAtIndex((CFArrayRef)v1, 1), "floatValue");
      *(double *)&qword_1ECF21DB0 = *(double *)&qword_1ECF21DB0 - v6 * v9 / (double)v3;
      *(double *)algn_1ECF21DB8 = *(double *)algn_1ECF21DB8 - v6 * v8 / (double)v4;
    }
    CFRelease(v1);
  }
}

@end
