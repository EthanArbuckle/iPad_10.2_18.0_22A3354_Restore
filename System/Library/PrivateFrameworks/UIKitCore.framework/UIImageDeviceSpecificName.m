@implementation UIImageDeviceSpecificName

void ___UIImageDeviceSpecificName_block_invoke()
{
  void *v0;
  uint64_t v1;
  double v2;
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if ((v1 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v2 = 1024.0;
  else
    v2 = 480.0;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");
  v5 = v4;

  if (v5 <= v2)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    v9 = dbl_18667DCF0[(v8 & 0xFFFFFFFFFFFFFFFBLL) == 1];
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_pointsPerInch");
    v12 = v11;

    if (v12 <= v9)
      return;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-%.0fr"), *(_QWORD *)&v12);
  }
  else
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("-%.0fh"), *(_QWORD *)&v5);
  }
  v13 = (void *)qword_1ECD798B0;
  qword_1ECD798B0 = v6;

}

@end
