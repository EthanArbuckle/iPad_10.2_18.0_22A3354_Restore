@implementation GEOVLFLocation(VLExtras)

- (void)initWithCLLocation:()VLExtras location:heading:
{
  id v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  id v16;
  __int128 v18;
  uint64_t v19;
  char v20;
  _BYTE v21[7];

  v8 = a4;
  v9 = (void *)objc_msgSend(a1, "init");
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x24BE3CC08]);
    objc_msgSend(v8, "coordinate");
    v12 = v11;
    objc_msgSend(v8, "coordinate");
    v13 = (void *)objc_msgSend(v10, "initWithLatitude:longitude:", v12);
    objc_msgSend(v9, "setLocation:", v13);

    memset(v21, 0, sizeof(v21));
    v14 = *((_QWORD *)a5 + 2);
    v18 = *a5;
    v19 = v14;
    v20 = 7;
    objc_msgSend(v9, "setEcefLocation:", &v18);
    objc_msgSend(v8, "horizontalAccuracy");
    objc_msgSend(v9, "setHorizontalAccuracy:");
    objc_msgSend(v8, "verticalAccuracy");
    objc_msgSend(v9, "setVerticalAccuracy:");
    objc_msgSend(v9, "setHeading:", a2);
    v15 = objc_msgSend(v8, "type") - 1;
    if (v15 <= 0xA && ((0x5EFu >> v15) & 1) != 0)
      objc_msgSend(v9, "setType:", dword_210BCAA10[v15]);
    objc_msgSend(v9, "setIsFused:", objc_msgSend(v8, "isCoordinateFused"));
    v16 = v9;
  }

  return v9;
}

@end
