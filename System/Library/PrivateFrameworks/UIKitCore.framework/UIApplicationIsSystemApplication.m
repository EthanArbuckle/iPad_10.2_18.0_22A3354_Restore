@implementation UIApplicationIsSystemApplication

void ___UIApplicationIsSystemApplication_block_invoke()
{
  void *v0;
  int v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  char v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v1 = objc_msgSend(v16, "isFileURL");
  v2 = v16;
  if (v1)
  {
    objc_msgSend(v16, "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByResolvingSymlinksInPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "pathComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isAbsolutePath"))
    {
      v6 = objc_msgSend(v5, "count");
      if (v6 >= 2)
      {
        v7 = v6;
        objc_msgSend(v5, "objectAtIndex:", v6 - 2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Applications"));
        v10 = (void *)(v7 - 2);
        if (v7 == 2 || (v9 & 1) != 0)
        {
          byte_1EDDC8022 = v9;
LABEL_20:

          goto LABEL_21;
        }
        objc_msgSend(v5, "objectAtIndex:", v7 - 3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("AppleInternal"));
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v5, "objectAtIndex:", v7 - 2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Applications")) & 1) != 0)
          {
            v14 = 1;
LABEL_17:
            byte_1EDDC8022 = v14;
LABEL_18:

            goto LABEL_19;
          }
          if (v7 <= 4)
          {
            v14 = 0;
            goto LABEL_17;
          }
        }
        else if (v7 <= 4)
        {
          byte_1EDDC8022 = 0;
LABEL_19:

          goto LABEL_20;
        }
        objc_msgSend(v5, "objectAtIndex:", v7 - 4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        byte_1EDDC8022 = objc_msgSend(v15, "isEqualToString:", CFSTR("Applications"));

        if ((v13 & 1) == 0)
          goto LABEL_19;
        goto LABEL_18;
      }
      byte_1EDDC8022 = 0;
    }
LABEL_21:

    v2 = v16;
  }

}

@end
