id sub_2172B1A68(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  UIImage *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setContactType:", 0);
  objc_msgSend(v3, "givenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGivenName:", v5);

  objc_msgSend(v3, "familyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFamilyName:", v6);

  objc_msgSend(v3, "photo");
  v7 = (UIImage *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    UIImagePNGRepresentation(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImageData:", v8);

  }
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

uint64_t sub_2172B1B3C(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_photo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
LABEL_5:

    return objc_msgSend(a1, "_photo");
  }
  objc_msgSend(a1, "photoURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDBCE50];
    objc_msgSend(a1, "photoURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataWithContentsOfURL:", v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", v2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "set_photo:", v6);

    }
    goto LABEL_5;
  }
  return objc_msgSend(a1, "_photo");
}

uint64_t sub_2172B1BEC()
{
  return 1;
}

void sub_2172B1BF4()
{
  UIImage *v0;

  v0 = (UIImage *)_os_crash();
  __break(1u);
  UIImagePNGRepresentation(v0);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

